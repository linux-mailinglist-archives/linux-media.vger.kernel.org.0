Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98456B6681
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjCLNQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbjCLNPx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:15:53 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D761D26595
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:14:49 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id cy23so38400414edb.12
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=;
        b=Vy9duYu5oml7kBElCY7/Pz9DoA06T0NpAzoFB/8UDRZyaoC1RpIJ1UG/pwIgekC2Xm
         yYW/KxCTuRHcGby/RdJBOs8FfozWHhANyCcxDcfPAptsunxdi4xdisq8hxE/EovjxMxx
         WjByu21a8DRYQ5vQ5rjtppMPmTA3YfVs7EfXHLOyMmvOw/czvNHgWfZxzwLoODRI5KEw
         vNanwMyr9B6tnUqhDIuZmnrX5YVE2IR3o04xY7Cs4tE2w9Qz305VEEdxXyxoLSTvTBjY
         Yy1omhrkhMUHIvMWUnx/Ay+JP5uqpp8jwJihgHxxCnFFmOGcACEyvVyl0XheIj0cDejW
         35+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyfZXZKB4+wMo+MDBbIp2+KcuCWmp7jMlDdmZzcv/lM=;
        b=g66Qh9ThEQtjKFFgGw8x7J6T0OpqFg0y8uYpqpmI5PVwR6NrV3zD8WmcNJiTs/uzKr
         rbufKRO/R46dPxvQDuToww7vw1/MjsQneqKtw/QkFfigVfsUz/2ekj+E0K2UhiIpkuVO
         xNUyX8TSAXIJb85jXAHz4vRHAACKgXoP0BubwuypmBDIaH3YMuhEJhzjVLRFG2hjmYZh
         yzewOhfYe6hjrwZmY9vEYmam09pTyJ78ih2BfJctSNPFnolKCgPeRZ/x+8Zy2l+4d+3F
         hDqC3N/+MN91ZMhKIF5F18p2QBeCStavbMgbASpudKEA81O5s6gvmg/yTa3EXO/KjnvU
         lBGg==
X-Gm-Message-State: AO0yUKUkYqgpJJxrbiDGSVZaZauKKElhgSZnfA49tLqwkd9hvPpU2HU4
        RnnHGAkC+oxhXOHl7xMbMzdnaA==
X-Google-Smtp-Source: AK7set89zg6fjfmD/Q83CKvXo7fQ6g/JeQCzWDXtSGLthFDWRFHtX2ThlhUxvw+IDwH+wYEhp3Ys0A==
X-Received: by 2002:a17:906:5284:b0:915:fbba:2e0b with SMTP id c4-20020a170906528400b00915fbba2e0bmr18851554ejm.58.1678626858623;
        Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:18 -0700 (PDT)
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
Subject: [PATCH 28/28] media: dvb: mn88443x: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:18 +0100
Message-Id: <20230312131318.351173-28-krzysztof.kozlowski@linaro.org>
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

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).
This also fixes !CONFIG_OF error:

  drivers/media/dvb-frontends/mn88443x.c:782:34: error: ‘mn88443x_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/dvb-frontends/mn88443x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index 1f1753f2ab1a..0782f8377eb2 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -798,7 +798,7 @@ MODULE_DEVICE_TABLE(i2c, mn88443x_i2c_id);
 static struct i2c_driver mn88443x_driver = {
 	.driver = {
 		.name = "mn88443x",
-		.of_match_table = of_match_ptr(mn88443x_of_match),
+		.of_match_table = mn88443x_of_match,
 	},
 	.probe_new = mn88443x_probe,
 	.remove   = mn88443x_remove,
-- 
2.34.1

