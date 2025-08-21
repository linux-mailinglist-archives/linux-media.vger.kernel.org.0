Return-Path: <linux-media+bounces-40559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB0CB2F772
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9572DAA7A82
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E772749EA;
	Thu, 21 Aug 2025 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Tnx74/4z"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983B28C869
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777681; cv=none; b=bP66tujlJr58QHG+5ORIaSjgGL7to6p6ZhyQCieKzMZj+mK603hkpE8bWDpsoDbsCJdi6bfVherFpKePdR6pab6Ow8sFJG4JbMzlXEw+T4V1aLLWbgm6k2JbJYQP0Sem2yyg/BmHhvsE0WdeO5Nvu1b5IZZ8L2K1O/X/YMLfGnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777681; c=relaxed/simple;
	bh=K91enrdlaRyOiHHk6YgLklg4R6P7um0xtlczo6zTzts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcyuwmlUqoaUeTD2XIDehvzEwY3a082tEIAphMPDGS1NyorAVDFNAJ5DngH1lMiR+Qi4/F14nzB/dF+RBSA1wadL+afMYNW4ETb4AQbPZeCal2mmS0zXovOK6rQ2Io7BONVcgMrQiYFZzK0uEWtmei6envpKwnPBaYmk9BvbPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tnx74/4z; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c723J0yFNz9tSH;
	Thu, 21 Aug 2025 14:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755777676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Us2CEKzb/LZYmkMd3REl+O/jRJoz5l7mOxNvoiHYNQ=;
	b=Tnx74/4zhxlKHa8xBZEEmYRlW05meeTn2fdl8UfYK9X7ZUPQUyppNEtMfvlyGnEmBf0NvC
	4w+8i+N1i4L3AoI/a/BcrywVmEqgzaWe0fgB/3yy6xN77fJv4JGuQJ95qZsWItLXOwVQ2I
	9J/2y1u1cXz826JgG0tP5gHQKjsCQO/Hq9it1YKEseUHFhucKdp+Tbu9gJLa6Gi3pdVpiv
	+xWlSojWNBaLYTx+goWOnRBfa0eJim/pxBW3NPYgvmS0ncKqwy7lHQtIYfAwswdWvcp4Xg
	U/15aAHsns+wCjna/G8PwJFJ8+sri32ItbsEbjTQTR8720ACaclvLbvtTFgKTw==
Message-ID: <b1a39526-92c6-4fff-9376-0354bf2f8ff2@mailbox.org>
Date: Thu, 21 Aug 2025 14:01:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
 <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
 <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
 <6f6a149e-846a-45ca-b516-09482c87ea1a@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6f6a149e-846a-45ca-b516-09482c87ea1a@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 67766e4211117622b8f
X-MBO-RS-META: 57yjiim1r1b9ka3azn4618hr575chnsd

On 8/21/25 11:42 AM, Ming Qian(OSS) wrote:

Hello Ming,

>>> Using sram instead of dram only improves timing, but doesn't 
>>> completely circumvent the hardware bug
>> Does it make sense to upstream this patch anyway ?
> 
> I think this patch is helpful.
> 
> But so far, we don't have any SRAM resources for jpeg.
> The i.MX95 does have sram, but it is very limited, and it has been
> assigned to arm_scmi and VPU.

I found out the SM can work fine with only 192 kiB of SRAM instead of 
256 kiB of SRAM. That frees up 64 kiB of SRAM for NS world. Each JPEG IP 
needs 20544 Bytes for descriptors, which fits into those freed up 64 kiB 
of SRAM.

The alternative would be to handle those AXI read errors and restart the 
encoding. I always observe these errors in the CONFIG phase of encoding. 
Do you happen to have any details of this issue you could share ? Do you 
know whether the problem occurs only during CONFIG phase, or also during 
image read phase ?

If the problem occurs only during CONFIG phase of encoding, it would be 
easy to retrigger the CONFIG I think. If the problem occurs also during 
image read, that might need some more creative fix.

> This patch makes the jpeg can support SRAM. Maybe in some scenarios, we
> can assign the SRAM to jpeg instead of VPU.
> 
> So for me, I welcome this patch.

Thank you

-- 
Best regards,
Marek Vasut

