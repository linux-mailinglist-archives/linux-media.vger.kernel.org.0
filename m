Return-Path: <linux-media+bounces-51163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCw3OAEKcGlyUwAAu9opvQ
	(envelope-from <linux-media+bounces-51163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:04:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8849D4D777
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A03C62F583
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 22:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E5C4508F8;
	Tue, 20 Jan 2026 22:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="beJbGOJe"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53E3E8C64;
	Tue, 20 Jan 2026 22:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947676; cv=none; b=PfDG84XhNE44FZNu7UxUVD+ctbiPSxf0sEwUqgtHPAGRvbQWQefKw2SSpGAEK0O2sueTAKEPI/r3M5ageApt+Ol+0I8dGIBsvpStXdH3/67yqBozpwnQ/xvL/eWiqKCfIouj/UUPdyTEXNHWJs6DLVomTKVIu5+VVRzqx5QhwHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947676; c=relaxed/simple;
	bh=EXChkKtMpNp0GDUfPdW+xanq4enywieNEBvIqMjgxK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpMNVvJq8CVRpdx+GwQjWue44oAFH2u2PwaC0q7Y+AOqtYYSCK8RtEnuCcrCvWAgnwqU2uH99dfuUlDZTxh8CTpCRU2dXLbm0cyGteMzuYwP6LQOdyd8w3k44JKBzhVgygqCrmG0O7/SLwlD6lVgnjfVHgH7KqLZuPVbBAh2Zcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=beJbGOJe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768947664;
	bh=EXChkKtMpNp0GDUfPdW+xanq4enywieNEBvIqMjgxK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=beJbGOJe2sORzTGOM0qJB/ES/8lJ4Z23QUfpGidstvZr/Db5zBiEwCwK/1zO6qhKt
	 QoGzYFElavAFKBt1IeTLs8tUaJ35NWWegR2zl2KoEFtBp5EH7OPXzrvMWetUBrOFJU
	 q1cilgNQjvxiSg0KF/CfPprnWGP9lxnkOWM8g5kb+5tSKMfIRAenWUxfh2SqT1qWw9
	 koicm1DJoZtwDjBBFXzgOB13rOZHPoro4NGWYCMr2IXSDobr5D7R9q328unX7byrib
	 7r02vCYUjs/MMvPdSXapXAYA0hkQurv5751dbN0zv+HKpVaZJS0geuSdt9VUJh8zaU
	 Q9MDEt3duIhDw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6DDE517E0CF3;
	Tue, 20 Jan 2026 23:21:01 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v9 11/17] media: rkvdec: Support per-variant interrupt handler
Date: Tue, 20 Jan 2026 17:20:11 -0500
Message-ID: <20260120222018.404741-12-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120222018.404741-1-detlev.casanova@collabora.com>
References: <20260120222018.404741-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51163-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,vanguardiasur.com.ar,sntech.de,lwn.net,chromium.org,google.com,ideasonboard.com,gmail.com,linux.intel.com,blaize.com,vger.kernel.org,lists.infradead.org,kwiboo.se,cknow.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,collabora.com:email,collabora.com:dkim,collabora.com:mid,cknow.org:email]
X-Rspamd-Queue-Id: 8849D4D777
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prepare for supporting different variants with different interrupt
managers.

To support other variants specific function type later, introduce the
rkvdec_variant_ops struct.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 21 ++++++++++++++++---
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  5 +++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index ff6a09e45462e..174536ebdcc7c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1222,10 +1222,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 	}
 }
 
-static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = priv;
-	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -1246,6 +1245,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+{
+	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	const struct rkvdec_variant *variant = rkvdec->variant;
+
+	return variant->ops->irq_handler(ctx);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1261,16 +1269,22 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant_ops rk3399_variant_ops = {
+	.irq_handler = rk3399_irq_handler,
+};
+
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
 	.coded_fmts = rk3288_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rk3288_coded_fmts),
+	.ops = &rk3399_variant_ops,
 };
 
 static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
 	.coded_fmts = rkvdec_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
+	.ops = &rk3399_variant_ops,
 	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
 };
 
@@ -1278,6 +1292,7 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
 	.coded_fmts = rkvdec_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
+	.ops = &rk3399_variant_ops,
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 751f39afe7e2d..faabedd2b9d88 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -67,12 +67,17 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 			    base.vb.vb2_buf);
 }
 
+struct rkvdec_variant_ops {
+	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
+};
+
 struct rkvdec_variant {
 	unsigned int num_regs;
 	const struct rkvdec_coded_fmt_desc *coded_fmts;
 	size_t num_coded_fmts;
 	const struct rcb_size_info *rcb_sizes;
 	size_t num_rcb_sizes;
+	const struct rkvdec_variant_ops *ops;
 	unsigned int quirks;
 };
 
-- 
2.52.0


