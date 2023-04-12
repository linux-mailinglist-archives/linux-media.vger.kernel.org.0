Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A1D6DF471
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjDLL5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 07:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjDLL5I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 07:57:08 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC5CEA;
        Wed, 12 Apr 2023 04:57:07 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c2e:89bd:4b8e:9e98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E77BC660326B;
        Wed, 12 Apr 2023 12:57:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681300626;
        bh=g41XyyHBmbMssUN5c7ZvMN8gUuqx7OSKT4P6IGFh8Fw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KllQBzg7XRRIbLQbrPYlMyUjiVCXtV94oPZMkV+6s4RRUKnzgGqSlyneCj5GESOLl
         F+agXHvWPHWDSeCoq5wGDYGEc1d2ZhJjRwuqGReNCU0E+gEsqHOVkDeR9nwGoRRMoS
         jqK1AkaBDJg5tbeGSqP0tebBk5rp/ov01nVWnn4owzmBZq8tnIzFlNaezQwRIaWSkE
         l4M5aNNd8xMZkicV3Iisq5216o0EbeUr/a5QGItfjYh7XDVpW2x8At9ttgjEi9LYmg
         zGJemjqOK3pUMyLp8qg7voTUNvsJ4AYw3wptl22rf2bDx+PD3Pbhak1516ajhoSX0U
         51eCXgbUAt0Ng==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 05/13] media: verisilicon: Get bit depth for V4L2_PIX_FMT_NV15_4L4
Date:   Wed, 12 Apr 2023 13:56:44 +0200
Message-Id: <20230412115652.403949-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412115652.403949-1-benjamin.gaignard@collabora.com>
References: <20230412115652.403949-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's the driver knows that V4L2_PIX_FMT_NV15_4L4 is a 10bits
pixel format.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v6:
- Rename NV12_10LE40_4L4 pixel format into NV15_4L4.

 drivers/media/platform/verisilicon/hantro_v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index d238d407f986..4445dec630cb 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -71,6 +71,7 @@ int hantro_get_format_depth(u32 fourcc)
 	switch (fourcc) {
 	case V4L2_PIX_FMT_P010:
 	case V4L2_PIX_FMT_P010_4L4:
+	case V4L2_PIX_FMT_NV15_4L4:
 		return 10;
 	default:
 		return 8;
-- 
2.34.1

