Return-Path: <linux-media+bounces-58511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLxRFCy/2GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:13:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC823D4939
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCBE93096CD0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491983B3C00;
	Fri, 10 Apr 2026 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g8kkOXUb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC53B3BE3;
	Fri, 10 Apr 2026 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812029; cv=none; b=rFVZU//8M4qp73SVYEY5p4FQo/Ng9vtr1qc6Ev6eEt7WhWm4QKf5HmCAHz3BKxnU3yEB35NbB51beMkryHq7RZWkxRPku5KOBrl5r0LBbjGnt2Hl9uvulkTmgVx/0T1thiJycHPOP5PJJw49vIPkw+d8K5cG0XWjDKyB/QNMs1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812029; c=relaxed/simple;
	bh=XozLBHL03Wldp7WAJf0TYbnowC3KCp8m8gezcbLz600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJuYFLdmrxA5B5Ajz4ZQFwdxr/zbmfPsHAtT6izWQLmDrpBj0QMtGBlQuFFBZBGCYbMpF/awQ3tmWT1CD8coMbRj9NmyHAdDJ6mISWjADTuZRU2jUQLm2/ihXmwLDW4d7faJqFJnfLJfR0ixaBia4TVKo60R/MYVNLJsy6XfKmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g8kkOXUb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2F76236;
	Fri, 10 Apr 2026 11:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811935;
	bh=XozLBHL03Wldp7WAJf0TYbnowC3KCp8m8gezcbLz600=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g8kkOXUbfCfpKMIfLYvPko4+X9F5STC0qyJZP/BVOIrDcqE+56xk/ot0+zPeNhGJv
	 N2GjpdFCLMoSOWgNALOKpP7ZLdrxY3L0NUfYZ4LLfBeN91F3sDLbhd7H9WP5EFRrIK
	 9aWvwi3vkZh23M308sNHaF9A3Pmn3jwPpEXV/Gyw=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:41 +0530
Subject: [PATCH v7 06/18] media: rppx1: Add support for AWB gain settings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-6-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3202;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=OsEaXKtGNv44aK93wP6gEHnXJoFDL8mXRTMqcvyHt8c=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L181gjARfH+F1VzQeQ8Fq4dZyJSlEYW5JW3d
 SeDRRHD67OJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9fAAKCRBD3pH5JJpx
 RZLZD/4hqqh6wqxEeNIwxjjFi2pVHZoMNcz0c14UJKR+VAa9g7BdKkddUQeR3L88eAkGEFoKLYB
 5mTHv54GREcZHAJWcxIYON720uC9PHdURixxWGHC+knUg/gCAFT9I8+25nuEoRzo0fV6wVY23/f
 i9iOSy02AFYI27JP6vRTiMt9i05jCOzm9/+rQ3QzHQVkwp+dX98uRmuobKKgxWVxQOhcOeg0Rky
 xOYEn/ozcAUl/egGATwmzbKNhjGiwoJR1z1ksLkDiv6G8NVV7+kp2iAtiDutpbEo/fn4YhFU2bX
 q2bqGQVTP+SZLdDvI/bA2avbIXTi7p0WWTv69NR6jSPuw7Mb89wlHbrrOLNlD13CTi5LZXOak4q
 Bcje+Hnd3vbHj9M2UyOX0Bwt5yHK3/Fnr7kArFYPEgaEgSKPUdB+XSYZA6kRe7Bj4+wuS5uTPKT
 gZVKhUpfuw6XThrKO+6pMpT29qQOQWVHUXifuCa+Hws+lr5rHTgOXwOuR7p7I4aUZQTpmT9zR3/
 wr+E/pSyElz6c9+j0xIXjKI/ILR+Gzu9QwclHLPGGDIjLt1LnI7KQbGVmk1fGy6f2FWJvTXvmfp
 QKfjXM2+NXk14oxCtB0qvQz/ASvzNOZ9ykvum5E1lYbTtK1SsOAjCXWppyTQ0T9iEaYuRyNf61k
 YYC1/QKAlSMvuWQ==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58511-lists,linux-media=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ragnatech.se:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BFC823D4939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the AWB gains using the
parameter buffer format. This is the second function block inside the
RPPX1 to be enabled and it uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how (and when)
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  4 +++
 .../media/platform/dreamchip/rppx1/rppx1_awbg.c    | 32 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 868a5ce1620e185174b8fade8a9a697826b3fed5..de47be81133d067a85f63ba0eb3f8f5e1f0ba2d3 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,7 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 };
 
@@ -51,6 +52,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN:
+			module = &rpp->pre1.awbg;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
index e20bc369ca8c6db3781ed95381024f0fa4c48dff..0be63cc8dfbec573da8dec921f08f7bcc1b95a82 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -25,6 +25,38 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_awbg_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_awb_gain_config *cfg = &block->awbg;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_ENABLE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
+	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
+	 * contradictory this is the register definition, the function
+	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
+	 * which is not possible...
+	 */
+
+	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->gain_green_r);
+	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->gain_green_b);
+	write(priv, mod->base + AWB_GAIN_R_REG, cfg->gain_red);
+	write(priv, mod->base + AWB_GAIN_B_REG, cfg->gain_blue);
+
+	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_awbg_ops = {
 	.probe = rppx1_awbg_probe,
+	.fill_params = rppx1_awbg_fill_params,
 };

-- 
2.53.0


