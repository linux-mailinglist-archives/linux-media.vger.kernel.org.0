Return-Path: <linux-media+bounces-61946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGtnBr/uCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:49:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA456AF89
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DDAFE301A274
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27373EF0D4;
	Mon, 18 May 2026 10:32:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEBD3E6DDB;
	Mon, 18 May 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100330; cv=none; b=A2Z6i53533aLQ8bdwPXLpw0xd98//c8n/G5jaRM5pjSiHi/7Ut3wrSd1iNPGuhyuHf5mU9xQn8ntxNyeRXD0BmfLAdHdqAh9w5tMOmvuB9oEpHabgWD8s5OjMMUSo1GNwsZRvXDnw6oodUpUSOqeojYbomo+BYnHmaGIfHSibMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100330; c=relaxed/simple;
	bh=y79apGl6OKDANYCmmE5+PZLLyf9iwNGUT3KnWbPd0gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stP4+1OUIEWDIcI3trNWsUXSVREEM8rjrEva9M1B7cQdJZ0bJAkFXB/0dJKsLspIfbzpEPt9SLez3GsP+TPT0BnPG7QzdjfJ3zSuhMuUYpcrsynUjl/SiCVFUL08Wlr5Mx2Fn7AwfDdWHXrnWi900LcDenvPgWTyaLAXSFd2Abc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id ED4611F8004A;
	Mon, 18 May 2026 10:31:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 708B1B40828; Mon, 18 May 2026 10:31:52 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 6F206B407FB;
	Mon, 18 May 2026 10:25:01 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 13/16] media: sun6i-isp: Add dummy params link_validate implementation
Date: Mon, 18 May 2026 12:24:48 +0200
Message-ID: <20260518102451.417971-14-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1DCA456AF89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61946-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sys-base.io:email,sys-base.io:mid]
X-Rspamd-Action: no action

There isn't anything configurable about the params video device link,
but the v4l2 core complains that no op is provided so implement a dummy
one to make it happy.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 77c2d06c0436..b7ef33fa2b13 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -450,6 +450,18 @@ static const struct v4l2_file_operations sun6i_isp_params_fops = {
 	.poll		= vb2_fop_poll,
 };
 
+/* Media Entity */
+
+static int sun6i_isp_params_link_validate(struct media_link *link)
+{
+	/* Nothing to validate here. */
+	return 0;
+}
+
+static const struct media_entity_operations sun6i_isp_params_entity_ops = {
+	.link_validate	= sun6i_isp_params_link_validate,
+};
+
 /* Params */
 
 int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
@@ -470,6 +482,10 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
 	INIT_LIST_HEAD(&state->queue);
 	spin_lock_init(&state->lock);
 
+	/* Media Entity */
+
+	video_dev->entity.ops = &sun6i_isp_params_entity_ops;
+
 	/* Media Pads */
 
 	pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
-- 
2.54.0


