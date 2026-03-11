Return-Path: <linux-media+bounces-55404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N90B510sWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E0A264E95
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55F7E300BC88
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D055367F2A;
	Wed, 11 Mar 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h5rdd3cz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A746317161;
	Wed, 11 Mar 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237259; cv=none; b=qj6GYcfOO5BzFDb4dBqeDmWGM2k3AbtgHmUbzBfTgcOnkzh2YppnKsrb3nPz/30IBV3X4Pbd4CoG5H9/do3WfrZN+hmw5dqXqoSaaC9S1FW3JscCPiGqzntlEzPT1IF4f+70h5XnEBlMi+EZ8KBnWtOopBGcFmSGVmxKm2h5z9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237259; c=relaxed/simple;
	bh=dhK3uD+Ut+8LJFD1lnLJkekf7X3cpMpIVzZnITUPmuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYK2VIrfDE2XeNSOECCUEGCDOFwDFGqSnAAxgzC69AxlBbxbGcSXiGfEDBfftm3BLE9muAoEngsOMgGJBSi/IjAQlp4cmWGPlBFf460wyNDOERY3Ql+dn0JZa64qFtEWjxM8tJEZoAnINhr2H1z30Cv47yWmbbEqH+5ajxNGUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h5rdd3cz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 169C2128C;
	Wed, 11 Mar 2026 14:52:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237166;
	bh=dhK3uD+Ut+8LJFD1lnLJkekf7X3cpMpIVzZnITUPmuc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h5rdd3czSzfAfHUs9WOj2UlsmnTWcy+tYdPad1DczEplw4etBF2YKJgHGD8eZU7I8
	 aQ/Wpl0uMbCob+8qxS0LTvJVtspavhXzn+iQdkVj42mpbLE6FpEF33I1Ui0MhSgqZe
	 5Z2K2DoboGeTHsGKiQILvyFnwbFJAATd7VnGpBFA=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:19 +0200
Subject: [PATCH v5 06/10] media: rcar-csi2: Add .get_frame_desc op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-6-3e6c957d7567@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=dhK3uD+Ut+8LJFD1lnLJkekf7X3cpMpIVzZnITUPmuc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPrrTOLAUGOxedoQEbgj9MOVQz3DaNVjdbyb
 T/a2JxfMx2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6wAKCRD6PaqMvJYe
 9frlEACcac8tUvrb4XW8UiiGPMsl4izz2BWsNP5i9RtUuhj3WEtGR18CX0Zcdt7fylxd7MpCl6R
 mKWuulRapCJbaO1Ds4KRwjmlDM/VLU0T8Dlhhv9m2DuQ6h2jWuZOLBaBaWXbCBQm/IGG3JOcchP
 jM7+CW10ARm4aUnETmmubVh33qDirAblK48BpHTs2kmKjIUmLr/gjzXytDeGY0EKR37XqNwQf8a
 jsW5bs4ztNumd2BVWwnnk+npneVcJNlv98daq6ZqR47rwvyjYH4Z+lhYvfXCjnYMD2ZwkSMDoor
 0vulKRiF+B67HqY+ibI60qobbjxhhyNvCtmkpnnCqXVk5vuJvzvPeG0aiXYXCxyKKXhbqR1HtWr
 IYZJUc6NJlcl4EP0Rj74kDzSEVvD+vPy+75eQkr+cg4ujW3pm7TwlnFARzbr3keyFn7jgpTWioS
 w6dcb1js/AuHfI8ZWmpszrttWv1BjNtOqINLqwDJpLzuOtWcfKkhN5qpVI2NXh4QAnQYvvHZO/y
 wE8DpYgbxSu3wZWt/z9QYuqs/FmI4N8mkIZEADuUDt9ROfmjITffvbhlPPN+EaXAtveZhos86C5
 4h1M//mzZT4+ztH72sGfCT2zlY9gRs2h7ggWlgb4MvTH1aIb4NQ6kGz7/uy/reFmQ+WjF1/JnGW
 Nkalc5qBHYvMclg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 35E0A264E95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55404-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

Add v4l2_subdev_pad_ops.get_frame_desc() implementation.

We also implement a fallback for the case where the upstream subdevice
does not implement .get_frame_desc. It assumes a single stream with VC =
0 and DT based on the configured stream mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index ad62c95c8f9a..b8baf7c65e90 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1935,12 +1935,82 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
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


