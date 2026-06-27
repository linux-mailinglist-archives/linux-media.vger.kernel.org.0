Return-Path: <linux-media+bounces-65808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q73CHnXeP2qrZwkAu9opvQ
	(envelope-from <linux-media+bounces-65808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 16:30:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8276D2176
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 16:30:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="kZ+2FJ/d";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65808-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65808-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B76D3022922
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 14:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527A33B2D24;
	Sat, 27 Jun 2026 14:29:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281DE3B14CD;
	Sat, 27 Jun 2026 14:29:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570592; cv=none; b=TzyiVdGLpQk3JABjiU4PQZv1jw7H7QeTwo2TVEHZCgnvUIif8sNhBJTCoK0MkArPZ1jenogxZjthGirXGzmdswFvygGQHXhlSX7hs5rGFeaUK3MLp4ldOtI6djGThMi1yiFvl6b5PbV8iJuzz6x0FKtyRYH+7vheZnvsdCKR2VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570592; c=relaxed/simple;
	bh=wi/MAfwUDiUiFQunh+yrhnBtsraDVRTIV68439t74Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XR63mFuhH3veO7In5Zi1tfivK3aW+lH7g4LFD/XyIuZuUzbeCoeuUzw8N6LtF6PYzINxFvN/lQ59PftRpMpi3wuAhG63gnx1EtqzYoiv3djizHE5I2d/99UOzA6E19G/TR2A0BD7I3z7+irA+K6V3/frS0A0teCFnonhWIA3IjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kZ+2FJ/d; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F8FA19C6;
	Sat, 27 Jun 2026 16:29:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782570545;
	bh=wi/MAfwUDiUiFQunh+yrhnBtsraDVRTIV68439t74Ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kZ+2FJ/do7kbOisrN8N9MJ8mZAlQXjXKdttP2Yq2uGt9pfw7Y3Va3VcHUngcNOeAJ
	 comm5aiCRGY1Mi5eKKbrMYKxq5GcSi5oti8rBVDQIvpieKXzC/OAu+jmOIQ8a2uYxl
	 JckEtouS0DUUagzVRjeNVbob7aYLyziFLuB2WM9c=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 27 Jun 2026 16:29:14 +0200
Subject: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
In-Reply-To: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2410;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=3SzUS+X6UN0wA3rn96FvHsL20HwYo4/pET8nCk4wvHk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP95Vp6GaIkxm10BxKuWKx1uy6tLHFEIsvYlko
 DOPyRBDmp6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/eVQAKCRByNAaPFqFW
 PFTUEACoeMeu4dthQQf7H9uxlxDoTW3N6KJpwLO0zlxAPfuyN4SKMt1aDCweMND3PmHn3kaQXed
 WF7ok/oTKidJO5IO3oYLci04liCc+B21VHhcS2xcaaiUw+1DVmtXPZTP4NR9Zpdh8+bRoersoQI
 KH6lFuyh1Oely5/MfZusfVQpdftGAXQLnEpKA3s36GJd32qDm4DxZWeoQn3BtYhdxii8UBmZlPA
 uMgiMfeuBKSiUk5ZKS9eKGUl0Ui1hQK0Cig8Uo5T7Zgt9+Skf+j4r+tPXhiCrBW9mtesQzs2U5Y
 thoII7RSLdUBPvxSfgN0KZEeYehLAGwAJm9uu1QGk0Q0bV3nv3zZi+EQodor/WU5bH+o56TLhwo
 ZPV3ApQlqolEKl9NoeD2jVRo29bsun/2nkHUWRHPqwKF/YnP4OQ6dPjLzTMFXdPB5lgJAu/zbOU
 p13JsySfl3VQO4HFxuRQ2wYyXAXEUneRaHcFd49qKSOw3BuiuTF4b4c0ejspU2kmIh04l479DS7
 z5Ii6lqHFMWbmDbiXSSqd7EMO+o5MHoz8WKXyAhHuAAIFWs8l/yxJSDE3vt8kkklrB4mT/Fq8pR
 9G9JZ4mgVtWiscetJ7q8wIm8LW4wgeragWFZJCzpCkAQNgSbjGAAzUz0MoS6FxDEjzij0uuotm6
 QSLG3liVM/AHcPw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65808-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A8276D2176

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Implement validation of CCM block parameters.

CCM coefficients are expressed as 13 bits signed Q4.8 format and their
raw value cannot be higher than 8191 (BIT(13) - 1).

CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
value cannot be higher than 4095 (BIT(12) - 1).

CCM offsets are 12 bits unsigned integers and their value cannot be
higher than 4095 (BIT(12) - 1).

Validate the parameters provided by userspace using the .block_validate
callback of struct v4l2_isp_params_block_type_info.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v3:
- new patch
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 0da5215c52c3..333e66ee3923 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -477,6 +477,41 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
 };
 
+static int mali_c55_ccm_validate(struct device *dev,
+				 const struct v4l2_isp_block_header *block)
+{
+	const struct mali_c55_params_ccm *ccm =
+		(const struct mali_c55_params_ccm *)(block);
+
+	for (unsigned int i = 0; i < 3; i++) {
+
+		for (unsigned int j = 0; j < 3; j++) {
+			/* Coefficients are 13 bits signed Q4.8. */
+			if (ccm->coeffs[i][j] > 8191) {
+				dev_dbg(dev, "Invalid ccm coefficient %u\n",
+					ccm->coeffs[i][j]);
+				return -EINVAL;
+			}
+		}
+
+		/* Gains are 12 bits unsigned Q4.8. */
+		if (ccm->gains[i] > 4095) {
+			dev_dbg(dev, "Invalid ccm gain %u\n",
+				ccm->gains[i]);
+			return -EINVAL;
+		}
+
+		/* Offsets are 12 bits unsigned integers. */
+		if (ccm->offs[i] > 4095) {
+			dev_dbg(dev, "Invalid ccm offset %u\n",
+				ccm->offs[i]);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static const struct v4l2_isp_params_block_type_info
 mali_c55_params_block_types_info[] = {
 	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
@@ -514,6 +549,7 @@ mali_c55_params_block_types_info[] = {
 	},
 	[MALI_C55_PARAM_BLOCK_CCM] = {
 		.size = sizeof(struct mali_c55_params_ccm),
+		.block_validate = mali_c55_ccm_validate,
 	},
 };
 

-- 
2.54.0


