Return-Path: <linux-media+bounces-36761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2CEAF897F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF5AD1CA0D45
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79622857CA;
	Fri,  4 Jul 2025 07:27:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98C127F759;
	Fri,  4 Jul 2025 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614059; cv=none; b=nPyCIzPdC9IV/9rs9pE2v7Jd741Nk79c3dMjTwRhQdbxfUgVmh6bkTGRa4Qkv0KDCmzfSPJAvsW/yaak0RihtLudFHwcFQwUkVDq/MhGq3I6RZ4DfMBGtCf5s+xXYaRxyZ9Mqfue5WCnuzUUzSHY+X2Bm9lX7WUmKPDXdqTHhtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614059; c=relaxed/simple;
	bh=yVFYo6Kk/6Zc9eHOlHEVJQtvOkaea4d9X8jdBYc1rs8=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=J6Gyxw+SBu/c6FzF+5JUg+IrYo2EYMJuzGYoclSJo459lRh+0/K2mC4PumyTPjSsUgw4AuDIjDZu5yRfHuZBtm/5O790WZbN6c7n3H1UsAR2VYD4Aw44NzzUX+YsBItMlK2G7oECYiDvy7AfWXsacP6sWeqDur7gFwB2P76ghjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bYQ6R5g88zCh12;
	Fri,  4 Jul 2025 15:21:19 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4bYQ6H6fKFzBRHKj;
	Fri,  4 Jul 2025 15:21:11 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bYQ644Mftz8R044;
	Fri,  4 Jul 2025 15:21:00 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 5647KiW8090359;
	Fri, 4 Jul 2025 15:20:44 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 4 Jul 2025 15:20:47 +0800 (CST)
Date: Fri, 4 Jul 2025 15:20:47 +0800 (CST)
X-Zmail-TransId: 2af9686780cf5ce-2beb8
X-Mailer: Zmail v1.0
Message-ID: <20250704152047205U11FdEih1MxrmcmAz0Xpp@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>
Cc: <mst@redhat.com>, <eperezma@redhat.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <virtualization@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSB2aXJ0aW86IEFkZCBtaXNzaW5nIGtlcm5lbGRvYyBmb3IgdmlydGlvX2RtYV9idWZfYXR0YWNo?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 5647KiW8090359
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 686780EE.000/4bYQ6R5g88zCh12

From: Peng Jiang <jiang.peng9@zte.com.cn>

Add kerneldoc for 'virtio_dma_buf_attach' function to fix W=1 warnings:

drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' not described in 'virtio_dma_buf_attach'
drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' not described in 'virtio_dma_buf_attach'

Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
---
 drivers/virtio/virtio_dma_buf.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
index 3fe1d03b0645..18d261ba5197 100644
--- a/drivers/virtio/virtio_dma_buf.c
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -35,7 +35,16 @@ struct dma_buf *virtio_dma_buf_export
 EXPORT_SYMBOL(virtio_dma_buf_export);

 /**
- * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
+ * virtio_dma_buf_attach - Mandatory attach callback for virtio dma-bufs
+ * @dma_buf: Pointer to the shared dma-buf structure
+ * @attach: Pointer to the newly created attachment metadata
+ *
+ * Description: Implements the standard dma-buf attach operation for virtio devices.
+ *              Retrieves virtio-specific operations through container_of macro,
+ *              then invokes device-specific attach callback if present.
+ *              This enables virtio devices to participate in dma-buf sharing.
+ *
+ * Return: 0 on success, error code on failure
  */
 int virtio_dma_buf_attach(struct dma_buf *dma_buf,
                          struct dma_buf_attachment *attach)
-- 
2.25.1

