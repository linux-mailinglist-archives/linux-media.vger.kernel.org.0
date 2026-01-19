Return-Path: <linux-media+bounces-51063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6CD3AB35
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 15:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C0A1302E338
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 14:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36CF378D6C;
	Mon, 19 Jan 2026 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="xPgVoupC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303F1374186;
	Mon, 19 Jan 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831582; cv=none; b=UrljkDWf71nVLvDvWQkUTyD5f0XNMmdnFJiNRi/okhtLMx0s6ZNAYMcHM9ZHSw6N+y9C43L5V2Dgi9ORWDq5qstUQVa1aBVlm4p3PGI7QOhIjHWnaUqTTe1Bwvdhv08Nak5cwsr//E2ba5MsCXoznQ98C9ou6elTwavLNsUIeMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831582; c=relaxed/simple;
	bh=8fE/fVBEgdOLpzuob5JArOL9qUED4Igf5P6wZV9E7zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfT9g5DtXf70xX62oT3/2ngI6UnC0X0FloW7gbHCVrZRLwb215P2tEJSXGda/znSYiYylSfIKtow5tqMe3zJHpq7NS8waVt8wDxhh3wlo4KVV7TY5EF2Cpb3CMsQZ+A2GF7IUMdv69TPAgJ8OwGKOIHgKM8aSdrCmxuPADQhkzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=xPgVoupC; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A8A165FE3B;
	Mon, 19 Jan 2026 15:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768831573;
	bh=8fE/fVBEgdOLpzuob5JArOL9qUED4Igf5P6wZV9E7zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xPgVoupCZJ21WG/9NetjaYmj37rlGXT0p1h01g/8PJf/5BIF/sDss8wVY7EBEuCxc
	 o50eZsGy06uMek/GekduYUc5aIaus/KwqqpL5mNJlrZYYzH6u0UJGE6jqYJfgw5HpX
	 8WyvB+OC36TmRRvmPVpg870uPg62YqoWwjrbQOPPl+TGMMS5Xbkd990Qq0zpCe+C05
	 5PynYXLJG2n+yhU6JGOenybtrAbQIEXemWff2IbFUZkGoVVtb2tNqkcJoPSthab6Np
	 B8buqRrGdK6s8V3FOkjRGjak08I9MEp0uu6DMJoleA/1Y1Ld380PutUAMZhAOYKicD
	 UZqqaTazCQs1Q==
Date: Mon, 19 Jan 2026 15:06:12 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Will Deacon <will@kernel.org>, robin.murphy@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <f2v4y2fi6dw44zfp4uxn6d5v5hq4sukwds4hxn4btn6zxr7vrp@b4qbub57vgft>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
 <d81c0f26-ab36-42a9-bc40-b9767aea038a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d81c0f26-ab36-42a9-bc40-b9767aea038a@collabora.com>

On Mon, Jan 19, 2026 at 11:28:11AM +0100, Benjamin Gaignard wrote:
>  * This hardware block is using a 2 pages tables allocation structure.
>  * That make very similar to Rockhip iommu hardware blocks but it has
>  * it own driver because the registers offset and configuration bits
>  * are completely different. An additional raison is that this hardware
>  * has been developped by Verisilicon to be used by their hardware video
>  * decoders and for a general purpose like Rockchip iommus.

Please run a spell checker on this (e.g. raion -> reason, developped ->
developed) and I think the last sentence lacks a "not". Looks good otherwise.

-Joerg

