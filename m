Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2E052CD85
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 09:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235011AbiESHv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 03:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234962AbiESHv1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 03:51:27 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1E91AF3E
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 00:51:25 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id j25so5887986wrc.9
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iM6CKxNIjkJ6jtgcoGB6e3JO7TA8aFCAtiaLHSOsVJE=;
        b=V4UXNqgMQHzxZLvO6OeUNoo8CEMuEAbelwrlkWZ1T3t7ZyDQvYhOG2E3AVIXwlLZ0t
         oWVp80/aNSLp+Bkr5ZFgc5o7EzGkK+43Tdnyvsg+WMDqSwpv/7Nrx12yfMKFuO+9aETp
         zU9tupNFIRgS7dOUYEHuEiy2SKo9as/nzIaIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iM6CKxNIjkJ6jtgcoGB6e3JO7TA8aFCAtiaLHSOsVJE=;
        b=0e71w1d+7psG5mhv76Of/QRSsN6tkm3KRCKvzRE5EAmSchOPZ4h08w4OHe93BF7xn+
         qtBGPn08d2eIbc0L1J7q+7owyGOZ8kNNQwqXJPZcsXQZAGGaVElGnSBVo91dJBddLzbU
         TqaCYiN80nfomX3OdHgjoSSKLJCaiuKK761tx/hSAxocHyuOjhC4q3the17BszAJCou8
         Tdlx4fzlIWBwpSjG3MsymKJxU3vxrO/UIG93WWx71ycGUvMSU0vxQ36mb2cdEBbzVKmS
         cYcTpV6uZQKHL+DK0I6JoKfPZ8f904mA4DuefI4R++oGFOQSl5sTPh6L8p0V+OU/KbkY
         YYIQ==
X-Gm-Message-State: AOAM531Rvat0qJvGDVqdDpmwWUitbWXIoq9jRSY37lg5SuZ1at3I+Gw3
        TjB2CCsGtjO2zq2Rq3XUWO7MjQ==
X-Google-Smtp-Source: ABdhPJyXqPOJv+c6R/rrewe0H5MWdpHADVjc2q4n28Oz4QdT4PjkGZFZrzAiy9A5IfLUmqPeO0UxDA==
X-Received: by 2002:a5d:64a6:0:b0:20c:64ef:c9cc with SMTP id m6-20020a5d64a6000000b0020c64efc9ccmr2983587wrp.190.1652946684161;
        Thu, 19 May 2022 00:51:24 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-53-154.cust.vodafonedsl.it. [188.217.53.154])
        by smtp.gmail.com with ESMTPSA id c6-20020a05600c4a0600b003942a244ebfsm3370254wmp.4.2022.05.19.00.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:51:23 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     tommaso.merciai@amarulasolutions.com, linuxfancy@googlegroups.com,
        linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: rockchip: px30: max drive-strength for cif_clkout_m0
Date:   Thu, 19 May 2022 09:51:15 +0200
Message-Id: <20220519075117.1003520-3-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519075117.1003520-1-tommaso.merciai@amarulasolutions.com>
References: <20220519075117.1003520-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add max drive-strength for cif_clkout_m0. This fix the issue that
sometimes camera ov5695 is not probed correctly.
Tested on PX30_Mini_EVB_V11_20190507

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Tested-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index 848bc39cf86a..53930e28eadf 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -537,6 +537,13 @@ wifi_enable_h: wifi-enable-h {
 				<0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	cif-m0 {
+		cif_clkout_m0: cif-clkout-m0 {
+			rockchip,pins =
+				<2 RK_PB3 1 &pcfg_pull_none_12ma>;
+		};
+	};
 };
 
 &pmu_io_domains {
-- 
2.25.1

