Return-Path: <linux-media+bounces-61854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gELVDVH4CWrivgQAu9opvQ
	(envelope-from <linux-media+bounces-61854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:18:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A1562741
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 19:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BEBC300C982
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 17:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC38634CFCA;
	Sun, 17 May 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="unGaLiBa"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A933261F
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038281; cv=none; b=Zi8pKhNhwQINuUgnlutTTqBIRL0G1C+B5v2jM10CCMqSppZdcnp1N/ZgjLVuapotnfZOA0zo7mqbxtp5MYe+y7hOMpa/cJMbzNGatKvgtqQ0jwLZLKPw69YOJSl+SaUNVGl4ZL2g2U5TQgI8EIITMPm8gECaZxVEKMN1vukXkiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038281; c=relaxed/simple;
	bh=Pbcjmu2neKpIq11ZvX2Vs0VZuTzrW7nh1KKeegZow3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DYa1iyQ9X1Kt80Ynz7i03I9YcCAT+bYlqD6KlRsXtiKmFM+N7K0+mJZpcM868SVj+/0NE8cGm6G+wSyds7gnoJMzoev0qIiPrzw2oL5ysptMbQzDG9JEaEuH5H5X8c1MAtndkY5lamtwBJWDVEDgv1FhXA9B/y4PzyTCrmBs9/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=unGaLiBa; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779038278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMrIRzmDFzvbvvNy8Qjd2QGwDALwWuRi1tolJDbELPA=;
	b=unGaLiBa/gE+JfzUjnx2o//hKQQtglsdj2wbBP58QwFcvDXkN5lW3/g0eLPv7fK2VfbaUg
	Gd5zStT+EaZbWfhgnpVXs6/UqeRCKH9KM6qACXEdfAk3a3mYtvNZONw+P8KHfd/Cz7iAzh
	/l9cQPz0cYeXMksJnIIcjJiGI+1rMCw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: ivtv: use clamp in ivtv_try_fmt_vid_{out,cap}
Date: Sun, 17 May 2026 19:17:43 +0200
Message-ID: <20260517171743.2698-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776; i=thorsten.blum@linux.dev; h=from:subject; bh=Pbcjmu2neKpIq11ZvX2Vs0VZuTzrW7nh1KKeegZow3A=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmcP8x7qqynes1dPu3fsusfA9oKvx/vUOh43btc6Fl9t UNAwIplHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRS9kM/x038ayYuSDPeVb8 20ntDxWFHXids74etzz5bjFHEN9OoQJGhj4+zuagboGX1b9unp9Qr6bouUuh8JnpUXeT857dVxN 38QEA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 989A1562741
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61854-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

Replace multiple min(), max() calls with clamp().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/media/pci/ivtv/ivtv-ioctl.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 8d5ea3aec06f..fc95f0bf48d5 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -467,15 +467,13 @@ static int ivtv_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format
 	int h = fmt->fmt.pix.height;
 	int min_h = 2;
 
-	w = min(w, 720);
-	w = max(w, 2);
+	w = clamp(w, 2, 720);
 	if (id->type == IVTV_ENC_STREAM_TYPE_YUV) {
 		/* YUV height must be a multiple of 32 */
 		h &= ~0x1f;
 		min_h = 32;
 	}
-	h = min(h, itv->is_50hz ? 576 : 480);
-	h = max(h, min_h);
+	h = clamp(h, min_h, itv->is_50hz ? 576 : 480);
 	ivtv_g_fmt_vid_cap(file, fh, fmt);
 	fmt->fmt.pix.width = w;
 	fmt->fmt.pix.height = h;
@@ -516,8 +514,7 @@ static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format
 	int field = fmt->fmt.pix.field;
 	int ret = ivtv_g_fmt_vid_out(file, fh, fmt);
 
-	w = min(w, 720);
-	w = max(w, 2);
+	w = clamp(w, 2, 720);
 	/* Why can the height be 576 even when the output is NTSC?
 
 	   Internally the buffers of the PVR350 are always set to 720x576. The
@@ -533,8 +530,7 @@ static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format
 	   resolution is locked to the broadcast standard and not scaled.
 
 	   Thanks to Ian Armstrong for this explanation. */
-	h = min(h, 576);
-	h = max(h, 2);
+	h = clamp(h, 2, 576);
 	if (id->type == IVTV_DEC_STREAM_TYPE_YUV)
 		fmt->fmt.pix.field = field;
 	fmt->fmt.pix.width = w;

