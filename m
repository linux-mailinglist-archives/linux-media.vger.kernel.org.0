Return-Path: <linux-media+bounces-30071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA4A86827
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 23:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76FF1BA423B
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 21:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A9129AAF3;
	Fri, 11 Apr 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q0hWbpIe"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82528137D;
	Fri, 11 Apr 2025 21:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406734; cv=none; b=Te/SqM0ENeo43sEkr+XQWs42X1vTVV4z4Dzrqi9RJ5AUodSGTELIvotiaOkvkv1zSJONYeKPVtLpMQL51SwivQ1pArRRLcviDajRxE0K4DjxYoH3F3G6qEFzGtZBrzo1tGi6KOPyLxv0/dTHY7AA40sN2iv3vlQkM9erNGDH0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406734; c=relaxed/simple;
	bh=ThBaHPlP8Us6So99qDHxoLAuz+a80BU93KBGXiGoG58=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=luJJN4xmNxP6F25unnvxRhYmgRtcPp373Vex49nujYpVzAN3ALONRIV9JRsRL2PoAK7O08+tMs6QVWf04BCiyehXZ5aCdkqd0DU82FDQXFp4oWRfdsQokSTQufQZbeFaIn4csYDdjM2YzESPGfds9GQ9a2xWQCOmC/YzRcWPACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q0hWbpIe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744406729;
	bh=ThBaHPlP8Us6So99qDHxoLAuz+a80BU93KBGXiGoG58=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=q0hWbpIe2HvBwghNgE0McPUR1I+vlPkRQVIYhv6NZw7vwm6kPM7p3a3c1KmJSyo9C
	 IO2ZPnT8rmZIfJcCWBkBYwGTWHzhTerMDKCXlX2SYe5I5yhtVPNi0w4HDpVUiboCjt
	 ICFGReI2Tvi53xxqBghM1Y/fq+cQVhWhIZqfkiIH+XTk6AuHcVnG2h0on0nw4B/opj
	 LRCh5MgOT3R0VQSkBNz32AFnRaGnuYzi0bJoprkRbKyAt3iBIA1Py6+GsIPC6uMWSC
	 T/Ap6KrjvzgmX+yy7vY43Y75XBmDMl/54t37lsMMEifXnwhXf+w/T8l+FQEVaJxZW1
	 brNGWVwRS3dBA==
Received: from [IPv6:2606:6d00:11:e976::c41] (unknown [IPv6:2606:6d00:11:e976::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68BF717E0B2D;
	Fri, 11 Apr 2025 23:25:26 +0200 (CEST)
Message-ID: <9f1c7c30082de242b4906e5ecbeb382400fcd4a2.camel@collabora.com>
Subject: Re: [PATCH 2/3] mailmap: add entry for Michael Riesch
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: michael.riesch@collabora.com, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Sakari Ailus <sakari.ailus@linux.intel.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Date: Fri, 11 Apr 2025 17:25:24 -0400
In-Reply-To: <20250410-maintainer-mriesch-v1-2-cdc5c6c68238@collabora.com>
References: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
	 <20250410-maintainer-mriesch-v1-2-cdc5c6c68238@collabora.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le jeudi 10 avril 2025 à 21:41 +0200, Michael Riesch via B4 Relay a
écrit :
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> After five interesting years, I left WolfVision and started to work
> for
> Collabora. Add a corresponding mailmap entry.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>

> ---
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.mailmap b/.mailmap
> index 4f7cd8e23177..59f99aa83185 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -503,6 +503,7 @@ Mayuresh Janorkar <mayur@ti.com>
>  Md Sadre Alam <quic_mdalam@quicinc.com> <mdalam@codeaurora.org>
>  Miaoqing Pan <quic_miaoqing@quicinc.com> <miaoqing@codeaurora.org>
>  Michael Buesch <m@bues.ch>
> +Michael Riesch <michael.riesch@collabora.com>
> <michael.riesch@wolfvision.net>
>  Michal Simek <michal.simek@amd.com> <michal.simek@xilinx.com>
>  Michel Dänzer <michel@tungstengraphics.com>
>  Michel Lespinasse <michel@lespinasse.org>

