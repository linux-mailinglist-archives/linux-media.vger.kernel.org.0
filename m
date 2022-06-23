Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC0A558914
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 21:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiFWTeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 15:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiFWTeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 15:34:13 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3424362739
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 12:14:54 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 88so1315161qva.9
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 12:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LQ+FXgAQqbDOwQR3BZm+KDkjcAZnz7yXFfElz9s/pME=;
        b=QBzMWxY+H/caLIqEoe+CoE3sDnb+uR+HAlyhswEFMCd3ZzCwtKudNN9Y4P/4OeH7dB
         QR/xPdM4Vvv9SuFZBnS26A7znWvngi4/tfg0tkSOX2ji8XD9mX5z93KjMkXtewD2NIYz
         CHlTVB9p3dTLe995eGW5aGh3/JFlDCW77tlYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LQ+FXgAQqbDOwQR3BZm+KDkjcAZnz7yXFfElz9s/pME=;
        b=0rpTKsqEZ/Em+y4wKAWYtE3pxdDwOOLNuYnzEK1Zkokjj5n9AlnnJkPB0euHqAe3Ns
         +Y5JUhHQvNAzKQSNfB0K+f48sQ5ghsV1AJ1RYZ4/FVS40+5Igkc/4y4XsK+2E1bpF3Ym
         EhOR95Hu5BLfgJmggITQETDT+hCH5M5VlAbLSwyZiL6Jqr0WoXLgaxLcS7xJDz2nDtOk
         k079ZMK8si+KVKLovvvuYnIS3Df3NdHEi0iYYlBl08xTLDK/w2+LpwWoIC2cjsAZdwvH
         KaLScSDlav+D5eCVOAQm/7HToV8vZXScnSdmLztDwtM8W8SvzzS8hfXhoW2q/cDPGOWb
         xCWQ==
X-Gm-Message-State: AJIora8yTAJs+V1CTYVcK5G68kobyYCu1P9zk3jEAp8Hg4Y3IqBtjy1M
        vF1aGm81MTaq632VAjblRzUIrg0f0lTTgg==
X-Google-Smtp-Source: AGRyM1tMb1Qg9uaycaZRQCr/fL4O/AdjZviaPQFcYecD3vlF0tr7RMtH0jtnEXB9X9mez2oUxPQ3YA==
X-Received: by 2002:a05:6214:5292:b0:470:5123:d365 with SMTP id kj18-20020a056214529200b004705123d365mr13974464qvb.131.1656011693164;
        Thu, 23 Jun 2022 12:14:53 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:ad2f:e281:a5ae:eabc])
        by smtp.gmail.com with ESMTPSA id br8-20020a05620a460800b006a75fb69697sm244514qkb.72.2022.06.23.12.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 12:14:52 -0700 (PDT)
From:   Justin Green <greenjustin@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com,
        nicolas.dufresne@collabora.com, andrescj@chromium.org,
        yunfei.dong@mediatek.com, Justin Green <greenjustin@chromium.org>,
        Justin Green <greenjustin@google.com>
Subject: [PATCH] mediatek/jpeg: validate data_offsets for v4l2 planes
Date:   Thu, 23 Jun 2022 15:14:22 -0400
Message-Id: <20220623191422.1157518-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Validate V4L2 plane data_offset values. We need to make sure the size of
the image we're encoding does not exceed the size of the buffer minus
its offset.

Signed-off-by: Justin Green <greenjustin@google.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index bc5b0a0168ec..8f5c1b9937bc 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -687,6 +687,10 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
+                if (vb->planes[i].data_offset > vb2_plane_size(vb, i) ||
+                    vb2_plane_size(vb, i) - vb->planes[i].data_offset
+                    < plane_fmt.sizeimage)
+                    return -EINVAL;
 		if (ctx->enable_exif &&
 		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
 			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-- 
2.37.0.rc0.104.g0611611a94-goog

