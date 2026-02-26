Return-Path: <linux-media+bounces-53481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKhDEs4koGkDfwQAu9opvQ
	(envelope-from <linux-media+bounces-53481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:47:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9301A4834
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4880F303089D
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF513164BA;
	Thu, 26 Feb 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nK37pX3+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732B3148D5;
	Thu, 26 Feb 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102823; cv=none; b=f08s8tBWl9ChUhh7yRnFp6VchBO6Oe4SoHJWzzIrWI9Pu/5G6ALbLFmCL6m2iaBzjLY2KsO7qLvGn9qDni4uwSTUS1yXHrWJ9r0hZIBekjQRIsr+SgBfpZ+JidURtvDxlWfsw+c4JNU9HJ/iMCRFj4mtU/m0j68FSAvCAztoKlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102823; c=relaxed/simple;
	bh=7evQl1U56Y+krUyCkNdBkF6YOqsOl19RT9juFbdoLd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oiWI3YrMUP2oIZVckUr3aXzX5Ltdfe1ZBPQYlIcYPQODE2SwZxTqxysNd0ZOJpV2FlmcOnyXmZ6GUPqCyg80m5bJ9sA5Qabm8NM3DUH2pTnu7n+QX6lTznbysTJEVtRzpQBXL4ioFdCyOd2amv3NMhZqSPoiX3HReClAxlP2n5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nK37pX3+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102819;
	bh=7evQl1U56Y+krUyCkNdBkF6YOqsOl19RT9juFbdoLd4=;
	h=From:Subject:Date:To:Cc:From;
	b=nK37pX3+Bu77wQctTzYR5DPioPJHbtf5abNjJBP0UmSpt20WOP03SST/Xr6prB9pG
	 fTwdFyMkZ/OZf2QeHHtCYYp0loVroydVoxW8l9nWPh86RM4AUPV/q9A4uItjpooAML
	 iTI6XU8laft8oUy1AOIy09RFjtBvsuSmeiRDLTpS30PKG8D7urpP/vjR9XIWkbCZrn
	 NXMpQ4CeIoolKAAKp+nTNbgmU20uzHC4cggz4J5E0bEdj+XpV1nM7QpP+M9gl7ezkz
	 ApsgjPwmRO2ymIMKZTbPgDF6t/gxaJbQP4XWXB6ueBNdRGoTiZKhx0mNQuG0iaKqgM
	 ySx0yw2gzVg1Q==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DC6F17E0029;
	Thu, 26 Feb 2026 11:46:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 0/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
Date: Thu, 26 Feb 2026 12:46:52 +0200
Message-Id: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQrCMBCF4atI1o4kkya1rryHuEiTqQa1kakER
 Xp3Y1ciii7/B/PNXQzEkQaxmt0FU45DTH2Jaj4Tfu/6HUEMpQVKtBJRQw7kgWkHiQMx8EGb2oL
 3SN6SNNQsRbk9M3XxOrmbbel9HC6Jb9ObrJ7rLzErUGCsbGprrG2DXvt0PLo2sVv4dBJPNeNfE
 oKE4LqqqTB0XuInSb9K5puki2QcUkuqVcot36VxHB9aQDjQUgEAAA==
X-Change-ID: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53481-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 6A9301A4834
X-Rspamd-Action: no action

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

The first patch updates 'reg-names' property in rockchip,vdec binding to
allow providing the register blocks following the address-based order
and, consequently, ensure the video decoder unit address points to the
first register range.

The next two patches reorder 'reg' and 'reg-names' for the impacted
RK3576 & RK3588 vdec nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v4:
- Removed the unnecessary one-entry item from the reg-names oneOf clause
- Minor adjustment of the commit descriptions as 'function' naming was
  not used in the context of the older SoCs
- Link to v3: https://lore.kernel.org/r/20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com

Changes in v3:
- Mark the current 'reg-names' listing in the binding as deprecated and
  introduce an alternative 'link,function,cache' one
- Drop the Fixes tags from all patches and updated commit descriptions
- Link to v2: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com

Changes in v2:
- Added patch for updating rockchip,vdec.yaml binding
- Added patch for updating RK3588 vdec nodes
- Link to v1: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com

---
Cristian Ciocaltea (3):
      media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Update vdec register blocks order on RK3588

 .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi             |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi        | 12 ++++++------
 3 files changed, 21 insertions(+), 17 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


