Return-Path: <linux-media+bounces-60473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM+SH3w9+mmjLAMAu9opvQ
	(envelope-from <linux-media+bounces-60473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:57:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF69D4D2F1C
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1C1B30B55DE
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 18:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE224A341F;
	Tue,  5 May 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="lWWGss4A"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CE035A938;
	Tue,  5 May 2026 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007318; cv=none; b=YB2emV4aYGFbUp22yDflfAqImT9BTuqUZZyJ+gJZgozVUD4IVkfjZnfBBOPWzVXtJzmoP03xpAJOyOiU1tMa22FLevHyE9KTWvniVePkwsU3KXYXBjbaIJSM8bnuBSBiMyVVoXe6+x1oVwphY4J3y87A4SyTShBWSwFz8atC2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007318; c=relaxed/simple;
	bh=pZZvpuAnjZimKNBIbNC9vAqnsOr6JTXaC6NK68b/Gk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNoQz3211OSPfKu9wA05vOEI58xwUBCNuvtBNcMQSzu0BCN+gDdJuxs4Tf8r9itM/k5IuxTZ/OES4rlZG1LBOnSecpO3B88r5sXySJrw+VUW+gakyQxWyuxuJrsJsymkEhFqHHYhPO6LU3A6u8J9ibVR6j7mdMyYXiDHks/fcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=lWWGss4A; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EdUe4UPi1xfrH6SeZFh0BDIwDN7xDOV5Uww/aWy2a1s=; b=lWWGss4A+4AyrPW69TEmA9O98n
	3luVcHPpCd55cDntRjiHdHeN0CKdMkn5Va2DankgUsHK5gvtEP0s/TK6VcXoKnNzg6bwhkB+IrdNJ
	rh9FMCyXucbX08zIXSkHikJ5lwdAWE8NMTlJehqORiYOC9k/f56kFWTxA5YunsbOIaX8ezGxOoRa2
	z1LOx5LSU4QWL22axnWabxNUiqBHwvkaRzUw3/4KsapoQQepYTHPyTxdZpTDctIUIiXy25002lx2I
	TcuUL4Ro2HP+OXmTar1l/l79oSiX2e2XO4bN1BfUwP+0QQPzNzKhr8GLaRRqPiW0l9zLDnev7yHwR
	vynbPytg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] media: synopsys: csi2rx: add support for rk3588 variant
Date: Tue,  5 May 2026 20:55:02 +0200
Message-ID: <177800729427.3301010.1526029967373808485.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
References: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CF69D4D2F1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60473-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]


On Tue, 28 Apr 2026 09:27:22 +0200, Michael Riesch wrote:
> Habidere,
> 
> The Rockchip RK3588 features six MIPI CSI-2 receiver units:
>  - MIPI0: connected to MIPI DCPHY0
>  - MIPI1: connected to MIPI DCPHY1
>  - MIPI2: connected to MIPI DPHY0
>  - MIPI3: connected to MIPI DPHY0-1 (only with split DPHY0)
>  - MIPI4: connected to MIPI DPHY1
>  - MIPI5: connected to MIPI DPHY1-1 (only with split DPHY1)
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      commit: 5052c99cf05271b91fe2b4e6540f7a7d9b6db62f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

