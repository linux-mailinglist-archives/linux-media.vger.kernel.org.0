Return-Path: <linux-media+bounces-60439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP2CJ0r7+WkYFwMAu9opvQ
	(envelope-from <linux-media+bounces-60439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:14:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69C4CF30A
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B251A301D0EF
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A17C48035D;
	Tue,  5 May 2026 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wgk4k//q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DE47F2FB;
	Tue,  5 May 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990380; cv=none; b=ShGECdinPNMbwOt6J2a6cJCiNdjigEGaXLwdmpMpbPWv5yBG3Yera4VokyU71Kk2FFxYSLwOBld5t65uHxjnbBJyRPBFaYYQ2g7WVgqOsxbReNr9XYbz+QNYJ591IejDjIzP4W8tjMDsotn7P2FJUa1Q0KvlInBZAAyogFS6f5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990380; c=relaxed/simple;
	bh=oNsDyr6uZzYV3a0cCi0urCH+ptz1GQyQi5/4NRsNn4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLU4IvKPwJ+z4QLMT7fehwcBUZIuFxMxq1riVsYATDfVzNlUwVDg5awBXF6Hy5jKTuesSFae6uryiU58aT6q4OorXnhRR8wtlpNuVhzp2mO9XBBVt9akjUUoJKaHNtaP7VzMdf3hBO0IklBxOuViXGY3AFcJ1IZH9MxpiONnmsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wgk4k//q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.83] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1B8525A5;
	Tue,  5 May 2026 16:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777990359;
	bh=oNsDyr6uZzYV3a0cCi0urCH+ptz1GQyQi5/4NRsNn4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wgk4k//qbnibymttqy/+7QS8YMZ4rTsowIaGAKsHXAn+FcHYV56hC3Rq+36JwnqkN
	 9KikoDzOQKzTuP96EHxMf+iLxXSIoTloaswXlfZTAFbYc3lFXuAh4UVH3NtbALzt43
	 AY3Jnmzs9/O8Z85tjOEvg9ZQIOLu1rXmuTkoFSDI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 May 2026 16:12:16 +0200
Subject: [PATCH 5/6] media: amlogic-c3: Implement per-block validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-extensible-stats-v1-5-e16f326b8dad@ideasonboard.com>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
In-Reply-To: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
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
 bh=oNsDyr6uZzYV3a0cCi0urCH+ptz1GQyQi5/4NRsNn4Q=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+frUFGUUfHWvhDdsFPSw5E4ysiqXgLk9nmwEp
 tjBnpAhKqOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafn61AAKCRByNAaPFqFW
 PLxDD/9vh83Fran6CpinIVndOaHQNOxAaWb+KyzQvg7tsIr5X0Fpe783K0t4klgLaXF3citw4sQ
 I21FmxCCeUUfcpGW2aERp25WMboR9qvbktPk944VPaCFauiT76KbIDtpntNkv4LUxqqVkuTgFYp
 6TFoGwXCsoyqHd4Z8F585wc08lK+NT4BErXeTErKU8mSYo+TPSTeiYbLqdHhhAUm/EH5qiDpqN7
 Fb183rc9vkqyOBFW8gK5of8VVwmSkSOlc5CR0QKhPPW+PxrSII62sID9vF+Z/Ua15jhe9np+Btc
 794e1OSKquxXmebMUD6Thb6Im9TS3DLnUB/nwKodr8dkJ2YPEzJfbhsQvTI68dge3Zjat6gkEXW
 aUB65OTQqjukyDOj7rc0UQZtAvJ5k2kgvdIrMgJW4qT6HYEAcspe0llEFviQW/+TalGEOQm9H+M
 1XlZpj136r3P7PkMgU1pQsVgqEzRVo3AviQK5kSI1v8rLnkzORzBQkmxvW7gYrnrMk5QInJgAmn
 tLeYhGw5mHoSXYKE3FA4wWMdReQwTR8AHXvGv9hKl8GeaAjWLwxKDMQsOjQgSzNQazUY/04Md6j
 mVXyy+me3+VE6yCX0RCd1+TNjTZbYQ1/yeUfUAkYWUICQGSL0O4xzx2ccwFau29Mqu3A8h0XVau
 isiLudGqU8F7wUA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: 9B69C4CF30A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60439-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

Use the newly introduced per-block validation in v4l2-isp framework to
implement a validation callback for the AWB and AE configuration blocks
to make sure the configured metering zones do not exceed the hardware
capabilities.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 42 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index 6f9ca7a7dd88..6d5d332599df 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -531,16 +531,52 @@ static const c3_isp_block_handler c3_isp_params_handlers[] = {
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
2.53.0


