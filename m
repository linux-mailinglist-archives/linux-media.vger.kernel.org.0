Return-Path: <linux-media+bounces-58519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHSxFCbA2GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:17:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8BF3D49CF
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7515305D1E0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA723B8BD5;
	Fri, 10 Apr 2026 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PMAoxitz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394E3B7B98;
	Fri, 10 Apr 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812078; cv=none; b=GLs4zu+3wiK1POjfAf+wryJ3auRqSrAFPlDPOfV2kuIIxl0GpCdPz/LKShHC7NfEtmTAKK4yCQdJYdINHGz//bPoar3wZFDRDIezx+kY2EpbPG049sQuaDQUEnBUVM9dE/KiEd4b9zPj/xkLq2gRcB/34Nk0L2udfbBnBaRA4U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812078; c=relaxed/simple;
	bh=tIjkVfvqT10NavX5Hie5brEdMCJOl/cZjETJkcAVT7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUDAlClgv+H8laaqAzJsDnK6VR945uxtkhtT7hqANBaYtTBCT/cNJoxNDLkDbNTiT2NaCY4yRvCaAM42Y0qs79JdfBXw8ZqXLrNEXchf7C3ptIAEGuIckcEN7S81M9xDaFd/FiweH3uahsFd/M6zNefOIyBD7RW5/BORVuj+sio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PMAoxitz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F06B1225;
	Fri, 10 Apr 2026 11:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811985;
	bh=tIjkVfvqT10NavX5Hie5brEdMCJOl/cZjETJkcAVT7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PMAoxitzh6+Zug0+2GH9OBIHgHxs++WwvSVciz9pdh/BiXS/tRhuinGjCflPbxIyl
	 niWU9NWNy9lijrIADwwIakHFK0k2pVfXN/tqqKEhgrz09MneE+2xvkAvuttCH0wyHf
	 xnDyLsyYXyb2H0FUHotd2s44ErGbHXbNmgTWuYmU=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:49 +0530
Subject: [PATCH SQUASH v7 14/18] media: rppx1: lsc: Make full lens grid
 programmable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rppx1-v7-14-43cfc6b44f1f@ideasonboard.com>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
In-Reply-To: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5749;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=tIjkVfvqT10NavX5Hie5brEdMCJOl/cZjETJkcAVT7o=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2EaER8KR/R4a4i1PIdqhDsv3ncnexnl6Wj1
 2jBbX9UfvqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9hAAKCRBD3pH5JJpx
 RbdQD/9daPVBLedmkWfiGD7ytexOaZZBGab2IAgIUj2+7MueXDzIVPYykB///gYGwQU0tCt68pF
 ePv3y5cRPXSdLp69M5bRL6LU7FFFhwAcJ+o/bfokRj9u0lH83Flh/aYTVfcc5WLQM4ymoUyPPyU
 5YK1UhjcFFbL02/WtCO3XerCxGiLlpZWaX4eu0I7epUccpOtPVqFZlV33TgM7O/jCDPTaQY0kPY
 PV17oqxUunN6lwLmeNyxL7LtoCXnt5CDx+IoIup+iVyVaEmuKYuPnEj66tW9OHMFTsX+5nBrHcl
 c9XcwoCkXn25FL8anAHMlnDaLZVtcFkh4pPoCyzqQYxGlEQXeupO8OvDtVesQ54yFvmPcDQw4aZ
 ISi5tIHI6+1TJSSKY0Vhxz5TLLb8PSUr2OVumCf9G7GIGlBprXfk7FhScPjM0lo0okwBJrIH0qH
 C5Dv+pkXWmDpPIdu38tqXkSk56dHY3zHq+B/UPZtitvClhz6YtevY32ZR1hcqtc8BjFqN4cSp3o
 ZqqhndzlNtgud3xLEr+p0y6YjRe/tVjNUMmx4LuTrSK4lu0Q2IsY+rIrkLbGpeuDVDWv40qaxZb
 E/XYlNBlB1O32VqYuqzvwTLnGXbx01bHqpmaOMvqsJbw8gPD9W/jBvHfbWMfV7Ai1Rj7kcwtuPV
 BhFCaddZzxGxmvw==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58519-lists,linux-media=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 9F8BF3D49CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RPP-X1 supports programming the full grid of the lens instead of just
one quadrant.

Expose it in the uAPI and add support in the driver.

Note: This commit's changes will be squashed into the relevant uAPI and
driver commits. It is separate for now to ease review and highlight the
differences.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c | 39 +++++++++-------------
 include/uapi/linux/media/dreamchip/rppx1-config.h  |  2 +-
 2 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index 4cba2d075bec6390ecc5bffb25eeba443213f52e..c548d42727cc601f5559567a29597ad8443b7244 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -133,13 +133,6 @@ rppx1_lsc_fill_params(struct rpp_module *mod,
 
 	/*
 	 * Program X- and Y- sizes, and gradients.
-	 *
-	 * The RPP ISP can describe each quarter of the lens individually, this
-	 * differs from the Rk1ISP which can only describe one quarter of lens
-	 * with software and then extrapolates the other three.
-	 *
-	 * To adjust for this extrapolate the three missing quadrants using
-	 * software for the RPP ISP.
 	 */
 
 	v = cfg->x_grad_tbl;
@@ -147,40 +140,40 @@ rppx1_lsc_fill_params(struct rpp_module *mod,
 	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
 	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
 	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
-	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
-	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
-	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
-	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
 
 	v = cfg->y_grad_tbl;
 	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
 	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
 	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
 	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
-	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
-	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
-	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
-	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
 
 	v = cfg->x_size_tbl;
 	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
 	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
 	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
 	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
-	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
-	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
-	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
-	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
 
 	v = cfg->y_size_tbl;
 	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
 	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
 	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
 	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
-	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
-	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
-	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
-	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
 
 	/* Enable module. */
 	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index b247312cfde41510c6d678cb6482a3b22b9036b5..e55c1f4818ef8f2ecf533340da65b0e4b667f7e0 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -25,7 +25,7 @@
 #define RPPX1_GAMMA_OUT_MAX_SAMPLES			17
 
 /* Lens Shade Correction */
-#define RPPX1_LSC_SECTORS_TBL_SIZE			8
+#define RPPX1_LSC_SECTORS_TBL_SIZE			16
 #define RPPX1_LSC_SAMPLES_MAX				17
 
 /* Histogram */

-- 
2.53.0


