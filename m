Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC31650F7C
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 16:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbiLSP4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 10:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiLSP42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 10:56:28 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF5738D;
        Mon, 19 Dec 2022 07:56:26 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f69c:5603:d4ce:7aa2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 993746602C38;
        Mon, 19 Dec 2022 15:56:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1671465384;
        bh=dnBJgh8sSkt857ri8yCAHtqY7H+7m35HgIufTqw86+k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dM+TQZYjcvfz+QOSRqrc5sqY1jLwFJ6RJWQ5j6je+x/qWmuOfQucYQtllbzklTEGF
         8dSIdRN+2QdCn/3mf5cokKibr/8R5vmjXLQRnDTYV7c3JYLRtnvzpu8Yv2D1iLodeL
         vz06sp1fnaJbAsLvf0czQwiewHEraHf23KALfj4U2yu5eM7fIJ/ZoB5VS0KobkPCj/
         GvX2SfMaypzKv80MS6qtOCtF5x8P7ylGkzrHZoxmZCflcUo1mnYKQS0WomFauAFf3H
         eiocvEdRWCz1pP6K21qZObA5/hXeWhGua+K9fAeavWeyktksj36DK5aZn6uWnxvUrQ
         Kgy2sjHmNXsxw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        daniel.almeida@collabora.com, nicolas.dufresne@collabora.co.uk
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v1 2/9] media: verisilicon: Add AV1 decoder mode and controls
Date:   Mon, 19 Dec 2022 16:56:09 +0100
Message-Id: <20221219155616.848690-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219155616.848690-1-benjamin.gaignard@collabora.com>
References: <20221219155616.848690-1-benjamin.gaignard@collabora.com>
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

Add AV1 decoder as new decoder mode to Hantro driver.
Register needed AV1 controls for the decoder.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |  3 +++
 .../media/platform/verisilicon/hantro_drv.c   | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 2989ebc631cc..61480825b856 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -38,6 +38,7 @@ struct hantro_postproc_ops;
 #define HANTRO_H264_DECODER	BIT(18)
 #define HANTRO_HEVC_DECODER	BIT(19)
 #define HANTRO_VP9_DECODER	BIT(20)
+#define HANTRO_AV1_DECODER	BIT(21)
 #define HANTRO_DECODERS		0xffff0000
 
 /**
@@ -111,6 +112,7 @@ struct hantro_variant {
  * @HANTRO_MODE_VP8_DEC: VP8 decoder.
  * @HANTRO_MODE_HEVC_DEC: HEVC decoder.
  * @HANTRO_MODE_VP9_DEC: VP9 decoder.
+ * @HANTRO_MODE_AV1_DEC: AV1 decoder
  */
 enum hantro_codec_mode {
 	HANTRO_MODE_NONE = -1,
@@ -120,6 +122,7 @@ enum hantro_codec_mode {
 	HANTRO_MODE_VP8_DEC,
 	HANTRO_MODE_HEVC_DEC,
 	HANTRO_MODE_VP9_DEC,
+	HANTRO_MODE_AV1_DEC,
 };
 
 /*
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8cb4a68c9119..4500e1fc0f2c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -498,6 +498,27 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
 		},
+	}, {
+		.codec = HANTRO_AV1_DECODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_FRAME,
+		},
+	}, {
+		.codec = HANTRO_AV1_DECODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY,
+			.dims = { V4L2_AV1_MAX_TILE_COUNT },
+		},
+	}, {
+		.codec = HANTRO_AV1_DECODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_SEQUENCE,
+		},
+	}, {
+		.codec = HANTRO_AV1_DECODER,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_FILM_GRAIN,
+		},
 	},
 };
 
-- 
2.34.1

