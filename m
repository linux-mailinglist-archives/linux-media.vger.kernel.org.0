Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58AD06B6644
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjCLNOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjCLNN7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:13:59 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290AF244AF
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:13:40 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r15so11313733edq.11
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHdIlruO4673D+QGyV/d/vIqZ9Xg8F12PDIOBTs3+As=;
        b=nLrNJOzka6fkWMXC1NOP2ZsVYUSEIvYPqBnDKWQu8s6RUps1sloI4ULFFuPSN8KqMs
         25UMmUtDKKI+rvOaqrztIuQUMx+KVfNTpwlrsZ8kYSrgah/Nmjt3vTqtVRDktNH1Aqta
         SeX1GO/gVL0OkfCC4K6StepCYID8FBE0fqBdwf5/+wO8zRGa1L//BQ9QDV6/dmNX8u7W
         TyXVghyvIeAmohnv6gFuNrnRshHMVsfLE4DdKppPOdlEXlxnBBaUD9bEzYQkdz7C0LWD
         kVPW7AD6RynUU/RWDrgrAomkRYAf5fWyhpbU34Ogh+s7n2sZYojuS6svF5USw4YN9XoH
         FuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHdIlruO4673D+QGyV/d/vIqZ9Xg8F12PDIOBTs3+As=;
        b=SzwQydfeaa8c1plOyR/++oMfD0EwNtB3jtQHnRvJMj1xN386+yG1BIsr6dt2VANfsY
         5n+LCHq8dZy0hLcqqlSwb9/u5f57CKGeP9fGyeWU6NP+IohJAujTysQzorSPqH0okJy2
         f2e7m6w0T/imQs8Vy9+hhi5X56YdgtZj24tZLfzPjUPMbxdYedhr088IxjP0SlIs9Rfo
         YEx0mAIGed7fqgjoXcpMwUq183/c3AuNG7MMEiGwQu6ndwGzrB+T0kUWXIJbLAl9lhnL
         3M2SSaVo4ikHGqQiJudPhLV81fvRUr8XOIkdH1fdJMHi8fkgiZl5rONXMChSTuGmDuFD
         DOjw==
X-Gm-Message-State: AO0yUKXRuZ+hxSIjh0dno+vIc0KHPLtEnVvWM7pcTjUd32xVtygtfJ5c
        hM+bhA6maonMEL8eYpKcH8/E3Q==
X-Google-Smtp-Source: AK7set+ZvJJL+Mve7wJv1jb215unOxH3yq0KFIbxsDNpElm/tKBCVPXY+pyv4E67ZrgfbQD8rzw19Q==
X-Received: by 2002:a17:907:3fa6:b0:877:a9d2:e5e9 with SMTP id hr38-20020a1709073fa600b00877a9d2e5e9mr40195064ejc.42.1678626819671;
        Sun, 12 Mar 2023 06:13:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:39 -0700 (PDT)
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
Subject: [PATCH 08/28] media: platform: intel: pxa: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:12:58 +0100
Message-Id: <20230312131318.351173-8-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/intel/pxa_camera.c:2449:34: error: ‘pxa_camera_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/intel/pxa_camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 54270d6b6f50..f659abf1a22d 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2456,7 +2456,7 @@ static struct platform_driver pxa_camera_driver = {
 	.driver		= {
 		.name	= PXA_CAM_DRV_NAME,
 		.pm	= &pxa_camera_pm,
-		.of_match_table = of_match_ptr(pxa_camera_of_match),
+		.of_match_table = pxa_camera_of_match,
 	},
 	.probe		= pxa_camera_probe,
 	.remove		= pxa_camera_remove,
-- 
2.34.1

