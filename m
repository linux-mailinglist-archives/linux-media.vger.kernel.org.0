Return-Path: <linux-media+bounces-65111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 43KcEpWMMmqi1wUAu9opvQ
	(envelope-from <linux-media+bounces-65111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:01:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F846996BC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:01:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=P5tMezFN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65111-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65111-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E38B306AB57
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9713F9F56;
	Wed, 17 Jun 2026 11:56:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8E83F54BB;
	Wed, 17 Jun 2026 11:56:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697375; cv=none; b=VwrMSWxiT/lxOhMkBd/D9ueyB/36UJJcAxfAHUqIOc5Es/F3qQqPSLKcWKf59cZAdc2+AxDhLLTB3tauKYrjkNdJUytFOyJ7auX00zCjP7IS23r3GSBEzDfdVzJn6U1q7ccGO6KEWRXO8KUvm5XOUhSzhWoH3VV2Ia4m4g1qzGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697375; c=relaxed/simple;
	bh=sBcIT51/DlVUNmZuKuMsMHbk8CgiKIupbYEj/l/JidE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGylu2lgJbvER4K68JjCzn9FgwS0YqqKdoB/CfPgGQ3TkzdWiqL10bD9RGZ7mfUb6v8JzIGpQeeYKZoiEMjD/mmGqfDmDdlSJwUrF7LrywsAi+gs7txr308HmHD5cLXbnoLa7+HAOoytBogVQMZWEup2kH+I2He79cVfnFgBkFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P5tMezFN; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2043A1943;
	Wed, 17 Jun 2026 13:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697322;
	bh=sBcIT51/DlVUNmZuKuMsMHbk8CgiKIupbYEj/l/JidE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P5tMezFNHcNtaQBNDGDVXl3MnIMU6FcD2B6Bt2DpbU0BwcXcuX5mo0Ev1RvRVOZib
	 IEik4RkP+JJ8PeD5MERbq5GJsyfx0wowWca4fKYJApVs3KfKAh0uEiuFQHNJLLND8M
	 qLsJ+MOK0vNJAeDgMKEs8bkzkA9CKtDG22AVwktE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:54:59 +0300
Subject: [PATCH v6 06/11] media: rcar-isp: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-6-1260eb72dff7@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4488;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=sBcIT51/DlVUNmZuKuMsMHbk8CgiKIupbYEj/l/JidE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotFeDgCFrWxExnZ32495fKq/KtgLERgLKLa8
 htXWsuGQ5CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRQAKCRD6PaqMvJYe
 9ZQyD/9y39uGabRPeXK6iYHFIpYgkbHmMWNqpEMW4utQWsYnzXVh3J5P1rnFRcUuOy6B1UVWc/n
 ZAWiRX9AXKLAPRZu0k/mKwL6uL1N/Ty0WD2r3DztScGKshL3+uM/SAh80c61n7+gHzYS3mybSFu
 xLeRr174ZTzWjjqhHx7V9QwlxR/I6r9Noa926WCHTQJl4PfcMvdZBYtxXQzNgBt5SyVBdHPJ0iC
 EgtoASJrS/hR34wtzyjMG9RheHP1odj+kJPKayntWTX6milC1624/MUALBXdlIMLRwhJtT0dYj+
 FJKtixwoL5w8nax8l2Lav2c7rmheNg4YSUZ4VrjM22Hwbsq0CFlUN2sWNNGp17GA/OB1wT0yU7F
 4kfJ1Von0NNxYkw1DSjdCzOXnEVYZgsPS5Knx70Ze2EfGDGlJhQBHnbrHTS8MxxyVCgYZkeTZCu
 HM9MEdeWXIvIW829eyqQAInDisGGO/TEhT1clYByriHHtNKwAtE9PjvshTrEBivpRyisgvJwyET
 5TPwknF91Upn6RV+ayAnpjU+jD38b738wqOcFY+cdfAiyfFSKTA6NLc7GcyokHbDzR2ocvQkrkK
 lpK+e4ccbjOSCQn8ocQNNprEHoUilKV04gYs3lkq6UAyMAZ2WjA/MZ/J3q4qs32Q235v7qQaS+R
 shCcvCCX8WHPLug==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65111-lists,linux-media=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49F846996BC

Switch to Streams API with a single hardcoded route.

For single-stream use case there should be no change in behavior.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 69 ++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 58a9a3bd9f75..8ac45516aa39 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -124,6 +124,17 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
 	},
 };
 
+static const struct v4l2_mbus_framefmt risp_default_fmt = {
+	.width = 1920,
+	.height = 1080,
+	.code = MEDIA_BUS_FMT_RGB888_1X24,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.field = V4L2_FIELD_NONE,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+};
+
 static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
@@ -216,13 +227,20 @@ static void risp_power_off(struct rcar_isp *isp)
 
 static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 {
+	const struct v4l2_subdev_route *route;
 	const struct v4l2_mbus_framefmt *fmt;
 	const struct rcar_isp_format *format;
 	unsigned int vc;
 	u32 sel_csi = 0;
 	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
+	if (state->routing.num_routes != 1)
+		return -EINVAL;
+
+	route = &state->routing.routes[0];
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
 	if (!fmt)
 		return -EINVAL;
 
@@ -341,7 +359,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_ISP_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -349,10 +367,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	if (!risp_code_to_fmt(format->format.code))
 		format->format.code = rcar_isp_formats[0].code;
 
-	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
-		framefmt = v4l2_subdev_state_get_format(state, i);
-		*framefmt = format->format;
-	}
+	/* Set sink format. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
 
 	return 0;
 }
@@ -369,6 +397,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
 	.pad	= &risp_pad_ops,
 };
 
+static int risp_init_state(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	static struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_ISP_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_ISP_PORT0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	static const struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&risp_default_fmt);
+}
+
+static const struct v4l2_subdev_internal_ops risp_internal_ops = {
+	.init_state = risp_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * Async handling and registration of subdevices and links
  */
@@ -526,11 +580,12 @@ static int risp_probe(struct platform_device *pdev)
 
 	isp->subdev.owner = THIS_MODULE;
 	isp->subdev.dev = &pdev->dev;
+	isp->subdev.internal_ops = &risp_internal_ops;
 	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
 	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
 	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 
 	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
 	isp->subdev.entity.ops = &risp_entity_ops;

-- 
2.43.0


