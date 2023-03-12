Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A6F6B665C
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjCLNPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjCLNOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:14:38 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8116521DB
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:13:59 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id cn21so8315566edb.0
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6y38vRZkdBS5R5uwqFpYAPV0SwqgL3Ad/RHz3KFEYg=;
        b=F6qp4Yb8Iigoi2EWlwMSg+KfJE/41jbOR7JfTYJrgttrWACfS6ajuqUiwOO66uyPgb
         TSDyuz5lva0OBRpoxvmaQOkSg779UZzBuqAbseB/rjiaktLeYs86i+UZ1RiiDfuwEogl
         ImOHBGF6zWH4XHlclIsr4PBBWT2fVxOqEv7QgTlPMCwKZCTyvZvengCbdn/HQjYm1St7
         TR1Fuiv3f3MVlOlqtTOYQ3sVaeIbG4GFsP8RvY29ZWUI9AsuszMAJwOB3kqiSewpQkFQ
         GTId4N5+TKXJcB3/DyP8UI5FAsEArWEZwyv6MV+vzx+xd9JOXHrYMPxQGsi4uVXbREux
         JaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6y38vRZkdBS5R5uwqFpYAPV0SwqgL3Ad/RHz3KFEYg=;
        b=oE2XeS0POLX1t02BceZfBmdspT4DbTKQcgFpmtwbb7qGXgIWKMi0w0xhU7724+b5Ir
         taLgKwPBQla8hYZoJM3O18yo9FyHpjbstQySZ1RAPygHW95OJcm7+bgcEJlEW1O86obD
         M57FSa/dHVjBVk78e5YqCgYvhfNdHPHkqO7RsZnZOM50D/nUbslliKFo5u3MMzgKyKFF
         Q9SBuHhBefJsT1E/GuM2B7W9q7XMz8Rd4bE88asGSBXiX1KZC0uUG5oz25Lr8praRHn2
         M9yJjQmiVmqURmtv1cfu1eb0rdNvVrrukAIhaDfpFTy1jgn4htoeldQMY4lb4KIa+Azd
         k9nw==
X-Gm-Message-State: AO0yUKVaL7jBnPA4OXEuyRHn/fB6cCT8+yoAEmPtQFm3b0awkqv4yTTj
        V/VJGnPoU7fKepRqhS2+j6MD2Q==
X-Google-Smtp-Source: AK7set/WMW6RgALtAuft2GXt0JFDI5Y2R0SGD1j3uPRf3y93eii3868Nj2pM7xYCjr1WDifLt9I7Xg==
X-Received: by 2002:a17:907:8a12:b0:88d:9cf8:2dbb with SMTP id sc18-20020a1709078a1200b0088d9cf82dbbmr37183584ejc.12.1678626839411;
        Sun, 12 Mar 2023 06:13:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Joe Tessler <jrt@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 18/28] media: platform: sun8i-a83t-mipi-csi2: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:08 +0100
Message-Id: <20230312131318.351173-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:818:34: error: ‘sun8i_a83t_mipi_csi2_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index cd2e92ae2293..1f0cc7b1ba47 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -826,7 +826,7 @@ static struct platform_driver sun8i_a83t_mipi_csi2_platform_driver = {
 	.remove	= sun8i_a83t_mipi_csi2_remove,
 	.driver	= {
 		.name		= SUN8I_A83T_MIPI_CSI2_NAME,
-		.of_match_table	= of_match_ptr(sun8i_a83t_mipi_csi2_of_match),
+		.of_match_table	= sun8i_a83t_mipi_csi2_of_match,
 		.pm		= &sun8i_a83t_mipi_csi2_pm_ops,
 	},
 };
-- 
2.34.1

