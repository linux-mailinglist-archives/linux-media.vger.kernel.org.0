Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6094F7B52A5
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 14:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237228AbjJBMHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 08:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbjJBMHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 08:07:00 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7201D101;
        Mon,  2 Oct 2023 05:06:46 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CC2866607379;
        Mon,  2 Oct 2023 13:06:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1696248405;
        bh=ipUXv7UJIHHhxRMQZmIK4W+snIi8YRwkVW1/aAA+P6g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TLLGMIv5jfgGYeraENvYuKEsuV7BhSqQ+vv2GURiG0nM3bnDSx6sAz30ndk2EIitN
         POT39tISSRE0F8qkpmfZdVI/dBH3ObYr+00M6qZhVKQJjoCSYOHCWRRBEYZ5NJQo9I
         jZDHYk7TLO3r3WsVUTRlQIH9KVeTk4S/uyn7B/rJhfl2j4+CNEOuC7fTPgbUBeSRo6
         PGcPjlRTOcH8KnIXziC4RyYit3Og6qZXN7SHFZWqIm78flLsD7210UkJb1rmVQq68M
         Mit3g76oU5aFaR+Dl5gkgjZxjTCM0iIIyS+B0z5gGUfruolt1QOtcBVZMUQRGBgzXq
         kJ5Eau2J2G9nQ==
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
Subject: [PATCH v9 38/53] media: usb: airspy: Set min_buffers_needed to 8
Date:   Mon,  2 Oct 2023 14:06:02 +0200
Message-Id: <20231002120617.119602-39-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
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
min_buffers_needed to 8 and remove the useless check in
airspy_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/airspy/airspy.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 462eb8423506..56bc1b23d39b 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -483,15 +483,10 @@ static int airspy_queue_setup(struct vb2_queue *vq,
 {
 	struct airspy *s = vb2_get_drv_priv(vq);
 
-	dev_dbg(s->dev, "nbuffers=%d\n", *nbuffers);
-
-	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(s->buffersize);
 
-	dev_dbg(s->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);
+	dev_dbg(s->dev, "nbuffers=%d sizes[0]=%d\n", vb2_get_num_buffers(vq), sizes[0]);
 	return 0;
 }
 
@@ -1011,6 +1006,8 @@ static int airspy_probe(struct usb_interface *intf,
 	/* Init videobuf2 queue structure */
 	s->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
 	s->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
+	/* Need at least 8 buffers */
+	s->vb_queue.min_buffers_needed = 8;
 	s->vb_queue.drv_priv = s;
 	s->vb_queue.buf_struct_size = sizeof(struct airspy_frame_buf);
 	s->vb_queue.ops = &airspy_vb2_ops;
-- 
2.39.2

