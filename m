Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF06FCD49
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 20:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbjEISJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 14:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjEISJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 14:09:43 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B8D1713
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 11:09:41 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so61377707a12.1
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 11:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655780; x=1686247780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOxLtKQQVjzWmW6oMf5arrESUTg7L76NrXcLY8eEWIY=;
        b=h/Xalg+73qTYecR2RtFtm3tuJpHj9tjuvX9Eoeoi1yrKT6S/qlpEjSxNWyP0Bg5R+Z
         c6n1s3h36fbep6yxERo9p8+xZFVL/VRQidHslyr48QNTYB02rQyr3p26ugouGKwsuUpN
         6bSC69Rj3wmQlhIz0ngfGctDQI311hlnJfuss4MqYdPzdax+834fd1V6hf/ICPiZANyR
         YQHv17bGlOgnT3jZVr3of2u0izPDQNgKNs87xG/PTlPxme0t/+1mWurd6oCVUWVSHorh
         yVeNNHcnMpcRpv/dz6zty3KMklR/nYFb086yJuNo3GrrPqStPUJPA2qto7NJHw8y40LM
         1yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655780; x=1686247780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOxLtKQQVjzWmW6oMf5arrESUTg7L76NrXcLY8eEWIY=;
        b=BITGtYroJsVDjzAtUCVRyY/uMcDqUCH6CfGpZd8142JDL9yHtqXlzDpU5G7levNd1Q
         1pi+YW2l886Mqe0foDLz5RYKsjiFclpOCLmwfRm5dHKN5a3S9Yw1KcmReJI+890jh1lv
         Rs2KO4H1hLQC9juhXJrDkVIDfyP7fJeK0ImlgtWgxcP/DE4L0ILYCF1dQzutBmDfIH59
         ouhN7v6QpPx5BSvXTk1otQWF1kGj5ho3QqscFh5AQFStSpbOhVAmGXiN1tSfgD1iIqsw
         +9j1YdBXiavtxjdTTyD7hvIyHmR7tihQsAQFOOr7zw4C32RZwl/xt6nqrGbdgwnREUnA
         dH6w==
X-Gm-Message-State: AC+VfDwmi29r4e811kcx2gdk71UKLU4uk0kYWsAmbbaq0qoQlaYBDl4T
        8r/HjxzjtvKDf9YNXUGSm4EIIQ==
X-Google-Smtp-Source: ACHHUZ7ZP9TpSCN16a7TGu8HBolTKycKVwrMz/AgCz5Pz6hGWhLH011gKjd/yBRjPNbci8b64gxLLA==
X-Received: by 2002:a05:6402:34c9:b0:50b:c350:f9ca with SMTP id w9-20020a05640234c900b0050bc350f9camr14480931edc.10.1683655780065;
        Tue, 09 May 2023 11:09:40 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:39 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 01/13] dt-bindings: soc: samsung: add Exynos4212 PMU compatible
Date:   Tue,  9 May 2023 20:09:28 +0200
Message-Id: <168365575563.242810.473604395196843985.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-2-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-2-aweber.kernel@gmail.com>
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


On Mon, 01 May 2023 21:55:13 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> back the relevant compatible.
> 
> This reverts part of commit c40610198f35 ("soc: samsung: Remove
> Exynos4212 related dead code").
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: soc: samsung: add Exynos4212 PMU compatible
        https://git.kernel.org/krzk/linux/c/8a19d4a1508c62ff28ba427c3209cdb57379d325

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
