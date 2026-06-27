Return-Path: <linux-media+bounces-65803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LZSqFvPTP2qxYgkAu9opvQ
	(envelope-from <linux-media+bounces-65803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:45:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D26D207E
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:45:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=YDgb2Fu9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65803-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65803-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD809305B965
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42223B19D2;
	Sat, 27 Jun 2026 13:42:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7F373BF3;
	Sat, 27 Jun 2026 13:42:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782567759; cv=none; b=lPY6YxierSWWHh+AjKpOFiJzMe+erlZpBKxgcOVh3JBKT5uPB9yDxo7rpMF09bwO7ny3/oBpRHP24pyVq7Ddhpi5rgkEBPI09ucB2CiAI7qDklEJUAcQLutznmlsUzP1TRqDlkzPfzZNKc3UN5GFTjJiXV9vgH8pGz0OWyMZ3iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782567759; c=relaxed/simple;
	bh=zhyxM5wg3b8dLCYsy8jC5g0uh0IufzUrGIs7mL6WjYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYMTcEJyeGcCRAj6TxFlaOvo1H5lYbgtldaxAfYObXvIoA3NcY2DVVWDfb6vxjUtEkEWD499RsdJdea+HSf8qNkK90jCU2K3uFtPy9rJzBjHWU8C55Jub7FpJefIAYg0rLsN6ooqT2gviUZh16chJetNHIGEpTgRO77V8gNLPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YDgb2Fu9; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 002541D0B;
	Sat, 27 Jun 2026 15:41:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782567709;
	bh=zhyxM5wg3b8dLCYsy8jC5g0uh0IufzUrGIs7mL6WjYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YDgb2Fu94mtCiAQyl1L5/dMDOA5bJooPNouwzBeUJy/TEMITouS3k5Yx0U+5udEjW
	 C3WXsZ+oYuN4+WyM0YEHuS8YTCsE1W4e+z7UMD0B7xlee0SzYoPhCeGNOLj4L0Hrqc
	 QVAOg0knYoeCj5oA7ceLvI1mIAuo13AIl7aN/xIw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 27 Jun 2026 15:42:02 +0200
Subject: [PATCH v3 5/6] media: amlogic-c3: Implement per-block validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-extensible-stats-v3-5-3b600bb2db8b@ideasonboard.com>
References: <20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com>
In-Reply-To: <20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=zhyxM5wg3b8dLCYsy8jC5g0uh0IufzUrGIs7mL6WjYo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP9M6xJZW1aWoFNTR88XoXoD2eOWPUxQdgcfYg
 C52zGlav1qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/TOgAKCRByNAaPFqFW
 PC7+D/wN2RYRXJTQvEg9RFLh2isMIv5BR8Ifhk8FFt4rRLKIhghcqCken3lbrkBunD5p1391F2K
 sqaAoahVbpNCSM3kPz3HwjP+6JTk+pUMPRnLgwKON1tqgpEy4L0lg+10M+DhoZdaGhS2EV3ANft
 bZzf6KFfkCN1NAP0aJ5K/OtUGpCIH/FoE0sa0vgVAEzDSWWw+UZff2x3thUN1FeGdRcCRryYbmo
 UAd04E3janI++0Nlu/DBRTsgaCMFGNRhGYeeUuhq3v7sdlf8+zkHs3cIjqMzJhjDBNPBh5X1/oP
 uNbItZJhI9l8Acj/Sq/CLF1HyATr2pgq8n+b5oVNE8xqrqS/r3VsNA+WNpYXC13kIRlmMjmOMpO
 TgdNZefpX8yaRULfywK3vyTwSkDcH12jooub7CchFaF5nMR0aSCPYHc8yCYKQyKq5PuWkuimbOX
 JfcIhbeyuUp5k9YwVHBGGQ1bf/b444cRmQcbzLOW5UjkgJx6dM3jsOSpLBFyDFnqrnOI457Bg2M
 MElaZp9K4JEfgY/l9iHNriCjgc2pQk8PVnXHYb0qUqSn6PsVKw6+y6dVuFlZHPeZE3vGZysUxJ0
 litKG1xen8mG02+q4ULw0luu4zTvorWjUOjRAaAByld6/BaKUu2XDRHmTTRD9b0AS8DeQW84EJv
 t6dba1ZMBrHlTgA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65803-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:dan.scally@ideasonboard.com,m:keke.li@amlogic.com,m:antoine.bouyer@nxp.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E1D26D207E

Use the newly introduced per-block validation in v4l2-isp framework to
implement a validation callback for the AWB and AE configuration blocks
to make sure the configured metering zones do not exceed the hardware
capabilities.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 42 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index aec3eed0e443..ae0777a20bda 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -535,16 +535,52 @@ static const c3_isp_block_handler c3_isp_params_handlers[] = {
 	[C3_ISP_PARAMS_BLOCK_BLC] = c3_isp_params_cfg_blc,
 };
 
-#define C3_ISP_PARAMS_BLOCK_INFO(block, data) \
+static int
+c3_isp_params_awb_config_validate(struct device *dev,
+				  const struct v4l2_isp_block_header *block)
+{
+	const struct c3_isp_params_awb_config *cfg =
+			(const struct c3_isp_params_awb_config *)block;
+
+	if (cfg->horiz_zones_num * cfg->vert_zones_num > C3_ISP_AWB_MAX_ZONES) {
+		dev_dbg(dev, "Invalid number of AWB measurement zones\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+c3_isp_params_ae_config_validate(struct device *dev,
+				 const struct v4l2_isp_block_header *block)
+{
+	const struct c3_isp_params_ae_config *cfg =
+			(const struct c3_isp_params_ae_config *)block;
+
+	if (cfg->horiz_zones_num * cfg->vert_zones_num > C3_ISP_AE_MAX_ZONES) {
+		dev_dbg(dev, "Invalid number of AE measurement zones\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+#define C3_ISP_PARAMS_BLOCK_INFO_CBK(block, data, cbk) \
 	[C3_ISP_PARAMS_BLOCK_ ## block] = { \
 		.size = sizeof(struct c3_isp_params_ ## data), \
+		.block_validate = (cbk)\
 	}
 
+#define C3_ISP_PARAMS_BLOCK_INFO(block, data) \
+	C3_ISP_PARAMS_BLOCK_INFO_CBK(block, data, NULL)
+
 static const struct v4l2_isp_params_block_type_info
 c3_isp_params_block_types_info[] = {
 	C3_ISP_PARAMS_BLOCK_INFO(AWB_GAINS, awb_gains),
-	C3_ISP_PARAMS_BLOCK_INFO(AWB_CONFIG, awb_config),
-	C3_ISP_PARAMS_BLOCK_INFO(AE_CONFIG, ae_config),
+	C3_ISP_PARAMS_BLOCK_INFO_CBK(AWB_CONFIG, awb_config,
+				     &c3_isp_params_awb_config_validate),
+	C3_ISP_PARAMS_BLOCK_INFO_CBK(AE_CONFIG, ae_config,
+				     &c3_isp_params_ae_config_validate),
 	C3_ISP_PARAMS_BLOCK_INFO(AF_CONFIG, af_config),
 	C3_ISP_PARAMS_BLOCK_INFO(PST_GAMMA, pst_gamma),
 	C3_ISP_PARAMS_BLOCK_INFO(CCM, ccm),

-- 
2.54.0


