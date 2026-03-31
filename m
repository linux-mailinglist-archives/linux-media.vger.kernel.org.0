Return-Path: <linux-media+bounces-57822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN+tCopJzGmmSAYAu9opvQ
	(envelope-from <linux-media+bounces-57822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 00:24:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2DD372625
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 00:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7CF6302F0F2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 22:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871A64657D0;
	Tue, 31 Mar 2026 22:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="of5TGQ3B"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FCF3803FC;
	Tue, 31 Mar 2026 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774995760; cv=none; b=nIlKUBmpRtuG1TXU5ogfIvy1ghGNpsSgFfkjlaftwtX0sikTA/UsmsSwS7QZgTZjIj17W9goYGgSpYuQLkD3mkLI+PuGpFpi5yFub9erU5Ogols2mzowz90H6BGe4JRGy7RLBL7/kok5+U3ymcp2bphAaipmZmul4LU5G0wb77U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774995760; c=relaxed/simple;
	bh=rSN3556X0WPg2Hj91zd4Pp5IUyn4KcRXfcYrEOVwTbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dlvy9dFkktX/oZCa6V2IZDCcvERbY9i2rSBxyknQ16YNo8vjV8i4dAuLsAXQns9tZb51g+vcy+moYDTC6flyb/Ob9MGUzwjxinuZVRECd/25r9YK5J1pPmHorYfQgVWOue4oknOWMBs38+MPN1sFiYtg/XXFT2Lg0TAVRV/fOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=of5TGQ3B; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zn6Tx+/yUqe1wFWE2jjPTR23b4f4dmxO8nkrQL8rqP8=; b=of5TGQ3BY/0dYg1URKjyoESvBO
	WXTk2pPyPrMCkMK4+uqn8AKjLqJs0tgkgxpPvBGgmG5MvL0wqBRI5ixxaEtVHnDc/bd12kQHGXQ+D
	MGX+Am8QHsCVJuQhquqAC+qi0CdqFzDyrXoT+0Lt7rfGBHI3+6aboRx0JwiZ9G1eB97ifpZMm+xnM
	f8RVfU+U0xVnXNHFYnmWPqYoWRR+zOQdljjtbzkik/e7DVX+fuHOtaboo4Ew3XUSKagsTdcV4h8ZB
	eceTwq94vniZVWqvhCZ7fM9HLnXrcJFHjvSli50pym7lOwEdXDLMe+89t+86ZVto83iAdEjMlSOYF
	yZatu2Ow==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/4] arm64: dts: rockchip: Fix vdec register blocks order on RK3576/RK3588
Date: Wed,  1 Apr 2026 00:22:22 +0200
Message-ID: <177499572601.2230685.5329289608304242879.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57822-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,27b00000:email]
X-Rspamd-Queue-Id: 8A2DD372625
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 23:00:39 +0200, Cristian Ciocaltea wrote:
> When building device trees for the RK3576 based boards, DTC shows the
> following complaint:
> 
>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
> 
> The first two patches updates 'reg-names' property in rockchip,vdec
> binding to make it mandatory for RK3576 & RK3588, since this is what the
> driver expects, as well as to allow providing the register blocks
> following the address-based order and, consequently, ensure the video
> decoder unit address points to the primary register range.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      commit: f8fa98aa23699b7019023cc7cd8bbb8d837f2d3b
[4/4] arm64: dts: rockchip: Update vdec register blocks order on RK3588
      commit: 6c4a6f7f19e69bedddee87bebd4f1f1c7411b820

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

