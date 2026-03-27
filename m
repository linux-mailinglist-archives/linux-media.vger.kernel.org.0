Return-Path: <linux-media+bounces-57291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CyoNbK9xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:26:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25E348501
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9993A3058110
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D703A391826;
	Fri, 27 Mar 2026 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="goQxBrEt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6E37880A;
	Fri, 27 Mar 2026 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631443; cv=none; b=iaO7O+pkXbiefsued/Ac3LmRsVKhPywsUvVKzvLjDmAbFeCL/8wOprhUaYv5FznM/CM5OBKuD5F29ze1CdxeyEWIvM2NhxWLsCGQp3tUE7oS9CrKawUrtlsF+FRotAvD7O2kwSvxi3BXVT5nBs2ZQcADl4MDSDXHXXy/sl3q2Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631443; c=relaxed/simple;
	bh=hyxIgbS0ksdduwZ5rmcnHJuSmMt+tqN5LMFSwZj36u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fVQx3YgQlASgIdiuzo1Ro9zTVshLAghTzJYEgwVkvmAohcfBJxs6d8VvG4i74dVhNlZ8PdJHuj5mfKlpTWiJq8HjBS8oG+l9XWkqGkzlvSSn8F28ebPIhN1cdNRUEleVmwvuqgOT2ay+hVqJCrysMSUtvWkaJfKRMBbNpSO/S1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=goQxBrEt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 763C82664;
	Fri, 27 Mar 2026 18:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631357;
	bh=hyxIgbS0ksdduwZ5rmcnHJuSmMt+tqN5LMFSwZj36u8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=goQxBrEttUPOCv4J/lUjISoHrjVcfzrDe84liiT7qlj03wnGMO/E6um3jVdttYsVa
	 YXmoXj7toQoqKnDMdxdz5o6BTqZ/vr4RiF5CcQ5mp5p9Le7U+/L+j64SKMDA4GfVRU
	 NADforzV/MS/SNPbpSHFbqbW+k8tAeGSrxXjVf5Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:07 +0100
Subject: [PATCH 02/14] media: rzg2l-cru: Use only frame end interrupts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-2-3b7d0430f538@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=PNpmp4iW823YzhydOXvGlJgfC5bJODk7pvJyX7lu7aA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroJLi/cr4hF+7atJRq4JUWkHDFFtmrLTdpWk
 uCfKd10VG+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CQAKCRByNAaPFqFW
 PMxeD/9QQv4JHapnZu73Nl6X5Oehv18BdrUwshtWjYvIiQ9mUH3v9YEO+/bvsTGwW6Zq/v6gssZ
 tKdaKE/CZ6P2jTfjpM00lul8a89XvRxEigWNMQ7RFWVGYaxuI2cB62atSJOpzcumnfalkIV3t1W
 ncaaqlnU9YRPnf93hZqEnGIbigOzy/N1W30kxtPJRN4DkUDmjAozK7LxpmDAA4oXLDrg+sHk0ra
 mreCJhJOPVPDKA3ZWrqo5ZsGnaNd0tjl89ByK9fnj0RQFB8EwtegDakstEd+f+W/qSbsGIeNUxm
 72lRqbBePUJj8r08WLotYQ5xTMhSZMiSkE4QZpxabe2iPd1gF2pPvmrugK+wHpjg/1Maavaz4Zr
 NO8axXHsvTbnS9pFY96xU+b5jnJgsGiINu/cpVDr7S1TMEfOLtn+52KarjpmRPy1yo4+hKQLgX4
 dzh7jgL/OQTWP/UJi5woMM+P26qGUGy8h8jIKbUwAtBi54+5ZgXtQ5VQbzrMKxNsw6+rBxWOWdE
 rlE+j1qeaMZ0ivOXHvOiNrBGRo2sDsRYMCUjG4aPOvH/qLXtQG+q1oQsPWK8DbkFMngKVL+d5i9
 98cZ3SllxTnd1sQzZoV4Sz4pfhZJdv1bdojbsQmmOgEyN6tFAKU1OwzB65F8unQZRw8CwOmL1zu
 wYfVxWIhSAFCIcw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57291-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 0E25E348501
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
register bit layout.

This ensures that DMA stopping is triggered by the intended frame end
events and avoids incorrect interrupt handling.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c    | 9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 10e62f2646d0..5a6ac9cb09a4 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -19,6 +19,7 @@
 
 #define CRUnINTS_SFS			BIT(16)
 
+#define CRUnINTS2_FExS(x)		BIT(((x) * 3) + 1)
 #define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
 
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


