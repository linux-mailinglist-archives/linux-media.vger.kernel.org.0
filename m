Return-Path: <linux-media+bounces-61143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPhGCTT7AWomnAEAu9opvQ
	(envelope-from <linux-media+bounces-61143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:52:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDAF511947
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20F1430FED69
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74256402BBA;
	Mon, 11 May 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mimgsen2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E22264D9;
	Mon, 11 May 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514217; cv=none; b=FEB4MRZGiLjfwIOAHAHbdmuCAmUPCKtiag71IOlScNnVzdfhdkQy/E0Ctw9V3wM02Zy4auDFPrTXhzFZ7AxbHtJWXjfC8+F0nq/IPijIuEXOPQ81G7wElUEJUdMqqchKy4OilrxEDIdJIKXvoRgHwjRpFSKp3rWV24gj1yjtW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514217; c=relaxed/simple;
	bh=nMYKw9ofUkFWHVFjnLDo6sFguwvLWaN21ikxxm1fVz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qi/GuGd5XGlF/JhQbxZFhi/aRG+OkA6lpD55gbAecY7idHdMvFa8JZtfay88rTpAk3maUND/yT+sEa5Bv6RvxIhIQu+UnN/y4Xv+w7x4rNHzPnTeyNS1s3MWvqhSVNryGi3i+w0WMi8/jaBSWoi4RFy4+We24Y01R5t3jWbsBR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mimgsen2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-109-113-28-211.net.vodafone.it [109.113.28.211])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EDE31544;
	Mon, 11 May 2026 17:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778514207;
	bh=nMYKw9ofUkFWHVFjnLDo6sFguwvLWaN21ikxxm1fVz8=;
	h=From:To:Cc:Subject:Date:From;
	b=Mimgsen2rxGr6kPb9FL/tgCOF/Y5oGDUJfjSTatrv1lVTbOL8dKcRLElzFqYzfpYL
	 60cxUn3kerzcj/Benh/R61u0JXV16OQN/nIn8EQmYkJx5wYXB9Iz/f9LiaqtnIMXM+
	 wtzWy9hUb/poqPK7Bok+tLazmc0HgxBzwZw+K0jc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rzg2l-cru: Add MAINTAINERS entry
Date: Mon, 11 May 2026 17:43:23 +0200
Message-ID: <20260511154324.141703-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8EDAF511947
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61143-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

The CRU was missing a MAINTAINERS entry.

Add it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2be8f02dffb..d5448b82a644 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22683,6 +22683,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
 F:	drivers/counter/rz-mtu3-cnt.c

+RENESAS RZ/G2L / RZ/V2H(P) CRU
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+S:	Maintained
+L:	linux-renesas-soc@vger.kernel.org
+L:	linux-media@vger.kernel.org
+F:	Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+F:	drivers/media/platform/renesas/rzg2l-cru/
+
 RENESAS RZ/T2H / RZ/N2H A/D DRIVER
 M:	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
 L:	linux-iio@vger.kernel.org
--
2.53.0


