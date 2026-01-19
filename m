Return-Path: <linux-media+bounces-51019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8219ED3A242
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 879C030024DF
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 08:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A774350D4A;
	Mon, 19 Jan 2026 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="KlZN88K3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FE233B96B;
	Mon, 19 Jan 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768813129; cv=none; b=o2IfeRU8kpnBnqOg1a/x9cRrcp7vIkMCSMlUbEh2ZXkC0XfeW1yFmyybZEliQEY9p8e/zqdv210FGcULeNsSYwy6VgwXI8sgiPDfvrLHQdjhjvSNCBWcSZl5QGLmmbjjuG5MM5R528xWj7cv8HPNxanc+qqVhsbHjr5e4R8Q4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768813129; c=relaxed/simple;
	bh=Lo8mZoaaii8JRD26jt3FCJPkfvZqzRGPmpdFFjziTNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LziYjsWEHubJp9t05wO+MlAMwhJ07Gm23Pg9C74E/FJEttjF8gGzvhIlyVutNHuHQmPGWMksSzmkcWvfe2m4vBNu2LT2ux39KU1Rq/s0o/CzCejgtkrsMpCNYjgsXDPYYiNgC2zQUdxJA7Qh4d6kcRx7Q6Z6NvDaiXIbHtCdA7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=KlZN88K3; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B65D85FD8D;
	Mon, 19 Jan 2026 09:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768813126;
	bh=Lo8mZoaaii8JRD26jt3FCJPkfvZqzRGPmpdFFjziTNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlZN88K30kX5xY42fu7pSaEAKeJHxEGY2cNJniqi84AxkUGHPHeBS6TAY5zmygyOM
	 J45FU/+v4Ebje9id3gPMEGEcx+JGmFMB+7b2/0rUkLpBIVYnn8roF4n9Sfnqcgrlum
	 khdtzpIN0iWDXUwsvy8uYVsEnQiCTz6kwdewROxCqevdX9vTtGkyIjSAIeSZMWd8tU
	 qcAvUDDx/0Q5jgi3iHGBD/6SmfmltU+831vv65eFcqx/fx86YmOAOZCvn8MMzrR/8Y
	 0FFmoN8xOtzCtrTogxk6yERoo4TTSZdTHstpzIfa7GOChmAiwxkZjLHCoIZhVPX3B5
	 VU389lM1p7vtg==
Date: Mon, 19 Jan 2026 09:58:45 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: will@kernel.org, robin.murphy@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v12 3/6] iommu: Add verisilicon IOMMU driver
Message-ID: <62w3kf2jmjoswnjvhszu4zl4sc7e4ut7qzmdkkiifkrzah5qhm@vaujr4wa4ozm>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
 <20260114100922.149187-4-benjamin.gaignard@collabora.com>
 <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>

On Mon, Jan 19, 2026 at 08:58:37AM +0100, Benjamin Gaignard wrote:
> If needed I could add a patch or send a new version to add the following comment
> for vsi_iommu_restore_ctx()
> /**
>  * vsi_iommu_restore_ctx - Restore iommu context for AV1 decoder
>  *
>  * @domain: iommu domain attached to AV1 video decoder
>  *
>  * AV1 stateless decoder could decode multiple bistreams at same
>  * time and before decoding a frame it is needed to restore the iommu
>  * table to avoid mixing decode contexts.
>  */

Good idea. Please add that with the other comment I requested and send a v13.

-Joerg


