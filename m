Return-Path: <linux-media+bounces-49337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30DCD5AD0
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD70730237A9
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAB12DCC04;
	Mon, 22 Dec 2025 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dx4dlihs"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BBB219303;
	Mon, 22 Dec 2025 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766400776; cv=none; b=gC3yL4r0mD4EETgcU8lsGm2Mldb8absCFiDkwR1EgaPuOHinvlGrDQvQw23aaxhSQJbwuofyLWOldWgSMWZ/OzmJSd6fSuCjDB1fRaxHDcDMtjpe6G053Y70KuFXm460jzylBpuOYjcCKruK2H8WCEmcnApSlAk5kCsu8o4KcWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766400776; c=relaxed/simple;
	bh=yR3XLlPsBVBt623zAwcBxYbHiscFPr+WDAuPWLeURTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fOFU5V1Qt8KJDqGO9DMc6UpZptjG9NxFo+hwbSZlDnQcmhi7Aqv+jcji8HJ832u/yJL6B8RZBW2CRDvD5M+KAZpFlqH4qbXdfGMFTtMvjeW+BTkP7c2Pji5tuQVYbyE6+3m3MoN6AzElVlQOkbY6uuBMWRwV2zaw+0+TfWmyEMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dx4dlihs; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dZZjT0csbz9sRx;
	Mon, 22 Dec 2025 11:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766400765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXI5KezZWY1SsMtfKiD420M+L57YvEvMyMG0dWoQ63A=;
	b=dx4dlihs3ZwCVbMteeO+QOKd3lxhxY33iu1wAY3z0ikM2qcxQgP5ihVEga1FBzKqqGtYQ6
	fKTcZH2gY8MiZ9rxZv/XPckVOYxh7HExQI13ZYqa0gY0LtHTop9/hM/adIJhosFrgy+udz
	miKF6qJZPfSBwyvQDF8/Kp3eqhbEglj5VkayXcX+wKt75+Z4deHUaPrGIb5oo0i62xWiG/
	RBaOvkJ7MHqTk2VwgzhFyaHyUs1CzsoY1UZBpluXCSTz++tc7JJeFUMPYjO/azf2QFmcE8
	5c5dzsYdTsR8CMVZpfx9X3VdGC16+3nHxtWxMIKK4tTcHc5MWrSmhpC0itYADw==
Message-ID: <de5e22b9-5a35-47b4-b290-06729b56c887@mailbox.org>
Date: Mon, 22 Dec 2025 11:52:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/12] media: Add support for R-Car ISP using Dreamchip
 RPPX1 ISP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251111090228.2511734-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251111090228.2511734-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6b419733c5d4fab65a2
X-MBO-RS-META: ycsxpgj5g79qpwqgb1ubox6gddueipzg

On 11/11/25 10:02 AM, Niklas SÃ¶derlund wrote:
> Hello,
> 
> This series adds support for two different devices that together enable
> ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
> is for Dreamchip RPPX1 ISP, this device purely deals with image
> processing algorithms, statistics and image conversion; but have no DMA
> engines. The second driver is for the R-Car ISP CORE, this device
> deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
> interface for the ISP.
> 
> The R-Car ISP driver uses the RPPX1 framework to drive the ISP and
> together the two devices provide a functional ISP. For detailed
> description of the RPPX1 see patch 1/12, and for details about the R-Car
> ISP see commit message in patch 2/12.
> 
> The RPPX1 ISP is similar to functionality and design to the Rk1ISP
> already supported upstream. For this reason this series reuses the pixel
> format for ISP parameters (RK1E) and statistics (RK1S) as the user-space
> ABI to configure the ISP. The primary difference to Rk1iSP is the over
> all pipeline design and the register layout out is different enough to
> make it impractical to bolt it on the existing drivers.
> 
> However on a functional block level the blocks amiable and their
> register layout mapped to the buffer formats are similar enough to make
> the reuse practical. Another difference is that RPPX1 operates at a
> hight bitdepth then Rk1ISP, but this is easily supported by scaling the
> values to/from the buffers.
> 
> All functional blocks present on the RPPX1 are not yet added to the
> driver, but most are. Hence not all configuration blocks of the Rk1E
> extensible format are supported, but most if not all can be added.
> 
> A libcamera pipeline reusing the Rk1ISP IPA have been posted and it can
> exercise all function block enabled by this series. It produce good
> images using all algorithms available.
> 
> Patch 1/12 adds the foundation for the RPPX1 framework. It deals with
> probing all function blocks making sure every blocks version register is
> supported and setup a "passthru" pipeline that just debayer RAW images.
> 
> Patch 2/12 integrates the adds the R-Car ISP CORE DMA parts and
> integrates with the RPPX1 framework added in patch 1/12.
> 
> Patches 3/12 to 12/12 extends the RPPX1 framework with the logic to drive
> the different IPS modules.
> 
> The sum of the work pass v4l2-compliance. A test suite for the enabled
> function blocks exists and pass. The work have also been tested with
> various libcamera utilities and compliance tests together with a IMX219
> and IMX462 sensor on R-Car V4H.
> 
> Biggest change from v3 is small fixes that 0day found when building for
> non ARM architectures.

For this series, please add my:

Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>

# On Retronix Sparrow Hawk with Renesas R-Car R8A779G3 rev. 3.1 SoC .

Thank you !

