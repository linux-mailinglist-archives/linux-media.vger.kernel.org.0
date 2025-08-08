Return-Path: <linux-media+bounces-39110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FAFB1E5A4
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA21D3A3FD5
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69B626AAB2;
	Fri,  8 Aug 2025 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoYYPuK8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2AC21B9D2;
	Fri,  8 Aug 2025 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754645621; cv=none; b=UcXArCvKzvVZiPOv/Axv8jYUzJ6OBfo8v2uwSyYMsWy+/mE4+SfeJ/hbFJ3Pem/vfQ9C5TtCo4IcmEbOJSQzQAHjUp2hM98t/g4P7NfFH58VQdQfvus9Ev3VxXSMaEbTm4y9UartdhFdmneHDDCRIzXixBoAOxx7XrvcFBHrQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754645621; c=relaxed/simple;
	bh=v5nJw7pW9NldiMiDVu4gHWSXUhRzC6alfq7kyL5LQlU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LBmuYy6XfWzsMDq1j2NqOGdsJliBcXAXKW7FlNfWl2x5igIK3F3r35VePNdJTZm1ZfZKdBHHwx4/zOva+OtgOr0spJ5Rdp4S6as57e0QB4YUTRrmD3Wz+CDaU5ksZF3riQLu0UpPiMU8CSgQnqKgED+46sl3Gze1SDmQyyq0w5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoYYPuK8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F50AC4CEED;
	Fri,  8 Aug 2025 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754645620;
	bh=v5nJw7pW9NldiMiDVu4gHWSXUhRzC6alfq7kyL5LQlU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=AoYYPuK8P1uFQHbW4CjoOxTwUU9NZYEYOpTLEtcLOclUFUclqihkeTB0E9hYFeLlQ
	 JCfha16Eiop3urr9hw4OwPqXx5w9BgLIoogl4HT+2EcXhpx5UViol+gqEwbCgI7OTF
	 wlZa5gFAFPm15eLMwXi6LjuqGaEC2rmsE5tPTdkxDtfMo0ENfe1BjKdlyCeUs7Sgsf
	 UikHmzSQpA7fIeTOaNAnwO/mptFMnwsPJcyakaM1+I/eJn0FCUoBIspJwJfzc9zMOP
	 F+jhPOAhil6J7m2wPVXE2Ew1YuaxaO+3bOGhUw3z/PL9xS6qCmhZbJfDSdViLZHejJ
	 b5t/bCOr62hWg==
Message-ID: <bf53e762-883d-4e14-bf84-355ec9ed7ad3@kernel.org>
Date: Fri, 8 Aug 2025 10:33:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] OV02C10: image upside down in kernel 6.16
From: Bryan O'Donoghue <bod@kernel.org>
To: Frederic Stuyk <fstuyk@runbox.com>, hansg@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7d38cf46-670e-462e-b7c2-78f9aaa9eb43@runbox.com>
 <4d193kdY6jzaUWpsKVleAVgwUkBkmgx2garx3qWBKFjDuJU0LxENQpBpuvRIXGVoTLPiswDorAZVEG2wy-qjRA==@protonmail.internalid>
 <b6df9ae7-ea9f-4e5a-8065-5b130f534f37@runbox.com>
 <fb156b5c-c83c-4d33-86bb-f3cc4cf39ada@kernel.org>
Content-Language: en-US
In-Reply-To: <fb156b5c-c83c-4d33-86bb-f3cc4cf39ada@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/08/2025 10:27, Bryan O'Donoghue wrote:
> On 08/08/2025 10:03, Frederic Stuyk wrote:
>> Querying the sensor orientation metadata shows:
>>
>>       $ v4l2-ctl -d /dev/v4l-subdev6 -C camera_sensor_rotation
>>       camera_sensor_rotation: 0
>>
>> This control is read-only and cannot be changed.
> 
> Register is defined but not used.
> 
> deckard$ grep ROT drivers/media/i2c/ov02c10.c
> #define OV02C10_ROTATE_CONTROL        CCI_REG8(0x3820)
> #define OV02C10_CONFIG_ROTATE        0x18
> 
> ::set_ctrl()
> case V4L2_CID_HFLIP:
> case V4L2_CID_VFLIP:
> cci_write(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
>            ov02c10->hflip->val | ov02c10->vflip->val << 1, &ret);
> 
> ::init_controls()
> 
> ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>                                     V4L2_CID_HFLIP, 0, 1, 1, 0);
> if (ov02e10->hflip)
>          ov02e10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 
> ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>                                     V4L2_CID_VFLIP, 0, 1, 1, 0);
> if (ov02c10->vflip)
>          ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 
> Something like that should work.
> 
> I think Hans said the ACPI tables provide the orientation for the sensor.
> 
> ---
> bod

0x3820: default 0xa0

bit5: vflip_blc_0
bit4: vflip_0
bit3: hmirror_0
bit2: hbin4_0
bit1: hbin2_0
bit0: vbinf_0

So you want to set bit3 = 0x08

---
bod

