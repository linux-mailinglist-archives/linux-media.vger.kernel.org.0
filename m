Return-Path: <linux-media+bounces-65810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XV9/CtLeP2q2ZwkAu9opvQ
	(envelope-from <linux-media+bounces-65810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 16:31:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D96D218F
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 16:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="gbWnn/+/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65810-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65810-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 876BF304B12A
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 14:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391103B3884;
	Sat, 27 Jun 2026 14:29:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A083B1EFC;
	Sat, 27 Jun 2026 14:29:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570595; cv=none; b=efOmqme8sjqHwxbOFLuiu12jxQflzcxBRqSusrNnnWjlEDoPAGEaJ7jOkDXA+NfjXCxtmHnIkC4yfHeemEcfBPvdiP9uzE5dfGTL59Fd7Dl6b87/C6F1uRgZFXcZB13UgaOP2rGf1nqw7RK/nujI6bPByOxrpnvM3Ysts4JrRnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570595; c=relaxed/simple;
	bh=F2fCl0Vcx5QsnL0xnswFi/K36Oxfm0YGdo1a573U8Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8WTTRs6wxSTXsjRLV6Np+KgYZAS+dEkwh1fnjJ3oPYUsWHD/2EFleFkedun5Re6lXEM6fIahZ4Ux4Wr4KXK5ufadlsBFLEFI5rO4nSQ1cSxrYlOyqIlzq9BDuMB3uULqBbNFOGcpytTaa5IfZf/LFkxScEKahayzj9zhYNkexM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gbWnn/+/; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0404BE1;
	Sat, 27 Jun 2026 16:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782570547;
	bh=F2fCl0Vcx5QsnL0xnswFi/K36Oxfm0YGdo1a573U8Ws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gbWnn/+/u5lXko+AVBAcDbHTxxPPHcuF9r/pkvDD35ii1xw9gyxfBOLkIar5Z1wOz
	 FiYDR4UaibPBJavTrrLIZCQnHmG444oeiHzSfI81rVSVq1+ydLQdmiH2QEFyO3WPvh
	 +ve3FPwiSBtVcCc+XArV/Wof54txSnE0srqnpjEQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 27 Jun 2026 16:29:16 +0200
Subject: [PATCH v3 4/4] media: mali-c55: Implement Gamma block validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-mali-c55-ccm-gamma-v3-4-113584c05174@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=aT4pRshPfm0NPFmru6HaHjx3V05Jp8+xF/3txbX/A34=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP95Vwh4U8mpRqsTwwrOar0OE3Uk9oY+XYdGd+
 DRGlLiAd2qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/eVQAKCRByNAaPFqFW
 PNlOD/4zTTzh2+YIrTJSjfia07/iJ9NLAwNy7JNhXjmQpGN+Q8Nce2QbZs8Ps8aWIEfyhhtMgPz
 mmc2Ecae9yHSG8E6vHV91s7fUXMLl0yauiYqCGnF/652uDeZoTP2M7Fm2JyHr9rqqZyK4lwqY9A
 PIES7umrk8NvuN6yEvFtA1uL/5eC98wJTPzRzpdL/XvyfZ74iF1pEXl4Fxofo1Xa2bRMPgCY01P
 gain6u2+3oV/uJnAr6bpxbbkkCAFllarob3aZrxDCKU8/whuw+i+rnJZp/PyLZRjknI0V2VF3E6
 WnNHE9tAgtaEAM9ud83GqlUSSqjDDOGEq3mSi9DSnKcpuaO/osOHbKwdnXIOE7cUn1dKSDprKHO
 +623fnXchRtCLJTwbh91GTBpyLCPtOMl07xYydKmhFUXpoBb615gxp1qDceS1nMAJWMrGClxtGc
 Yv3UCpN86ePRgBP2L2p18UKW+eTNX7Q8u9VBcM0+V1ZKUfUEX148GsjTmXxEoc68HK4fl6eXwN8
 zLxKSu/uWkQlWjq9ERM7FvKVrMdQeBrrM3vgyHOxv22yG6ObSIiRLo4H9qBYPY2Di3qljJ3/Zwk
 oxcWjf8zixeArQvYcndeH9/PdSvrDtBHRKnmexK0grRctC6HC4qjz9dNhA/oEXpkLf3+t/h5Jkf
 YaedIrrVbMIuz0w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65810-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 802D96D218F

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Implement validation of Gamma block parameters.

Gamma gains are expressed as unsigned 12 bits Q4.8 format and their raw
value cannot be higher than 4095 (BIT(12) - 1).

Gamma offsets are 12 bits unsigned integers and their value cannot be
higher than 4095 (BIT(12) - 1).

The Gamma LUT table is expected to have 0 as first member and 0xfff
as last member.

Validate the parameters provided by userspace using the .block_validate
callback of struct v4l2_isp_params_block_type_info.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v3:
- new patch
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 5857e9c2daf7..e9ab0e2dee15 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -581,6 +581,38 @@ static int mali_c55_ccm_validate(struct device *dev,
 	return 0;
 }
 
+static int mali_c55_gamma_validate(struct device *dev,
+				   const struct v4l2_isp_block_header *block)
+{
+	const struct mali_c55_params_gamma *gamma =
+		(const struct mali_c55_params_gamma *)(block);
+
+	for (unsigned int i = 0; i < 3; i++) {
+		/* Gains are 12 bits unsigned Q4.8. */
+		if (gamma->gains[i] > 4095) {
+			dev_dbg(dev, "Invalid gain value %u\n",
+				gamma->gains[i]);
+			return -EINVAL;
+		}
+
+		/* Offsets are 12 bits unsigned integers. */
+		if (gamma->offs[i] > 4095) {
+			dev_dbg(dev, "Invalid offset value %u\n",
+				gamma->offs[i]);
+			return -EINVAL;
+		}
+	}
+
+	/* Check the first and last gamma lut entries match the expectations. */
+	if (gamma->lut[0] != 0 ||
+	    gamma->lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS - 1] != 0xfff) {
+		dev_dbg(dev, "Invalid Gamma LUT table\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_isp_params_block_type_info
 mali_c55_params_block_types_info[] = {
 	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
@@ -622,9 +654,11 @@ mali_c55_params_block_types_info[] = {
 	},
 	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = {
 		.size = sizeof(struct mali_c55_params_gamma),
+		.block_validate = mali_c55_gamma_validate,
 	},
 	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = {
 		.size = sizeof(struct mali_c55_params_gamma),
+		.block_validate = mali_c55_gamma_validate,
 	},
 };
 

-- 
2.54.0


