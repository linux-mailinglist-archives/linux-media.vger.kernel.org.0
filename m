Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E4F35CA39
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 17:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242174AbhDLPkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 11:40:18 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:61775 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240930AbhDLPkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 11:40:17 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 77C5540008;
        Mon, 12 Apr 2021 15:39:57 +0000 (UTC)
Date:   Mon, 12 Apr 2021 11:43:00 -0400
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: Re: [PATCH] staging: media: atomisp: Removed a function entry log
Message-ID: <YHRqhLWxZ2zqLXQq@coplandos.local>
References: <20210412023558.360103-1-vrzh@vrzh.net>
 <20210412023558.360103-3-vrzh@vrzh.net>
 <e523c55b-9e5b-bbd1-73e8-a6c8dcd832f7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e523c55b-9e5b-bbd1-73e8-a6c8dcd832f7@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 12, 2021 at 11:28:09AM +0200, Hans Verkuil wrote:
> On 12/04/2021 04:35, Martiros Shakhzadyan wrote:
> > Coding style fix.
> 
> What exactly is the coding style issue? Please mention that.
> 
> Also, by removing the line you change the behavior (i.e. if debugging is
> enabled, you no longer see this message). That's more than a coding style
> fix...
> 
> Regards,
> 
> 	Hans
> 

Thank you, Hans - I will resubmit the patch with a better commit
message.

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
