Return-Path: <linux-media+bounces-60023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBuzJWNj8mmBqgEAu9opvQ
	(envelope-from <linux-media+bounces-60023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:00:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB159499F09
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE64030164AD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262B7395DBF;
	Wed, 29 Apr 2026 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web04.chillydomains.com header.i=@web04.chillydomains.com header.b="lrxD/WNw"
X-Original-To: linux-media@vger.kernel.org
Received: from web04.chillydomains.com (web04.chillydomains.com [193.19.92.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA43921D8
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.19.92.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492813; cv=none; b=sLyhIKbYQccftDkhflnIpG0G5LmQr3GmaPHUu23YxPV1WeL+wXnNGtwtuCXc3ACgnqQrULtjL/pgz3yY1LX4uU37v83enDpHN1WEfLvn0AnGXeHJRR44dE6pQHVfZsP3TKIFVUtv/VCRam2gG3XHXcTgKQeyHbQ4Kcmzan7VFV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492813; c=relaxed/simple;
	bh=bpQhwmNJ5Qt5Sm/H8ouckcbUEO59Haf+aSyRcPSnAZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmR0vUk4jcMpa3rldDNmlDvjeEawciNKVvSmY45AbbPtQ58JYPhKnNFRViGi9fQ/CRLTWBcUpcQw3WVI9gjd6EhiZ1yO5tBW89m5I4J7knKqivDdFbd9GmpVR2qhC7WJL+KZ9wvhOfa/pwF70eEnM/spL6ofhCOAwBu5tuEI47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reauktion.de; spf=none smtp.mailfrom=reauktion.de; dkim=pass (2048-bit key) header.d=web04.chillydomains.com header.i=@web04.chillydomains.com header.b=lrxD/WNw; arc=none smtp.client-ip=193.19.92.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reauktion.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=reauktion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=web04.chillydomains.com; s=dkim; h=From:To:Cc:Subject:Date:
	Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=+BMPRzE2ZaYndt8PUP9j3vTLvi6F1/BIe/
	+XCjPPh4w=; b=lrxD/WNwHIEekuNqi8vyqW3sAshhJYlyBWCJnbqSeTMYEytjp+
	UyGR2ATf8nRI1fDgeTXCln6LGbfU4BNAUXh/sUDzdti6LlZajf/4fLrePDzBpnfR
	Zo7FfaU9+6/4cWOP1EtpX0Nzmz3AyYUTl73wrxubhby8h1gzOUF1xTtmF0vyGvLV
	CjZU8gbZvp74M1UX9jJuJSqdVC+xjGUQYsICFy+ocDlBL0TMO0Ua+6ZF5cHRPUD/
	DjvymalihIlfMzkrStbDUkw4uHkM/LTqfTPDlJT+m0gGPrUxqjE7F2chM01iLOPb
	OTNNJgyb9YhYocCpHiL/e7PC4y/B+Zw4YCyA==
Received: (qmail 2739579 invoked by uid 7799); 29 Apr 2026 21:53:28 +0200
Received: by simscan 1.4.0 ppid: 2739543, pid: 2739553, t: 0.6181s
         scanners: clamav: 0.103.9/m:62/d:27778
Received: from 31.29.52.71.dynamic-pppoe.dt.ipv4.wtnet.de (HELO localhost) (automation@reauktion.de@31.29.52.71) by web04.chillydomains.com with SMTP [61968]; 29 Apr 2026 21:53:28 +0200
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
Subject: [PATCH RFC 2/3] media: hantro: attach dma_resv release fence at buf_queue
Date: Wed, 29 Apr 2026 19:53:05 +0000
Message-ID: <20260429195306.239666-3-mfritsche@reauktion.de>
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
X-Rspamd-Queue-Id: CB159499F09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[web04.chillydomains.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60023-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[reauktion.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfritsche@reauktion.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web04.chillydomains.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]

Opt the hantro driver into the new vb2 release-fence helper.

When userspace QBUFs a buffer to hantro, the buffer is added to the
driver's m2m queue via v4l2_m2m_buf_queue. We additionally call
vb2_buffer_attach_release_fence() so each plane's dmabuf->resv
gets a real producer fence attached. The fence is signalled by
vb2_buffer_done when hantro completes the decode (via
v4l2_m2m_buf_done_and_job_finish in hantro_drv.c, which converges
on vb2_buffer_done).

Wayland compositors (and any other userspace) that import hantro
CAPTURE buffers and wait on the dmabuf's implicit-sync fence now
wait on a real fence representing the producer's actual completion,
not a stub. Validated end-to-end on PineTab2 (RK3566 / Mali-G52 /
mainline 6.19 with this series backported) playing 1080p30 H.264 in
chromium under stock KDE Plasma 6.6.4 Wayland: KWin's
Transaction::watchDmaBuf wait completes correctly the moment
hantro's IRQ fires, instead of falling back to a stub-resolved
poll.

Signed-off-by: Markus Fritsche <mfritsche@reauktion.de>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 62d3962c1..e95a3433a 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -877,6 +877,18 @@ static void hantro_buf_queue(struct vb2_buffer *vb)
 	}
 
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+
+	/*
+	 * Opt in to vb2's dma_resv release-fence path. Userspace
+	 * consumers that imported this buffer's dmabuf and wait on
+	 * its implicit-sync fence (poll(POLLIN) or
+	 * DMA_BUF_IOCTL_EXPORT_SYNC_FILE) get a real producer fence
+	 * representing this device's completion, instead of the stub
+	 * fence dma_buf_export_sync_file substitutes when dma_resv
+	 * is empty. Best-effort: a fence-allocation failure means we
+	 * lose implicit-sync precision, no functional regression.
+	 */
+	(void)vb2_buffer_attach_release_fence(vb);
 }
 
 static bool hantro_vq_is_coded(struct vb2_queue *q)
-- 
2.47.3


