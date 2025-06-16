Return-Path: <linux-media+bounces-34864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F2ADAA2F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 10:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96BFB7A9DFC
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 08:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7EC207A3A;
	Mon, 16 Jun 2025 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="XjLGELEQ"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EA433AC;
	Mon, 16 Jun 2025 08:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060984; cv=none; b=HHiDC4TJ7OTj/dZeVmntLyXfgwZgWxuG3z21ys6/W34orlNfiSb2CxzTlSHq4dt9PyUCXvtiQovj8LCFPCfvuxor7X5OAXq+BEaAYBolPdsbfjDNvWaiH8kbFRTwsIcMUaluru9hKfCWhoPRMaGt3vvUdEsSbNuCR67JwzkX5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060984; c=relaxed/simple;
	bh=raEJHvLadixjvdJ7qc63R3g5V7Eedz7WU/voDKc8rO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNKV+ycfAzKCZN/WNQmIbHdeykYPZNl+38J2bIV842gHr431XatgIgY9GGYW3PBWUcdPJPdytijNOVwDR867R36Iq9IWfuV4pcw1FOWij3XR7CCUyN7QBRN9ngDkcxbyeMG5aNm/Z6pu4UAFSHCUMtxuKlz9VvrL2vj5jCvfL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=XjLGELEQ; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bLMtq22k4z1C5B;
	Mon, 16 Jun 2025 08:02:59 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bLMtn6tbmz2xTl;
	Mon, 16 Jun 2025 08:02:57 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=XjLGELEQ;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750060978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xLn9WwMy2fbwLf23/cGZVfGu07MJ871ievcr/llgWdE=;
	b=XjLGELEQ3ZeJLbQDIw7C2WCAxrCL49P5WAxLM7iPlB1LImWW61AnHtZqxOcfuqsA2EFwjk
	SUE8mhzbZtTtd8lvQndklBgWOhWsVxsWxDpgDSlFWopotDUqOcXij4hacE03yEoOGFDVFo
	PYFVu4ZHBNR8rXuR34ICzO3JxmDBmAZd+n0umsGRi9cKL4PqLt44rjwqmxjYb8uz5egFXm
	G+SnxlcbWQetJ+ErVYlDeaEHYJym04FKTQaPcZbXSoNx+si2qgRpuZHh/TA2n/QY0/N/Sb
	iSo+tZNtSvDozHL1GqXITI977MbWDoJmiNs/LXu8HZJ35WJpY/dN7TKw1TG+EA==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=684fcfb2 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=ALfknb9URJNsmHePyuIA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
Message-ID: <2f0028ac-e94f-4f35-afda-8b53ce231b3f@jjverkuil.nl>
Date: Mon, 16 Jun 2025 10:02:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] media: Fix CSI2 RGB vs BGR pixel order
To: Maxime Ripard <mripard@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 12/06/2025 14:53, Maxime Ripard wrote:
> Hi,
> 
> Here's an(other [1]) attempt at fixing the current mess due to the
> opposite meaning of what v4l2 and the MIPI-CSI2 spec call "RGB". By v4l2
> nomenclature, the format CSI calls RGB is actually BGR.
> 
> Unfortunately, a handful of CSI transceivers report through RGB media
> bus pixel code, which is then understood as V4L2_PIX_FMT_RGB24 by CSI
> receivers.
> 
> This is made somewhat worse the fact that media bus codes have been made
> mostly with parallel busses in mind, and thus the order of pixels wasn't
> clearly defined anywhere.
> 
> So the v4l2 vs CSI mismatch was confusing (but there's nothing we can do
> about it), but the doc didn't really make an attempt at clearing it up
> either.
> 
> We did have a convention so far though, that about half the affected
> drivers were following. 
> 
> This series improves the doc, adds the missing media bus codes, and
> converts the transceiver drivers to the rightful media bus format.
> 
> We'll also need that series [2] from Laurent to fix all the affected
> transceivers. 
> 
> Let me know what you think,
> Maxime
> 
> 1: https://lore.kernel.org/r/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org
> 2: https://lore.kernel.org/r/20250611181528.19542-1-laurent.pinchart@ideasonboard.com

This link seems to be wrong. Can you give the correct URL?

Regards,

	Hans

> 
> ---
> Maxime Ripard (4):
>       media: uapi: Clarify MBUS color component order for serial buses
>       media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
>       media: tc358743: Fix the RGB MBUS format
>       media: gc2145: Fix the RGB MBUS format
> 
>  .../userspace-api/media/v4l/subdev-formats.rst     | 51 +++++++++++++++++++---
>  drivers/media/i2c/gc2145.c                         |  4 +-
>  drivers/media/i2c/tc358743.c                       | 10 ++---
>  include/uapi/linux/media-bus-format.h              |  3 +-
>  4 files changed, 54 insertions(+), 14 deletions(-)
> ---
> base-commit: 6e417fb287553495e43135125d099daf80b63fe1
> change-id: 20250612-csi-bgr-rgb-b837980c00b3
> 
> Best regards,


