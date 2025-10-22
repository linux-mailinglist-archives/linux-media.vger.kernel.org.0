Return-Path: <linux-media+bounces-45323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41949BFE542
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 23:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D615B3539FA
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 21:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B60302CDB;
	Wed, 22 Oct 2025 21:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VJLcnh4a"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210D2877FA;
	Wed, 22 Oct 2025 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761169108; cv=none; b=C2HIg7wosy/j7nrEZzOm5l1SaxbBg0y53oc8s6rPB+PW1VI78BCAPl3IlUdMgTVU14z9uErghILzvlwwWV1AkMtIqfvrJ9AZxbEE+yhiai6sNsDFuJWgc1swFIwhq5jYurbWnE7oyvmK80Z2dZBAbaEZux7UhBy4yioZf5c4uTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761169108; c=relaxed/simple;
	bh=n8Zw4/wL2Bpk+jmRSKZmBt8iLjAPrPIC2YC696U3FzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnCgQJwb/0GBs5HhwmlKV0hbKHD5GpzcItdTGGsm7OYCXRDIatS5GuhsfxyF7w13vm49s82e+mvFgb7CvzErTqxjIONFwYaWppkHA6RSqDc8+ImjUxclPWZ8BgE+p97uUeSPL31xiuZl7kZdGI+bI8H0hDtaZt6bVJTFvujCeTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VJLcnh4a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761169104;
	bh=n8Zw4/wL2Bpk+jmRSKZmBt8iLjAPrPIC2YC696U3FzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VJLcnh4ayIO1ND/GoKsNFJdVA/pHuQxF9EjhZPaze5oYyuV2XxVy1RgsGoBbS9e3R
	 LxfwaTNytcnZ3SHg4N+wIxhbuFKFSyhLtuGg7QSZEmIvFbxKwvXrW89NVknVpWuM9A
	 j/KZ2Limkj9/FbGzuIHFuNacceSReGYosvvPu4w3+x1e6O+J8oRdgpE7w2tEsjfix0
	 4E1fLU9qWr9QWCWM+ZD5vwEAYDv5t2O42PpmF7otv1MGxjZLPlSIHNcghyvSFS3SbM
	 TSZcZ0I87q2UY8tqjLbUpSWfoDhuhschIAn7cID9uD0KoRGmDsXiUfrn9i6OIE8fWb
	 ZoF+qOUJ4obvw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF2FD17E00AC;
	Wed, 22 Oct 2025 23:38:22 +0200 (CEST)
Message-ID: <9063b2d2-d496-4577-8e71-885760e41410@collabora.com>
Date: Wed, 22 Oct 2025 23:38:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/18] media: rockchip: add a driver for the rockchip
 camera interface
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
 <aPkM8wD7rbFaeO2N@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aPkM8wD7rbFaeO2N@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 10/22/25 18:57, Sakari Ailus wrote:
> Hi Michael,
> 
>> The driver can be readily extended to provide support for the RK3588
>> VICAP variant. In order to keep things simple, however, this extension
>> shall be submitted separately.
> 
> I can't recall whether you already did but -- can you provide a
> v4l2-compliance -m report on this version, please?
> 

At some point (maybe v7 or so?) I did provide v4l2-compliance reports,
but only for the video devices.

Now I gave "-m /dev/media0" a go and the tool found two issues with some
of the subdevices :-/ Sorry for that, v14 coming soon.

Best regards,
Michael


