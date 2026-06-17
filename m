Return-Path: <linux-media+bounces-65112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qfkXG8qNMmoE2AUAu9opvQ
	(envelope-from <linux-media+bounces-65112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:06:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EB16997D6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:06:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=W0kVghgV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65112-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65112-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 706D030A9CE0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FF03FA5F0;
	Wed, 17 Jun 2026 11:56:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A77F3F8892;
	Wed, 17 Jun 2026 11:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697375; cv=none; b=liBHLtZfhYSyduXw5NqHBnV6gi/4zUgbJEeHJMvHkKLKb0TgQneMiwFZYZLLI30K5uRJOPbktuISE4FEjK4Og4R6hrjr5OvVAyGrLVvf52SABsBKzeiFBcQWIshPfjc2rZsPoaPuOFfC7QMg5TakPRUA+7bkBObkGDZBgRze8/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697375; c=relaxed/simple;
	bh=GK/EfESteMm/OAfHPWec46Cpj/NwHtTv+mYplktaWZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KI0Xmo6vRyFJy9Nb0W+n5xFMUWDFNpr69oeWYoVRoRNJZN1u4nvAddfTjALeEpXEhSLPpj5sscP6s5RHsj5IThdC1tBoGoS3WUB7setevK1FS6qx4zx+wSa1+GR5OhruX8gi0b4IFw22ghYDC4UfButTKiLwohJGQFZmzk+eeOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W0kVghgV; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1C8D1E20;
	Wed, 17 Jun 2026 13:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697323;
	bh=GK/EfESteMm/OAfHPWec46Cpj/NwHtTv+mYplktaWZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W0kVghgV2MM9AEAzj9Z8f5OQjEqEc0Abqc5T+4kryJi5Q/gsiIGFy+db789EF4Qro
	 fJ7WErBRFkr3uhUF0NxBfgMG/o0E+xZzJc5sYATBW65G38eEXJkN4KbA90UyWeAyev
	 nlw6drfKDzGTZGlva7ZnzZ6OYi3633LlJdhlyFSQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:55:00 +0300
Subject: [PATCH v6 07/11] media: rcar-csi2: Add .get_frame_desc op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-7-1260eb72dff7@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=GK/EfESteMm/OAfHPWec46Cpj/NwHtTv+mYplktaWZE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotFigmik6+pW6+Lu6/sL+ZxyeXn52qjVt9+u
 G1FdAnD87SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRQAKCRD6PaqMvJYe
 9XFED/0ZxO2a3dexMW6mxqbfohBsMLlp/NBscMYn/vdzxoP7mvbDwd//HOoLWIW44R1g3k8K/3e
 U+ehOPuFZneHay7VD5mOXvXgv41nG0/6wYuYOEwPEarg3v+qwAmjNTQJOZ2zJnqYvm8/Sf4iWk2
 toEyZfVlsaJX2bWNCLC1b+XCDPw9Y5h5TMIJFPSau7kUqPpBJPJluSxk4Xv+vYDHS++IJq3ttvx
 d01lVQgHFkVRQ8mb8K1ITPQqw8iKLD2o3WfEnTd3RN5S8ACup6iXHVf9qWijpeQqiMMbeT+FY1m
 oQH2OxR38uEZDP4buy/66tGye8TxnQNuMod9A1itIVDPNly0FmfoMu50ei/owxdFn+Mze3/c8/c
 qn8ZoUUvfNY8PpEJ0C7bFOltiINATfdPrhYdbT3z60HZL55oFVWa2VkUYRO6z0ChGBkJOayPols
 OvL4zwey2M0KC7S2yHYfr6zsCWngzuhYR4T3JowZ1WVv0UuPVtiJ/l/dEPmGhLdD/ns0l+KivZ/
 kBxCNuvX6lqGiS5i59Xmcw+lyHohWYDi9Pyg2FOvkLY2AhIhS4jOEDr/fPVdYnf6XxVs5s1Jnzw
 VxGKscyQ7mc8aOGxonvXghtAa9UsPeei6/VH/9jmzwJjFX+4TjDKRaRaDs0S4slqFPtdHTvF0uV
 OKwq7IKe4VoAHdw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65112-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7EB16997D6

Add v4l2_subdev_pad_ops.get_frame_desc() implementation.

We also implement a fallback for the case where the upstream subdevice
does not implement .get_frame_desc. It assumes a single stream with VC =
0 and DT based on the configured stream mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 91f713e1f8c2..0d9e730fa677 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1935,12 +1935,86 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
+					 unsigned int pad,
+					 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_route *route;
+	const struct rcar_csi2_format *format;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (state->routing.num_routes != 1) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	route = &state->routing.routes[0];
+
+	if (route->source_pad != pad) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	format = rcsi2_code_to_fmt(fmt->code);
+	if (!format) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fd->num_entries = 1;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->entry[0].stream = route->source_stream;
+	fd->entry[0].pixelcode = fmt->code;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = format->datatype;
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	/*
+	 * This should only get called on gen4, with ISP, so yell here
+	 * if that is not the case to highlight a driver bug.
+	 */
+	if (WARN_ON(!priv->info->use_isp))
+		return -ENOTTY;
+
+	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
+		return -EINVAL;
+
+	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
+	if (ret == -ENOIOCTLCMD)
+		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
+	return ret;
+}
+
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.enable_streams = rcsi2_enable_streams,
 	.disable_streams = rcsi2_disable_streams,
 
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+
+	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {

-- 
2.43.0


