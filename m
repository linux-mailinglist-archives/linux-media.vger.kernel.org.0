Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7ED64F513
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 12:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfFVKJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 06:09:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34504 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfFVKJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 06:09:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 307EF27FEED
Message-ID: <e44df6c3347cd328e325ffcfe8f7cec9bcaf93a2.camel@collabora.com>
Subject: Re: [PATCH v2] media: v4l: ctrls: Add debug messages
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com
Date:   Sat, 22 Jun 2019 07:09:14 -0300
In-Reply-To: <91bf1b29-d8a2-c71b-c7e2-abd53be55c11@xs4all.nl>
References: <20190621225006.31773-1-ezequiel@collabora.com>
         <91bf1b29-d8a2-c71b-c7e2-abd53be55c11@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2019-06-22 at 08:53 +0200, Hans Verkuil wrote:
> On 6/22/19 12:50 AM, Ezequiel Garcia wrote:
> > Currently, the v4l2 control code is a bit silent on errors.
> > Add debug messages on (hopefully) most of the error paths.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> > Changes from v1:
> > * Drop changes in the debug parameter semantics.
> > * Drop new module debug parameter.
> > * Add documentation.
> > * Add a debug error in all places where control can fail.
> > * Reorder the vdev parameter, to make the patch less invasive.
> > ---
> >  Documentation/media/kapi/v4l2-dev.rst      |   1 +
> >  drivers/media/platform/omap3isp/ispvideo.c |   2 +-
> >  drivers/media/v4l2-core/v4l2-ctrls.c       | 106 ++++++++++++++++-----
> >  drivers/media/v4l2-core/v4l2-ioctl.c       |  12 +--
> >  drivers/media/v4l2-core/v4l2-subdev.c      |   6 +-
> >  include/media/v4l2-ctrls.h                 |   9 +-
> >  include/media/v4l2-ioctl.h                 |   2 +
> >  7 files changed, 100 insertions(+), 38 deletions(-)
> > 
> > diff --git a/Documentation/media/kapi/v4l2-dev.rst b/Documentation/media/kapi/v4l2-dev.rst
> > index b359f1804bbe..4c5a15c53dbf 100644
> > --- a/Documentation/media/kapi/v4l2-dev.rst
> > +++ b/Documentation/media/kapi/v4l2-dev.rst
> > @@ -288,6 +288,7 @@ Mask  Description
> >  0x08  Log the read and write file operations and the VIDIOC_QBUF and
> >        VIDIOC_DQBUF ioctls.
> >  0x10  Log the poll file operation.
> > +0x20  Log error and messages in the control operations.
> >  ===== ================================================================
> >  
> >  Video device cleanup
> > diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> > index 175bbed9a235..abc945cc05c9 100644
> > --- a/drivers/media/platform/omap3isp/ispvideo.c
> > +++ b/drivers/media/platform/omap3isp/ispvideo.c
> > @@ -1028,7 +1028,7 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
> >  	ctrls.count = 1;
> >  	ctrls.controls = &ctrl;
> >  
> > -	ret = v4l2_g_ext_ctrls(pipe->external->ctrl_handler, NULL, &ctrls);
> > +	ret = v4l2_g_ext_ctrls(pipe->external->ctrl_handler, &video->video, NULL, &ctrls);
> >  	if (ret < 0) {
> >  		dev_warn(isp->dev, "no pixel rate control in subdev %s\n",
> >  			 pipe->external->name);
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 2d7525e2d9eb..4ee703e04ef2 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -6,6 +6,8 @@
> >  
> >   */
> >  
> > +#define pr_fmt(fmt) "v4l2-ctrls: " fmt
> > +
> >  #include <linux/ctype.h>
> >  #include <linux/mm.h>
> >  #include <linux/slab.h>
> > @@ -16,6 +18,12 @@
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-dev.h>
> >  
> > +#define dprintk(vdev, fmt, arg...) do {					\
> > +	if (vdev->dev_debug & V4L2_DEV_DEBUG_CTRL)			\
> 
> This isn't very robust if vdev is NULL. I know it shouldn't, but it's
> better to check for this.
> 
> I'd use this instead:
> 
> 	if (!WARN_ON(!vdev) && ((vdev)->dev_debug & V4L2_DEV_DEBUG_CTRL))			\
> 
> That way nothing crashes if vdev is NULL, and you get a warning as well in that case.
> 

OK, no problem.

Thanks,
Eze

