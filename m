Return-Path: <linux-media+bounces-34863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E13B7ADAA2B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 10:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C299A7A743D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 08:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146D32066CE;
	Mon, 16 Jun 2025 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="PBHujKmW"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701B1EB3E;
	Mon, 16 Jun 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060946; cv=none; b=IXRx3CRo2qkq7G8lHLFhKacvPbs2mT1qGG6AWcs9hCGRQTI8OgalJ4UCMf0SnOzdUkxmomDYEp5bhsJr1FYuXQHbLWcXIkKe+8jIN0xBJbOzG1xty3V2kGO+K2uKgGx6dGVktC9dYUvriH+1cY8rP2QUf7i+IVhKv+K4HChyJFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060946; c=relaxed/simple;
	bh=AHrQv4g5d5PsnZigN4h+JuV26WazgvjMLSpZgs7LpmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf02Sm5vz1BOcprtlhyIldfKdHTka6YErxTKf2YRBB6929g27nTGNAaKRQz1fRSy0BzIaR5kTEJ2z2aBhQUND0KDD+taotv/MOWmdpkOB4XUM3/093m0p0xjJLNh79gEX7LBu/dzGyuGiE0CdkhaJhBwnKVtqeZ7icpreY1xGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=PBHujKmW; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bLMt23YkZz1C44;
	Mon, 16 Jun 2025 08:02:18 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bLMt20Qbrz6Q;
	Mon, 16 Jun 2025 08:02:18 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=PBHujKmW;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750060938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e1N4zxIieCklRjkP0RXCJrZop3KPJcsG8Ud/kaqp+pA=;
	b=PBHujKmWJImzGTxXPzr6DiTXxyE36btpCO3frm8jcFeHCDD4cscZyDfVXdk6z7y3iSMyCh
	ufr5kqRauVQDZCzz1J9nDQvzIOaao3ucR3Q+k5QUy3MrrqhpKZgWdoyj0IQPoqW0iBJVlt
	6dhXFZIjy0sGiWHXeM5NXbKZmZMtXXLVLI40tx3vPyAGRrdTNRIRQLlzYUNPYL+tgZbvrE
	aOgKkkDGTmVOTWeg7PHZpGZx4Ec1BhTVFHpTvoxroGc+bjAJyKtU1DT/JdaBS5NCXfqRV5
	lBYREz6VYfn0ZwcRjQsM9FiPDIUqlVmgnTD8RS3QA6TnM3CQn+JLQJYFLRgx7Q==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=684fcf8a a=mtmCn0Y4c/K3E2eZNiSSpA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=f9ReYnbyAAAA:8 a=VwQbUJbxAAAA:8 a=9HPNJWGvP0ZXJaPK-NQA:9 a=QEXdDO2ut3YA:10 a=pcuiDpOw-WkA:10 a=KfgQljnyxoMA:10 a=l6bbqRs-oetofZkxHce5:22
X-CM-Envelope: MS4xfD5F6VCHj3FSFxNPtOUPJmNh/v4xlzF8tjNrH16ugeS4TE6ynDH+nHNE3m1l+VlJMFqGuIRviGyexSV5cvfneLy0sXTN9IW8ODPEDOnxIKdR40spulWf 5NGHPkWgmGiSV5fb2fZLRLj/vVze3cuCX7g984UFCAb4C+pPGvWIEeMS3vLiErR1b55KBxRi2kVv/aOcaaOtHmr6go3+OAYDXcDm6l2DaVc3s3wcKPzQX+5f Mb5p6DFSiDrvirza07ktDoVQHh3wgid9xHs+Crokl6ccljgtjaiXE7yYs0NUrhfOB+A8Yb4O3cLvsm0u2hI9TQ2NlLMIOOtYAV5YmQe2hX65rUz6IfgueRx+ 9PTbRjKZmLsop41fO+mJ3zLphxowg9nULdCeLUgrf0Z4Z4I21AHLHH8azVCRNTgwsmqc7TO9aTSRXWazpMJ/PhQkf8j9tXMiv/+dgR9G0ObEW4SjHNjI5pDl +dAMa8cjQAcWGZYBsSWpWROSsEkxW5ZDGlqcATfPj/eF0Ek+CynGzoEuzNOnSmB3EtfLpXyOfKjyZ9N7ft4rsC2KB2hKJ/v6nYVzM554UT/cGYmWQDUSAjRH PQs=
Message-ID: <e9b61666-6bf0-4ec2-8524-0b6d94f028ef@jjverkuil.nl>
Date: Mon, 16 Jun 2025 10:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
 <20250612-csi-bgr-rgb-v1-3-dc8a309118f8@kernel.org>
 <CAPY8ntCYG8ufxpMkgBj1ZpSW-H2HObpcbQNg9tj+EXUM4PGkfQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <CAPY8ntCYG8ufxpMkgBj1ZpSW-H2HObpcbQNg9tj+EXUM4PGkfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 12/06/2025 19:01, Dave Stevenson wrote:
> Hi Maxime
> 
> On Thu, 12 Jun 2025 at 13:54, Maxime Ripard <mripard@kernel.org> wrote:
>>
>> The tc358743 is an HDMI to MIPI-CSI2 bridge. It supports two of the
>> three HDMI 1.4 video formats: RGB 4:4:4 and YCbCr 422.
>>
>> RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and listed
>> in the driver as MEDIA_BUS_FMT_RGB888_1X24.
>>
>> Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB888_1X24 to
>> V4L2_PIX_FMT_RGB24.
>>
>> However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
>> the R, G and B order, from left to right. MIPI-CSI2 however defines the
>> RGB888 format with blue first.
>>
>> This essentially means that the R and B will be swapped compared to what
>> V4L2_PIX_FMT_RGB24 defines.
>>
>> The proper MBUS format would be BGR888, so let's use that.
> 
> I know where you're coming from, but this driver has been in the tree
> since 2015, so there is a reasonable expectation of users. I've had an
> overlay for it in our kernel tree since 4.14 (July 2018), and I know
> of at least PiKVM [1] as a product based on it. I don't know if Cisco
> are still supporting devices with it in.

Those are all EOL, so no need to be concerned about that.

But it is the most commonly used HDMI-to-CSI bridge, so breaking uAPI is
a real concern.

See more in my review comment in the code below.

> 
> Whilst the pixel format may now be considered to be incorrect,
> changing it will break userspace applications that have been using it
> for those 10 years if they're explicitly looking for
> MEDIA_BUS_FMT_RGB888_1X24 or the mapping of it through to
> V4L2_PIX_FMT_RGB24.
> The kernel docs at [2] quote Linus as saying
> "If you break existing user space setups THAT IS A REGRESSION.
> It's not ok to say "but we'll fix the user space setup"
> Really. NOT OK."
> 
> I'm thinking of GStreamer if the format has been specified explicitly
> - it'll fail to negotiate due to v4l2src saying it can't handle the
> caps.
> 
> Yes it sucks as a situation, but I'm not sure what the best solution
> is. Potentially accepting both MEDIA_BUS_FMT_RGB888_1X24 and
> MEDIA_BUS_FMT_BGR888_1X24 as valid MBUS codes for RGB, alongside
> MEDIA_BUS_FMT_UYVY8_1X16 for UYVY?
> 
>   Dave
> 
> [1] https://pikvm.org/
> [2] https://www.kernel.org/doc/html/latest/process/handling-regressions.html#quotes-from-linus-about-regression
> 
>> Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CSI-2 bridge")
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> ---
>>  drivers/media/i2c/tc358743.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
>> index ca0b0b9bda1755313f066ba36ab218873b9ae438..a1c164a7716a10b0cb9ff38f88c0513b45f24771 100644
>> --- a/drivers/media/i2c/tc358743.c
>> +++ b/drivers/media/i2c/tc358743.c
>> @@ -688,11 +688,11 @@ static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
>>                 mutex_lock(&state->confctl_mutex);
>>                 i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
>>                                 MASK_YCBCRFMT_422_8_BIT);
>>                 mutex_unlock(&state->confctl_mutex);
>>                 break;
>> -       case MEDIA_BUS_FMT_RGB888_1X24:
>> +       case MEDIA_BUS_FMT_BGR888_1X24:
>>                 v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __func__);
>>                 i2c_wr8_and_or(sd, VOUT_SET2,
>>                                 ~(MASK_SEL422 | MASK_VOUT_422FIL_100) & 0xff,
>>                                 0x00);
>>                 i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0xff,
>> @@ -1353,11 +1353,11 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
>>                         (i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
>>                         "yes" : "no");
>>         v4l2_info(sd, "Color space: %s\n",
>>                         state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
>>                         "YCbCr 422 16-bit" :
>> -                       state->mbus_fmt_code == MEDIA_BUS_FMT_RGB888_1X24 ?
>> +                       state->mbus_fmt_code == MEDIA_BUS_FMT_BGR888_1X24 ?
>>                         "RGB 888 24-bit" : "Unsupported");
>>
>>         v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
>>         v4l2_info(sd, "HDCP encrypted content: %s\n",
>>                         hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
>> @@ -1691,11 +1691,11 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
>>                 struct v4l2_subdev_state *sd_state,
>>                 struct v4l2_subdev_mbus_code_enum *code)
>>  {
>>         switch (code->index) {
>>         case 0:
>> -               code->code = MEDIA_BUS_FMT_RGB888_1X24;
>> +               code->code = MEDIA_BUS_FMT_BGR888_1X24;

So would this change break or fix the formats[] table in:

drivers/media/platform/raspberrypi/rp1-cfe/cfe-fmts.h

Are there other bridge drivers that misinterpret MEDIA_BUS_FMT_RGB888_1X24
and/or MEDIA_BUS_FMT_RGB888_1X24?

Regards,

	Hans

>>                 break;
>>         case 1:
>>                 code->code = MEDIA_BUS_FMT_UYVY8_1X16;
>>                 break;
>>         default:
>> @@ -1753,11 +1753,11 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
>>
>>         if (ret)
>>                 return ret;
>>
>>         switch (code) {
>> -       case MEDIA_BUS_FMT_RGB888_1X24:
>> +       case MEDIA_BUS_FMT_BGR888_1X24:
>>         case MEDIA_BUS_FMT_UYVY8_1X16:
>>                 break;
>>         default:
>>                 return -EINVAL;
>>         }
>> @@ -2172,11 +2172,11 @@ static int tc358743_probe(struct i2c_client *client)
>>         sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>         err = media_entity_pads_init(&sd->entity, 1, &state->pad);
>>         if (err < 0)
>>                 goto err_hdl;
>>
>> -       state->mbus_fmt_code = MEDIA_BUS_FMT_RGB888_1X24;
>> +       state->mbus_fmt_code = MEDIA_BUS_FMT_BGR888_1X24;
>>
>>         sd->dev = &client->dev;
>>
>>         mutex_init(&state->confctl_mutex);
>>
>>
>> --
>> 2.49.0
>>
> 


