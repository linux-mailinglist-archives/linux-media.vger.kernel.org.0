Return-Path: <linux-media+bounces-19754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE81F9A0844
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 13:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D379B26861
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 11:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857C62076C4;
	Wed, 16 Oct 2024 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbxcZs/4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF251206E9C;
	Wed, 16 Oct 2024 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077893; cv=none; b=lqKDNzV2zPGmIDDYyDS0EldL/9U9+X0MuYpzAMnWTBeIdEgN8i/5Fpyon0iZxfHvDlFDdljNASmYRZoxbPOZCwa+F3puJKXM7itVl1uxJl1KT3JO7Y3/cuywcbh5fg18Pzd5mYQK2YXDTQg3HSBr9ri9SvVXeQe3EpeYEtl1uZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077893; c=relaxed/simple;
	bh=/f5ZOuxkKpkc2C8e/hGt/Hm9Ch/o+QxbJJIVvOOBMdY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLQpPTocxqIHI8c8TOLbP4XYx+apH7QoXzFIoCKpXXYhvlTl91f+ZuSLOWGIEfhXWuHoVCQPo+PZzXBo2ycdtLxY7ld6gk1CGpQF6m0dzG8E9qm6CEbyugX46y3maWz8Ow1+w6Khe4ulf5qnWuM5aNWWGs5rYC2ofFrCAFs8MAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbxcZs/4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA96C4CEC5;
	Wed, 16 Oct 2024 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077892;
	bh=/f5ZOuxkKpkc2C8e/hGt/Hm9Ch/o+QxbJJIVvOOBMdY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lbxcZs/4W2dDLIVibJqUCESaXCiXNHPq150CvFTaEIW6zyKoJnhfQR9/UJSB/OoH0
	 VLCr7WNUsxwNUt1fbhaM28g7IjUUg5CehSG36wgoDpajeE56sFdfTru6jYHx1DA9G9
	 fbOEp+Od0GASkKaNdf4HLNYLnadKzvQEhcNUHMbwX0RUl5gryBgRz1h011+z6wB94Y
	 RFqE/HOpCDfa/+qKNAS3HOIjltvjx/Cx6RURSCZCXD4y/IlqyHt9EyJmP63n+PVzZf
	 TiuBMoII8cXBdm4YWm+hFZ31Ky8fQTEzutIDOO03Ig/xny8EmI9YWNIZUG8dMOB3Vd
	 CY9Cd+DqhFoHQ==
Date: Wed, 16 Oct 2024 13:24:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 10/13] media: adv7604 prevent underflow condition when
 reporting colorspace
Message-ID: <20241016132448.15e5a4fa@foz.lan>
In-Reply-To: <e591ffa7-4214-4ec0-91f3-65c809aedce9@xs4all.nl>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
	<41d12c1afd6571f9cc56c1b920df6ba558d0b927.1729074076.git.mchehab+huawei@kernel.org>
	<e591ffa7-4214-4ec0-91f3-65c809aedce9@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 16 Oct 2024 12:57:53 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 16/10/2024 12:22, Mauro Carvalho Chehab wrote:
> > Currently, adv76xx_log_status() reads some date using
> > io_read() which may return negative values. The current logi
> > doesn't check such errors, causing colorspace to be reported
> > on a wrong way at adv76xx_log_status().
> > 
> > If I/O error happens there, print a different message, instead
> > of reporting bogus messages to userspace.
> > 
> > Fixes: 54450f591c99 ("[media] adv7604: driver for the Analog Devices ADV7604 video decoder")
> > Cc: stable@vger.kernel.org  
> 
> Not really a fix since this would just affect logging for debugging
> purposes. I would personally just drop the Fixes and Cc tag.

The issue is on a VIDIOC_ ioctl, so part of media API. Ok, this is
used only for debugging purposes and should, instead be implemented
via debugfs, etc, but, in summary: it is what it is: part of the V4L2
uAPI.

-

Now, the question about what should have Fixes: tag and what
shouldn't is a different matter. I've saw long discussions about
that at the kernel mailing lists. In the particular case of y2038,
I'm pretty sure I saw some of them with Fixes tag on it.

> 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
> 
> Regards,
> 
> 	Hans
> 
> > ---
> >  drivers/media/i2c/adv7604.c | 26 +++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> > index 48230d5109f0..272945a878b3 100644
> > --- a/drivers/media/i2c/adv7604.c
> > +++ b/drivers/media/i2c/adv7604.c
> > @@ -2519,10 +2519,10 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
> >  	const struct adv76xx_chip_info *info = state->info;
> >  	struct v4l2_dv_timings timings;
> >  	struct stdi_readback stdi;
> > -	u8 reg_io_0x02 = io_read(sd, 0x02);
> > +	int ret;
> > +	u8 reg_io_0x02;
> >  	u8 edid_enabled;
> >  	u8 cable_det;
> > -
> >  	static const char * const csc_coeff_sel_rb[16] = {
> >  		"bypassed", "YPbPr601 -> RGB", "reserved", "YPbPr709 -> RGB",
> >  		"reserved", "RGB -> YPbPr601", "reserved", "RGB -> YPbPr709",
> > @@ -2621,13 +2621,21 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
> >  	v4l2_info(sd, "-----Color space-----\n");
> >  	v4l2_info(sd, "RGB quantization range ctrl: %s\n",
> >  			rgb_quantization_range_txt[state->rgb_quantization_range]);
> > -	v4l2_info(sd, "Input color space: %s\n",
> > -			input_color_space_txt[reg_io_0x02 >> 4]);
> > -	v4l2_info(sd, "Output color space: %s %s, alt-gamma %s\n",
> > -			(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
> > -			(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
> > -				"(16-235)" : "(0-255)",
> > -			(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
> > +
> > +	ret = io_read(sd, 0x02);
> > +	if (ret < 0) {
> > +		v4l2_info(sd, "Can't read Input/Output color space\n");
> > +	} else {
> > +		reg_io_0x02 = ret;
> > +
> > +		v4l2_info(sd, "Input color space: %s\n",
> > +				input_color_space_txt[reg_io_0x02 >> 4]);
> > +		v4l2_info(sd, "Output color space: %s %s, alt-gamma %s\n",
> > +				(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
> > +				(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
> > +					"(16-235)" : "(0-255)",
> > +				(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
> > +	}
> >  	v4l2_info(sd, "Color space conversion: %s\n",
> >  			csc_coeff_sel_rb[cp_read(sd, info->cp_csc) >> 4]);
> >    
> 



Thanks,
Mauro

