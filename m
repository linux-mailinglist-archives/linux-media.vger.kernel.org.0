Return-Path: <linux-media+bounces-57765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPvbHSqjy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:34:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D773680CC
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3E413095656
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77003EF0A0;
	Tue, 31 Mar 2026 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hBWD/kgd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03683EE1FD;
	Tue, 31 Mar 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952880; cv=none; b=Y0ESIf59+Po6iZd/M1Sqp09V7fo5WtDcA9oTbEbRJfCUzRy0jXXtXs6ckO4r9qITGa7P9f3ucvtx+sI+EXfZ+eGRbkfSYyYnr5HlNitSKGNmMlpGToymSgLYkrYq2zdQPgFPKFoeGg2pWOcvZIKCBH7p/fmKKVqNK/Kc7nVrRR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952880; c=relaxed/simple;
	bh=dKfL8SDeByCJwIxnh7io1VO4wSbjh//UYruwHmngJBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qa1I4VwhWH/ykhiHVI94OtxTtfm5MfDQRyoP4NGJwrcolGyf69x9jY/00hUMhmWZIJzE0xjC4gWhDG74aivmTHvg2Nqbc6n7x5JvzLfng7pr5QJsmhwg0n9jfBpAlsFxPnxvazBwe+V4ONdVOaWuu5M+WelINOGCBF70HgWjUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hBWD/kgd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3659E1E29;
	Tue, 31 Mar 2026 12:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952793;
	bh=dKfL8SDeByCJwIxnh7io1VO4wSbjh//UYruwHmngJBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hBWD/kgd0roI51rKdICC9UEYKlWdnc254MWuQEwg7mOJhka4JvpRXY+YK+cEVAGWg
	 O0DAJDRF6Mm5q7glRLgS4QhgDEHpNz1wjwhoaXB+dz6q7+rZztT/PePDIlOPuJzHL0
	 4x/Ybw2fbHnMSw+ET1vkSkAcQ3IwnRrjK1MClKqE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:32 +0200
Subject: [PATCH v2 02/15] media: rzg2l-cru: Use only frame end interrupts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-2-f94b238b35d4@ideasonboard.com>
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
In-Reply-To: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2924;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=+YRGaQp4yustsSxDKUNbqJZF34xK6G1kpDy+Avav1sY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6Gn8oqHQfIQ5DUfDsx844Sd+3BPb6zSodzz5
 5FpK1lx516JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhpwAKCRByNAaPFqFW
 PMr+D/9IxIb4JNsLrujQd26mO2ovpzQQ0yOPdVAZ43nRUndupu662VvcxXI/qwHNzk3RM8LRAAN
 Jf/knnp9KUehWA38a6LaCmQ/7kkV3/stncTcD2/epAmzCgLj+/XmkH3PhzdqYVTlDffTWZgX9oE
 5yCtXz+Hs6ME0FIyRxHh+B5RTZ3/OcD0rrWeesslG/eL4KzxFwNBjn620PK5Nklx9pXCo2q8Iv4
 KwAvbvxUvHBjJxNFA6p8yYrcX+7J4dlyaxjSppz/fG/OkiBJU7Zd98xxbRW11C3I9cV5LGIbBBQ
 lbWxK5Y8fiKdetMnrsQ3Uko2dLtan/GnH/1G6rxvpmA86jfwtk5tJfSw/YA6z5uFizAAKFXIwkg
 8H4WtTCulemb7L4EmxFKNa5YlkeQaENdZxHBthhHfW6yZzaleF2QPQKXzqb3HgEUKouJu2rIUwp
 iaLHVxpReQipc2HP5ifB2vMqj8Zs164ma5vmhXWcCA8dKwTdzJ0QcusCa7O9bk1wejH7Oa3emSn
 +ZAPH9H14xofRk9FG9rYjmBrNNZOU7bs7ImUu5qPrgmb0KDws5t6FPulk5Hm/eBRhZc9JsKfbWg
 tnoVA3h8ix7DQY0NxRbfRF0WwaBtLjmTbu+86jDINb7WFtjQoB/g7sCtFjQXOTxZgkFQbyxFLRl
 bX9ucwutSVNnPWg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57765-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 35D773680CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

On RZ/G3E the CRU driver relies on the frame end interrupt to detect the
completion of an active frame transfer when stopping DMA.

Update the driver to enable only frame end interrupts (CRUnIE2_FExE),
dropping the usage of the frame start interrupts, which is not required
for this operations flow.

Fix the interrupt status handling in the DMA stopping state by checking
the correct frame end status bits (FExS) instead of the frame start one
(FSxS). Add a dedicated CRUnINTS2_FExS() macro to reflect the actual
register bit layout and drop the now unused CRUnIE2_FSxE() and
CRUnINTS2_FSxS() macros.

This ensures that DMA stopping is triggered by the intended frame end
events and avoids incorrect interrupt handling.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h | 3 +--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c    | 9 ++++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 10e62f2646d0..23cb50ee8e57 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -14,12 +14,11 @@
 
 #define CRUnIE_EFE			BIT(17)
 
-#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
 #define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
 
 #define CRUnINTS_SFS			BIT(16)
 
-#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
+#define CRUnINTS2_FExS(x)		BIT(((x) * 3) + 1)
 
 #define CRUnRST_VRESETN			BIT(0)
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 6aea7c244df1..98b6afbc708d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -440,7 +440,6 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 
 void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
 {
-	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
 	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
 }
 
@@ -700,10 +699,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 		}
 
 		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
-			if (irq_status & CRUnINTS2_FSxS(0) ||
-			    irq_status & CRUnINTS2_FSxS(1) ||
-			    irq_status & CRUnINTS2_FSxS(2) ||
-			    irq_status & CRUnINTS2_FSxS(3))
+			if (irq_status & CRUnINTS2_FExS(0) ||
+			    irq_status & CRUnINTS2_FExS(1) ||
+			    irq_status & CRUnINTS2_FExS(2) ||
+			    irq_status & CRUnINTS2_FExS(3))
 				dev_dbg(cru->dev, "IRQ while state stopping\n");
 			return IRQ_HANDLED;
 		}

-- 
2.53.0


