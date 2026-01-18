Return-Path: <linux-media+bounces-50970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E930D3938D
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 10:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EE883015A9E
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 09:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BCC2D5C95;
	Sun, 18 Jan 2026 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="1oHg8FZw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9202BCF5D;
	Sun, 18 Jan 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768729271; cv=none; b=uiJAJIuaJ5ZUFZ/U0F9zBTXxXk/74f3aLdjtNwFhIJUHVp8FNy75X2QsdjIV0VoogyETDml2LgW6ZwG5h1TilnnnLoY+CrnH20zTVWSw6qqhjHyEnehOICSzCHcXeYj6Vs3jrDzrI5tfP0+hJBpqm4ybfkZt2U4/bJNr2h7rKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768729271; c=relaxed/simple;
	bh=meUwEYrMdweubvTIm5FwW/U0eowupvfI3Lql8NwUJtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbBHpjt+T5dGxhnVKd0DyMo4KDO3Ayu6hHwHgNByX8TwKOD+A4Z69W/9nlnkZWp/aT0VV23O5ONKdgRfRA2wVZAOxp9s9xP8UINZPdHym1gr+o63vXS6UgIBsM/tqI2XK8oCzlcj8V1Lth5D/UG8RPQAhrtLvSI/cRzonVNQkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=1oHg8FZw; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af1d960047d77347aeef488f.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:47d7:7347:aeef:488f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3781A5FABE;
	Sun, 18 Jan 2026 10:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768729263;
	bh=meUwEYrMdweubvTIm5FwW/U0eowupvfI3Lql8NwUJtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1oHg8FZw2wv7vH7qbbyBuDnThAsavGNrks5gc3Jq2wMNdke5i1Q5X8PMji2guRWGE
	 tISEaDxmMcUZo0WZMg8LHkcxlA9ZTht/1K+ceKUNl3/sSMC6EHZtv7YBtB+RqDjpA4
	 Szz4quSLI8HQ18qzVX6o6IpZb1AS5OWjc7ahvV2RpkSYoK/wdI9T/EpxfA4QMngOoj
	 k7luaysT03vqWQIqtBWe8Xh0ZdCw6GyGgV2NQu8+BD1Qr2xxfxqhVz/a60NaIag9ZI
	 Tq2fFY7KNW/hXIYXvo5W+0hnDbTA7rhJpwyu9TlRVdmPBxZNLwm6XHCXJzG5hhEmDn
	 emj3VYKPzjczw==
Date: Sun, 18 Jan 2026 10:41:02 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, 
	mchehab@kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZui-rn5RDPwpEO@willie-the-truck>

Benjamin,

On Tue, Jan 13, 2026 at 04:10:51PM +0000, Will Deacon wrote:
> I took another look at this to see whether it had changed significantly
> from v6 when compared to the rockchip driver. Sadly, they still look
> very similar to me and I continue to suspect that the hardware is a
> derivative. I really don't understand why having a shared implementation
> of the default domain ops is difficult or controversial. Have you tried
> to write it?

When updating for v12, can you please put an explanatory comment at the top of
the file explaining the relationship of the IP this driver is for to the
RockChip IOMMU and the rationale for having it as a separate driver? I want
this part of the discussion documented in the code in case it comes up again.


-Joerg

