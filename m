Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B288A7C6D05
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 13:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378329AbjJLLrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 07:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378755AbjJLLrP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 07:47:15 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E9018B;
        Thu, 12 Oct 2023 04:47:09 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AD7A6607342;
        Thu, 12 Oct 2023 12:47:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697111227;
        bh=fi+Fxcs6m07q1y5Umer9Ad8BDnSh9/sSAfF+r67YVOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MeUP9vNzWBasugY68j+66SW3C/LzkLPve86K4aNyyQ8g++Q76e+RYBrQ7LINrkiK2
         dsRGKCnEg6ehWToc0Tncef+RTzatdbeo/RNZrTk3Dbo5KvI4v47Vt6wvsvpenCVL0/
         y+0a8Wh1yV6ny/p02Tl32UDcVc7xMtAlNltup5VYEr43eFC1BV4fb0nqEsusg3DHtU
         rQCOAq2Yfh3yQTde3Wfmp7KWiR0PWlxKxpY3IszrosThGBVzGgCd5HOOCuLe0XWICi
         EZvCqXBc9OZUrFfT5a44sHvMPfl1hTbJXeMn5R0TEEji6U92aR0Ok3gWrm45MOQ8ky
         0oR+n+dAb7a5Q==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v11 34/56] media: usb: cx231xx: Set min_buffers_needed to CX231XX_MIN_BUF
Date:   Thu, 12 Oct 2023 13:46:20 +0200
Message-Id: <20231012114642.19040-35-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vb2 queue_setup checks for a minimum number of buffers so set
min_buffers_needed to  aCX231XX_MIN_BUFnd remove the useless check in
cx231xx queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c   | 4 +---
 drivers/media/usb/cx231xx/cx231xx-video.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index c5e21785fafe..fecdb12f5ef7 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1223,9 +1223,6 @@ static int queue_setup(struct vb2_queue *vq,
 	dev->ts1.ts_packet_size  = mpeglinesize;
 	dev->ts1.ts_packet_count = mpeglines;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
-
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -1777,6 +1774,7 @@ int cx231xx_417_register(struct cx231xx *dev)
 	q = &dev->mpegq;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->min_buffers_needed = CX231XX_MIN_BUF;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx231xx_buffer);
 	q->ops = &cx231xx_video_qops;
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index e23b8ccd79d4..26b593844157 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -717,9 +717,6 @@ static int queue_setup(struct vb2_queue *vq,
 
 	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
 
-	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
-		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
-
 	if (*nplanes)
 		return sizes[0] < dev->size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -1805,6 +1802,7 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 	q = &dev->vidq;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->min_buffers_needed = CX231XX_MIN_BUF;
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct cx231xx_buffer);
 	q->ops = &cx231xx_video_qops;
-- 
2.39.2

