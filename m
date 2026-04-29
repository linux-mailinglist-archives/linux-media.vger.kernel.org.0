Return-Path: <linux-media+bounces-60019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLv2Hcph8mk0qgEAu9opvQ
	(envelope-from <linux-media+bounces-60019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:53:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3CB499EAB
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D55D3016489
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6203B38C2C3;
	Wed, 29 Apr 2026 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web04.chillydomains.com header.i=@web04.chillydomains.com header.b="nGSlbyXY"
X-Original-To: linux-media@vger.kernel.org
Received: from web04.chillydomains.com (web04.chillydomains.com [193.19.92.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F6C3876C4
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 19:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.19.92.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492421; cv=none; b=A7cVOcAZ6+yd6ZRtGvoxOsUjm+fmNZiGhqnuPNwzbLVe5cnwFpNU2SVUn9u/kdIj2yuJnaBo8caSRtHMajUpiIzdTz2DupSBmvxpqTyIEp/JkNB1XRgAmY7Y/Cvc0En6WBjXJyCCHbX1R1Un1YouJdim0Jg+uQQ1g0GWowKHtwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492421; c=relaxed/simple;
	bh=REH/NUdhinkJIbM6VqOY0rkDja+Ujbzq0BugVyp78aM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoG1l2VVU/jI4na8r9towj8QHl78NO6a8LgaJM/H0RtgtAD3Bn9tD/cnnU/kLQDnsfS3Ii26dK3o2ZHaEVi+MOVjf4BO51LbYR3w92Edd/2IuMgfEeJyaN+w1z9+bWJD1fGBD5onbww3/nGVDKl0RfAJJKRFPnG5eYF19vcKadY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reauktion.de; spf=none smtp.mailfrom=reauktion.de; dkim=pass (2048-bit key) header.d=web04.chillydomains.com header.i=@web04.chillydomains.com header.b=nGSlbyXY; arc=none smtp.client-ip=193.19.92.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reauktion.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=reauktion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=web04.chillydomains.com; s=dkim; h=From:To:Cc:Subject:Date:
	Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=OaxA1KOQqFLnJwD8i8nhUbyHPWKOXYrj9Z
	YYoAP/kX0=; b=nGSlbyXYUKfQkPQwkan4V4FLTl1ALcyBc3+tUwIgRQWWxv/h2n
	pesTI414bf4N64kRjBeEU7tiq8EUc8Lt3K2VyQKx7gi/uE4xPiUZHDrY7kp9b/F4
	oHJit6O9XlrqQYW4MFIBZkv9UdCHcSUMc/OMHRIvBSZtRhCECuv3o9eU3XyLpG9V
	TmJpMAYX7743WkMFHRFlvFATt01iFwwFinKlU6eewGwo3VYsymZlNMdFiI2mRIYh
	3iMb+uUxr9SNY/mp3eHMABzA11kKqFvixLvby1WpBK3B2ddPiE27Vcc8VDeuGFsT
	ba9CvK9bEPNHt4W5Utk1BeuDJEL0QbRF4MgA==
Received: (qmail 2740071 invoked by uid 7799); 29 Apr 2026 21:53:35 +0200
Received: by simscan 1.4.0 ppid: 2740007, pid: 2740026, t: 0.6149s
         scanners: clamav: 0.103.9/m:62/d:27778
Received: from 31.29.52.71.dynamic-pppoe.dt.ipv4.wtnet.de (HELO localhost) (automation@reauktion.de@31.29.52.71) by web04.chillydomains.com with SMTP [64183]; 29 Apr 2026 21:53:35 +0200
From: Markus Fritsche <mfritsche@reauktion.de>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC 3/3] media: rockchip-rga: attach dma_resv release fence at buf_queue
Date: Wed, 29 Apr 2026 19:53:06 +0000
Message-ID: <20260429195306.239666-4-mfritsche@reauktion.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429195306.239666-1-mfritsche@reauktion.de>
References: <20260429195306.239666-1-mfritsche@reauktion.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE3CB499EAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[web04.chillydomains.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60019-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[reauktion.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfritsche@reauktion.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web04.chillydomains.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]

Opt the Rockchip RGA driver into the new vb2 release-fence helper.

Same shape as the hantro patch: rga_buf_queue enqueues the buffer
in the driver's m2m queue via v4l2_m2m_buf_queue and additionally
attaches a release fence to each plane's dmabuf->resv via
vb2_buffer_attach_release_fence(). vb2_buffer_done signals the
fence when RGA completes the M2M operation.

Userspace consumers of RGA-produced dmabufs (image-processing
pipelines, screen-rotation servers, gstreamer flows on Rockchip
boards) get spec-clean implicit-sync semantics, matching what
hantro now does in the same patch series.

Signed-off-by: Markus Fritsche <mfritsche@reauktion.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 70808049d..5557ca632 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -153,6 +153,16 @@ static void rga_buf_queue(struct vb2_buffer *vb)
 	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+
+	/*
+	 * Opt in to vb2's dma_resv release-fence path so userspace
+	 * consumers of RGA-produced dmabufs get a real producer fence
+	 * to wait on instead of the dma_buf core's stub fence. See
+	 * the leading patch in this series for rationale. Best-effort:
+	 * fence-allocation failure means we lose implicit-sync
+	 * precision but the m2m operation itself proceeds normally.
+	 */
+	(void)vb2_buffer_attach_release_fence(vb);
 }
 
 static void rga_buf_cleanup(struct vb2_buffer *vb)
-- 
2.47.3


