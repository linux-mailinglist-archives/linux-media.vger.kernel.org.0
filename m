Return-Path: <linux-media+bounces-53328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKa8CLnpnmk/XwQAu9opvQ
	(envelope-from <linux-media+bounces-53328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:23:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 743021973A6
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 166B030FA49A
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 12:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0536C3AE6E7;
	Wed, 25 Feb 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZZhdxzLS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E809E3AE6F9;
	Wed, 25 Feb 2026 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022005; cv=none; b=AWqV8Z/dnt0bdbgSvVQzgJhAJGwXQ4fUtCDYgqfeVzd5QryLm+OBijY656eDF7+Cy34JDdog6YY4ztFGMCcGtHeC4Aql1tqErGj+OpkK5/sQp8TBJ9sE6XGOdjDInP/8P3bNRmdR1GdDn6Qm5Lmklzs6Qji5ehehcvnklBJYwxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022005; c=relaxed/simple;
	bh=bZoRD/Bq4RKph0cDXwuzpv24e0W+T6a1VDCAqIREFsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pTXwtEDSQ29uFUr+STvJ/osBUKpS2M+PdrPR+drW2f0JFoX5Zat3AVE8h5lwp6ewZ1HcCsPndEqftz/+kQ114O22T8mLYIelNob2sjt0PF+Nd3ctPXJmpqDcQsUBKpX5weENbRYEBObRzMch2cmP3hJxemXVe+u2Jc6XHl5JPzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZZhdxzLS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772022000;
	bh=bZoRD/Bq4RKph0cDXwuzpv24e0W+T6a1VDCAqIREFsg=;
	h=From:Subject:Date:To:Cc:From;
	b=ZZhdxzLS7pr8+CqP4HWy0BgdfFRvDjq37aqssrM+ieDdcoz4Rw4lCbrl75Zsq6oYH
	 rj3f/svfN2tHvnyBaIGHJufPS+XMxLzMj6sYlieXqpK1QS4BTFnAcmwAKF6n4KvB8o
	 MrQkdmhvK2RX/ZSXS1sfo/cXXhvJysmvGQkcbYBoPMOnK/8BYZR/zyqlR+LQ2oAYRM
	 ByCM5MHV8/18fH1x43LcNIsmwnPoxyFije0MYiPQ9UdX1kFGr4fCmLYWxvoGLvxe/R
	 hYlssDx10bAe5bqd9l4nE7hvY1sHQOQkIZ8KduhejTs9Kp/JVkK+DmVvcUGei6mhHT
	 66UnbaKrxdxnA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85C6B17E012E;
	Wed, 25 Feb 2026 13:20:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
Date: Wed, 25 Feb 2026 14:19:56 +0200
Message-Id: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQrh1TprSIK+9hXEA7QKNSMzWNh
 nB3C0s3uvxfMt/MIhJ7iuJYzIIp+ejDlEPtCmHHdhoIvMstUKKRiAqSIwtMAwR2xMBXpWsD1iJ
 ZQ1JTcxD59sHU+9fmni+5Rx+fgd/bm1Su6y8xlVCCNrKpjTamc+pkw+3WdoHbvQ13saoJ/5IQJ
 Li2r5oKXW8lfkvLsnwAWVFjfwgBAAA=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53328-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,27b00000:email]
X-Rspamd-Queue-Id: 743021973A6
X-Rspamd-Action: no action

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

The first patch updates 'reg-names' property in rockchip,vdec binding to
allow providing the register blocks following the address-based order
and, consequently, ensure the unit address points to the first register
range.

The next two patches reorder 'reg' and 'reg-names' for the impacted
RK3576 & RK3588 video decoder nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
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

 .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi              |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi         | 12 ++++++------
 3 files changed, 21 insertions(+), 16 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


