Return-Path: <linux-media+bounces-55701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BAPA+IotGkQiQAAu9opvQ
	(envelope-from <linux-media+bounces-55701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:10:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9662859E7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B4473075ABA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0AB3B3C04;
	Fri, 13 Mar 2026 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h+sCnRs4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193143B3896;
	Fri, 13 Mar 2026 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413657; cv=none; b=AkZibRtXmL9nKisOauRPc916iWHuQZ0+BRYwYGPC10VZir/kbRPkHmmeSFif6u7UZo3ubiDd4gYT+V19L28sRNll+yCEk7Ffd8n9x50yerdhHCtvyCctmv0ocxCM/tFC/I1h5E5Dx4a5JDDHB1dfHoLC+T/CDD1rSkiMgIzrCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413657; c=relaxed/simple;
	bh=0nP79qxKyt2X+hCH5uOYDoygKJCpsHZxRexF5epaeCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rm/QHDvQbI83si0x5KkyiepoNgcFDiD//7tGY5DS/3iKDmAFwDDF9q2K0/he1RyRtwFgZQR7iM8Xma70TlEPQ+ZzENmfCukw/YJvNtxktac0i38/TtKBMOTxc9yCNlrBu5uJzbSTPqyg7hn6SEAuRJniSpWYecxvJOijLvm1WbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h+sCnRs4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.122.93])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 720D81934;
	Fri, 13 Mar 2026 15:53:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773413583;
	bh=0nP79qxKyt2X+hCH5uOYDoygKJCpsHZxRexF5epaeCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h+sCnRs48ii+ULgl73iF+dRHFpmRF9mmtu42BG+lsLq4VLkqit+Q1YPk62RAJ4ohS
	 Qp2N4QTHAFFElMWJE9o6+5uUYsKt+m8ayndhKa+f8ik4GxYDywCckt17JFVe8x9+qy
	 LplVETajpxFFNlL3081v5KZT5QnzZT6MdWcAf0W0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 15:53:59 +0100
Subject: [PATCH v2 3/6] media: mali-c55: Fully reset the ISP configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v2-3-885c07961f30@ideasonboard.com>
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <Nayden.Kanchev@arm.com>, 
 Konstantin Babin <Konstantin.Babin@arm.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3739;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=0nP79qxKyt2X+hCH5uOYDoygKJCpsHZxRexF5epaeCY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBptCUOYQk5tO8AtzN91XnVTR7Ee8TsQu84pR9dO
 hkmWpsoAZGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabQlDgAKCRByNAaPFqFW
 PI/nD/9dtpTry2G2H3eFrR4c43605cTaL0Y6DOGjo3IHjFIJbhYUAK+xPrmxie5ODDgUnI2twby
 v0+CVJq5LQsjB3PHEaXi1+UW0Bc/yqoQkXsfETEG1KkwdgvEY34gwi8F7AaJRwyrCsfp2gWQOlr
 GdZHxZlhu9cqqSbSZwVt8kpI6woxHEpfUhSaQNadtTxg+h1XG1eO4KjV7snrTUlnKQKT9xC2M0A
 PatAijEvpojipZnc9CYLFm/06uD1kxyU4NBFU/S0Vn8GyinCjHaJq8rZjtmxMPVuI5xfz+wiqlF
 mf8mZfLtLIYN1Bip/6c4VI9TiLgNjh7eh7wCZkI/HJfKBfFsP/F7szf6OWVrltMvbU68f37iJmR
 BOeUUL0e6UZyaT1q+LUaKA2gbuHcx7VxyEMb3CMvdGGl4NJfD6t4oYIreQSNNhd66PzJbaen63E
 Bwaa4fHsWem7QR1ZqcbQXDfGuRl2mNVtDqoAaqMrqPSjk/0rQEN3fn8fAbAKYNPKY+noNQg85h/
 lAM+ZaPXdrQJ0WwIaX9SGWhnDxF6u5FlkMbcFtUsoRhKOtiO2nAUxJle0TIh21EKvyE2IWQBXJQ
 m1KMvc5xMhNYny5y4osH8U+q9tUocn/p8hul+NBP/AGTXuqXsY2I2aN7Idw+UW59Tablzs1sly5
 HWjEte97UKQ33Ng==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55701-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 8D9662859E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Mali C55 driver uses an auto-suspend delay of 2000 milli-seconds.

As the delay is quite large, it is certainly possible that two
consecutive calls to enable_streams() do not go through a suspend of the
peripheral, meaning we cannot rely on POW register values for the ISP
configuration.

To prevent a streaming session to be initialized with settings from the
previous one, reset the full ISP configuration to know state disabling or
bypassing all the ISP blocks the driver supports.

Cc: stable@vger.kernel.org
Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index c84a6047a570..773e5b6a2b7e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -781,6 +781,43 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
 				 MALI_C55_REG_BYPASS_3_SQUARE_BE,
 				 MALI_C55_REG_BYPASS_3_SQUARE_BE);
 
+	/* Bypass the sensor offset correction (BLS) module */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
+		MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH,
+		MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH);
+
+	/* Configure 1x digital gain. */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN,
+				 MALI_C55_DIGITAL_GAIN_MASK, 256);
+
+	/* Set all AWB gains to 1x. at both AWB configuration points*/
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1,
+				 MALI_C55_AWB_GAIN00_MASK, 256);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1,
+				 MALI_C55_AWB_GAIN01_MASK,
+				 MALI_C55_AWB_GAIN01(256));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2,
+				 MALI_C55_AWB_GAIN10_MASK, 256);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2,
+				 MALI_C55_AWB_GAIN11_MASK,
+				 MALI_C55_AWB_GAIN11(256));
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1_AEXP,
+				 MALI_C55_AWB_GAIN00_MASK, 256);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1_AEXP,
+				 MALI_C55_AWB_GAIN01_MASK,
+				 MALI_C55_AWB_GAIN01(256));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2_AEXP,
+				 MALI_C55_AWB_GAIN10_MASK, 256);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2_AEXP,
+				 MALI_C55_AWB_GAIN11_MASK,
+				 MALI_C55_AWB_GAIN11(256));
+
+	/* Bypass mesh shading corrections (LSC). */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_ENABLE_MASK,
+				 false);
+
 	/* Bypass the temper module */
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_2,
 			   MALI_C55_REG_BYPASS_2_TEMPER);
@@ -802,6 +839,19 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
 
 	/* Disable the colour correction matrix */
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
+
+	/* Disable AWB stats. */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+				 MALI_C55_AWB_DISABLE_MASK,
+				 MALI_C55_AWB_DISABLE_MASK);
+
+	/* Disable auto-exposure 1024-bin histograms at both tap points. */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+				 MALI_C55_AEXP_HIST_DISABLE_MASK,
+				 MALI_C55_AEXP_HIST_DISABLE);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+				 MALI_C55_AEXP_IHIST_DISABLE_MASK,
+				 MALI_C55_AEXP_IHIST_DISABLE);
 }
 
 void mali_c55_unregister_params(struct mali_c55 *mali_c55)

-- 
2.53.0


