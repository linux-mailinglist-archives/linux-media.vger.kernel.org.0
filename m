Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13FF31D640
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhBQIHe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:07:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53212 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhBQIEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:04:47 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:fd6e:12cd:95d7:3350])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E7C0B1F4508E;
        Wed, 17 Feb 2021 08:04:03 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v1 11/18] media: hantro: Add helper function for auxiliary buffers allocation
Date:   Wed, 17 Feb 2021 09:02:59 +0100
Message-Id: <20210217080306.157876-12-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add helper functions to allocate and free auxiliary buffers.
These buffers aren't for frames but are needed by the hardware
to store scaling matrix, tiles size, border filters etc...

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index a9b80b2c9124..7f842edbc341 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -446,6 +446,30 @@ hantro_get_dec_buf(struct hantro_ctx *ctx, struct vb2_buffer *vb)
 	return vb2_plane_vaddr(vb, 0);
 }
 
+static inline int
+hantro_aux_buf_alloc(struct hantro_dev *vpu,
+		     struct hantro_aux_buf *buf, size_t size)
+{
+	buf->cpu = dma_alloc_coherent(vpu->dev, size, &buf->dma, GFP_KERNEL);
+	if (!buf->cpu)
+		return -ENOMEM;
+
+	buf->size = size;
+	return 0;
+}
+
+static inline void
+hantro_aux_buf_free(struct hantro_dev *vpu,
+		    struct hantro_aux_buf *buf)
+{
+	if (buf->cpu)
+		dma_free_coherent(vpu->dev, buf->size, buf->cpu, buf->dma);
+
+	buf->cpu = NULL;
+	buf->dma = 0;
+	buf->size = 0;
+}
+
 void hantro_postproc_disable(struct hantro_ctx *ctx);
 void hantro_postproc_enable(struct hantro_ctx *ctx);
 void hantro_postproc_free(struct hantro_ctx *ctx);
-- 
2.25.1

