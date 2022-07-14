Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595015746D5
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 10:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbiGNIfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 04:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235545AbiGNIfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 04:35:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C61F3C8EA
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:34:59 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id l22-20020a05600c4f1600b003a2e10c8cdeso3073059wmq.1
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=525hSq4AqE/ODq1x1H64Ic6C0Ftmupp+tEU4L66GSTA=;
        b=d/Vosp39ghLBw/KoZ0pCSfzVp/CjqUhzYOzfCGEo2/Iq+U0/mNbEi5KeTkL/0vyHBo
         BNfsV4J+3MyEHJkgt9Q2nTEPx/0WC6t8fSSE+sPlq672yqkqI1fL5xrTqYRVLJuMNMEv
         kdYGYrTFySE/vaw6J8jbxyL8fdveoF43USFLCanktyvwmSGnht4fTHTL3qa/nnc6ouh0
         Qs2IrXFAa2ABaBMU9zw89M9lWV7Yvh4DsKrXoiKAzmGC3s/6ql+iUMV57eQ/gXlTYqfn
         QHFcJtSVVtoVpttR/dBBsG4UQgsUuE9DepaDvgOGlnFsANWMzcmVxebfX+PWXfl8lOva
         5QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=525hSq4AqE/ODq1x1H64Ic6C0Ftmupp+tEU4L66GSTA=;
        b=beEHIUu+NkiCtWzU5mYM3S/Py0oLb5ljklvGjmw2PwsJAxDy/YdorkKxmMjZl9OLAZ
         nilUWOvwuQC35QqKCd5qFUBSxor1nsezAAuGXuscCr2PDqNhTd9yTRJQ5j8Gm/16aS4X
         b6n6YnucLhOom2/zNM3Le3kJh+bXIeHxfo2kmpEIUZ/ZpTnM30Xxi+hHCelnO/aBnwFL
         c48MqSooTL82BEIkJgSSkeAm3pZxV39WusUCDxDoNHdAOQXgy1EfZxhQBgzOrhsenXBu
         ZnLihW8G8FJT+2PsOVS+9eozOAR+NacqfmD9l7tEdT3MMThQ1hENantar/5OeSFAjoug
         rwkw==
X-Gm-Message-State: AJIora8dBOAiRsjYJiv8J7NIOwCdcCJpQ0ZTo4e4B72NJeIMVJ/xOmNJ
        3hgbCTOiIvLalWnUW92DXsZeKXMh+xxeFcQLM55i5P0OXmZj7I/Rf7WewGln0B2Yz1029Ck4+qb
        Pw8DFNheD7sOjjf5y06wSR4i1TyX6Q9CEY3nzzPgyPGrfm5xkXLYRc3NIjSrf7nxg6D/UIeqj
X-Google-Smtp-Source: AGRyM1ukbb5VcNdvsjkgLLpNy5yzcTeBLFKa+l16FbiGprgUgnTR1SG1xSys2FsLI7/N56ZALmZi7w==
X-Received: by 2002:a05:600c:41c7:b0:3a2:e8fd:fe52 with SMTP id t7-20020a05600c41c700b003a2e8fdfe52mr7816162wmh.123.1657787698142;
        Thu, 14 Jul 2022 01:34:58 -0700 (PDT)
Received: from melexis ([194.44.50.167])
        by smtp.gmail.com with ESMTPSA id d14-20020adffd8e000000b0021d6a23fdf3sm856587wrr.15.2022.07.14.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 01:34:57 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org
Cc:     Volodymyr Kharuk <vkh@melexis.com>,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/6] media: xilinx: video: Add 1X12 greyscale format
Date:   Thu, 14 Jul 2022 11:34:44 +0300
Message-Id: <e2ea1840b666ad0b4ff169b4f58c85bc0291af59.1657786765.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657786765.git.vkh@melexis.com>
References: <cover.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend the xilinx video driver with Y12_1X12 greyscale format

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 drivers/media/platform/xilinx/xilinx-vip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index a0073122798f..5b214bf7f93a 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -40,6 +40,8 @@ static const struct xvip_video_format xvip_video_formats[] = {
 	  1, V4L2_PIX_FMT_SGBRG8 },
 	{ XVIP_VF_MONO_SENSOR, 8, "bggr", MEDIA_BUS_FMT_SBGGR8_1X8,
 	  1, V4L2_PIX_FMT_SBGGR8 },
+	{ XVIP_VF_MONO_SENSOR, 12, "mono", MEDIA_BUS_FMT_Y12_1X12,
+	  2, V4L2_PIX_FMT_Y12 },
 };
 
 /**
-- 
BR,
Volodymyr Kharuk

