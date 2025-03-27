Return-Path: <linux-media+bounces-28827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9148A72C1C
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12CB3B00AA
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 09:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51B718309C;
	Thu, 27 Mar 2025 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KT8qSU4G"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0B286A9
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066628; cv=none; b=a79aRNaByxSP8R1sXDPHOWVKmcbW5Wjd+gzVijkUcxLtomAYrTVyG7twIUTetkanpSm3lCk4hkXJWELWcqA+umI7CDfs/pS6UfSu6wUmvSO+e0kl8gcaDChN/VlEyHqb92jvq3LBSV0WhKGXALGa+im1+lhwk2A/oBHh8L0mdBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066628; c=relaxed/simple;
	bh=Jsiw5KiTxUR4iNE3MqYmHnUbxOuveSDHcUBdK6NwZLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VE/KwIhvI4U41ElPkE3ZrZjUKve4y+YeODuFwls0w3fBFRAO0Ow2d8r+q5HiLMxgmwkjl9N+9ZMJsE2Zh8pHnPATI3VRYcZ1/7pMvWNP6LVzQnYRYKXGxYxcnuvJwXrMjzfribWxcb4JNUOKLJjypQ3qNEv/0cgztg/MXQszn6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KT8qSU4G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743066625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcfS9YBTl7tCs/xylX6HhDzKlfrkf3xWC6I7P5nWbCM=;
	b=KT8qSU4GAYcMGAACfe0GFhnMoPPlxgGYzR8At1l4B7YP2n1H/97iQ536kzsvexKUZtNR3B
	C+G5ymUJZwnPVslobFDnMPGo0ycwmQlwDXH+fAWsFwbKx1vdp+a0rUddwBZqwMGwsdTbZb
	/rftCoECVZCmnyXjdbuHpy8t01Ydqfw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-KE2NFzcVMQSmPK6IPE6SNg-1; Thu, 27 Mar 2025 05:10:24 -0400
X-MC-Unique: KE2NFzcVMQSmPK6IPE6SNg-1
X-Mimecast-MFC-AGG-ID: KE2NFzcVMQSmPK6IPE6SNg_1743066623
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e5c76fd898so663816a12.1
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 02:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066623; x=1743671423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcfS9YBTl7tCs/xylX6HhDzKlfrkf3xWC6I7P5nWbCM=;
        b=tokMcwSshH6bhx2rsavXw2qaQO9dlhplgBtl12ct9kcCv4yuWZLpO3u1BpFBzkE5oA
         5jXadSfkjkVWSDHnZ7jERxGti1hFjpEkTPq6h5QprQbLPSburU3GR192XrMKlXrarRBE
         mIKkzN2kXo3vUpXgx81WL94nI9njKGyWeMVC1WVJjg+6nJOKXalr1RBjOKnZ2MYXKptJ
         e9uxWQ6Cj3d9wZZZ9pz82UHUCN9sPCjYuTF8DBtFPMjqVcbPfz1bksDCt51I8VLwXxo0
         F/zwFB2anBKNAETBAYqv4WQMk6NB2U0rl57U5/G7i+RMzAv3jEsckiR8ZY2+hshV5CgX
         O60Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqUcunAqCiyGPJVlpE+yFBP7tnxtRHZ+4sI+ijhaHrtYaPeN64xjw1QheXwqwWgyxA555B+2oQruy7QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJteBIAwilvLAwwH52DIrxKCqBDwa2cOG2rYgW56pbAWuthxRm
	nJIvFqEW8ev5nbfJmoc+/sZe4aEoynPLsM31GTKbpDiD0WBHhhToq9P9Zfnc/YaDhJ7H9MYM7Pz
	lcBfWpdZupdRDDfLtkYGN/jtkCHXSg6usr6hfDlNbo0TtabXIuofFUksI/YJQ
X-Gm-Gg: ASbGnctvCdYCNV4Ny8wbe2VAlVxS2Yvf3+Q1QVN5AXcXzPtQRpFLknfVSoxn1pxIc+u
	SSBj8K0aV/e0o+uqPM73Df3ZFpyGfvRguo9GSRQUxJX74xPATpvJHDhnBwXoU4rYm8Vj1k1j7xn
	7XYGFp/Dfz2KbOBdETx3GstSvkemH3JXicIRZU9jqthVXJuqBnovgHAIq0jGHliToerN+JNiTul
	0LvwuUH86siH4FSEXbDIAecpR2lg2xcGdnOVTGPiuAyOhaivUms9W2pqz8krMRP8Kaj51R9XnnW
	dFQ0ccwN/zamJ9/Abvtau8DlKET0T7djM+eZYALK1my6OYCRsZhLrLmOCIFFhvMH5L50JXc7zW9
	1Spqoe1RIgdl7I1ukbgvDlemUhcKSEVfwT2MAFs+2HcRVGFnoDYT8k9VFWGmFHUxzWdzi
X-Received: by 2002:a17:907:7f8a:b0:ac6:d9fb:ede3 with SMTP id a640c23a62f3a-ac6fae622d4mr262420266b.7.1743066622837;
        Thu, 27 Mar 2025 02:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnMpoTcxNZUuQJDdtTQprA82RoG/L7k+YerCaH+dD9o3uX0yHBYKFa09X/u1y8BnCH0blwsg==
X-Received: by 2002:a17:907:7f8a:b0:ac6:d9fb:ede3 with SMTP id a640c23a62f3a-ac6fae622d4mr262417666b.7.1743066622295;
        Thu, 27 Mar 2025 02:10:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb52c2fsm1206008266b.100.2025.03.27.02.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 02:10:21 -0700 (PDT)
Message-ID: <927dc606-ef77-4435-81f1-f36b951be25b@redhat.com>
Date: Thu, 27 Mar 2025 10:10:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Jingjing Xiong <jingjing.xiong@intel.com>,
 Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
 You-Sheng Yang <vicamo.yang@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
 <Z-UBPcSvq_oUDLAp@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z-UBPcSvq_oUDLAp@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Mar-25 08:41, Sakari Ailus wrote:
> A few more comments.
> 
> On Tue, Mar 25, 2025 at 02:49:29PM +0000, Bryan O'Donoghue wrote:
>> +static int ov02e10_set_format(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *sd_state,
>> +			      struct v4l2_subdev_format *fmt)
>> +{
>> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
>> +	const struct ov02e10_mode *mode;
>> +	s32 vblank_def, h_blank;
>> +
>> +	mode = v4l2_find_nearest_size(supported_modes,
>> +				      ARRAY_SIZE(supported_modes),
>> +				      width, height, fmt->format.width,
>> +				      fmt->format.height);
>> +
>> +	mutex_lock(&ov02e10->mutex);
>> +	ov02e10_update_pad_format(mode, &fmt->format);
>> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
>> +		    fmt->format;
>> +	} else {
>> +		ov02e10->cur_mode = mode;
>> +		__v4l2_ctrl_s_ctrl(ov02e10->link_freq, mode->link_freq_index);
>> +		__v4l2_ctrl_s_ctrl_int64(ov02e10->pixel_rate,
>> +					 to_pixel_rate(mode->link_freq_index));
>> +
>> +		/* Update limits and set FPS to default */
>> +		vblank_def = mode->vts_def - mode->height;
>> +		__v4l2_ctrl_modify_range(ov02e10->vblank,
>> +					 mode->vts_min - mode->height,
>> +					 OV02E10_VTS_MAX - mode->height, 1,
>> +					 vblank_def);
> 
> Note that this can fail.
> 
>> +		__v4l2_ctrl_s_ctrl(ov02e10->vblank, vblank_def);
> 
> As well as this one.
> 
>> +		h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
>> +		    mode->width;
>> +		__v4l2_ctrl_modify_range(ov02e10->hblank, h_blank, h_blank, 1,
>> +					 h_blank);
>> +	}
>> +	mutex_unlock(&ov02e10->mutex);
>> +
>> +	return 0;
>> +}
> 
> Please rely on sub-device state and the state lock instead, see e.g. imx219
> driver for an example.

Or see the conversion to sub-device state in my incremental v8 posting
of the ov02c10 series. Converting this driver should be alsmost
identical.

>> +
>> +static int ov02e10_get_format(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *sd_state,
>> +			      struct v4l2_subdev_format *fmt)
>> +{
>> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
>> +
>> +	mutex_lock(&ov02e10->mutex);
>> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
>> +	else
>> +		ov02e10_update_pad_format(ov02e10->cur_mode, &fmt->format);
>> +
>> +	mutex_unlock(&ov02e10->mutex);
>> +
>> +	return 0;
>> +}
> 
> And you won't need this with sub-device state.

Also see my incremental v8 posting of the ov02c10 series.

> 
>> +
>> +static int ov02e10_enum_mbus_code(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_state *sd_state,
>> +				  struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->index > 0)
>> +		return -EINVAL;
>> +
>> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov02e10_enum_frame_size(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *sd_state,
>> +				   struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	if (fse->index >= ARRAY_SIZE(supported_modes))
>> +		return -EINVAL;
>> +
>> +	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
>> +		return -EINVAL;
>> +
>> +	fse->min_width = supported_modes[fse->index].width;
>> +	fse->max_width = fse->min_width;
>> +	fse->min_height = supported_modes[fse->index].height;
>> +	fse->max_height = fse->min_height;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov02e10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> +{
>> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
>> +
>> +	mutex_lock(&ov02e10->mutex);
>> +	ov02e10_update_pad_format(&supported_modes[0],
>> +				  v4l2_subdev_state_get_format(fh->state, 0));
> 
> Please rely on init_cfg pad op instead.
> 
>> +	mutex_unlock(&ov02e10->mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_video_ops ov02e10_video_ops = {
>> +	.s_stream = ov02e10_set_stream,
> 
> Please use {enable,disable}_streams instead. See e.g. imx283 driver for an
> example.

Also see my incremental v8 posting of the ov02c10 series.

Regards,

Hans



