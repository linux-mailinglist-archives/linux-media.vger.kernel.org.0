Return-Path: <linux-media+bounces-55405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDvSHaF0sWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA011264E9E
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 084CB3008D1A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB47372B3E;
	Wed, 11 Mar 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OQKF6F4J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2856836309B;
	Wed, 11 Mar 2026 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237259; cv=none; b=aO6kc9h0SZjO9/YcsVa7B5gx54DQCoRYYxhmkpDRugzXG7mTAmSwJcloyCEHmhLIYzXxlEiQ114eIOAQv37OOB11YZH19kyg+VHle8/tNv4tqa0OlfSklmL5zgzLTUJQxrbH2mNIPRkiwsbNsMqc/myRpQh3uvMJFsI69w+Zf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237259; c=relaxed/simple;
	bh=Iff4ud66u5yMU9jO70xyyuEbjXflyaiIAtTzW1C/x5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsJ1MQtUPVznKFBgGsV67N5SEnGBqrQzA/KA4j489a3z4lBbBZN5FfYjhqf6eBWugg86Dd1JLmUce9tdg5NwTyE2TWx7iiX87XEQ3MwnULUNGh1kNmwpQuzs4TkOIsqeBhJpaapLndMlKa3VfwVrb8MtaqRKgadWKGU9mEtGAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OQKF6F4J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C337712BB;
	Wed, 11 Mar 2026 14:52:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237167;
	bh=Iff4ud66u5yMU9jO70xyyuEbjXflyaiIAtTzW1C/x5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OQKF6F4JQ/3bODwURZgzSDe6NOO0madTFPCiFQ6hjm1t9Zs1mqbw8edkGU49ubKpc
	 5XGub6w3iNrTXivx2jWuGIomeRypZ6f0/GqmxB3zxICbR1Ktr0bmMsS+WlknmTWjcm
	 nivhR0xE8oIcetcKmewfFNY6MzpVEhg0p03OqI3U=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:20 +0200
Subject: [PATCH v5 07/10] media: rcar-isp: Call get_frame_desc to find out
 VC & DT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-7-3e6c957d7567@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4963;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Iff4ud66u5yMU9jO70xyyuEbjXflyaiIAtTzW1C/x5c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPryjnJdi9KWXEqyLa/Fj2hooCfymXhXHgTI
 7Gh1hau7T6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6wAKCRD6PaqMvJYe
 9VB8D/sFjViv3UDevocZ8KVnv7Gwv4fIiH6yQA3/dHYhmnajqfxP3EPqHlJKvbge315qgPKViEY
 E8NGNohZC72HniJ7vdvDHOgpiCyzjnAoKLHo5QLVoN2WvW79WcFf7nvb0fN/19iFtKaTztLYJtk
 oVionhlZMaDfcC1e5ZEdTgarRmTIwA0F+TgDgHuA9XNpWCarQUCdloZ4oBJiu94mDJQB2Ah9er2
 Jzv+YHkZhoUl+qrHH6WSmO+BRraq2p/LgP7rtjoC9FMPE3Q5S4qzrw6oQ7QoUOza9ETJAsPqOxp
 aUQzKiI9zVxmVXK80QrizcyoM0fgAhsf+fjWCb3ZZwFoPMSN71zgvPu/7AeJn0jBCANGxZpenIx
 LAcOg5H29cvUyhr5UFBwRNWs50XQDwLNna+55KocgduSS/M3dyYJwfx8inzHcd4csne6GRopPgU
 QmeMptXbJZp8XL0ltvQ/H7pQvygYBUyVyqAPXwrIPgzaDQ9Pdf/TdSl3xLIiTxknP7yFGILv77k
 gyX7nfeD0P4PW4RD86uBfw1hj89fPz18c6fmZ/1DbK3klLR0yK27c+1T6s7YvZKnNm3cmIuAavX
 lgG33orMPg0vYodI8wO2Hl1nFKf+5q5R+lTAWN5CH3lmLqlHr72N+3b3cnsK67WQN+2TwZ0dcI1
 WOBNDf3sVVLznXA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: AA011264E9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55405-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
routing and deducing the DT based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 110 ++++++++++++++++--------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8ac45516aa39..18d63731b6c0 100644
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
+
+	/* Clear the channel registers */
+	for (unsigned int ch = 0; ch < ISPCS_NUM_CHANNELS; ++ch) {
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
+	}
 
-	route = &state->routing.routes[0];
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
 
-	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
-					   route->sink_stream);
-	if (!fmt)
-		return -EINVAL;
+		/* DT Filtering */
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
 
-	format = risp_code_to_fmt(fmt->code);
-	if (!format) {
-		dev_err(isp->dev, "Unsupported bus format\n");
-		return -EINVAL;
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


