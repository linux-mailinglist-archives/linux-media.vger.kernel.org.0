Return-Path: <linux-media+bounces-59900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MTWEtZM8Wk0fwEAu9opvQ
	(envelope-from <linux-media+bounces-59900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 02:12:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F330E48DB70
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 02:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED88B302A18B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 00:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7113D2032D;
	Wed, 29 Apr 2026 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q29rZBBo"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C740DFBF
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777421514; cv=none; b=JyHhFmFY1OsnaIcDx0Qc4pFGnaCeg53oh3IbD00aYL/8MFb+YLKn70RAzVBTEKWlG81OqEhQAopFd0aVaGrF70eOp91T9T834G7DLD9F+qO2GaQbMTATahOuw0Cp+AZ86M2Fq1sx3eDa1yRC03y5RY8y60dwFBtW91eQqp5R3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777421514; c=relaxed/simple;
	bh=Pbcjmu2neKpIq11ZvX2Vs0VZuTzrW7nh1KKeegZow3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uj44fAaXtL38WjrabW6TSnS09fZQ/IR1Uc2gA3D9PDO/7dVYdVYFFuNzl0tg1U6i89fMZAPpssGVf93qcmPalLT4xfKPgKqFn+/pHw7yC9DbH62hH/N5u2cXtZRK314jzK5Ovy3Eg+MOpFLibNG2/uzkftyJX1g5Q/CftksAc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q29rZBBo; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777421511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMrIRzmDFzvbvvNy8Qjd2QGwDALwWuRi1tolJDbELPA=;
	b=Q29rZBBoFRMxrx5ShZZ9KQ68YwtTFN6+uVFE9Gb0XzMYmBSjSEpWvdOZDfEt1A70hdDVK6
	1Di1/XhE3hZs+K3XPJ2bLMDRUbbhd7oxqFTmqQ/+9c4/Z+wnPfaUAd8RYHPEfdSh5sLvLY
	Qk79cpeqAtvK0VtKmFtwd7taSot9z1I=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ivtv: use clamp in ivtv_try_fmt_vid_{out,cap}
Date: Wed, 29 Apr 2026 02:11:21 +0200
Message-ID: <20260429001120.1639-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776; i=thorsten.blum@linux.dev; h=from:subject; bh=Pbcjmu2neKpIq11ZvX2Vs0VZuTzrW7nh1KKeegZow3A=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJkffVb0VFlP9Zq7fNq/Zdc/BrQVfj/eodDxune50LP6a oeAgBXLOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiFUEM/z0rq7aElh7Jfr5g r0T6+Zffl7zO/5958s77iznFxcxx21cxMnxPWOvz3TH5Kf+O+2ckhXt/vGe9Jrl78iX2ldXLdjL +/MUBAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: F330E48DB70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59900-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:email,linux.dev:dkim,linux.dev:mid]

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

