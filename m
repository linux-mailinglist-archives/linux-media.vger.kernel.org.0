Return-Path: <linux-media+bounces-57764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H1kLx2jy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:34:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAFF3680C5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63F41305AD52
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3BA3EF0BF;
	Tue, 31 Mar 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RsHTDxub"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70943EDADB;
	Tue, 31 Mar 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952879; cv=none; b=CyxtYkQRYJHMndmPTWyuw8t6tj5rMmoHPNEMZKOscdhroP6XJuHm3lOyh6KUwXBlmc6+4FPNs4Op0d/pzK4wHlTZVY6kdFaCfjNTtixWFTBhoStcVZ/m79X+nmErNHitzGfie0aZIVyyfVpOPdiTrANNqbc8czrWbkRchsuYwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952879; c=relaxed/simple;
	bh=qjqN3UVBZddPw7k6SBUknSInyEUjzkn/TIchzSfs5R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huYAD9TS2/NDBY5Jle3kMRokp75aAcaqE8tx+cKVfSjg5A0bo9jz48KSe2rbTOgJ4nOfmlVJP6gItiblWjRS12/TJ9OjBUPtMEKL1rOT8SslrWbO6+8Jn5pT5HLgWl1rX+05HuG/u+va5xAhV0GJBW968zSNzqIxbtxhXEEyyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RsHTDxub; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72D5610D4;
	Tue, 31 Mar 2026 12:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952793;
	bh=qjqN3UVBZddPw7k6SBUknSInyEUjzkn/TIchzSfs5R8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RsHTDxub8mfkK4PFbVmxwh9/Pn4FDM5HLA0+cYSulzAfToHifVig9vDhxuYicaQ1x
	 mDkCZyH2FJ77iHSI/u5As4A+IjWuFXWTumIxuiNchs4u36Xqd0pl1XSifGvwSImSRx
	 tK0WY7+D648JgR1jhVAGCSyH8opPmmVZvgKl0TkY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:31 +0200
Subject: [PATCH v2 01/15] media: rzg2l-cru: Skip ICnMC configuration when
 ICnSVC is used
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-1-f94b238b35d4@ideasonboard.com>
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
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=yMSf/Uh8D73dR+HGREaX3F3oHZpFtzwWwYAbsWP52Ro=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GnXbqkbG+4f3JMYo1XhH3+2rgfcwcfs3sh5
 cicvmSZrlOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhpwAKCRByNAaPFqFW
 PC1GD/4717/irmi3QQw8GvRMYixn+0OWioLYu/XHeCGs2XlzKOMgi6/XzFKJeW+43LvZzx1Cpmq
 vQ35G70ouKk/r0kaDsFyn45quqKBawDwyXJxoAoow9mEYqNaTh7v0Q3DrZm4LbCWRqdqSTVbpkr
 mTDh2VJvJGEV1dnoOdNkD/CNAY8Rr5XttMi+WpZ3uOlh/BdZrpuiEELd+YwI1BSOHIZpVKr2dz6
 ZX1wMLujDteJyFdb2lDUwxNe6qyZiuSrbll2STLMn2RrLU1rKYcCTmmQj9A9ZTuckIf6Q7L7uZX
 qN/F4A4aewZQhO1pcynN0XJVD/CFd431KWiyggUTv5MJevb/Dd6IjpV21wwPFzHxsx2D31/zUlz
 Y/tY4gseSCte2YKSFIC530hO0nzjs38D3iNOUEYyemDiTz0oKaoN8s9IJbRH/l2qxXu7l0w1Ukq
 KPm5bsIVGYfXA0KP9ijLErkCmc3WH161bkqQ/Ki3IPPFFnP9+MVZqqzf23aLjmiHjtsoPVoPSYP
 lJ5xawdDqwtzInf5/BrUb7vqpetzXQjPY4D13yz/bCEgF4rAIyUb8w4Pw04kCY1z4AWaD2cxC/1
 1mLQEmNzGP9KEO7y4ZA3mc3X1S4bPN82z8gPLtH1QyvwZM22TjxilHZaNipc2DfIGqufd5aZFFl
 laHnHLO/GoPfa+Q==
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
	TAGGED_FROM(0.00)[bounces-57764-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 5FAFF3680C5
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
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


