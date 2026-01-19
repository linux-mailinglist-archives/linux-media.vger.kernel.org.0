Return-Path: <linux-media+bounces-51018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D0D3A24D
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6E7A3082166
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B88350D4C;
	Mon, 19 Jan 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="vajByuO2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7865350280;
	Mon, 19 Jan 2026 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812987; cv=none; b=Dt3erOXDq621f10M7M90aFTrvQxycz9yvFhwbgt3w4T4vJ9j9FTT4VHGBcd3URHJthCYa2nkkgHBtMOnRfKoAeRsxiVy/Yr6N8XOQRLhLRgovEJJGm/e9MafayliQjHlRn8yY3T7py6YjPru9xbCRG8etdGerkVygIkF52w6ZiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812987; c=relaxed/simple;
	bh=9iYYlWq5RKphq3xtHuAjLTBgmtCUMliojUXRG4UjaZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0z3btbKeSaIXIt0jrOFZQYMdbJxQCjeZF04/hMCkDEsO9Mg5TQuHigN7ath0q1EMFD7ncN1BpqajXwZFlsQZDU6gHfJcAR3owkab1+o2AJECqzgjc76cZicb0VzofIGyVrIZVOo0DnlO3lWkG/Bnu9VRXw9Qc616bsdCBg17MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=vajByuO2; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 592055FD8D;
	Mon, 19 Jan 2026 09:56:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768812984;
	bh=9iYYlWq5RKphq3xtHuAjLTBgmtCUMliojUXRG4UjaZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vajByuO2m3rIm5XGOXMJd9MmaN6MUFzdLp7pdgRDi47q/3HGvMK9/E8JSS+t75IdZ
	 BorcbBaGlbxYg9O2ESDONDIEntUG+zczjNiwoXemUmNPF7JhbhiEfxf9w6cv3oKJWm
	 s9u+WEuAMSvROa+EoLo02BdL+hsIADQH+tJIpX15oy2Qmj9z2y5UPaJRSYbu8DvVzJ
	 G0dADKJkmt/5WVGLZaXuZaslpofgoEGij34S9rvBbc5LbwN9CyRn9EfXaCiIJG7qs5
	 Zi7PhzD4w5TN77ppzARYJY87eIn/2gM+eCQWlhOZAX5CP4FtmsxbQF13nWJb/ncpwD
	 bZM6gIB3KeQNQ==
Date: Mon, 19 Jan 2026 09:56:23 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Will Deacon <will@kernel.org>, robin.murphy@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <piak4uh65p5rzyicotia4at2g2bdwqg3xyrln53v3yfjzyde5j@irwvikgbyexl>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
 <1030ddab-6124-414d-958f-c461c19bdbb0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1030ddab-6124-414d-958f-c461c19bdbb0@collabora.com>

On Mon, Jan 19, 2026 at 08:51:46AM +0100, Benjamin Gaignard wrote:
> I have already send v12 where I have removed the useless function.

Then either send a patch on-top or a v13.

