Return-Path: <linux-media+bounces-52493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI4xJtTqimlEOwAAu9opvQ
	(envelope-from <linux-media+bounces-52493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E9118361
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 806DB303320D
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 08:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BE433D4E3;
	Tue, 10 Feb 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WcVJYc7r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E972DAFD5
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711761; cv=none; b=YmU01EEqoYQN3XO6NC00+XbosZR53x6RIISm+cwuW5JNnRJs8gsldB+wRBxi5lsLAQuFfCa10e3q52b+JFse/LIIOlXwbR5kj6o5V5OQgDClfFSWUZQ9uhBQ4qsXJW9Ox0XJ3Q+pE6d+lLp43WLcwlcMEyOL3EtfCLV29Rql6H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711761; c=relaxed/simple;
	bh=C2D8ZrofyoQF+2NV+5i1Wn9PVdCVY7W973Seq32HEiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHb4Zdxj1rpILGuNPJfAeJ53SzrYtWFerW8D5GDBnwZsY3SzOsGtIGpcsXevyzS775md0V9GtU7NWwLq+Nx1enVSYfSHb+ww7FC40kojHQdLeixlcuEhNEUw5r066R4yzxrens9KeDju1id2VCJzRHudK6ks05TIfBkoV00z/FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WcVJYc7r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:2edd:807a:f3c0:8d1b:28a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12FD8E47;
	Tue, 10 Feb 2026 09:21:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770711712;
	bh=C2D8ZrofyoQF+2NV+5i1Wn9PVdCVY7W973Seq32HEiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WcVJYc7rNdAQrQEaBChQTChjOicFoVaP/eQylM200v7CMpHGH66xJ7s8DHu7RcaSk
	 f1coYFB8IQMoOBaEMrUD4xRREkPVdAgtyef5Sp+9soQbMvkG/TAImHYH/2IXUEbdP0
	 t80uqo737F0FwYJCWh5JDZwEk34aBU1Jc9mnzsB0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 10 Feb 2026 13:51:22 +0530
Subject: [PATCH v2 5/8] media: videobuf2: Allow exporting of a struct
 dmabuf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-b4-vchiq-isp-v2-5-4403944152fe@ideasonboard.com>
References: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
In-Reply-To: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3305;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=j7qzDqakzZei+9a6emX3yapjgMO8lsfF6tpVIix0pJs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpiuqqty7vOMNSWWU0hMlWbcokbYjtthbhP5eqD
 6QJnLfamrWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaYrqqgAKCRBD3pH5JJpx
 RUybD/sEouoXGOYP67F+Q3xFb8G0qTUZG1Wlg69FOnFusERl9KuKmdl7hKawLaWJa9nR4ibJwVT
 Jao+oBZqgSZL6td17XibXdqdjLPNfYlsAWupKP1hqCXuWZlhiOOShdxQ+rfZROgdKYuxVKNBNJN
 2NtPi+9t10McZs/QwQyncgWw5BJnh7S9NnnqLX/BuiIPNvqII6sDhaTTjb5PAkdkVZ8Nktez/Xl
 jOyWe7w8l+4cJVZOF4SIXZNU1brOyvGvRd0kleOGtcm5mTHOjkRaINR8NJ/tK5H5AIKiCn3bi0k
 eFlnKzoxkOsijmTF+W563b2HvFOkg6ZD2EV3stLng9J8E1kFvleVTon6LalD9zSPWSbc7ZoL7Vp
 EWfsmP3xqjiO6C/lomgeTfQhBtdU/Oseb9zzZw1zdIKSK5MnrT8UfdOmWmUbtAPnGqO0fPwnA8k
 xy2euhAXnk/naIgw5oMWvx9bpyWbW1zpshnWeeVx2EnxsXIDwFju0jq+IjO0E85xVd7rPbzA+s0
 ZU2yw1BMsOoraPgLAJIElR6pkJeuNrWiPX9Dh6zCz2GxxaG8WiLKWFLzRq2Gr5gWh5q6gNP8Xua
 dmhaMnpYFqcSCK82oMrcXB2qFjo98VGaqkOLGF6ldwScES7EAKiHSEtn4ziC+sUBaY+lvaJ4el4
 pWtQmjCYgPNvclQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52493-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,gmx.net,vger.kernel.org,raspberrypi.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,raspberrypi.org:email]
X-Rspamd-Queue-Id: E69E9118361
X-Rspamd-Action: no action

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

videobuf2 only allowed exporting a dmabuf as a file descriptor,
but there are instances where having the struct dma_buf is
useful within the kernel.

Split the current implementation into two, one step which
exports a struct dma_buf, and the second which converts that
into an fd.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 21 ++++++++++++++++++---
 include/media/videobuf2-core.h                  | 15 +++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2df566f409b65eb99fa7fbe308b8e3afe1bdcbca..f316864d99fc5c5abb2e5a27779cbc371c1a211d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2431,11 +2431,11 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	return 0;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   struct vb2_buffer *vb, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf)
 {
 	struct vb2_plane *vb_plane;
-	int ret;
 	struct dma_buf *dbuf;
 
 	if (q->memory != VB2_MEMORY_MMAP) {
@@ -2480,6 +2480,21 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
 		return -EINVAL;
 	}
 
+	*dmabuf = dbuf;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
+
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
+		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+{
+	struct dma_buf *dbuf;
+	int ret;
+
+	ret = vb2_core_expbuf_dmabuf(q, type, vb, plane, flags, &dbuf);
+	if (ret)
+		return ret;
+
 	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
 	if (ret < 0) {
 		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 9b02aeba41089c42b552998b49f27906dc70eeae..c75b4f14581a353d8dbe68d8bedd2b2ee86934d2 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -967,6 +967,21 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
  */
 int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
 
+/**
+ * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
+ * @q:         videobuf2 queue
+ * @type:      buffer type
+ * @index:     id number of the buffer
+ * @plane:     index of the plane to be exported, 0 for single plane queues
+ * @flags:     flags for newly created file, currently only O_CLOEXEC is
+ *             supported, refer to manual of open syscall for more details
+ * @dmabuf:    Returns the dmabuf pointer
+ *
+ */
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   struct vb2_buffer *vb, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf);
+
 /**
  * vb2_core_expbuf() - Export a buffer as a file descriptor.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.

-- 
2.52.0


