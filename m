Return-Path: <linux-media+bounces-1404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D28127FEFB3
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 14:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D38AB20E7F
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 13:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51973C6B8;
	Thu, 30 Nov 2023 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602D38DE0
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 13:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDC0C433C7;
	Thu, 30 Nov 2023 13:03:47 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: "Dr . David Alan Gilbert" <dave@treblig.org>,
	Deborah Brouwer <deborah.brouwer@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] media: bttv: start_streaming should return a proper error code
Date: Thu, 30 Nov 2023 13:58:10 +0100
Message-ID: <9e336a99f359b3e86ed793b6b83ccc460a4e8541.1701349092.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
References: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The start_streaming callback returned 0 or 1 instead of a
proper error code. Fix that.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: b7ec3212a73a ("media: bttv: convert to vb2")
---
 drivers/media/pci/bt8xx/bttv-driver.c | 6 ++----
 drivers/media/pci/bt8xx/bttv-vbi.c    | 8 +++-----
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 09a193bb87df..8e8c9dada67a 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1536,13 +1536,11 @@ static void buf_cleanup(struct vb2_buffer *vb)
 
 static int start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	int ret = 1;
 	int seqnr = 0;
 	struct bttv_buffer *buf;
 	struct bttv *btv = vb2_get_drv_priv(q);
 
-	ret = check_alloc_btres_lock(btv, RESOURCE_VIDEO_STREAM);
-	if (ret == 0) {
+	if (!check_alloc_btres_lock(btv, RESOURCE_VIDEO_STREAM)) {
 		if (btv->field_count)
 			seqnr++;
 		while (!list_empty(&btv->capture)) {
@@ -1553,7 +1551,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 			vb2_buffer_done(&buf->vbuf.vb2_buf,
 					VB2_BUF_STATE_QUEUED);
 		}
-		return !ret;
+		return -EBUSY;
 	}
 	if (!vb2_is_streaming(&btv->vbiq)) {
 		init_irqreg(btv);
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index ab213e51ec95..e489a3acb4b9 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -123,14 +123,12 @@ static void buf_cleanup_vbi(struct vb2_buffer *vb)
 
 static int start_streaming_vbi(struct vb2_queue *q, unsigned int count)
 {
-	int ret;
 	int seqnr = 0;
 	struct bttv_buffer *buf;
 	struct bttv *btv = vb2_get_drv_priv(q);
 
 	btv->framedrop = 0;
-	ret = check_alloc_btres_lock(btv, RESOURCE_VBI);
-	if (ret == 0) {
+	if (!check_alloc_btres_lock(btv, RESOURCE_VBI)) {
 		if (btv->field_count)
 			seqnr++;
 		while (!list_empty(&btv->vcapture)) {
@@ -141,13 +139,13 @@ static int start_streaming_vbi(struct vb2_queue *q, unsigned int count)
 			vb2_buffer_done(&buf->vbuf.vb2_buf,
 					VB2_BUF_STATE_QUEUED);
 		}
-		return !ret;
+		return -EBUSY;
 	}
 	if (!vb2_is_streaming(&btv->capq)) {
 		init_irqreg(btv);
 		btv->field_count = 0;
 	}
-	return !ret;
+	return 0;
 }
 
 static void stop_streaming_vbi(struct vb2_queue *q)
-- 
2.42.0


