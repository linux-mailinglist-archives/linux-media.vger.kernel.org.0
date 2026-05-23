Return-Path: <linux-media+bounces-62669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDAmFNpNEWqnjgYAu9opvQ
	(envelope-from <linux-media+bounces-62669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 08:48:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C0F5BD747
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 08:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D1CB301D335
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 06:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F0D3385A1;
	Sat, 23 May 2026 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKLxM6w7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4D224AFA
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779518905; cv=none; b=grQMTgARjcyX7OtPMCOpPVCMbySwFsywpEKyIbwbVtfVBQx1Q/ywnJO9xO8YrVYaPirseLTUwnUK8PRkWrtxi5MON0LVgROe0WIdrSwIvy5BCXGEtTqXO18oeyZJuO+6DQ1tLucZ5+io6FR34eZpf0Gq9/QxwqbK5m3e1Cs1JAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779518905; c=relaxed/simple;
	bh=ruHWhs/NAmjUK/E6UKPL9THibS9Ul5SiTJSCwblcQ2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/SU672HawsEcGZR/pCOef2Zx9Bt9TvtO3BDKpWJV40FC92GTdwKV1tthgc55pkf4/GPgX/FkinBtv6QzBDvIYTgr0kd8NlWBOaf1KFYNseIds9G/bzfcKtJgE85PpfWsqqEf6GkKIoDN6OEWabZ3r9lBOZa6ZhF6kH61J+f5gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKLxM6w7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-687d82dd690so1235367a12.2
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 23:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779518902; x=1780123702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQNJLijS1LXC3DyCF2fRyHh6+k3ll0IPAv+Qb62GcJI=;
        b=BKLxM6w7XhZTtxUt7w2IQgp+Hv9g6ksT1AiYqS+RCy9152kW8O7T3uKEGxegTDG2TV
         uUF7uqBn6ej4FJ6lnSQSC8oXpzD1YAlyELnNUDbaGndHHGwCgS7Ykn36xmR2ofoWeX+P
         77xuMn2t3qvPDJJHYsGpgWG2Kt2DsNOqTKwFMqiJOz5KFqg76Me16kKRqr3jypiiger3
         gO7StR2V0ivgmyJ7/RbH/0T1sMubnh3vayp3nsqEwNPWNAFqrNknDY9cDdaqTviElCrq
         FJkJfjJ25v8RW0J0F+TW1HzCeyjqvCNVhE3yX82GjmwpBmkdmEfhmHc+dY5ZMN3ADKZ6
         jGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779518902; x=1780123702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQNJLijS1LXC3DyCF2fRyHh6+k3ll0IPAv+Qb62GcJI=;
        b=AEpBXjb+Aj5Ytwb/pBRoX7YM9DwjigfwXrizajdMYx3z6gbWIG3M1CX+4OMQWtFDxr
         UjWNGHJ4WI4seQpLL4ByYE3nGtgBp1PBbmzsDTySJLDoQV7UTpcS2Cz80T2nUbZ4foE8
         I60mDglU9Ade91Orw+zDWgIlF6NtZfsQa0AreS+M+VLvKZ4qzOtpWfQI0Hap7y4CcLQb
         Z1fxZD9zk28PbJg7GiS1FhL386rer4orU6P2XFcISAg7tzxuWZPWDLYm+AavpKf+1Awc
         Q1Nm38J6GItTl2sU2dOhBdZ+Ashtkz0USYmYJE8YqKpKFT+aoK9y8Gzc8zDAsCNCi7bV
         y91g==
X-Gm-Message-State: AOJu0Yzc01GTO6NSqFG8WjUpMma6ft3x9Z3KDark5LcZin6yl3imdUKd
	6bhZeRgwJABnU5pa/bfFSG2O0FJPg8cFGX0S6VeWGyAiufuCJKpFt6O5
X-Gm-Gg: Acq92OFhYQGrmWnK1Gl1uafP+375t79RrkrvbEBEfcLURNF2bJqKKE2RTszGeVKTXt6
	cWKLCeBLuhqXJa8g2IPQN1k4K9qEyfVnEWQC39qExNL3Yv+JUy3i9goEV0ORtSH274E7qYa3ixg
	K/6L1TmHF98UMAy4xBmEcxl+pH+ZJvgUMmWHjzzsfEqf4jHaU7WDr/qv/020aWdL1SEq/dMcd6s
	aCF7lwPl9rbZvIwcja0UrZTMPpebua60gL9U6GcQntq5sKBW/0wUtPz1HBfopC1twHILLgyVDGD
	oO4fbX0oDPv/9Dp/OnPxEHC+i1EAg31VS4ukm39+FNdQoA99ps0cYvbNyDbQbyW2m2zF/YKBQ6F
	YjqttjUFpLioEndWl7md8J26AJHjkjBRlhP17G2WKpAKJWaSdkNPRka5FAJ+IKys4OLPDYHmvIj
	qvhXq5ZwAbaRxJ
X-Received: by 2002:a05:6402:3896:b0:680:1e7:cfa4 with SMTP id 4fb4d7f45d1cf-6889cc78d76mr3740625a12.24.1779518902334;
        Fri, 22 May 2026 23:48:22 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1532272a12.30.2026.05.22.23.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 23:48:20 -0700 (PDT)
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
Subject: [PATCH v2 1/1] staging: media: tegra-video: vi: Improve media graph building logic
Date: Sat, 23 May 2026 09:47:50 +0300
Message-ID: <20260523064750.35553-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523064750.35553-1-clamor95@gmail.com>
References: <20260523064750.35553-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62669-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 04C0F5BD747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index f14cdc7b5211..24e4bd438678 100644
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
+				ep);
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
+				ep);
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


