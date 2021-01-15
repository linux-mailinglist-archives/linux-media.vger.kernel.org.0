Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D83C2F785D
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 13:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbhAOMNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 07:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOMNv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 07:13:51 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B36EC061757
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 04:13:08 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B07291F45EB9
Message-ID: <276aeddcb765139e03a77a833dce682af9f0bf3d.camel@collabora.com>
Subject: Re: [PATCH 03/13] media: renesas-ceu: Use
 v4l2_async_notifier_add_{i2c,fwnode_remote}_subdev helpers
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Fri, 15 Jan 2021 09:12:50 -0300
In-Reply-To: <X/+nKwhIhDY7Z9HW@pendragon.ideasonboard.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
         <20210112132339.5621-4-ezequiel@collabora.com>
         <X/+nKwhIhDY7Z9HW@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, 2021-01-14 at 04:06 +0200, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> Thank you for the patch.
> 
> On Tue, Jan 12, 2021 at 10:23:29AM -0300, Ezequiel Garcia wrote:
> > The use of v4l2_async_notifier_add_subdev is discouraged.
> 
> It's not yet, that only happens at the end of the series :-)
> 
> s/is discouraged/will be discouraged/
> 
> > Drivers are instead encouraged to use a helper such as
> > v4l2_async_notifier_add_i2c_subdev.
> > 
> > This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> > should get a kmalloc'ed struct v4l2_async_subdev,
> > removing some boilerplate code while at it.
> > 
> > Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
> > or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
> > the needed setup, instead of open-coding it.
> > 
> > Using v4l2-async to allocate the driver-specific structs,
> > requires to change struct ceu_subdev so the embedded
> > struct v4l2_async_subdev is now the first element.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/platform/renesas-ceu.c | 89 ++++++++++------------------
> >  1 file changed, 31 insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> > index 4a633ad0e8fa..18485812a21e 100644
> > --- a/drivers/media/platform/renesas-ceu.c
> > +++ b/drivers/media/platform/renesas-ceu.c
> > @@ -152,8 +152,8 @@ static inline struct ceu_buffer *vb2_to_ceu(struct vb2_v4l2_buffer *vbuf)
> >   * ceu_subdev - Wraps v4l2 sub-device and provides async subdevice.
> >   */
> >  struct ceu_subdev {
> > -       struct v4l2_subdev *v4l2_sd;
> >         struct v4l2_async_subdev asd;
> > +       struct v4l2_subdev *v4l2_sd;
> >  
> >         /* per-subdevice mbus configuration options */
> >         unsigned int mbus_flags;
> > @@ -174,7 +174,7 @@ struct ceu_device {
> >         struct v4l2_device      v4l2_dev;
> >  
> >         /* subdevices descriptors */
> > -       struct ceu_subdev       *subdevs;
> > +       struct ceu_subdev       **subdevs;
> >         /* the subdevice currently in use */
> >         struct ceu_subdev       *sd;
> >         unsigned int            sd_index;
> > @@ -1195,7 +1195,7 @@ static int ceu_enum_input(struct file *file, void *priv,
> >         if (inp->index >= ceudev->num_sd)
> >                 return -EINVAL;
> >  
> > -       ceusd = &ceudev->subdevs[inp->index];
> > +       ceusd = ceudev->subdevs[inp->index];
> >  
> >         inp->type = V4L2_INPUT_TYPE_CAMERA;
> >         inp->std = 0;
> > @@ -1230,7 +1230,7 @@ static int ceu_s_input(struct file *file, void *priv, unsigned int i)
> >                 return 0;
> >  
> >         ceu_sd_old = ceudev->sd;
> > -       ceudev->sd = &ceudev->subdevs[i];
> > +       ceudev->sd = ceudev->subdevs[i];
> >  
> >         /*
> >          * Make sure we can generate output image formats and apply
> > @@ -1423,7 +1423,7 @@ static int ceu_notify_complete(struct v4l2_async_notifier *notifier)
> >          * ceu formats.
> >          */
> >         if (!ceudev->sd) {
> > -               ceudev->sd = &ceudev->subdevs[0];
> > +               ceudev->sd = ceudev->subdevs[0];
> >                 ceudev->sd_index = 0;
> >         }
> >  
> > @@ -1465,28 +1465,6 @@ static const struct v4l2_async_notifier_operations ceu_notify_ops = {
> >         .complete       = ceu_notify_complete,
> >  };
> >  
> > -/*
> > - * ceu_init_async_subdevs() - Initialize CEU subdevices and async_subdevs in
> > - *                           ceu device. Both DT and platform data parsing use
> > - *                           this routine.
> > - *
> > - * Returns 0 for success, -ENOMEM for failure.
> > - */
> > -static int ceu_init_async_subdevs(struct ceu_device *ceudev, unsigned int n_sd)
> > -{
> > -       /* Reserve memory for 'n_sd' ceu_subdev descriptors. */
> > -       ceudev->subdevs = devm_kcalloc(ceudev->dev, n_sd,
> > -                                      sizeof(*ceudev->subdevs), GFP_KERNEL);
> 
> I may be missing something, but it looks like the subdevs array isn't
> allocated anymore. It turned to an array of pointers, but it still need
> allocation.
> 

After some thought, I'd say it would be better to leave
ceu_init_async_subdevs() untouched, trying to be as
uninvasive as possible.

Thanks for the catch.

Ezequiel

