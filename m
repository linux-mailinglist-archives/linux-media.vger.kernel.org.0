Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 500906FCD6E
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 20:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbjEISKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 14:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234627AbjEISKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 14:10:00 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61B94EC5
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 11:09:51 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc3a2d333so9583585a12.0
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655791; x=1686247791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy+cbzzMQuxCTrCfzjntf6kXXVEyP3ei1AGAzgxK3L0=;
        b=NPeP8kTFznlWkRMqcClddaeKDzmkjQbgNMwJxBfaSCN0pSkjTnuATgpYWNKk8HP1kH
         pGGpL46W7oww6yNoG0OKriH7VQgtwHYt4Kktq40HB1/WXQhC3ObC8//5Ui/BVPtsoOop
         BBWNXAKjB8XeYJNq5O9CnOS+QIYEprH8BtQHesWyflL+5DB3+7asFS01Vk59YlI5LxHX
         ANBO+LgErYOlDkUucmnl7hE5hasWOhl4EmRs7qf3idPoO0yM3EBiLPLK85/mDn/MnPT4
         N3cZsT3Ld5wsNGYiZZgufpWcr4fawSbi7+0LnsyLiEHvPZbMFT3BBnwkfqqHtZmhLDA3
         +d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655791; x=1686247791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy+cbzzMQuxCTrCfzjntf6kXXVEyP3ei1AGAzgxK3L0=;
        b=Dpl+W+Bf0ZBWwPchBC1KWnuDRZcS2dGk1slmAbUTs2jGwAHbv6ShRJJT+rbo7/rBXL
         t6DUwz3mqfecoGd/iGEzId4WIUYgTpdDBqtSV8Dh0y8twPxGpy+IHwd2R1H1c//fM9TM
         xMblEWEXw12ntkfoIYlFVgi0W46QuFjU+niS/lVf/XznGzBWnB5njAB6C66JmuDLbDAt
         VQNZ76MmF7ADf0E8J+praYAipau7rrVH8Whqek8yY1VrNzPidkiTzZRSyQtt/JSMsOkj
         69SB0hEOhpjoCut9ciFxIjn0zEZAd2/sL3sgTw7bUc7rOtZ3alhesz+utu20seKD5RTN
         huwg==
X-Gm-Message-State: AC+VfDxVwjktnmqJMhbVq0RXNeMGQm+TNaSm+ih6welC+sHNIzCgU/DJ
        URcEDLoLgRUrtj3uMF9iZ77oew==
X-Google-Smtp-Source: ACHHUZ47HeppV/iVh2N6EUDsOtopv6N36J1VqvXDHLRSjrs44zgmwmyzGrm7QSIaJADtmRvpEvSKuA==
X-Received: by 2002:aa7:d45a:0:b0:50b:c4fb:770f with SMTP id q26-20020aa7d45a000000b0050bc4fb770fmr10993092edr.34.1683655790926;
        Tue, 09 May 2023 11:09:50 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 09/13] ARM: dts: Move common Exynos4x12 definitions to exynos4x12.dtsi
Date:   Tue,  9 May 2023 20:09:34 +0200
Message-Id: <168365575565.242810.17999495054025034304.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-10-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-10-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Mon, 01 May 2023 21:55:21 +0200, Artur Weber wrote:
> In preparation for the re-introduction of the Exynos4212, move
> their shared definitions to a separate file. Rename the pinctrl
> definitions accordingly, and adapt the Exynos4412 DTSI to these
> changes.
> 
> This reverts part of commit bca9085e0ae9 ("ARM: dts: exynos:
> remove Exynos4212 support (dead code)").
> 
> [...]

Applied, thanks!

[09/13] ARM: dts: Move common Exynos4x12 definitions to exynos4x12.dtsi
        https://git.kernel.org/krzk/linux/c/b4354b9761437ba136329e3f2ea1386e8d483e1c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
