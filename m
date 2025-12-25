Return-Path: <linux-media+bounces-49558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED284CDE19B
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 22:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B52B3000EBD
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 21:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A6E296BBA;
	Thu, 25 Dec 2025 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="C/+aLgOx"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEB62BAF7;
	Thu, 25 Dec 2025 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766696398; cv=none; b=VKDAaN2FcXTc7PyXMCuCTm3+Ava2o5k8hwkoi8noyIQOrqMK3HnDXHVYo4CYJOAFp+uswgU6OAsK9iwJY5jd1/aO2Gz7Vg4qHF3WcjvQzRAudXedxWCscIIrsSnU5UEGGB21aa8dsVyEqDHOI3pv9qq7uyyWvTg7YtnJhvdFbBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766696398; c=relaxed/simple;
	bh=3DG3xWN0gJxf3xhbhmGqm9OpVOilzoqkir2AlXECbXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t1dfJP3coUlAtq37Wptm32MeUg4N0/yD1qHutmoO2QXFUWh+8kU8UaYWEoYgvvY4mSOlExZD1CI56efm96l907cyz3Eypbx1jebmIDbCbJ8i6GasSjCkrTMZIwm8SvadSSAuiDihQGfV80ffJN8nQdgdT+5OG9ilvjKJ2J2z08U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=C/+aLgOx; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dch2V2Qx9z9tKX;
	Thu, 25 Dec 2025 21:59:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766696386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSzp5TrA8n5+KkpEMX5TwvJYRc0YhJmc3FD4l2HkYOg=;
	b=C/+aLgOxtnohV9bWcjNq4wKE+fznTUQ3K78REq1BAsIURJtfyPCJqbmYhpbBF1uIgO4GF+
	tlHMgYH2nHxC5NHWhCEjvEtsB0nZ6xop9sxKB+uVgp+14hQ6WDo5XHAe/t2/YoaMOYwvWi
	U+Ssyh+oRKH9VzO+iYmU19DzY0W5FhtS2iCnp/PGoMuXQC7ccc1RBMZaWrF5KWYDFJ0iBP
	xE2cjKLktET8WtF3MD1TmpWHn+8Sq7B2XGQ37GOWRAYHcM3GO/rq5p818VzSurQ9Eqfs+e
	nXfiVApodUtIemV1+18vC5jzl7pOwfos4CKHcoOJwI43U6hw3iuOG9PuHRf5aA==
Message-ID: <5401228b-e8e3-4f2b-b91c-7e202afd9fdb@mailbox.org>
Date: Thu, 25 Dec 2025 21:59:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 01/12] media: rppx1: Add framework to support Dreamchip
 RPPX1 ISP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251225171054.1370856-1-niklas.soderlund+renesas@ragnatech.se>
 <20251225171054.1370856-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251225171054.1370856-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d84ebf8cc7a7c354592
X-MBO-RS-META: 6omtztg984d6kpay8bdcfcbosb7np6s6

On 12/25/25 6:10 PM, Niklas Söderlund wrote:
> Add a framework driver for Dreamchip RPPX1 ISP. The driver aims to
> provide a framework for other V4L2 based drivers to drive the RPPX1
> functionality. The reason for this split is that the RPPX1 IP itself do
> not provide any DMA engines to drive data to/from the device, instead it
> depends on other IP blocks to implement these features.
> 
> While the peripherals around the RPPX1 ISP used in different designs and
> by different vendors are different the RPPX1 core itself is the same.
> For this reason the framework solution to be able to split the Dreamchip
> RPPX1 driver from vendors usage of it have been picked in hope to reduce
> duplication of the common parts.
> 
> The functions provided by the RPPX1 is similar to what is exposed by
> other ISP drivers already in tree (RkISP1 primarily), but the
> implementation of them are different. It do however open up for the
> possibility to reuse the RkISP1 parameter and statistics pixel formats
> in an initial implementation.
> 
> The design is to try and keep the surface of this framework as small as
> possible. The intention of this change is to be able to fill all needs
> of this.
> 
>    * Two functions to create and destroy a RPPX1 instance, rppx1_create()
>      and rppx1_destory(). These are intended to be called in the users
>      probe and remove code paths.
> 
>    * Two functions to start and stop the RPPX1 processing, rppx1_start()
>      and rppx1_stop(). These are intended to be called in the users
>      stream on and stream off code paths.
> 
>    * One function to ask the RPPX1 to process parameters buffer prepared
>      by user space, rppx1_params_rkisp1(). This is intended to translate
>      the parameter buffer (RkISP1 format) to the register writes needed
>      to be preformed on the RPPX1. The intention is to call this function
>      when the parameter buffer is queued to the V4L2 driver and the
>      result stored by the driver until the time it needs to be written to
>      the RPPX1. It's the users responsibility to write it either using
>      MMIO or other means.
> 
>    * One function to fill in a statistic buffer (RkISP1 format) based on
>      the current status of the RPPX1, rppx1_stats_fill_isr(). The
>      intention is that the user call's this in its interrupt handler when
>      it knows the RPPX1 is done processing a frame.
> 
>    * One function to ack and retrieve the interrupts generated by the
>      RPPX1, rppx1_interrupt(). The intention is to call this function
>      when the users interrupt handler detects the RPPX1 have raised and
>      interrupt. There is no need for the user to understand, or act, on
>      the actual RPPX1 interrupt, but it can if it wants too.
> 
> The initial support in the framework is limited and do not implement any
> ISP processing algorithms other then configuring the RPPX1 to process
> any Bayer (8-, 10, or 12-bit) image and produce either a RGB or YUYV
> output. It do however probe all function blocks of the RPPX1 and provide
> an interface to interact with both parameter and statistic bufferers.
> The user of the framework will not change as algorithms for the
> different function blocks of the ISP are being added.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>                        ^

Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

(in case the apostrophe corrupted the TB tag)

Thank you for your hard work !

