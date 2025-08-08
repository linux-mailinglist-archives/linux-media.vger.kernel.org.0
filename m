Return-Path: <linux-media+bounces-39109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FDFB1E59B
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71CCF3BCB23
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159DA26E70E;
	Fri,  8 Aug 2025 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIhPQXAh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A252C181;
	Fri,  8 Aug 2025 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754645263; cv=none; b=eLwmfrRiPBbbUKgbJZxf2MxDzAH1EK2ETan+nYeuPwIJoef9M9O1dPlCJ1+fmGTlghjNi3DxQPp14htEvEyN5GflRU6ypzRKb5jelJurqugAIUCdLxGhnvl0oVh0lD8E4D15UtpmSJGc/WPqdN/YCErfsvc1fFsw+yReRi6qFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754645263; c=relaxed/simple;
	bh=XMAAaKUHKb+89gbJxiJrRs/H0s9nZo36TNrqRNIy1z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dw2yA9k5HA7Yg8abuN0GFWcccW1LjRkqVaRsF8yVcw3fP8cL6vC4lwFszIni8vGkUeJpEymsCH4qRl5zT/XTBh+/+tOjo31+hq1CBc2HSKYuLPUlwl1tRaYGxE6PiiNROjjCehNg+YfnWuBGuodvNpkh5u4yWUGsRyOcRlR+Eo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIhPQXAh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD557C4CEED;
	Fri,  8 Aug 2025 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754645263;
	bh=XMAAaKUHKb+89gbJxiJrRs/H0s9nZo36TNrqRNIy1z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CIhPQXAhwxdTe1R/BiOa44O+SbQWYdwBn+2/N1HHBfhy109QeXfKIunpLCHPWqIFZ
	 d22PQSn7qWr9wbbQ1+YPQs3Sp0Fg/GQEP+GM1GeLvNnaR0nZjKpNuSBi9YAjqkZPUW
	 a8mbNtrju92OrFwbERu4JVxQn8duKtvG5vEFBZnFd2KolyuhPRPJHZWJMFasx9tpPn
	 UMIoVMpW1YI58xeDG0DbdNgDNP/8eSLOqXZtFB2hCL9mWKk0nqI0p1YilmGNiVg272
	 oLSLKLsn5uqsta3GkG9zJKfxZaM4Bj+1mMkI2jyH71CdQiBve/gMVF/7usjprluVJp
	 LGj4SVGGS939Q==
Message-ID: <fb156b5c-c83c-4d33-86bb-f3cc4cf39ada@kernel.org>
Date: Fri, 8 Aug 2025 10:27:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] OV02C10: image upside down in kernel 6.16
To: Frederic Stuyk <fstuyk@runbox.com>, hansg@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7d38cf46-670e-462e-b7c2-78f9aaa9eb43@runbox.com>
 <4d193kdY6jzaUWpsKVleAVgwUkBkmgx2garx3qWBKFjDuJU0LxENQpBpuvRIXGVoTLPiswDorAZVEG2wy-qjRA==@protonmail.internalid>
 <b6df9ae7-ea9f-4e5a-8065-5b130f534f37@runbox.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <b6df9ae7-ea9f-4e5a-8065-5b130f534f37@runbox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/08/2025 10:03, Frederic Stuyk wrote:
> Querying the sensor orientation metadata shows:
> 
>       $ v4l2-ctl -d /dev/v4l-subdev6 -C camera_sensor_rotation
>       camera_sensor_rotation: 0
> 
> This control is read-only and cannot be changed.

Register is defined but not used.

deckard$ grep ROT drivers/media/i2c/ov02c10.c
#define OV02C10_ROTATE_CONTROL		CCI_REG8(0x3820)
#define OV02C10_CONFIG_ROTATE		0x18

::set_ctrl()
case V4L2_CID_HFLIP:
case V4L2_CID_VFLIP:
cci_write(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
           ov02c10->hflip->val | ov02c10->vflip->val << 1, &ret);

::init_controls()

ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
                                    V4L2_CID_HFLIP, 0, 1, 1, 0);
if (ov02e10->hflip)
         ov02e10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;

ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
                                    V4L2_CID_VFLIP, 0, 1, 1, 0);
if (ov02c10->vflip)
         ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;

Something like that should work.

I think Hans said the ACPI tables provide the orientation for the sensor.

---
bod

