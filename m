Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACFD6B6653
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjCLNO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCLNOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:14:18 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3383E51CA6
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:13:53 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id da10so38597380edb.3
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=YAxPlJhF1+DE9jUIWYyITWyk7/AONuibeqeBOgc+dWF5fRBbLmZqbk1IYqYlHABI85
         gz1wXPUZjU5FC3mPpXfAfbwnto9A2C8UR5j79ptmQvXc8NIm93NUj7vnZscY32eF5vOQ
         MNqXBlnv4ABmODy3pYii1yEyd13GeBgb4NroSTWOAXhnpEoT/yi4gqdHK3skNRal/Ae+
         3cMpgvlN2t9T17SYFpZKlQ7VLMYX986I32TaxVNtQfKWUgod+jAHKsvNHdpkbRKt4aYk
         B2uanB4ZtOcer65Igqf0RJ3h8hJb/2Xmwgp0Xi2cgPElJofc8L4SdOxvKNLQznQt+/k0
         yqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=mOCWXbPm0SB7Bsjous1rEK5OBow3NbP76R994vimC3K92XBmiAKYmbDZHdQ2bvGrpk
         GBBCvB3xu3b9tq/8VFn6o0yPtP4FpJwcn/QDpfnspNzLUZKU/RmLk96u1S7HMeR2uBli
         W1qUxU7vg8KoM3GLnhRs0IjnqIOtF0ryp9Wx5lLgxU0VdVmtWoysN+KqlHA2Am4adsEs
         1KCIOWO/AxaW2OTq/jh91pd0IU5hUZsC6gI+qb6WJKn8z/zHA+baC6FHxs8jNLGXCz/5
         i358JBbPt5U0hSxKC9KrLOdpPFKPtiSSZRQ1ROvnQe+pPDC9joMTX6Mg9TXw/R1vB5gT
         fnyg==
X-Gm-Message-State: AO0yUKW1QKsrtG7SYhu/gxAWorODaqD4fsWPdCrrCzvNDRvpyS94AnjC
        GOG/ZaIPaFw4ZDdYGEMNYJjY9g==
X-Google-Smtp-Source: AK7set+1VMb4vP5AkQiutwwyqAr2RuSDyquikjNxXi+uMI4iRdw2RCO1AJJ8nzH1kwmE3q0OOnHeOw==
X-Received: by 2002:aa7:dbc8:0:b0:4f9:deb4:b97f with SMTP id v8-20020aa7dbc8000000b004f9deb4b97fmr5865130edt.13.1678626829419;
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
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
Subject: [PATCH 13/28] media: platform: marvell: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:03 +0100
Message-Id: <20230312131318.351173-13-krzysztof.kozlowski@linaro.org>
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

  drivers/media/platform/marvell/mmp-driver.c:364:34: error: ‘mmpcam_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/marvell/mmp-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index ef22bf8f276c..b7747c7bae45 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -372,7 +372,7 @@ static struct platform_driver mmpcam_driver = {
 	.remove		= mmpcam_platform_remove,
 	.driver = {
 		.name	= "mmp-camera",
-		.of_match_table = of_match_ptr(mmpcam_of_match),
+		.of_match_table = mmpcam_of_match,
 		.pm = &mmpcam_pm_ops,
 	}
 };
-- 
2.34.1

