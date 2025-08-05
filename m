Return-Path: <linux-media+bounces-38901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD5BB1B04D
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FF5C189285A
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C88B25394C;
	Tue,  5 Aug 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0AJXyO8i"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12132494C2;
	Tue,  5 Aug 2025 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754383213; cv=none; b=WcvdTuefd16KTfXUm2nakAelMQHJDYNCPjvOlk+6o7IhJmgMD4CwGV1SqXcR2McIpAlUgzqeZzzEqji4EDdHHhOL9hrfRZrZUnA6Ls0XmlsHC7NE6xUreO0LGMmQLmTrpKtLfrwX93QJIR6yYZm5zbDEsdasrcvEI8z68fMWiqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754383213; c=relaxed/simple;
	bh=1ip67BdMs/akXi5ehVuqM2pQ7e1uUDLLsiJWWVNnZw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSdrg2kVar0+3N36rhDpuMUVnPqul4La5lHuLFzSE47++W8CO+0cW/59qjo1m1ucuzhHzZuar2hHBpiWAO2kltf755p0Ia7PhwHTYBG6YuAlwzcV3sZxrWakb4IyxiPmAHZBB2r6SxV5m3fXuuckFldQfbiP45A4LDtOj+si+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0AJXyO8i; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XoPxFNcgJAdEsyWsliRUUMh2F6p8LJA74DV0vc4jgz0=; b=0AJXyO8ipdWn0DQG5vvehlul4J
	rT6iw99nglWoNXDFrqsorX1kPXe7qSddRSeNwmcwkbnDBIWFS1+F5bNXR3/EjdHvXOOI5pbllTwJF
	ENDybyQu5HAY/qfFgl9x8LIPgUwlyIMWIR3yA92I7HrxhIFA4i77bZz80XUlnqWo+cIIpULtJKah1
	H9Xe8mGj4v6+GLoo9i9Rnlp8WAge23Me5DBLTFw97KbLdgUd9PgZvp4ji4Sc/G9idpMH0AKObcEsC
	QLw/ONECJyeoYcuiFbatVCJFb4lxSjV+/lKhbmV4W82WuoGgO8dQFXtfaUoNQ10/APkKP6cl7F9qX
	07tsTzMg==;
Received: from i53875aca.versanet.de ([83.135.90.202] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ujDDH-0004kH-KH; Tue, 05 Aug 2025 10:40:03 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Cc: linmq006@gmail.com
Subject:
 Re: [PATCH] media: rkvdec: Fix incorrect NULL check for
 iommu_paging_domain_alloc
Date: Tue, 05 Aug 2025 10:40:02 +0200
Message-ID: <2196043.OBFZWjSADL@diego>
In-Reply-To: <20250805061833.3670085-1-linmq006@gmail.com>
References: <20250805061833.3670085-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 5. August 2025, 08:18:33 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Miaoqian Lin:
> iommu_paging_domain_alloc returns error pointers on failure.
> Replace the NULL check with IS_ERR to correctly handle error cases
> and avoid invalid pointer dereference.
>=20
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Going from the (static inline) function definition [0] to the
iommu_paging_domain_alloc_flags() function [1] it uses, the doc states
	"Return [...]  or an ERR pointer for failure."

So this is the correct fix,
Reviewed-by: Heiko Stuebner <heiko@sntech.de>



[0] https://elixir.bootlin.com/linux/v6.16/source/include/linux/iommu.h#L858
[1] https://elixir.bootlin.com/linux/v6.16/source/drivers/iommu/iommu.c#L20=
46



