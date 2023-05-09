Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBEC6FCD52
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 20:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbjEISJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 14:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbjEISJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 14:09:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59881199F
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 11:09:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bc040c7b8so9643196a12.2
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 11:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655784; x=1686247784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs9IksAZdPUWZueIWev0YHwP3SfwTJngjTY4HAluqu0=;
        b=k3tXANjes4g05zH+EiJsegWVxlkJzp41oNY3t1dshZB/kkJLq7LyekAftEzAadwf3U
         10Xc91NiUZEeq+UdneApZrEHyTkl18baPlYBxM/jJeEzJTpktNxhLwWB8UP1qMZEHRPP
         HxZ9j5syMXIa5W2CbsnzlM1ZWiauPeJOXuaDRRlY/2ZAjQZtsUVKpNWe9Lt9owhhEF5c
         dpwlWcc7SNI1TSBZMLrOf6Z0ZsQIdhhkXzypjItx/lsFs4Sn5+HRI7IQkvdtCLTBPZnq
         aq18PWOcv/9gofTZDflgIF2QuHx4juSZoxnRcJYpN0IqRzVl9KB/HAParfVePmCfOVAt
         DiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655784; x=1686247784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs9IksAZdPUWZueIWev0YHwP3SfwTJngjTY4HAluqu0=;
        b=SNjRqBu0sWBFkMOWVvP4PQTCzLE9lRkBhm8P23jgTM4oDySiHq6et3SniXkBW/LS4n
         0VFRl0f3im2gXOKDUvbiJJ5rxlEisv+vQRD/mz7X29F+gMtV5PkMVsEPmOpwbNCRySBO
         fP5hSRQ0hHpOf6N060azoVowYC/jB349LGY3+kbCQ3IL83bjboJnu/x16rVmWWf0Z+NL
         Z3OkbB2DvKz0CicyS/cXv24WgDxO/cP+aKULfKPsXDyJOLWNZFMy3wNni7ASwR3KONtC
         0L09qUNHzHUMwG7mqBcnOYz0+9dlXF4GgoPF/Zyx7/b6jJVQhNHrhGLe2aaF5EtVAgNc
         moig==
X-Gm-Message-State: AC+VfDyBwxBN3DNRw1C/CEC5e7yCRlHvpvxUhMGa6yicBoM2ADObVPTp
        B6zVvJaSzfaj8wRGT7vPw4Xv8Q==
X-Google-Smtp-Source: ACHHUZ5e5xBUZoC73JkHOAuYZol8+WzHPQzUCswmjDbXMuKS2byDzPvO1tY0/0dKFOjnVbNh6oDCWg==
X-Received: by 2002:aa7:ccce:0:b0:50b:c085:1991 with SMTP id y14-20020aa7ccce000000b0050bc0851991mr11920150edt.19.1683655783875;
        Tue, 09 May 2023 11:09:43 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:43 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 03/13] ARM: exynos: Re-introduce Exynos4212 support
Date:   Tue,  9 May 2023 20:09:30 +0200
Message-Id: <168365575564.242810.13469552889679829335.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-4-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-4-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Mon, 01 May 2023 21:55:15 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> back the relevant code.
> 
> This reverts commit 9e43eca3c87476f75680f472ff3ebcd85f357b86.
> 
> 
> [...]

Applied, thanks!

[03/13] ARM: exynos: Re-introduce Exynos4212 support
        https://git.kernel.org/krzk/linux/c/4e486a650162a20e5c3c7987715f8297c84c85f4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
