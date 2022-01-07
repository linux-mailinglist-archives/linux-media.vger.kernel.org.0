Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134354874CC
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 10:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346552AbiAGJfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 04:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346471AbiAGJfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 04:35:19 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924B8C06118A
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 01:35:17 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id q3so4733853pfs.7
        for <linux-media@vger.kernel.org>; Fri, 07 Jan 2022 01:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fjiy0XooAZ6+kW7wDLSv0ZRGyBQbrxYjLs1RiRmdLbE=;
        b=QvJo4nFH0gD8APv38byE5spLLGm2EstyxyTk2J3FFBpW7w7wx3d58C4oK9BSis/uWT
         V1neR7ko1JCTXSYbOsosrDSHBLVmVjSezPdgElFoRM5iWaBNNSSD5HqnNWw1baqQnlWR
         Dfu9ZPxAq50562bbUX1Ev9gRjkuCgBJ5lrK+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fjiy0XooAZ6+kW7wDLSv0ZRGyBQbrxYjLs1RiRmdLbE=;
        b=3LMO/w+D7jS4l5JoU6eur7td6g3WwVCbeFT1ZhRc1GzvSPanKfxUvTUDXCBD3z0eaF
         ViwfSJgspml6k3Z/v0+3SaaqpWo4EZEfKLXJfqd9iJv/3+HD5mWdFWBT/hAO0TlpSzzk
         VFVegL7ovTZsK0N4NYmZhGoAs1BGEQhcgblqtgIvFfxPs+NF+beBwbxO0Qtv7MgYO+41
         jkut3zeLKjMcFheMVqXE+73V/dFWVQIMp0A0Hx3h5llINuJhtRNAbGZhuPG4kyOnpyvr
         NCFlHMN9x0g34nntVvbLiYDe/tMI0GcqjXwRAEVFzCEBt4QlIMrVsOWxoeMpdmFQeIdt
         CyFg==
X-Gm-Message-State: AOAM5337ABU9/Q7CkShiK2JfiRwcSythMSg6AE56Ys+7RNVj7rN8947U
        Dr2Z75AupNYznZkQdB/nUbAn8A==
X-Google-Smtp-Source: ABdhPJwXKfTmxMvstQkseMraIWF9HRswARtFjx8amtQ1SIu1hk1yMo3q40/yRoCkMDPgQvU/zWmg0Q==
X-Received: by 2002:a05:6a00:1a4f:b0:4bb:113a:677c with SMTP id h15-20020a056a001a4f00b004bb113a677cmr63742556pfv.63.1641548117149;
        Fri, 07 Jan 2022 01:35:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8f6b:ee:64d8:ae81])
        by smtp.gmail.com with ESMTPSA id j17sm5269192pfu.77.2022.01.07.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:35:16 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 5/8] media: hantro: jpeg: Add COM segment to JPEG header to align image scan
Date:   Fri,  7 Jan 2022 17:34:52 +0800
Message-Id: <20220107093455.73766-6-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220107093455.73766-1-wenst@chromium.org>
References: <20220107093455.73766-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The JPEG header size is not 64-bit aligned. This makes the driver
require a bounce buffer for the encoded JPEG image scan output.

Add a COM (comment) segment to the JPEG header so that the header size
is a multiple of 64 bits. This will then allow dropping the use of the
bounce buffer, and instead have the hardware write out to the capture
buffer directly.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_jpeg.c | 23 +++++++++++++++++++++-
 drivers/staging/media/hantro/hantro_jpeg.h |  2 +-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
index 7d4018bd6876..e63eeef3952d 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -6,6 +6,9 @@
  * Copyright (C) Jean-Francois Moine (http://moinejf.free.fr)
  * Copyright (C) 2014 Philipp Zabel, Pengutronix
  */
+
+#include <linux/align.h>
+#include <linux/build_bug.h>
 #include <linux/dma-mapping.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
@@ -140,7 +143,7 @@ static const unsigned char chroma_ac_table[] = {
  * and we'll use fixed offsets to change the width, height
  * quantization tables, etc.
  */
-static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
+static const unsigned char hantro_jpeg_header[] = {
 	/* SOI */
 	0xff, 0xd8,
 
@@ -247,11 +250,29 @@ static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 
+	/* COM */
+	0xff, 0xfe, 0x00, 0x03, 0x00,
+
 	/* SOS */
 	0xff, 0xda, 0x00, 0x0c, 0x03, 0x01, 0x00, 0x02,
 	0x11, 0x03, 0x11, 0x00, 0x3f, 0x00,
 };
 
+/*
+ * JPEG_HEADER_SIZE is used in other parts of the driver in lieu of
+ * "sizeof(hantro_jpeg_header)". The two must be equal.
+ */
+static_assert(sizeof(hantro_jpeg_header) == JPEG_HEADER_SIZE);
+
+/*
+ * hantro_jpeg_header is padded with a COM segment, so that the payload
+ * of the SOS segment (the entropy-encoded image scan), which should
+ * trail the whole header, is 8-byte aligned for the hardware to write
+ * to directly.
+ */
+static_assert(IS_ALIGNED(sizeof(hantro_jpeg_header), 8),
+	      "Hantro JPEG header size needs to be 8-byte aligned.");
+
 static unsigned char jpeg_scale_qp(const unsigned char qp, int scale)
 {
 	unsigned int temp;
diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/staging/media/hantro/hantro_jpeg.h
index f33c492134e4..0b49d0b82caa 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.h
+++ b/drivers/staging/media/hantro/hantro_jpeg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 
-#define JPEG_HEADER_SIZE	619
+#define JPEG_HEADER_SIZE	624
 #define JPEG_QUANT_SIZE		64
 
 struct hantro_jpeg_ctx {
-- 
2.34.1.575.g55b058a8bb-goog

