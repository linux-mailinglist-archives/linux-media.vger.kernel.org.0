Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F336B6680
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjCLNQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjCLNPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:15:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9563B52929
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:14:37 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cn21so8317389edb.0
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz58BecKJebSQJXrlMMgq2KIDHoDh3NjA0FUivRICtA=;
        b=W1k9mfbGVEpQdjChyYJDNiJ9VR3PjfpZ73Gq0BDfuM4iMuvTnkBm2I6srbznEPwaJP
         THlB69G1mME7ojXh1+UnqUHgcM8NL3ZZ2wZAuhHFPilxMAer5hLfyLrT4pIdLtcQPfeV
         aXcgs+tx5X26yKopWPTDySMt5uxnpFkncJirZZQ3J8ya+8XQBT1WQwS+7uUljarXpIf8
         QlxnyaM/KalsZOSCpQHfqVfSJqyUGSLwkvQr84rm96y4zG1J7ohxebgv43j44n8p6esQ
         bTG+gP/Vnvv6vBEFNgPDZCQbrGPBjuTxP7W5ds8ev/FiQGo9mQ74eR+q80XVqAmL64o5
         jNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz58BecKJebSQJXrlMMgq2KIDHoDh3NjA0FUivRICtA=;
        b=V0PBnAz7VUBGbQz7tlrGCMOYOGP5gf5psr4joDwLlESuMsJ9s11Usfu/2WaEKopcjd
         N8u82Q16FF8/0mMjDxBxNnt8HR5l8sBNhWhFauyzRtWr8CY+BY9xFVrJg5fkpeQAVkcO
         Y4M3s+yJlh11rZCwziudlpa5VDEFzSpoSPveK/CspZnul51ySBfOk4fIJrrTCdqUAdYY
         AgCEJnJqkSzThHybWhPMupMiYdVXGHVE0lgCt5IDNof3qksVIuoYkVgKwDc5K9Cb9JjQ
         NT1YFU2ioEZYN5NvhVNyfliH//5gFfN9omyUlkPnNvpCzcsuvgtbucQ1gB3Qzwn+dmbP
         zHWA==
X-Gm-Message-State: AO0yUKWim3huhtd8PbylMGJO6t/FyddnEPWnvG3MiyXbJTR62knZxUDB
        2N0XeQADS+AHGs2dstVfzRT+YQ==
X-Google-Smtp-Source: AK7set+m0iyDhLybbQra1Mh0tgoInoxAaZlg1joIRnjfCJVkuIWQPofjhK4P4YWPgVu74VDSkXKUDg==
X-Received: by 2002:a17:907:2d0d:b0:903:9733:5ef with SMTP id gs13-20020a1709072d0d00b00903973305efmr38046533ejc.21.1678626856739;
        Sun, 12 Mar 2023 06:14:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:16 -0700 (PDT)
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
Subject: [PATCH 27/28] media: i2c: max9286: drop of_match_ptr for ID table
Date:   Sun, 12 Mar 2023 14:13:17 +0100
Message-Id: <20230312131318.351173-27-krzysztof.kozlowski@linaro.org>
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

  drivers/media/i2c/max9286.c:1707:34: error: ‘max9286_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 701038d6d19b..ed932ff9ec74 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1713,7 +1713,7 @@ MODULE_DEVICE_TABLE(of, max9286_dt_ids);
 static struct i2c_driver max9286_i2c_driver = {
 	.driver	= {
 		.name		= "max9286",
-		.of_match_table	= of_match_ptr(max9286_dt_ids),
+		.of_match_table	= max9286_dt_ids,
 	},
 	.probe_new	= max9286_probe,
 	.remove		= max9286_remove,
-- 
2.34.1

