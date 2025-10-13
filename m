Return-Path: <linux-media+bounces-44243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC721BD1ADA
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81B404EDF1F
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 06:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680C02E267D;
	Mon, 13 Oct 2025 06:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFKDIrPY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B605C1D618E;
	Mon, 13 Oct 2025 06:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760336819; cv=none; b=VH9cUG78GgVU9pFGBo99VGeGnkp7FHMTcd0IbpGZqpPGvm2A3ATOfJ+wRv+kVHb4TlpwlcrrShBWIAEc/v+KmTdaEUcZINyTTiQJb+GLifSUHNygwEYP1F0/leb1b9ug6fjf4DnBmomRfWt6GaNjAYJJxdAfyYv+t+mQOc+U7PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760336819; c=relaxed/simple;
	bh=W44OX3A6p6SRHvj91/XjFugrVwP4yz2hxtwlKgaGagY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ME0UuXTPfpmp7Ifq4KhjECH0rX2rdPC4D5UARNd8uTc1s85Qm5Klln2QrTQuCStKelL6CVANIb93FnOKQOuhEmp/8Ct7oCTuBnk5I9UXdFOTD7omS5O0Pp+0GnDbzwt8tRcCUAeQhok5tXlkeZDSejpyzMbX2RPfPdgNYApGnS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFKDIrPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9004C4CEE7;
	Mon, 13 Oct 2025 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760336819;
	bh=W44OX3A6p6SRHvj91/XjFugrVwP4yz2hxtwlKgaGagY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EFKDIrPYrbFPZwWBmj9KmGF/w2X4ZfbrefO3TsRU7fZ715tZ8PjcBEqMVoxaKvBqn
	 DuJseXgthDsF3i3tmxy3RwrFsfx5dgTf5zp4mhQKpF3T6GTpl66cDQ8jMpgIiiTUkl
	 Xw402/kDbKtw8HLSMXXO6AvKag+AjxfuIF7XXN73fmpu7LqGpry7Yj9BUmCxuWhk1N
	 FGcfepFtwZJKpNxsoP1EWdrVukm1Y//BSwk0KUyVMuEhixpO9r3aQbk7RY07cc4r9T
	 iylQ2VyJv8dyHT+OS2/iBuPL+YFVUbOG/d9uu4aOZ8UO0Yp91ym6/vn5vl2X35OPvf
	 dUVzQlD+G2eUg==
Message-ID: <3038fee4-f2a2-4fba-a1a1-d7ec00128d8c@kernel.org>
Date: Mon, 13 Oct 2025 08:26:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] dt-bindings: media: ti: vpe: Add support for Video
 Input Port
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hverkuil+cisco@kernel.org
Cc: sakari.ailus@linux.intel.com, bparrot@ti.com,
 jai.luthra@ideasonboard.com, dale@farnsworth.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, u-kumar1@ti.com,
 Sukrut Bellary <sbellary@baylibre.com>
References: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
 <20250909080718.1381758-5-y-abhilashchandra@ti.com>
 <56a961c4-d11b-448c-81a6-a3a970627dda@kernel.org>
 <7d183747-af9e-4607-8219-e89ddcb79654@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <7d183747-af9e-4607-8219-e89ddcb79654@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/10/2025 08:21, Yemike Abhilash Chandra wrote:
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    vip1: video@48970000 {
>>> +        compatible = "ti,dra7-vip";
>>> +        reg = <0x48970000 0x114>,
>>> +              <0x48975500 0xD8>,
>>> +              <0x48975700 0x18>,
>>> +              <0x48975800 0x80>,
>>> +              <0x48975a00 0xD8>,
>>> +              <0x48975c00 0x18>,
>>> +              <0x48975d00 0x80>,
>>
>> Are you really, REALLY sure these are separate address spaces? Some
>> people thing that gaps means address space finishes...
>>
>>
>> How does your datasheet define these?
>>
> 
> These are not separate address spaces. The datasheet defines them as a
> single address region: VIP1 (0x4897_0000 –> 0x4897_FFFF, 64 KiB).
> 
> We created three common libraries sc.c (scalar), csc.c (color space 
> converter),
> and vpdma.c, which are used by both VPE and VIP drivers. The helper 
> functions
> in these libraries were originally written in a way that assumes sc0, csc0,
> sc1, and csc1 are separate address spaces. Since VPE has already been
> upstreamed using this approach. I have tried to use the same kind of 
> approach.
> But I now understand that, this might not be correct to define these as 
> separate
> address spaces.


Your previous driver choices should not matter. You are describing here
hardware, not drivers. Especially not previous drivers.

> 
> One solution would be to rewrite these helpers and update both VPE and
> VIP accordingly, but changing these helpers now may risk breaking backward
> compatibility for VPE.

Don't care. Describe properly hardware.

> 
> Alternatively, we could make the VIP driver standalone by avoiding the 
> use of these
> helpers. I was able to achieve this for csc.c and sc.c, but for vpdma.c, 
> I had to
> export a specific function from vpdma.c, since the VIP driver no longer 
> relies on the
> helpers provided by vpdma.c (In the previous approach the helper would 
> call this function)

Again, describe hardware, not drivers.


Best regards,
Krzysztof

