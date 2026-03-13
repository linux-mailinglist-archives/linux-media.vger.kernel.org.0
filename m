Return-Path: <linux-media+bounces-55647-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMGpLtnss2m4dQAAu9opvQ
	(envelope-from <linux-media+bounces-55647-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:54:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B091281CAE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF3BD325CA80
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA19038E12B;
	Fri, 13 Mar 2026 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AMqorP+O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01DB38A716;
	Fri, 13 Mar 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399046; cv=none; b=VmHAKFUKWbOQelBc4H2lXUFRhEggbIbdp5qszZ7x9/aUIiEo/UYEq9Yd8jYDYaeF84f6dfsxOhSQJ67VKby9qCQpPuXgBpIyo2FZM8K7cIC/gYSoDLj5M2Sb9hnuXLdDMnCmlv9BjqvilWoL9cWGJuHmgF9b15k71i+0dmvwDvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399046; c=relaxed/simple;
	bh=0nP79qxKyt2X+hCH5uOYDoygKJCpsHZxRexF5epaeCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ox17iuMKMW1edsV3CFLEV+Xg0d6aVzelueY//4MuZarsKcFCGFvj1GI+xQ/woSf9fyFTTy4PgvtYTsjxNnDrDO6kbcLFSeuxDeszBadzliOFxsYgBfIOPHKRF24Wx2g2b3lWnaDHk29A5LV2PESwbyLr7dYp6Jkiyt4TlAm4SNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AMqorP+O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [91.80.67.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F9E11783;
	Fri, 13 Mar 2026 11:49:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773398964;
	bh=0nP79qxKyt2X+hCH5uOYDoygKJCpsHZxRexF5epaeCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AMqorP+OaQ71yQdYT8C3QmP7gVjNtOafX6QaIdiGIbxmHsjge+YmK0QFEfDN5HqUM
	 SODp0H8kVQsj9hsM1sWGc2qwte5gR8YVOPnOPZp89BhwRluVGVk1Q9FkLzOOvJk5ds
	 ALS0D5m6ID8jtDHWX6QkAfQmFg90SLbf9bbZJBYM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 11:49:40 +0100
Subject: [PATCH 3/6] media: mali-c55: Fully reset the ISP configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v1-3-21805b2b516b@ideasonboard.com>
References: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps+vyaJ/adjW9x9WK2how7t1OqCEeGsehu4Ld0
 H3HD6DVTvaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPr8gAKCRByNAaPFqFW
 PLTeD/0Z2TINFHg7XS9zjRPbAbknh/K3PWlQzBnOcYgW3X1vnd5f64trU4KoL0fPeYIDMZjuLiN
 9RB/2lm9EN6S7YUkaZwzKaiOSytLYbuYhqei850Y6mA+3JQM0Svlpu1hbMo3dt60TkQFSPz2Rrg
 LuFAazUa4+4wVrT40URdeePxGo6dtrSpK+w05OwWcDS93SVuK1ABZBaG6/U2qRfrtQI6+881Gqo
 O7K7HvzXjoRzIMWmWQxCQwD6yTqRxefcKQrby/RCW4tL3qezIBCDZndNC87OqWI3OHGA0eKVa5x
 uAZx4ky2ZBV8qId4yPfgq4Zm9YRZ7alUYQFkbEJzley124Zy/DWdXaDBZvQauq9335w4P0A2+Ko
 t0TdKHzxBYE6WKBp5bUX6vuC9jykeBUphho8mBLczNQMLqa0l6ilQfl0221N0Oi3pb3jXSrxCXU
 tuPVur5ja6zhy8KtQTXwkGdCqsOODwcsmkt5YHsmNWc6m/E5aWbZt0xl7F3wUQf//RUVsCNgvHk
 Z9vh6DY4RKUc8+9Fn2FYon1Au1ZhCaeyR8Rpfuf+vX3eTHceWkTM+kH7JVy02LXFC+LKWfnViu4
 nLwrVTee1Fy3UCYuzX+plS/xdH0D0Ewwa9ox2GvWPMyakFFq98jbRtxXjaAH84V1TuRnmG37fHb
 pZIdN+4eyTuXA4w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55647-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 2B091281CAE
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


