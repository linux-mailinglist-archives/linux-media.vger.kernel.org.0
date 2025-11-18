Return-Path: <linux-media+bounces-47320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD10C6B519
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 19:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57F274E05D3
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 18:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C242E2E1EE0;
	Tue, 18 Nov 2025 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qdjIFpj9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246FA2E1C57;
	Tue, 18 Nov 2025 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492361; cv=none; b=qozG49kGiM5NFCbVdzDb1xjnY/Ka0W9krcQY+qXQcl5pTzYl9pquUkz0L1MW+nxdIKCRY+6ZvAoASp6Vzk8CAHRXyD9op5c3JTwYRoSxIzrzl7xFv7jMA9MAfqwJkNa3tmZwiXTUuQQ0cB3Ik4Fiyw19hzuH5Ql6PRwXaJtrTKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492361; c=relaxed/simple;
	bh=zJNUrRj587FQsGyE0czCnjJ6PtuOY81WP+YvMy5Ka1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8GTfiuEcU7oy/iM7hnmBJna2VyoTCucuw+wkWrEYHvnhWcToz4Odt4AvJ77jfFNqq6B0U3v9ceae4DwnkxBWnRfR35d0Sq9RLVnO0NTXeEgt3LiQXG8L1Q+X74nm3djTigNQLO3bp0TBGv/ZnTDtJnPQaTmAKb0hura36dbgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qdjIFpj9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763492355;
	bh=zJNUrRj587FQsGyE0czCnjJ6PtuOY81WP+YvMy5Ka1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qdjIFpj9XfKyHjeibzt+NBM1a2vqzFfX4V3QdUbParRXtar/U765arJQycLvPXCVz
	 pdknpJnXYbqYoMsnkVQw78Fdt07QKs13NmgXRe7B0pZqNI1qo1UKCAEq+EdCjBBFxW
	 gIucdl8H02k9UBV3kFDur6ccv5FMWCvRQ0GLFEjw/tavAHeJ34EY/WbR5fdxJawwOV
	 HKu+zspSn5oqfoWg04OxZH5FqXS/laOaFeYSLU/q/2VXk03GXG7jHmYeZuuYm+F0gq
	 JoZEgCfwNy3D7kf2Syu61p0oczWw9FdRQNIpDT/QiFDCZAan/4xqrxUZdh+RjXOiDC
	 es6QJjaF9ERkQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DCD8E17E0117;
	Tue, 18 Nov 2025 19:59:14 +0100 (CET)
Message-ID: <554971e1-6fde-4b2c-a2de-fe178358a4e3@collabora.com>
Date: Tue, 18 Nov 2025 19:59:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
To: Frank Li <Frank.li@nxp.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
 <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
 <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Frank,

On 11/18/25 18:15, Frank Li wrote:
> On Tue, Nov 18, 2025 at 12:12:26PM +0100, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>>[...]
>> +#define CSI2HOST_N_LANES     0x04
>> +#define CSI2HOST_CSI2_RESETN 0x10
>> +#define CSI2HOST_PHY_STATE   0x14
>> +#define CSI2HOST_ERR1	     0x20
>> +#define CSI2HOST_ERR2	     0x24
>> +#define CSI2HOST_MSK1	     0x28
>> +#define CSI2HOST_MSK2	     0x2c
>> +#define CSI2HOST_CONTROL     0x40
> 
> Look like that is designware CSI2 controller, can we build common library
> for all dwc csi2 controller, instead of every vendor create individual one.
> 
> First try at
> https://lore.kernel.org/linux-media/20250821-95_cam-v3-21-c9286fbb34b9@nxp.com/
> 
> Toshiba have similar patch
> https://lore.kernel.org/linux-media/aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810/
> 
> Frank

This has been discussed already a while ago:
https://lore.kernel.org/all/20250507083837.GA11152@pendragon.ideasonboard.com/

Bottom line from Laurent:

"Let's keep this driver Rockchip-specific then. Thanks for checking."

>  [...]
Best regards,
Michael

