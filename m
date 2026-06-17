Return-Path: <linux-media+bounces-65116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O8nrEESNMmrk1wUAu9opvQ
	(envelope-from <linux-media+bounces-65116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:04:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26155699769
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:04:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=atFqgjOg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65116-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65116-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42C103083AB7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6870404BC4;
	Wed, 17 Jun 2026 11:56:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B663FF883;
	Wed, 17 Jun 2026 11:56:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697381; cv=none; b=PoLUsDiVkU6YcczSu4S8uZVrUXRyl0h5Rcb2xhpaB9CuwFErQz17q5NFTOsOjYP2vcLS0UaVtUAXuK4rpnEu7JYfI0yKQ0X3VU6A7020mh/XVRCTQBe+IUxieeW/rddcpASAIRPACbDlFW/vQMwPIee47Uf5vnP8shuxzIrUycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697381; c=relaxed/simple;
	bh=A33cXROl2PmqCjHKhGe6Ldp6ByCHXa6W1XIzFF8djBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qK17LbmgFeowqa4Nm3YwPGc0+tflodnQ19f3OVKacBOdx2v3ZgAtM5RBnUdQeAcmi7aVljImTZZIpJpAoUq9VxlurgF40rDZ1EAU2i/CtNVX+nCnS/5v5WWSb77fbZcKfie69X47zX9Ipsm/22kpEMe9ET6sx++CmcndsWmannk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=atFqgjOg; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6A2625A0;
	Wed, 17 Jun 2026 13:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697326;
	bh=A33cXROl2PmqCjHKhGe6Ldp6ByCHXa6W1XIzFF8djBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=atFqgjOg1cPb12n0ZWi6+mb8LsmnJ5QW/25BR415kE1lgKoLpDapsdt7UvywoCzRV
	 NZYLLLJBLZ707arxph6OLo9zkRK0Mpbke68ps4iN3hgZ+dOo3xsSaO6Wm+QV7TMxdu
	 TssN3cmEcj6oGwVjAiySdNuoHDIS608DnUd+5ykE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:55:04 +0300
Subject: [PATCH v6 11/11] media: rcar-isp: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-11-1260eb72dff7@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3025;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=A33cXROl2PmqCjHKhGe6Ldp6ByCHXa6W1XIzFF8djBk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotGwPgTi1MX2Gaol+CHZoi+EUrEdZQCIJluF
 40JH0UPBKqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRgAKCRD6PaqMvJYe
 9ZCRD/91kPP0ugwUUU7bMY7myhBxZXJZhbW2Ci5udzjaNnX8TT8jYSn7wPt4ks+IVVvvymCfZAu
 6zm6T4U6LLJ1qGyLSKl4jo7+ZBCi+xdRf8JUvQd/a3h31MrsfXvHPISpmUlIKwVJQxP0/hO+Uzj
 R/QYfefjfbt8ZKojzYlomOEX7XDC0/NZyvyBHbTwk0bKuCCs9vcf166dwPSRRjX9ST58faH0NMO
 DixyanCm3f/AUMSlxRlSQJcNe6SLqsq7GWhJUN6XN+SyNWCb3A7XsJPiq2Ujo2UZepGvJDa0WWP
 wgwr1ygwJBHhyb9QZa4y9iJhSOUXSEK3gRuXLpeoKX4fWGXKH9W0JvMvieAEirZWrNA8cHv1dQj
 zoDkMXe3xfCHCVw0WoVc00/2mkTEByQ2eXMw3pchSCEu7eTannFWTu/gqbQJUwP0pPjB3PnuOPD
 ANCR2sv6OlpWtwhR5JL9RmFtH/NyAti3TD4BgdtjcpmmcTtyKlOGhvQ91w+O7R8tlsfwni3Iuuv
 V47uK/aDdWLo2KZRqhv+kz7SYJz08c8QwAW340Te+583+DbicW22zeTTzvldNCFWPC+3ptDk3bK
 gLImOrfWFUXNWEQRqG0zE/Bye1yij2uJyg3s+oWzoiPtGByQFrJuHVacCepIdRRfEhE0ZMr2Gpu
 dDV+oSaLDrlg7rw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-65116-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26155699769

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 39 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 42ee6c19801a..2e1bc8fbd432 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -340,6 +340,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -354,8 +355,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
 		if (isp->stream_count == 0)
 			risp_stop(isp);
@@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -380,8 +387,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
-	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
-					  BIT_ULL(0));
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
+	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
 	if (ret)
 		return ret;
 
@@ -423,12 +434,34 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int risp_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &risp_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops risp_pad_ops = {
 	.enable_streams = risp_enable_streams,
 	.disable_streams = risp_disable_streams,
 	.set_fmt = risp_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
+	.set_routing = risp_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {

-- 
2.43.0


