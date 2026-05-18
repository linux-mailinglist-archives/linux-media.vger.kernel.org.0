Return-Path: <linux-media+bounces-61949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGZ8HdTtCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:45:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 006DB56AE85
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1C2130C6FF4
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9A33EFD00;
	Mon, 18 May 2026 10:33:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D143EEAFB;
	Mon, 18 May 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100410; cv=none; b=A0wB66ShHo4nb8gmDaIM5ioIvVG48JDKzbq4Tlq5oMPGSIYmtdmHQfaLPgO4HxeQsIDDzU9iPNEyAuKwY85ez60CqByrZWc2+o1Q3EjVuhAmG5iOh0t/pJ64wwYzWNFGrnpSxEr2fBewVQMYb3zEsq+QBnlZiAPHrkvTepLCF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100410; c=relaxed/simple;
	bh=SgJOt2lJqQBSvcUOjOlop7PuiMEzx9YAgYU411aMNBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmisROGWJkEAuPvOUfe7+nftDYlTEwpNTnjLqPAG7U9MTqaAUjZsP8DhpxDfAPyy7NC0Xq2Nvvwr//K4t6WqxX9RW0N0i5gdHo9xSmVUsIGR/rlB0HnIuoJATGU4uzo6NI3STObzxTj+0pcSNBD2XcFioob7wCKEBRopUwsZesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 228DF1F80044;
	Mon, 18 May 2026 10:33:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A4CBAB407FF; Mon, 18 May 2026 10:33:17 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 52A59B407FF;
	Mon, 18 May 2026 10:25:02 +0000 (UTC)
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
Subject: [PATCH 16/16] media: sun6i-isp: Add support for frame size enumeration
Date: Mon, 18 May 2026 12:24:51 +0200
Message-ID: <20260518102451.417971-17-paulk@sys-base.io>
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
X-Rspamd-Queue-Id: 006DB56AE85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61949-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sys-base.io:email,sys-base.io:mid]
X-Rspamd-Action: no action

This implements the enum_framesizes operation, which reports support for
even sizes.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index 372b9331bd6d..e638ec32c7cd 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -452,6 +452,26 @@ static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_isp_capture_enum_framesizes(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *frmsize)
+{
+	if (frmsize->index)
+		return -EINVAL;
+
+	if (!sun6i_isp_capture_format_find(frmsize->pixel_format))
+		return -EINVAL;
+
+	frmsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	frmsize->stepwise.min_width = SUN6I_ISP_CAPTURE_WIDTH_MIN;
+	frmsize->stepwise.max_width = SUN6I_ISP_CAPTURE_WIDTH_MAX;
+	frmsize->stepwise.min_height = SUN6I_ISP_CAPTURE_HEIGHT_MIN;
+	frmsize->stepwise.max_height = SUN6I_ISP_CAPTURE_HEIGHT_MAX;
+	frmsize->stepwise.step_width = 2;
+	frmsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -522,6 +542,8 @@ static const struct v4l2_ioctl_ops sun6i_isp_capture_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= sun6i_isp_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_isp_capture_try_fmt,
 
+	.vidioc_enum_framesizes		= sun6i_isp_capture_enum_framesizes,
+
 	.vidioc_enum_input		= sun6i_isp_capture_enum_input,
 	.vidioc_g_input			= sun6i_isp_capture_g_input,
 	.vidioc_s_input			= sun6i_isp_capture_s_input,
-- 
2.54.0


