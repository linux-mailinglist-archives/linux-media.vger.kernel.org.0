Return-Path: <linux-media+bounces-58516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IT7AuS/2GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:16:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 827613D4994
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B83330CD63B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409603BE62F;
	Fri, 10 Apr 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S2imkJBL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5473B47C7;
	Fri, 10 Apr 2026 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812060; cv=none; b=BhtoXVDpZwH63f59RfgDCtGm6mKC53LpR1M+QTTdwi+a06SGnF9tDEGEB5fN/m8s1I0yPNQZq4CPA9sfJS0fycs49JRO8uLMDMuUnicPaUgZ1XMO8W576iyI+x0dozN7inv46I6nb9K0CNCC5biRl0w5IWDT/4ZzD93hUKXs3Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812060; c=relaxed/simple;
	bh=dgzOcg1BPGw19ZO8WlckhqnretZfTVmdqet/Jo7pbl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0GOLkJxDjwH3Yw5Lw+F6pkc9I33sKii+pqviRSoMltUnF+ClSVZQQsFzmms8kNIGvjS7d8ZX7/aWB1PKUEJGW2ZQquXcNKsBoezAUthNoDIxRVdhxlq9S0FgxQZDrowzXBaqpZNJ9dukFyIjzltMz+XC8xqzlukOx0XNcZNE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S2imkJBL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36FA997F;
	Fri, 10 Apr 2026 11:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811967;
	bh=dgzOcg1BPGw19ZO8WlckhqnretZfTVmdqet/Jo7pbl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S2imkJBLfDr8+SWgyniZXNJ6PCmdDxZkkPGCVJ7N9m1y49zfSUmlgCdoOk76OsyOz
	 Iv4EZpiRvONwy/dW/Th3b0XNgygS+VMXmOm54msp/WlqzY33J7HckhJRsvmQQi4/Vg
	 AVU2Lq3MpU5B4QQgNv6fG589P0Ri/9/tkSG9G8E4=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:46 +0530
Subject: [PATCH v7 11/18] media: rppx1: Add support for Black Level
 Subtraction
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-11-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6577;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=AUty8koCIeC15VTHjbBv7tg3JGMr9X5dB7rH1o4QAng=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2BvkfGbi5w+Ew5nByhTQJFBNIInj9KNRG08
 M5FK7Fqve+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9gQAKCRBD3pH5JJpx
 Rc40D/9EdIGFFuVaMC1JNVLWnFIF1P5DSuTMRxKVXvIKmEjVt++8+IxxxcRbRVizOGYMouTa7eG
 8izUFxxaHc/CI69hY1GscbpuUEigJADJTDRGq7NUQrMpkTLaKtBz+miw1iLUlBH5hGHCHBgQ/ij
 g8OHzZ4GgJBClVOg8D9sYthtTGCtUsHtZlQZVcqzqa47WF73+zhmxo866LU5iupXn2BCErdj6Kt
 lHA9nNFE1VgaAi7U4fuRZB7OJpjtXZN2p01qktrXYZMDneKe0invwi/hrFZgrOPj+oxsgizzokJ
 Hx3U6Ta2GiCy3/+JZ/MD6UuMZcftIqeWLggOVo9BDKeWiJvHWUsMf5ItD3bzZf+hP3CDHzT/cHn
 RoJJ/ptw61vMnkdheXPkyAUkAppXtzNBYe7zNG4pwJujZKMcCOzL4N2qpTo7svqYJa0YTH2/2LF
 pXs4Tc1ar9Oz8psqVgQ+F+yq/J0WikYSSDaj/zNWniis58AerowA6Ua2eajcqVTEnq0ZsrzE7ia
 OIbn6oYc46dNlGBJjZ3hSBSkin37CfF3voEtmDI8NdzrJOMN3HnPlpsgmTyEgKKpXTpbJccCayc
 oS18stG6CWln98mQ9fyxGpJStW2vMSk7D+ntxv+6r/gMRoYaySXHVi52fGMAHEA6TQa35sub6CT
 86GjjjeoUQS4fAQ==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58516-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 827613D4994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the Black Level Subtraction
(BLS) configuration using the parameter buffer format. It uses the RPPX1
framework for parameters and  its writer abstraction to allow the user
to control how (and when) configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |   4 +
 drivers/media/platform/dreamchip/rppx1/rpp_stats.c |   5 +-
 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c | 110 +++++++++++++++++++++
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 788d26f619d1a96d16e9dc499d2763366f70be0a..c218a509098991943a5333f1df061d1aa5ec53d6 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,7 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(BLS, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RPPX1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
@@ -54,6 +55,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS:
+			module = &rpp->pre1.bls;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 6f3be95026f60252d05370421bb2ec6ea090ce6f..aa07de4c6892b4da0511f4854a06621cbfef3afa 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -20,8 +20,11 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 		if (!rpp_module_call(&rpp->post.hist, fill_stats, &stats->params))
 			stats->meas_type |= RPPX1_STAT_HIST;
 
-	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
 		if (!rpp_module_call(&rpp->pre1.exm, fill_stats, &stats->params))
 			stats->meas_type |= RPPX1_STAT_AUTOEXP;
+
+		rpp_module_call(&rpp->pre1.bls, fill_stats, &stats->params);
+	}
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index de7008befd8ea79f7bca974de7714399e8bf443c..1e5153f0ba3600c0c9ead0be4b8c0feb4c5fd9ad 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -5,6 +5,7 @@
  */
 
 #include "rpp_module.h"
+#include "rppx1.h"
 
 #define BLS_VERSION_REG				0x0000
 
@@ -54,6 +55,115 @@ static int rppx1_bls_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static void
+rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
+{
+	static const unsigned int swap[4][4] = {
+		[RPP_RGGB] = { 0, 1, 2, 3 },
+		[RPP_GRBG] = { 1, 0, 3, 2 },
+		[RPP_GBRG] = { 2, 3, 0, 1 },
+		[RPP_BGGR] = { 3, 2, 1, 0 },
+	};
+
+	/* Swap to pattern used in our path, PRE1 or PRE2. */
+	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
+		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
+	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
+
+	for (unsigned int i = 0; i < 4; ++i)
+		output[i] = input[swap[pattern][i]];
+}
+
+static int
+rppx1_bls_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_bls_config *cfg = &block->bls;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + BLS_CTRL_REG, 0);
+		return 0;
+	}
+
+	u32 ctrl = BLS_CTRL_BLS_EN;
+
+	if (!cfg->enable_auto) {
+		static const u32 regs[] = {
+			BLS_A_FIXED_REG,
+			BLS_B_FIXED_REG,
+			BLS_C_FIXED_REG,
+			BLS_D_FIXED_REG,
+		};
+		u32 swapped[4];
+
+		rppx1_bls_swap_regs(mod, regs, swapped);
+
+		/*
+		 * The native params are 24-bit + 1 signed bit, while the RPP
+		 * can be 12, 20 or 24 bit + 1 signed bit. Figure out how much
+		 * we need to adjust the input parameters.
+		 */
+		const unsigned int shift = 24 - mod->info.bls.colorbits;
+
+		write(priv, mod->base + swapped[0], cfg->fixed_val.r >> shift);
+		write(priv, mod->base + swapped[1], cfg->fixed_val.gr >> shift);
+		write(priv, mod->base + swapped[2], cfg->fixed_val.gb >> shift);
+		write(priv, mod->base + swapped[3], cfg->fixed_val.b >> shift);
+	} else {
+		write(priv, mod->base + BLS_SAMPLES_REG, cfg->bls_samples);
+
+		if (cfg->en_windows & BIT(0)) {
+			write(priv, mod->base + BLS_H1_START_REG, cfg->bls_window1.h_offs);
+			write(priv, mod->base + BLS_H1_STOP_REG, cfg->bls_window1.h_size);
+			write(priv, mod->base + BLS_V1_START_REG, cfg->bls_window1.v_offs);
+			write(priv, mod->base + BLS_V1_STOP_REG, cfg->bls_window1.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN1;
+		}
+
+		if (cfg->en_windows & BIT(1)) {
+			write(priv, mod->base + BLS_H2_START_REG, cfg->bls_window2.h_offs);
+			write(priv, mod->base + BLS_H2_STOP_REG, cfg->bls_window2.h_size);
+			write(priv, mod->base + BLS_V2_START_REG, cfg->bls_window2.v_offs);
+			write(priv, mod->base + BLS_V2_STOP_REG, cfg->bls_window2.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN2;
+		}
+
+		ctrl |= BLS_CTRL_BLS_MODE_MEASURED;
+	}
+
+	write(priv, mod->base + BLS_CTRL_REG, ctrl);
+
+	return 0;
+}
+
+static int rppx1_bls_fill_stats(struct rpp_module *mod,
+				struct rppx1_stat *stats)
+{
+	struct rppx1_bls_meas_val *bls = &stats->ae.bls_val;
+
+	static const u32 regs[] = {
+		BLS_A_MEASURED_REG,
+		BLS_B_MEASURED_REG,
+		BLS_C_MEASURED_REG,
+		BLS_D_MEASURED_REG,
+	};
+	u32 swapped[4];
+
+	rppx1_bls_swap_regs(mod, regs, swapped);
+
+	/* Return measurements at native hardware precision. */
+	bls->meas_r = rpp_module_read(mod, swapped[0]);
+	bls->meas_gr = rpp_module_read(mod, swapped[1]);
+	bls->meas_gb = rpp_module_read(mod, swapped[2]);
+	bls->meas_b = rpp_module_read(mod, swapped[3]);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bls_ops = {
 	.probe = rppx1_bls_probe,
+	.fill_params = rppx1_bls_fill_params,
+	.fill_stats = rppx1_bls_fill_stats
 };

-- 
2.53.0


