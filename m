Return-Path: <linux-media+bounces-57290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NvWJcu7xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:18:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 585EB3482E1
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D463308FD07
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC681377EB2;
	Fri, 27 Mar 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CjKEySTp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066233783AA;
	Fri, 27 Mar 2026 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631442; cv=none; b=nc8e9kdGPq1tskYFEwur6k3Czbb64pSTz1u49dq/dGm3D7l2Vrm5pNrAt3iQNJl7uPLLAyy66UBeG9G8ViQTdB07S/klmStwwSuK4nd8lvEBuUhh4j2KDt74Js48o/kfUzuiE7lGPfifsG+wlhy7IqsF74d3kFha5w88aKDjRu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631442; c=relaxed/simple;
	bh=6Cd2K6dLKZ3zuzWnWJ6JjOXVt6ngUet31cvKhNwhtFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbfNoWGuFIf6fVrLp+OuBpiOGMBKQzlX5V6ImFZYcxKabCniKCw8RzpeMd+ATQLLJjyCtN6gaJg7dHkzL+0v40nc6xkjDtD5/jdZ0IZNiiwalipgupH1o+Sv5p7pZvdCuQs2ogiEckhZ9CZP0yWEDUjY8V0dCSulxm5XhkFqgfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CjKEySTp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB1A821D0;
	Fri, 27 Mar 2026 18:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631357;
	bh=6Cd2K6dLKZ3zuzWnWJ6JjOXVt6ngUet31cvKhNwhtFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CjKEySTpjha/xlgnn4Ag6KDW+9fB/WHbQQUo+Ho6fmnnnAq3Aua7S7k+IVS8tQ45+
	 Z18RsFWg/qh8EnasXSaoe/8wS+7EU7m07Wxy2NAWbl+so3AC+zQd0P6ahcJuvozkDw
	 4G0wtDS6QoEvPRpqNDrBUPrzk7X0TerSHMcPy/PA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:06 +0100
Subject: [PATCH 01/14] media: rzg2l-cru: Skip ICnMC configuration when
 ICnSVC is used
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-1-3b7d0430f538@ideasonboard.com>
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
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2644;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=D1KBUVsVhQdrytLBtX5FtOsJvMx7kkKZJo71L6YH7Kg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroJOZj7020XjctDOYMfyDy2BlS3YKc9PJ9L+
 +yhTw0btDuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CQAKCRByNAaPFqFW
 PBRFD/0d8FBI76dUrJ85X3NfoDGojJlNhYLEynqaXxC6TwgZNusMjd2C1a9o4gTSJ2CS9QAb+na
 FZPcJCOLRyvD9VzoM3ZQpc9BYLH565MAHvlbMLldPY4m1gghhTJ/mP6NRV6s0tKxECJk5ExqW8p
 FLz00Rsil2gksEOjqlEaZefKXSJAMTj46+p/xrGnCCK9pJ79mRiu90XtvcF9fy4fbuKwyM1PuSK
 Kg0gR7S5DrHnO9MM8HbwXCFRSff8Q6ju7d564IHJb9p2FYfVBuT/U0bff7fERD3V2O6b38mZc2Q
 Ot8b10f73pWhgpCklFGL/1rOFxqk1PwkFzNx2L+T+JUiHpnOYofPvcs+DzVW/2bmsrCINXaWhUZ
 y9EmVSj8On6HMzCjv2h57nramZnVAjdiSpeUfVk9L/b7XcFeLe5Ocq7j15HwLj8cVlQOdWPSQkf
 miJFKdGAE+mxl/WxAUrxEEMRs+mTQzsquVTEcx8EIby4okp3n50acRJz9CKqsqOOFGmZiR3Mmi0
 XXHfA5Sk+nCkpfElgEyZCK/Pko7be1eB12h44nZt/cz68wfYZb/NInr3dOXTPS0IB+BA40kpWNW
 fS7ZTq0R2cRKzPppnh4Fwwfty22x0Fo4Pabz0wvUEUlX/go6pZjoHIdBm+BN+LUEU1z2s9TYtvA
 rVCkIDM0W8Uh35w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57290-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 585EB3482E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

When the CRU is configured to use ICnSVC for virtual channel mapping,
as on the RZ/{G3E, V2H/P} SoC, the ICnMC register must not be
programmed.

Return early after setting up ICnSVC to avoid overriding the ICnMC
register, which is not applicable in this mode.

This prevents unintended register programming when ICnSVC is enabled.

Fixes: 3c5ca0a48bb0 ("media: rzg2l-cru: Drop function pointer to configure CSI")
Cc: stable@vger.kernel.org
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
[Rework to not break image format programming]
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h   |  1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c  | 17 +++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index a5a57369ef0e..10e62f2646d0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -60,6 +60,7 @@
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
+#define ICnMC_VCSEL_MASK		GENMASK(23, 22)
 #define ICnMC_INF_MASK			GENMASK(21, 16)
 
 #define ICnMS_IA			BIT(2)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..6aea7c244df1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -262,19 +262,24 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
-	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
+	u32 icnmc = rzg2l_cru_read(cru, info->image_conv) & ~(ICnMC_INF_MASK |
+							      ICnMC_VCSEL_MASK);
+	icnmc |= ICnMC_INF(ip_fmt->datatype);
 
+	/*
+	 * VC filtering goes through SVC register on G3E/V2H.
+	 *
+	 * FIXME: virtual channel filtering is likely broken and only VC=0
+	 * works.
+	 */
 	if (cru->info->regs[ICnSVC]) {
 		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
 		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
 				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+	} else {
+		icnmc |= ICnMC_VCSEL(csi_vc);
 	}
 
-	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
-
-	/* Set virtual channel CSI2 */
-	icnmc |= ICnMC_VCSEL(csi_vc);
-
 	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 

-- 
2.53.0


