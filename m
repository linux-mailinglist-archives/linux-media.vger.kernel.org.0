Return-Path: <linux-media+bounces-65113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8OWoHeCMMmqy1wUAu9opvQ
	(envelope-from <linux-media+bounces-65113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:02:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 681206996F0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:02:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=X14kp94L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65113-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65113-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5600F3074C32
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DA23FDBFD;
	Wed, 17 Jun 2026 11:56:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF30B3FB052;
	Wed, 17 Jun 2026 11:56:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697378; cv=none; b=GF0VpghTD3gkk3KLSZkP1zVqne7vdibM7I0hZ3sRHDH4B0vQ+ldlWTnaCv+ptmjpCJEWpzSRbRgHuLSoAKyCQaduh4T/hQbgZhQOB/cX/j76yaJeXcvkwGq4WKKDeUiUVVjpEfzdtx7y66pnw3MwVpeMStP/981eodovGPZO8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697378; c=relaxed/simple;
	bh=pCxr7r38pjLHfIyuHDmhrSY7G5s+T+0pT8occa86F7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLMGNzqavRoh2tVW5OBK+FqgiSH7kSe/5WRr+Q444oP5urheoWnElNvGZn/ll+jVTL53pFMmUsSEtkEGTyiBMs5uvuxAuC2z7iauHlDyUVoo/hCDf47dpe/syrED3pcmU/Z2Y3GoDZKZaKAQkY0ha+9RMpsYbEVin/vV56szAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X14kp94L; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A10341E76;
	Wed, 17 Jun 2026 13:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697324;
	bh=pCxr7r38pjLHfIyuHDmhrSY7G5s+T+0pT8occa86F7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X14kp94LWBjRCb/a52Ol1InrISicA93rQEZAsbepnwiSNJw9eywXTTT4LsGwqe82Q
	 HBIs0/0aTCDUeJh7LyGoQLxVCtEe95FcmA8tOs6+k2tHNIHoHdI/G+pXJDLJEn/+qh
	 wfWHwmfxIqpCAy6i6me3YRdUdZSCaXxTsja1I2Ig=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:55:01 +0300
Subject: [PATCH v6 08/11] media: rcar-isp: Call get_frame_desc to find out
 VC & DT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-8-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4966;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=pCxr7r38pjLHfIyuHDmhrSY7G5s+T+0pT8occa86F7s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotFF+PQLf5VSgd/e4Enp7gWgxmixYus5bx1A
 nVfHSZ+SbuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRQAKCRD6PaqMvJYe
 9Zw5D/4zKKJCIzSYKYZBgYPrbzxauKd9yuNZ4AW3LeT7zvvz3dFuXtyh9B6p52cqTXGAkUW09YG
 FMbJZ7uA4d0DT8HNB85EkXLMNumOegp/zNG4E2MhOGZT7MMfAuDC3iTK1CkI/BdUPMb4m4QNq85
 6setKkygCN786nGkQGe2REjoefGnxmnx+n59WYxYEVodwllD4RwePfAdY8b+7JCchXLbqiNnfsA
 UshptYclUOeHBfaJNXgknZywzlQd3ak6N8ZyR79VxWfuikxm1NgXK5646A+i6Nci6fmIY7TShIX
 1jigxhraGuXmBg+os8QmD6qirA1gX98w5fNoI0jTa4+sb6lVm4NoCRRDfilqHXwxjqdVWlYk9uo
 kKwkrLo//CADETLRHdxsPCYNlNrvIrpGwxi885SxSaBC0sb0N5YeJ3XM0w5H8mVi6f8PA9RYcsl
 /t22BkBnC1nhLfUXE5xvChwBVo/vbMvBFFn3FPpm8tSlwutn0bdTdfMtOE2fuxJq4+EqSbtOyhz
 fLN3m4MG0Mrg1mdc3pM1F4xoQN44uNaeEwEz2WFEaPf3JTNCYXhRVIXKxEgW1K1Q6/7By0DFBZk
 wrlSGtrqAyHhT3Xf5J1SSgmmT79gn48HZqknruOK5i2kHdiaHY4DdkEDvcOnPU5/F6flizZnq4s
 npvWWs6yVheRyEw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65113-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 681206996F0

Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
routing and deducing the DT based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 110 ++++++++++++++++--------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8ac45516aa39..42ee6c19801a 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -42,6 +42,9 @@
 #define ISPCS_DT_CODE03_EN0				BIT(7)
 #define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
 
+/* ISP has 12 channels, of which channels 4 to 11 are connected to VINs */
+#define ISPCS_NUM_CHANNELS	12
+
 struct rcar_isp_format {
 	u32 code;
 	unsigned int datatype;
@@ -225,31 +228,82 @@ static void risp_power_off(struct rcar_isp *isp)
 	pm_runtime_put(isp->dev);
 }
 
-static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+static int risp_configure_routing(struct rcar_isp *isp,
+				  struct v4l2_subdev_state *state)
 {
-	const struct v4l2_subdev_route *route;
-	const struct v4l2_mbus_framefmt *fmt;
-	const struct rcar_isp_format *format;
-	unsigned int vc;
-	u32 sel_csi = 0;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	int ret;
 
-	if (state->routing.num_routes != 1)
-		return -EINVAL;
+	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
+			       isp->remote_pad, &source_fd);
+	if (ret)
+		return ret;
 
-	route = &state->routing.routes[0];
+	/* Clear the channel registers */
+	for (unsigned int ch = 0; ch < ISPCS_NUM_CHANNELS; ++ch) {
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
+	}
 
-	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
-					   route->sink_stream);
-	if (!fmt)
-		return -EINVAL;
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct rcar_isp_format *format;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int i;
+		u8 vc, dt, ch;
+		u32 v;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(isp->dev,
+				"Failed to find source frame desc entry for stream\n");
+			return -EPIPE;
+		}
+
+		vc = source_entry->bus.csi2.vc;
+		dt = source_entry->bus.csi2.dt;
+		/* Channels 4 - 11 go to VIN */
+		ch = route->source_pad - 1 + 4;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
+
+		format = risp_code_to_fmt(fmt->code);
+		if (!format) {
+			dev_err(isp->dev, "Unsupported bus format\n");
+			return -EINVAL;
+		}
+
+		/* VC Filtering */
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
 
-	format = risp_code_to_fmt(fmt->code);
-	if (!format) {
-		dev_err(isp->dev, "Unsupported bus format\n");
-		return -EINVAL;
+		/* DT Filtering */
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
+
+		/* Proc mode */
+		v = risp_read_cs(isp, ISPPROCMODE_DT_REG(dt));
+		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
+		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), v);
 	}
 
+	return 0;
+}
+
+static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+{
+	u32 sel_csi = 0;
+	int ret;
+
 	ret = risp_power_on(isp);
 	if (ret) {
 		dev_err(isp->dev, "Failed to power on ISP\n");
@@ -263,25 +317,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	risp_write_cs(isp, ISPINPUTSEL0_REG,
 		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
 
-	/* Configure Channel Selector. */
-	for (vc = 0; vc < 4; vc++) {
-		u8 ch = vc + 4;
-		u8 dt = format->datatype;
-
-		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
-		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
-			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
-			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
-			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
-			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
-	}
-
-	/* Setup processing method. */
-	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
-		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
+	ret = risp_configure_routing(isp, state);
+	if (ret)
+		return ret;
 
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);

-- 
2.43.0


