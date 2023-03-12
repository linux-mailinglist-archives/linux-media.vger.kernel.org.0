Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7386B666C
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjCLNPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjCLNO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:14:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EF6206AF
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:14:13 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cy23so38398575edb.12
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfEjbOEBC8Ag5735P/rqZiEX/nqcdTDOC9PYAPQl5HY=;
        b=uissALC9Qm6G3yTfi85yX5AZcJ4Dc0T+ZSTTKU0wpK9U2V+VDFH343iZjKC5N4s8V8
         Qp9COEJvlzCvWlb23mcYWEdcMc9pbjSuLJ33+tz+X+jWMZtcLKOcvkPj2fJY7WdI8v6P
         qeowegW6LOAq8GiD1h+HIkQ+puCRyyQWHwdYCcrlPZ6Vh93gluUCiol9RzZfw0oufC3G
         DKN/V59iphzKV7hQP5j1PbiPzW0aKpCKWusOS+ijCjSjX2qXzgzuwPhhxcj5tD8u+jqy
         gwla21lfQPZJNhCA9eIisu6WuJeZDVUE+4YaZsUYsp+KLTLS/bKPYcuYJMrZOeTcl/iv
         stDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfEjbOEBC8Ag5735P/rqZiEX/nqcdTDOC9PYAPQl5HY=;
        b=4uW2+ffTVAgp4+QNtuKpTj7obpX6WkD/3KEWp/enCLzS6Hr0+C7/UGpTUgY+MFtjFT
         C3qNoiMwaiUUp9qN6So9rPhryC7FJAyh/nbCk0McBCDAhuRn6Zzui+8+U+IUoWd/NasU
         6ON1I3DSGVKy8vlarQxpiBfuo4RZckAKYyhSn6Hiuj3+O76wSEdL8XTt9e/Y3WuU7ce2
         E2kxdbkPw8vuO+HILC3OmwKzzPZgNITfJK7WY52/pjeS30lUzE7NFBS4bSWDn7A6oiMm
         ZsNOnVgXdPN0Z5gwa728mdNm3mI6xhPifNN5F9VXUpe4K2OreUWJM3rduNxj2k3ux+wE
         wGLQ==
X-Gm-Message-State: AO0yUKXpTQPTtmchCJ88lWAau6jLOgiTe/A6KgfLeb3DQCnxUy2PZ4jH
        SkeR69yL50C0xzeAfc4baFh+Ig==
X-Google-Smtp-Source: AK7set/qUd+AuzKeWJtvFJW5YvrmY0+P99WMaVJpgFheOKbbtpLVYddA6FcuMGTWaLuCaaa5fxGzrQ==
X-Received: by 2002:a17:907:7e87:b0:8b2:e81:df2b with SMTP id qb7-20020a1709077e8700b008b20e81df2bmr38467057ejc.44.1678626841335;
        Sun, 12 Mar 2023 06:14:01 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:01 -0700 (PDT)
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
Subject: [PATCH 19/28] media: platform: mdp: mark OF related data as maybe unused
Date:   Sun, 12 Mar 2023 14:13:09 +0100
Message-Id: <20230312131318.351173-19-krzysztof.kozlowski@linaro.org>
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:31:34: error: ‘mtk_mdp_comp_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index d83c4964eaf9..37f2dd08ecec 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -28,7 +28,7 @@ EXPORT_SYMBOL(mtk_mdp_dbg_level);
 
 module_param(mtk_mdp_dbg_level, int, 0644);
 
-static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
+static const struct of_device_id mtk_mdp_comp_dt_ids[] __maybe_unused = {
 	{
 		.compatible = "mediatek,mt8173-mdp-rdma",
 		.data = (void *)MTK_MDP_RDMA
-- 
2.34.1

