Return-Path: <linux-media+bounces-38698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4FB16FB4
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 12:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 169AE3B2887
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 10:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C8C225A38;
	Thu, 31 Jul 2025 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Pf+t6wqy"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF581A23A5
	for <linux-media@vger.kernel.org>; Thu, 31 Jul 2025 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753958354; cv=none; b=tYhmNhP2+fn+lpHW/NB8cXeh331G/oJQrNYVfGuYKNr9fXhOaWQRNM+ed7ThiHszWRL5MDN9TuC7fAa51rlguKQV55+Zpwcip0wFAyr8oVGFCIMRgcgO2Tx83bv7EO/6/JtsvRaDAzHPiAdZTUtDFeJWG4UyeA+WrEa9hDBJ6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753958354; c=relaxed/simple;
	bh=xyUnWD6IV8AkGP10vfylhznJyIy8nEhkXOncPtUr5M0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h5uHTDgOTPpV687/NujY5PVBPwQWGt/WJ5wpUk51RolMa7eguKJJlwwZ6ejEmW96ORsds/qf6nR0kE3M3OTg+/uKUo0s+je0Hot+ZNeRJX1+AUIRQWiL87Ch9e8ydn7B+w3O5tLAI53NqXLcXFAJl31FsTBJw8LmFTFlc6XdaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Pf+t6wqy; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 6e71bf34-6dfa-11f0-9773-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 6e71bf34-6dfa-11f0-9773-005056999439;
	Thu, 31 Jul 2025 12:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:to:subject:from:mime-version:date:message-id;
	bh=XNymT6+BJBPnmhBVaOKXOVgErabOHa07F6ZNqQ7OXRE=;
	b=Pf+t6wqyF3B3mGG9iii0vLUl+jCz4whtgyqJfR/UVxcSjG2QJvME4PiGzXLTCE9+E9C78ETNTJjL7
	 8bbsSSYShjoSgDJRSVDJbSBQzeWHGb0W5MVYTr6QBB/ogvb9844Hl/yXa33StB48F9W8iSgE5wHC+k
	 6E95hvb20+8CIYJ/XCesg0zwen2Cop2myCQY6xkJwpVdOYFS48GSJN9A0m2R+ZtSpxuBIhHn9gE508
	 j9uQeRVVoGhpEnRmYwwxj6gCXE7I+u+BWzxz3Lq9itfbqrk9VTGDcPRqnmQbsMJL/XXzEgEvUPp50O
	 9Ojs1cR2m5EFDzUsYmxhm5DxUdmJ3Xg==
X-KPN-MID: 33|5bt2Dnx4eHO14gmm69eTbXRvVgzf8gt4FBP3+YqvdAtOkPPKpI2vGRvVtAUk90G
 7+Sbj2EhIShCCxtIKycn5I58HBJeRVTiiSAFr56TTW+A=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|998aPlYRk3r14CFTtQHO6OU5c2S6ZnhRN+4tc1JpOgnc+6q9Y2ZNFgQgwm+tKhV
 wmoyTj5LIGJRCL+ssPdgvrQ==
Received: from [192.168.2.10] (unknown [178.74.16.2])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 6e45c54e-6dfa-11f0-8d53-00505699b758;
	Thu, 31 Jul 2025 12:38:01 +0200 (CEST)
Message-ID: <fd856b59-8a08-4900-96aa-b8fa51a7f5e1@xs4all.nl>
Date: Thu, 31 Jul 2025 12:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mats Randgaard <matrandg@cisco.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
 <20250612-csi-bgr-rgb-v1-3-dc8a309118f8@kernel.org>
 <CAPY8ntCYG8ufxpMkgBj1ZpSW-H2HObpcbQNg9tj+EXUM4PGkfQ@mail.gmail.com>
 <e9b61666-6bf0-4ec2-8524-0b6d94f028ef@jjverkuil.nl>
 <20250618-dancing-rare-skua-eb7ffd@houat>
 <20250731-teal-oryx-of-shopping-ced228@houat>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250731-teal-oryx-of-shopping-ced228@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2025 12:14, Maxime Ripard wrote:
> Hi Hans,
> 
> On Wed, Jun 18, 2025 at 04:54:07PM +0200, Maxime Ripard wrote:
>> On Mon, Jun 16, 2025 at 10:02:17AM +0200, Hans Verkuil wrote:
>>> On 12/06/2025 19:01, Dave Stevenson wrote:
>>>> On Thu, 12 Jun 2025 at 13:54, Maxime Ripard <mripard@kernel.org> wrote:
>>>>>
>>>>> The tc358743 is an HDMI to MIPI-CSI2 bridge. It supports two of the
>>>>> three HDMI 1.4 video formats: RGB 4:4:4 and YCbCr 422.
>>>>>
>>>>> RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and listed
>>>>> in the driver as MEDIA_BUS_FMT_RGB888_1X24.
>>>>>
>>>>> Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB888_1X24 to
>>>>> V4L2_PIX_FMT_RGB24.
>>>>>
>>>>> However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
>>>>> the R, G and B order, from left to right. MIPI-CSI2 however defines the
>>>>> RGB888 format with blue first.
>>>>>
>>>>> This essentially means that the R and B will be swapped compared to what
>>>>> V4L2_PIX_FMT_RGB24 defines.
>>>>>
>>>>> The proper MBUS format would be BGR888, so let's use that.
>>>>
>>>> I know where you're coming from, but this driver has been in the tree
>>>> since 2015, so there is a reasonable expectation of users. I've had an
>>>> overlay for it in our kernel tree since 4.14 (July 2018), and I know
>>>> of at least PiKVM [1] as a product based on it. I don't know if Cisco
>>>> are still supporting devices with it in.
>>>
>>> Those are all EOL, so no need to be concerned about that.
>>>
>>> But it is the most commonly used HDMI-to-CSI bridge, so breaking uAPI is
>>> a real concern.
>>
>> Is it really broken?
>>
>> Discussing it with Laurent and Sakari last week, we couldn't find any
>> example of a userspace where the media format was set in stone and not
>> propagated across the pipeline.
>>
>> The uAPI however is *definitely* broken with unicam right now.
>>
>>> See more in my review comment in the code below.
>>>
>>>> Whilst the pixel format may now be considered to be incorrect,
>>>> changing it will break userspace applications that have been using it
>>>> for those 10 years if they're explicitly looking for
>>>> MEDIA_BUS_FMT_RGB888_1X24 or the mapping of it through to
>>>> V4L2_PIX_FMT_RGB24.
>>>> The kernel docs at [2] quote Linus as saying
>>>> "If you break existing user space setups THAT IS A REGRESSION.
>>>> It's not ok to say "but we'll fix the user space setup"
>>>> Really. NOT OK."
>>>>
>>>> I'm thinking of GStreamer if the format has been specified explicitly
>>>> - it'll fail to negotiate due to v4l2src saying it can't handle the
>>>> caps.
>>>>
>>>> Yes it sucks as a situation, but I'm not sure what the best solution
>>>> is. Potentially accepting both MEDIA_BUS_FMT_RGB888_1X24 and
>>>> MEDIA_BUS_FMT_BGR888_1X24 as valid MBUS codes for RGB, alongside
>>>> MEDIA_BUS_FMT_UYVY8_1X16 for UYVY?
>>>>
>>>>   Dave
>>>>
>>>> [1] https://pikvm.org/
>>>> [2] https://www.kernel.org/doc/html/latest/process/handling-regressions.html#quotes-from-linus-about-regression
>>>>
>>>>> Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CSI-2 bridge")
>>>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>>>> ---
>>>>>  drivers/media/i2c/tc358743.c | 10 +++++-----
>>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
>>>>> index ca0b0b9bda1755313f066ba36ab218873b9ae438..a1c164a7716a10b0cb9ff38f88c0513b45f24771 100644
>>>>> --- a/drivers/media/i2c/tc358743.c
>>>>> +++ b/drivers/media/i2c/tc358743.c
>>>>> @@ -688,11 +688,11 @@ static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
>>>>>                 mutex_lock(&state->confctl_mutex);
>>>>>                 i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
>>>>>                                 MASK_YCBCRFMT_422_8_BIT);
>>>>>                 mutex_unlock(&state->confctl_mutex);
>>>>>                 break;
>>>>> -       case MEDIA_BUS_FMT_RGB888_1X24:
>>>>> +       case MEDIA_BUS_FMT_BGR888_1X24:
>>>>>                 v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __func__);
>>>>>                 i2c_wr8_and_or(sd, VOUT_SET2,
>>>>>                                 ~(MASK_SEL422 | MASK_VOUT_422FIL_100) & 0xff,
>>>>>                                 0x00);
>>>>>                 i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0xff,
>>>>> @@ -1353,11 +1353,11 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
>>>>>                         (i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
>>>>>                         "yes" : "no");
>>>>>         v4l2_info(sd, "Color space: %s\n",
>>>>>                         state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
>>>>>                         "YCbCr 422 16-bit" :
>>>>> -                       state->mbus_fmt_code == MEDIA_BUS_FMT_RGB888_1X24 ?
>>>>> +                       state->mbus_fmt_code == MEDIA_BUS_FMT_BGR888_1X24 ?
>>>>>                         "RGB 888 24-bit" : "Unsupported");
>>>>>
>>>>>         v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
>>>>>         v4l2_info(sd, "HDCP encrypted content: %s\n",
>>>>>                         hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
>>>>> @@ -1691,11 +1691,11 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
>>>>>                 struct v4l2_subdev_state *sd_state,
>>>>>                 struct v4l2_subdev_mbus_code_enum *code)
>>>>>  {
>>>>>         switch (code->index) {
>>>>>         case 0:
>>>>> -               code->code = MEDIA_BUS_FMT_RGB888_1X24;
>>>>> +               code->code = MEDIA_BUS_FMT_BGR888_1X24;
>>>
>>> So would this change break or fix the formats[] table in:
>>>
>>> drivers/media/platform/raspberrypi/rp1-cfe/cfe-fmts.h
>>
>> It's pretty much the same table than unicam, and I don't believe it
>> does. For both those drivers the pixels are stored in memory in the CSI
>> wire order, so the proper format to use is BGR24 for CSI, not RGB24.
>>
>>> Are there other bridge drivers that misinterpret MEDIA_BUS_FMT_RGB888_1X24
>>> and/or MEDIA_BUS_FMT_RGB888_1X24?
>>
>> Yes, it's kind of a mess.
>>
>> adv748x, ds90ub960 and tc358743 report RGB888, and ov5640 reports
>> BGR888.
>>
>> Then we have alvium CSI2 that supports both, and can swap color
>> components, so that one isn't a concern.
>>
>> And finally, we have st-mipid02 which is also affected, but is a
>> receiver so it's easier to solve.
>>
>> For RGB565, ov5640, mt9m114 and gc2145 are in that list, but the pixel
>> representation isn't the same than RGB888, so it's not clear to me how
>> they are affected.
>>
>> For RGB666, no v4l2 drivers are affected, but a fair bit of KMS drivers
>> that use media bus formats still might.
> 
> Can we make some progress on this, one way or another?

Thank you for reminding me.

I would prefer to support both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_RGB888_1X24,
as you suggested at one point.

MEDIA_BUS_FMT_RGB888_1X24 should be enumerated last in enum_mbus_code.

If MEDIA_BUS_FMT_RGB888_1X24 is used, a warn_on_once message can be logged. Because
basically it's there for backwards compatibility only.

Clearly document this as well.

I feel uncomfortable just dropping MEDIA_BUS_FMT_RGB888_1X24. This driver is widely
used, certainly on the RPi, and I suspect there are quite a few home-brewn applications
out there that we don't know about.

Would this work for you?

Regards,

	Hans

