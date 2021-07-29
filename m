Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262BC3DA46A
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 15:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237560AbhG2Ngg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 09:36:36 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:37857 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237559AbhG2Nge (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 09:36:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 96D5mV4p4XTlc96D6mWuNC; Thu, 29 Jul 2021 15:36:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627565788; bh=rzrhpy3yzELuVgi3XKMS0mbqNigQ+B03mCShxZDLq/g=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=NzdnGXy5e9FFEl8yKJlVrB5QY5CquRMt1dygFsKo+uPjMSg+VydgKhoCQYHdmYqJ1
         emyDROz1kIKeYRFp0X2sPAlLe6msHvaEzF3S1nxG2qXaJI8Iyo1AJ5Z3Z6rXdmQnzH
         CflmhFf44oJVd/p50nLARmslyoP8Ob7xFZgwtQQsQ2+QPMKHCBW34ST/XG2neQhAsf
         SSIN1tHWAgLJD6WvizQ4lTjT2QDx9js95SDOZC1KRZgQXK8OyLnMgtwZqBedKlHIhF
         MQIH7jz8TCMjye2Ey099+dcPoSbA0UX2AmZ2WlBwi/bb44cPQFJ3kmO5KdCxekExQq
         NfjrtliMceY+Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 1/3] cedrus: drop min_buffers_needed.
Date:   Thu, 29 Jul 2021 15:36:25 +0200
Message-Id: <20210729133627.1592672-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
References: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGO50jq3zq15EklNILRdBPqiw3bRBKS+KTHcK5dj5eI2gxDuY+hjCkw5SSO5mN490Q939bLx8p8FD5SUNfS8NVrDTi2JiqDDJMYKH1QZ+VTOXGbILlq8
 RG4j1C/sA6iK2rsLmCsjMWxHRRLpMtyE00+TFKsoDpregSTXXCdpw+aGQJHDIapUHDo/x2XM1cNrKlrNXWAzbWeP0aEjHW5uxjNA8166MZRcqMHJ4jBgdgqj
 D3/wq0A+nSevuypcSzy1syzmPcZSyY0FP1MG+rTt6xLV/el6Tv/gLVGbQCq3UGDVW83NWK7mIzxLjguJZk1U4wuAOWswDo6OyM3Wfl7hv8jRPRQB64SdkjCW
 irUDwhZrTlG1zdljlkHnv1aNkPzQDQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no reason for the cedrus driver to set min_buffers_needed.
A non-zero min_buffers_needed can cause problems with the Request API
if start_streaming fails when queueing a buffer from a request.

Since it is not needed for this driver, just remove it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index c589fe9dae70..f3cd452575d4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -570,7 +570,6 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
-	src_vq->min_buffers_needed = 1;
 	src_vq->ops = &cedrus_qops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
@@ -587,7 +586,6 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct cedrus_buffer);
-	dst_vq->min_buffers_needed = 1;
 	dst_vq->ops = &cedrus_qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
-- 
2.30.2

