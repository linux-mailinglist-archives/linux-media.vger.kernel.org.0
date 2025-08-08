Return-Path: <linux-media+bounces-39128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA0B1EAB3
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 16:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 862E0189EC83
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3FA281529;
	Fri,  8 Aug 2025 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="itU+IMFd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220EA281378;
	Fri,  8 Aug 2025 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754664614; cv=none; b=HtF8/03wDuJAFPiKI0XmmPWg9/iyfPueelFeoKldWTov3sffL/FukUBQsqUoTOgT4nqJAVgxJzhrz7v+JdfRlfP6CN2X3+6Fnfkzb0/usteATCRll1RbFWoR3q2FwNseXVnxg6DynST9iaaVmqFCiKNN2I5ekfzfXvgmg7rNdCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754664614; c=relaxed/simple;
	bh=erL4d3pAzIMI/Ij8lqJws1gUl8F+7BHlqfHFZpF6o24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAxtbjbqxjJrrWDE0h1UKIeMOj2qyl0ns4dED6XOqFs1znw6A2ICXWX9N487YP/L6HEzgt/JYBGr3mNwHLMPQH0P2xi+On7jPVGXOBrncp8+n8T7kUufpeAHg0oRTJNoMtj0JMpwiyJVSDchNeKOcHXyXNYdDxvLsPSPYwb7O0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=itU+IMFd; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <fstuyk@runbox.com>)
	id 1ukOPz-003idz-0n; Fri, 08 Aug 2025 16:50:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=UkHUDmy0YLHv8qOUJEZC4ozgz8gskQrFknr7vrbeboU=; b=itU+IMFdlFeB5qKzE/h5ql06ro
	U91i3FCudlbMELCRFYjfOMYjZCDaz81MnhaCtr2vdROevdaVii07+kb3+VOWWHiRPiefPGSP/f4og
	Ye1g6aMpJyulPee9pYler5o3elboUyO3txrWhoaI7YEUB7tXdIOz32t5mVvsqBV0Au5d8LeGWOCqo
	ldMbh659FMtbsugp7u2idbcIrP/Y7duPd6umVyQqej7l0K9twWiufY1UoNNP01TDW4KYDfFEcJu+v
	9iSAFZ38W41n6hYPb7LxU59aypegtcTipzvrAW83tu8qRgzoGTPu088h7I6ZIjsNvGVayk8JpVKXt
	NWluXNMA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <fstuyk@runbox.com>)
	id 1ukOPy-0001V5-HV; Fri, 08 Aug 2025 16:50:02 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (906372)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1ukOPf-007vis-DZ; Fri, 08 Aug 2025 16:49:43 +0200
Message-ID: <6822be3e-630c-4c21-a2c5-6e49109b0712@runbox.com>
Date: Fri, 8 Aug 2025 16:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] OV02C10: image upside down in kernel 6.16
To: Bryan O'Donoghue <bod@kernel.org>, hansg@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7d38cf46-670e-462e-b7c2-78f9aaa9eb43@runbox.com>
 <4d193kdY6jzaUWpsKVleAVgwUkBkmgx2garx3qWBKFjDuJU0LxENQpBpuvRIXGVoTLPiswDorAZVEG2wy-qjRA==@protonmail.internalid>
 <b6df9ae7-ea9f-4e5a-8065-5b130f534f37@runbox.com>
 <fb156b5c-c83c-4d33-86bb-f3cc4cf39ada@kernel.org>
 <bf53e762-883d-4e14-bf84-355ec9ed7ad3@kernel.org>
Content-Language: en-US, fr
From: Frederic Stuyk <fstuyk@runbox.com>
In-Reply-To: <bf53e762-883d-4e14-bf84-355ec9ed7ad3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bryan,

Based on your answer below, I tested the following minimal patch on 
kernel 6.16 and confirmed it fixes the image orientation on my laptop 
(Lenovo ThinkBook 13x G4 IMH):

--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -107,7 +107,7 @@ static const struct reg_sequence 
sensor_1928x1092_30fps_setting[] = {
      {0x3816, 0x01},
      {0x3817, 0x01},

-    {0x3820, 0xb0},
+    {0x3820, 0xa8},
      {0x3821, 0x00},
      {0x3822, 0x80},
      {0x3823, 0x08},


Tested ok with gnome camera, qcam & firefox.

Would it make sense to add a quirk specific to this laptop model?

Also, the image appears heavily blue-ish under normal lighting 
conditions, regardless of the application used. It's a different topic, 
but I thought it was worth mentioning.

Let me know if there's anything else I can try or information to provide.

Best regards,
Frederic




On 08/08/2025 11:33, Bryan O'Donoghue wrote:
> On 08/08/2025 10:27, Bryan O'Donoghue wrote:
>> On 08/08/2025 10:03, Frederic Stuyk wrote:
>>> Querying the sensor orientation metadata shows:
>>>
>>>       $ v4l2-ctl -d /dev/v4l-subdev6 -C camera_sensor_rotation
>>>       camera_sensor_rotation: 0
>>>
>>> This control is read-only and cannot be changed.
>>
>> Register is defined but not used.
>>
>> deckard$ grep ROT drivers/media/i2c/ov02c10.c
>> #define OV02C10_ROTATE_CONTROL        CCI_REG8(0x3820)
>> #define OV02C10_CONFIG_ROTATE        0x18
>>
>> ::set_ctrl()
>> case V4L2_CID_HFLIP:
>> case V4L2_CID_VFLIP:
>> cci_write(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
>>            ov02c10->hflip->val | ov02c10->vflip->val << 1, &ret);
>>
>> ::init_controls()
>>
>> ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>>                                     V4L2_CID_HFLIP, 0, 1, 1, 0);
>> if (ov02e10->hflip)
>>          ov02e10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>
>> ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>>                                     V4L2_CID_VFLIP, 0, 1, 1, 0);
>> if (ov02c10->vflip)
>>          ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>
>> Something like that should work.
>>
>> I think Hans said the ACPI tables provide the orientation for the 
>> sensor.
>>
>> ---
>> bod
>
> 0x3820: default 0xa0
>
> bit5: vflip_blc_0
> bit4: vflip_0
> bit3: hmirror_0
> bit2: hbin4_0
> bit1: hbin2_0
> bit0: vbinf_0
>
> So you want to set bit3 = 0x08
>
> ---
> bod


