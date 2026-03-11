Return-Path: <linux-media+bounces-55403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NVOAm10sWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:55:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0C264E60
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 452E5301C6BE
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCD53603C6;
	Wed, 11 Mar 2026 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OiR/AZzV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB7363088;
	Wed, 11 Mar 2026 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237254; cv=none; b=grOPg+6JUfoHnz24DIKbuyDlBD9xgqdjJsFsvis1H3kPOazYw/9qEeJ4/t9N6eG4/n9M60qpZNIJIm5koa8MYHeN9Vnlu7cp/Ak/n1GIwKvno5x7RaDayBgHbu/Lfvnbz9Z5Y2n0MtIl5SF+Q5u6Id89oOT+dCGRVP062zVflNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237254; c=relaxed/simple;
	bh=mZWCoESvX+k2ae2+IKwq0Qo52nPIskYlapwxCMGA4K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBV7FIrKuQgoM1QO5Bmtcjl2qUopI+cIyDo2bEyryEoJt4huWg6ehVK6dNDXNFnaUdimhdNux5aKf/HPHtbc5FOQJLCA/sS3anIQ903flAvVpbDEWLjIV8QX3bQmWNyytVqVMElzNn0iNfwyTJVRLQFj5wElF31IQ5USyFzKcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OiR/AZzV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A4C2121A;
	Wed, 11 Mar 2026 14:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237165;
	bh=mZWCoESvX+k2ae2+IKwq0Qo52nPIskYlapwxCMGA4K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OiR/AZzVTO1VwIUxI2CP4SD0Q6ojB62ijOt5qSt3wI5ZsykB32oXcFgtdf0AFxl42
	 gymTA3dmkjrvf7AcE7zgUCWPXFSxIAO7SCCxndTctRlN+KwMvYkUDqoBYC06p4S4E6
	 Q0wADjh6hjTFfwrsaM4V8KYU9Y/pOeeSB6wv8IXo=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:18 +0200
Subject: [PATCH v5 05/10] media: rcar-isp: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-5-3e6c957d7567@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4413;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=mZWCoESvX+k2ae2+IKwq0Qo52nPIskYlapwxCMGA4K8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPq+gBvYKgXzdsgeA/eomKShIjksktLBtluE
 LH9eVh3aSyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6gAKCRD6PaqMvJYe
 9clTD/0f6fa1jqC+gAC/cvmXYxBFLJVDNWwFuMFDwYyPbISjUGBKprzGn85L/4aijkPnxOLJjSQ
 3Rfi7aEfysKnI7vyZClD0CBdUtKD21bOLidIWjAYPBJ+YYc98kslZ4XSw3m5UBFT9Qrj8uC480h
 tIr5QV4YnHQLDkn3uJZnxxWOzg/N7eGeELt7vRX6g1I7a6qWnuOEgkmCfn9V6VJmBVxoIGsNaXk
 bg4QBkwATTilwa/DKhWthyDs0NMX+43yfMEEHHMA+F5mMe7KYdo/OcuKI7AOqet/ut4QJepSO+j
 Rc6I52am1zAsjUghnej8r3AwXMEL1DZ5qEJCvQB9oqPPzzqW7by1IjbDnN557hs8+K6R6Xcl/Tr
 5XsU/7aVDpZ/TWsObLVyeqBbdhEiUrO9TzqgtA0N/7XtLrIXGC8VyS+K25k/x/DXh8m3Ug1rKJ8
 3ndf7oPmYwhCXlOWRa0TJ/q5eVziQmD6bFs6zVaf6eoVeZBHouHJLFTnYVtWIZswcdOulKAqmT2
 6PBniC3hI7vpuldeo06LfMbgU1nJhP0T9hLL/iDBzE4rcFiXIdLgOYZFqqTwDyGKOGQomAEX0l0
 /W8DEX1od2xrGsw7tYKZkIsQ5/cR14cuE3momO7nBQ5Aja8BzqRIZBHX91sm+1Ial/3Pzq3w4/3
 +FCIY2ogWBX/I0Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 08B0C264E60
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
	TAGGED_FROM(0.00)[bounces-55403-lists,linux-media=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Switch to Streams API with a single hardcoded route.

For single-stream use case there should be no change in behavior.

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


