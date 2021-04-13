Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC58435E55C
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 19:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347367AbhDMRug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 13:50:36 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40209 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347355AbhDMRuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 13:50:35 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id EDD966000E;
        Tue, 13 Apr 2021 17:50:12 +0000 (UTC)
Date:   Tue, 13 Apr 2021 13:53:16 -0400
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Removed a function entry log
Message-ID: <YHXajIGK50uT3M5Y@coplandos.local>
References: <20210412155959.6647-1-vrzh@vrzh.net>
 <50b6775f-f6cf-afd2-9a52-c30d02b89832@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b6775f-f6cf-afd2-9a52-c30d02b89832@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 04:51:18PM +0200, Hans Verkuil wrote:
> On 12/04/2021 17:59, Martiros Shakhzadyan wrote:
> > Removed a function entry log in ov2722_remove, as ftrace is a preferred
> > method for function entry/exit tracing.
> 
> It turns out that someone else already made the same fix [1], so marking
> this patch as obsolete.
> 
> There are quite a few atomisp patches pending for 5.13, so it might be
> a good idea to checkout the media subsystem master tree since that is
> more recent than mainline.
> 
> https://git.linuxtv.org/media_tree.git/
> 
> Regards,
> 
> 	Hans
> 
> [1]:
> https://patchwork.linuxtv.org/project/linux-media/patch/20210106181158.2270-1-fil.kolev@gmail.com/
> 
Noted. I will continue to work off of that repo - Thanks!
> > 
> > Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> > ---
> >  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > index c017e9066b7a..912eadaffc44 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > @@ -1175,8 +1175,6 @@ static int ov2722_remove(struct i2c_client *client)
> >  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >  	struct ov2722_device *dev = to_ov2722_sensor(sd);
> >  
> > -	dev_dbg(&client->dev, "ov2722_remove...\n");
> > -
> >  	dev->platform_data->csi_cfg(sd, 0);
> >  	v4l2_ctrl_handler_free(&dev->ctrl_handler);
> >  	v4l2_device_unregister_subdev(sd);
> > 
> 
