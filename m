Return-Path: <linux-media+bounces-948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228FA7F690B
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 23:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A43FB20EFE
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 22:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9CB4123B;
	Thu, 23 Nov 2023 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ED510C1
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 14:32:11 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1r6IEz-00052i-W7; Thu, 23 Nov 2023 23:32:10 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r6IEx-00B8L9-9r; Thu, 23 Nov 2023 23:32:07 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1r6IEx-005yyM-0l;
	Thu, 23 Nov 2023 23:32:07 +0100
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	kernel@pengutronix.de,
	stable@kernel.org
Subject: [PATCH v4] media: videobuf2-dma-sg: fix vmap callback
Date: Thu, 23 Nov 2023 23:32:05 +0100
Message-Id: <20231123223205.1425234-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAAFQd5AHdWS9zMSyG83LSQOMeGL852xq6APZm0ibiCJ3eMgtNQ@mail.gmail.com>
References: <CAAFQd5AHdWS9zMSyG83LSQOMeGL852xq6APZm0ibiCJ3eMgtNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

For dmabuf import users to be able to use the vaddr from another
videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
vb2_dma_sg_dmabuf_ops_vmap callback. This patch adds vmap on map if
buf->vaddr was not set.

Cc: stable@kernel.org
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v3 -> v4: drop vunmap function and make use of vb2_dma_sg_vaddr in vmap callback
v2 -> v3: resend as a single patch
v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram

 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 28f3fdfe23a298..6975a71d740f6d 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -487,9 +487,15 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
 				      struct iosys_map *map)
 {
-	struct vb2_dma_sg_buf *buf = dbuf->priv;
+	struct vb2_dma_sg_buf *buf;
+	void *vaddr;
+
+	buf = dbuf->priv;
+	vaddr = vb2_dma_sg_vaddr(buf->vb, buf);
+	if (!vaddr)
+		return -EINVAL;
 
-	iosys_map_set_vaddr(map, buf->vaddr);
+	iosys_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
-- 
2.39.2


