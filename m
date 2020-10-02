Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4AE280B82
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 02:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733254AbgJBAHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 20:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731525AbgJBAHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 20:07:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70CCC0613D0;
        Thu,  1 Oct 2020 17:07:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73CD660;
        Fri,  2 Oct 2020 02:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601597239;
        bh=j39Dc4gxTEr5923S3VEYL4W8+mB8WnwjUqvF4w7uLkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=klOMwCfrkrmY7xdrSVeHZ+kpcwGMUTAeNIIY6S0ZLQGcoJtQRG4Mz/vv4+/ipMh74
         zJyIHZQx1gkG8ZTcLoJY6yAuNltU/Kmj4TYgTreomkSFxA6bqFTOkazbDillAPyRG9
         sdJaUIhMpbQAUbSxVbUyPbdyGfFH5advDh1uUiFw=
Date:   Fri, 2 Oct 2020 03:06:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan =?utf-8?Q?Riedm=C3=BCller?= <s.riedmueller@phytec.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2 3/5] media: mt9p031: Implement [gs]_register debug
 calls
Message-ID: <20201002000642.GL3722@pendragon.ideasonboard.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-3-s.riedmueller@phytec.de>
 <20200930113831.GG5689@pendragon.ideasonboard.com>
 <289d5897-424f-326f-0bc1-c9a1b79284c3@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <289d5897-424f-326f-0bc1-c9a1b79284c3@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On Thu, Oct 01, 2020 at 10:56:24AM +0200, Stefan Riedmüller wrote:
> On 30.09.20 13:38, Laurent Pinchart wrote:
> > On Wed, Sep 30, 2020 at 12:51:31PM +0200, Stefan Riedmueller wrote:
> >> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> >>
> >> Implement g_register and s_register v4l2_subdev_core_ops to access
> >> camera register directly from userspace for debug purposes.
> > 
> > As the name of the operations imply, this is meant for debug purpose
> > only. They are however prone to be abused to configure the sensor from
> > userspace in production, which isn't a direction we want to take.
> > What's your use case for this ?  I'd rather drop this patch and see the
> > driver extended with support for more controls if needed
> 
> thanks for your feedback.
> 
> I get your point. I myself solely use these operations for debugging 
> purposes but I'm aware that others like to abuse them.
> 
> I thought I send it anyway since for me the DEBUG config is enough to 
> signalize that these operations are not to be used with a productive system. 
> But I'm OK with dropping this patch if you think it might send the wrong signal.

I'd rather avoid this patch due to the risk of abuse if it's OK with
you.

> >> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> >> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> >> ---
> >> No changes in v2
> >> ---
> >>   drivers/media/i2c/mt9p031.c | 28 ++++++++++++++++++++++++++++
> >>   1 file changed, 28 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> >> index b4c042f418c1..de36025260a8 100644
> >> --- a/drivers/media/i2c/mt9p031.c
> >> +++ b/drivers/media/i2c/mt9p031.c
> >> @@ -703,6 +703,30 @@ static int mt9p031_restore_blc(struct mt9p031 *mt9p031)
> >>   	return 0;
> >>   }
> >>   
> >> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> >> +static int mt9p031_g_register(struct v4l2_subdev *sd,
> >> +			      struct v4l2_dbg_register *reg)
> >> +{
> >> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> >> +	int ret;
> >> +
> >> +	ret = mt9p031_read(client, reg->reg);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	reg->val = ret;
> >> +	return 0;
> >> +}
> >> +
> >> +static int mt9p031_s_register(struct v4l2_subdev *sd,
> >> +			      struct v4l2_dbg_register const *reg)
> >> +{
> >> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> >> +
> >> +	return mt9p031_write(client, reg->reg, reg->val);
> >> +}
> >> +#endif
> >> +
> >>   static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
> >>   {
> >>   	struct mt9p031 *mt9p031 =
> >> @@ -1000,6 +1024,10 @@ static int mt9p031_close(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> >>   
> >>   static const struct v4l2_subdev_core_ops mt9p031_subdev_core_ops = {
> >>   	.s_power        = mt9p031_set_power,
> >> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> >> +	.s_register	= mt9p031_s_register,
> >> +	.g_register	= mt9p031_g_register,
> >> +#endif
> >>   };
> >>   
> >>   static const struct v4l2_subdev_video_ops mt9p031_subdev_video_ops = {

-- 
Regards,

Laurent Pinchart
