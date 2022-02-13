Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2EC14B3C64
	for <lists+linux-media@lfdr.de>; Sun, 13 Feb 2022 18:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbiBMRN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Feb 2022 12:13:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbiBMRN5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Feb 2022 12:13:57 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D1D58E5B
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:13:50 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so20975253lfb.0
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OsBhtQ98iI4ZnCfMYm1kTl/BmFgQLnIwAw++GaYjsQw=;
        b=RJvdFbF/76T6xHLHGuAsOhkC/v0gkx9X2gQ7hEi4jW4DhGQjrrpMRXs2syRItVdOhh
         JxipoDKlfZ4sQPrCVkCquNBHNpyngkD53y/6Vbgd/m1sMhat4hLQXAZREI//Hi9TVRf2
         K3g4ZiEC6JlSDc1IHpWJfCCMgGbk5eR3hyT1Bdtci3/SGV9CvRRiWW2UFLZqeriL1kTp
         mR2u5W0WsDEh8lAB2CVlLTkRywvuTRloAzzVPv0QBRGZo/xxiNVn0bIs104prFi0ScoQ
         uGJ+cOlcd89QcqG08xJDvXVG5iK1zkP2LDonqukZMTB/VeZAJxeyowW8vuOYnsMollgx
         F7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OsBhtQ98iI4ZnCfMYm1kTl/BmFgQLnIwAw++GaYjsQw=;
        b=ok/8l+V1MCYcKtu5sNGLWE28ByJOBzG3aK3Q3LX7P6tYL+QHGba1vnUmjVYGrkCoLR
         eqXmBodLfNv6alJFeKQPA4CFJKQY/0PQnHdsoZx2QNIiyyN+gh/o7r8i6k4oWN+JtF7d
         s9or88d31BZTjwwkJA4gnz5i/OwZn2KB5iOEg2POJRjWkBvkXQAGHa3nEOQJaoLXRzT6
         0AIqiwNPX4pEEdYrHztpES84V0xyxZbvPXsxJrrCQFIXkhuNWFRHO3cqlZZc3vVKJbxN
         VbtfQbpdzIZNWhb16TMgSKj8sR8Jx+/mlPsfoYIx1PHL68oBCc4Cpcgt8gv3wadRrAlH
         +RQw==
X-Gm-Message-State: AOAM531/zgnzCVYDf9SDQER6+sRQlF8lEomkQ1YGG34G9/ytXFAZ04wQ
        c0n0OXiFKwWpIAC8aAO40vLIxKX+d7qKdQ==
X-Google-Smtp-Source: ABdhPJxCSwN6skeBP3wMDkaRhN1qcI/uo/SrcTa0oljeaoBSKXftLu0Vog23sdrp12nRg+7u/lWHxg==
X-Received: by 2002:a05:6512:1111:: with SMTP id l17mr3852257lfg.6.1644772429087;
        Sun, 13 Feb 2022 09:13:49 -0800 (PST)
Received: from localhost (31-178-191-245.dynamic.chello.pl. [31.178.191.245])
        by smtp.gmail.com with ESMTPSA id k12sm3736120ljh.45.2022.02.13.09.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Feb 2022 09:13:48 -0800 (PST)
From:   Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v1 03/03]: dt-bindings: media: rockchip-vpu: Add RK3568 compatible
Date:   Sun, 13 Feb 2022 18:13:52 +0100
Message-Id: <20220213171349.3924782-3-piotr.oniszczuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220213171349.3924782-1-piotr.oniszczuk@gmail.com>
References: <20220213171349.3924782-1-piotr.oniszczuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

        From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>

        RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP9
        video formats.

        This patch adds RK3568 compatible in rockchip-vpu dt-bindings.

        Tested on [1] with FFmpeg v4l2_request code taken from [2]
        with MPEG2, H.642 and VP8 samples with results [3].

        [1] https://github.com/warpme/minimyth2
        [2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
        [3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt

        Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index bacb60a34989..6cc4d3e5a61d 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,rk3328-vpu
           - rockchip,rk3399-vpu
           - rockchip,px30-vpu
+          - rockchip,rk3568-vpu
       - items:
           - const: rockchip,rk3188-vpu
           - const: rockchip,rk3066-vpu
-- 
2.29.2

