Return-Path: <linux-media+bounces-61241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAfLMOr7AmpOzQEAu9opvQ
	(envelope-from <linux-media+bounces-61241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:07:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9651E462
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8002A309A1C1
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC55A39A047;
	Tue, 12 May 2026 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Okjo8wDp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397664BCADE
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580244; cv=none; b=sDWTc9ZSFVBUpL2dCee8nKlfiL8qBNXfjtAD2DiUfaPS1ADPDrPnHm8KIwQGcCxECSmMxdLuByjDoxeuaX6KqmVrGoijQmxAzyScuPoEX7cufSbd1XYLrKjuvdvs7V/4uBs/R7vG7OlZxARdFtNzNRwIKMq5539Iibwd8VRebeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580244; c=relaxed/simple;
	bh=WKrmxABRMAE4DhbaXi8a+LUQv14nHWHSekbhApTXvmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQjycITG8Jsxt2+8xK/GgQTqQSpU5bpSW5Ky+k6E53/x21JFLzr74t9Ffw+8ywALgkqoaQe4ZeOxiuYdaewaT1s+vaKLppMPBFEDBFRcCiaSFQjTwd6DiU0PWQmhTteE2ejctszSVrP2frlR3Eet2K+SsjP7y/LoP06+xrejQKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Okjo8wDp; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bcff2d08ca8so287474766b.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580240; x=1779185040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHje3x59v0HJxAwBRIB3HpZNZGjAYVtaQrA4sS+BMTc=;
        b=Okjo8wDpyRdHZDhRV5FI4qqi4BUScQxHU/SDr7R5P1G+iIWkCWKkaJ14aCIDz29aUM
         WkS5LaN/Frtnxll9ISxypMt5nitUlJgVel/HQOKwqzK0oMnn+g9gykr/zaGR4lpzdYLX
         /KKw8t4Xwl3r7AvZaXd6ix5HDhhyRmuI+/nVdWLZgj8wvak6Rg8AGx0nG2lRY5yQ0v5U
         hpHm6HSzwKDVbULKlz7zyha09sDBVH/dr761X7JS2IrGAx+uyLwFrJQmHjMQhV6C9eac
         54BfF7QQWiC2qya0iHRTVB/rm5C4+vBMgg0pV0DjtSDId24qAT2ed/esuQyKK5+UByPC
         0j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580240; x=1779185040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yHje3x59v0HJxAwBRIB3HpZNZGjAYVtaQrA4sS+BMTc=;
        b=McZx0j0Ifut6dYesXvgW0xaIjaExSyFJbXfYappMmWdcLn4BaA5EVRjTGOg3MEgjMs
         NxVesbYDCP9Vv8FKZ8k1+jnV0fpV4TSksUl11/7nO+K++MPKF3+TyTGvmt0M5WSukOx2
         HM7RsYNeqKudBdZDeHmoTtTVM3CP8p+w8rkAhqOXQIGyQr7VdCOI2fZiafIr8IAYpXfp
         OZA7t7vwN1ksIImtQZgjosUEBtZ3aWa7qGKn77hNRwrf0WgSSL9zWfgV7Xds85EE0jRd
         2RAWOWyTx9gk2KEk6ZOYFHci28KBIlJf+9Y5hWPGFPmLyZg5lHHxxOYG3fL3lzYfu4Qa
         54yA==
X-Gm-Message-State: AOJu0YxJqbxtYTq8PteidIsJwQXd4UCS7QZg4LXT5QXgYZV8EmsML0Ln
	Lam0Ty8iXsB4o1d+cbBXdiB6sGkQGl6EbiecGPHpkRYZ8sW8Z/EE60CEnfVbsg==
X-Gm-Gg: Acq92OFFGz0XXNPqjXr7jVkiEYQsLDmzYbY13DbLKuyKEZ8Sso7pPO5i4bG6fQ/G2oO
	k3Rly9KE06Ee2gkqaFEwuNF9dDjK4Dm/g+faiE3zxK/5y5rJ9v9r3DA3KeuLSyL9O5m4nybhzjJ
	yFq/Vbg7y6S9XHt1xz2OjsVyx0sevHWrsnqyRq4sgoHtgb8uWCmcEuZjfOJA86zx8pS8tIGZXbQ
	j0gllKwtMF+zsdk4ebuyx5OFgBTmgMsUdrbHmOREAJvh3jP1dp1bmZPdakrX9Jh61ZTNkSkaIou
	053nBjdJVwasp5NTdMeqdqUsPwruglVC+Zk0QFY+vKeP8ViFlfUM52FsK1nwYYZUdQBiwj2zWOx
	qC9fjy+oWdcfkh1qcfaSMHsN3CE6VqI03n3CY0b7Fq679IYiOT+QGeZUbjLaONywI5WgJqqtyvA
	9Hce0I9boJWpj/
X-Received: by 2002:a17:907:9611:b0:ba9:3122:49fd with SMTP id a640c23a62f3a-bc56ebf195dmr1769720766b.34.1778580240328;
        Tue, 12 May 2026 03:04:00 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm570531266b.53.2026.05.12.03.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:03:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Tue, 12 May 2026 13:03:41 +0300
Message-ID: <20260512100341.53769-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260512100341.53769-1-clamor95@gmail.com>
References: <20260512100341.53769-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7EF9651E462
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61241-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,bootlin.com,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..d84be14bb80e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1468,7 +1468,6 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 	struct tegra_vi *vi = chan->vi;
 	struct tegra_vi_graph_entity *ent;
 	struct fwnode_handle *ep = NULL;
-	struct v4l2_fwnode_link link;
 	struct media_entity *local = entity->entity;
 	struct media_entity *remote;
 	struct media_pad *local_pad;
@@ -1478,70 +1477,64 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 
 	dev_dbg(vi->dev, "creating links for entity %s\n", local->name);
 
-	while (1) {
-		ep = fwnode_graph_get_next_endpoint(entity->asd.match.fwnode,
-						    ep);
-		if (!ep)
-			break;
+	fwnode_graph_for_each_endpoint(entity->asd.match.fwnode, ep) {
+		struct fwnode_handle *remote_parent __free(fwnode_handle) = NULL;
+		struct fwnode_handle *sink_ep __free(fwnode_handle) = NULL;
+		int src_idx, sink_idx;
 
-		ret = v4l2_fwnode_parse_link(ep, &link);
-		if (ret < 0) {
-			dev_err(vi->dev, "failed to parse link for %pOF: %d\n",
-				to_of_node(ep), ret);
+		src_idx = media_entity_get_fwnode_pad(local, ep,
+						      MEDIA_PAD_FL_SOURCE);
+		if (src_idx < 0) {
+			dev_dbg(vi->dev, "no source pad found for %pfw\n", ep);
 			continue;
 		}
 
-		if (link.local_port >= local->num_pads) {
-			dev_err(vi->dev, "invalid port number %u on %pOF\n",
-				link.local_port, to_of_node(link.local_node));
-			v4l2_fwnode_put_link(&link);
-			ret = -EINVAL;
-			break;
+		remote_parent = fwnode_graph_get_remote_port_parent(ep);
+		if (!remote_parent) {
+			dev_dbg(vi->dev, "no remote parent found for %pfw\n",
+				remote_parent);
+			continue;
 		}
 
-		local_pad = &local->pads[link.local_port];
+		local_pad = &local->pads[src_idx];
 		/* Remote node is vi node. So use channel video entity and pad
 		 * as remote/sink.
 		 */
-		if (link.remote_node == of_fwnode_handle(vi->dev->of_node)) {
+		if (remote_parent == of_fwnode_handle(vi->dev->of_node)) {
 			remote = &chan->video.entity;
 			remote_pad = &chan->pad;
 			goto create_link;
 		}
 
-		/*
-		 * Skip sink ports, they will be processed from the other end
-		 * of the link.
-		 */
-		if (local_pad->flags & MEDIA_PAD_FL_SINK) {
-			dev_dbg(vi->dev, "skipping sink port %pOF:%u\n",
-				to_of_node(link.local_node), link.local_port);
-			v4l2_fwnode_put_link(&link);
-			continue;
-		}
-
 		/* find the remote entity from notifier list */
 		ent = tegra_vi_graph_find_entity(&chan->notifier.done_list,
-						 link.remote_node);
+						 remote_parent);
 		if (!ent) {
-			dev_err(vi->dev, "no entity found for %pOF\n",
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
+			fwnode_handle_put(ep);
+			dev_err(vi->dev, "no entity found for %pfw\n",
+				remote_parent);
 			ret = -ENODEV;
 			break;
 		}
 
 		remote = ent->entity;
-		if (link.remote_port >= remote->num_pads) {
-			dev_err(vi->dev, "invalid port number %u on %pOF\n",
-				link.remote_port,
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
-			ret = -EINVAL;
-			break;
+
+		sink_ep = fwnode_graph_get_remote_endpoint(ep);
+		if (!sink_ep) {
+			dev_dbg(vi->dev, "no sink ep found for %pfw\n",
+				sink_ep);
+			continue;
+		}
+
+		sink_idx = media_entity_get_fwnode_pad(remote, sink_ep,
+						       MEDIA_PAD_FL_SINK);
+		if (sink_idx < 0) {
+			dev_dbg(vi->dev, "no sink pad found for %pfw\n",
+				sink_ep);
+			continue;
 		}
 
-		remote_pad = &remote->pads[link.remote_port];
+		remote_pad = &remote->pads[sink_idx];
 
 create_link:
 		dev_dbg(vi->dev, "creating %s:%u -> %s:%u link\n",
@@ -1551,8 +1544,8 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 		ret = media_create_pad_link(local, local_pad->index,
 					    remote, remote_pad->index,
 					    link_flags);
-		v4l2_fwnode_put_link(&link);
 		if (ret < 0) {
+			fwnode_handle_put(ep);
 			dev_err(vi->dev,
 				"failed to create %s:%u -> %s:%u link: %d\n",
 				local->name, local_pad->index,
@@ -1561,7 +1554,6 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 		}
 	}
 
-	fwnode_handle_put(ep);
 	return ret;
 }
 
-- 
2.51.0


