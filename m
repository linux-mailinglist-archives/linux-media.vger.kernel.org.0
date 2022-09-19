Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601F75BC445
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 10:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiISI0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 04:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiISI0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 04:26:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BAD1E3E2
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 01:26:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l12so32970211ljg.9
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O2MgMIBBQEimoJdZbXcMWrscXFrilAA+hSe/6tn94n0=;
        b=MnzF7R+IGhfKCspZo8gZeidv6vRNzFRZYpqvo1Q5kocJ07LiCnYhoOlT/LOAsqz/Ba
         Bfbl45vt14+WGz48V514izOMO9xu73v34/ecgQZZQc+aPO2haWgfmAG62N2w7Efmw0cu
         iG7WpGkiUyWKViispqUf3trIREmDG9iDmwq/Naf+dLaBZCJ8qH0AeYO4O0jfQ8CJWd1I
         1OXNOskQ5sPzzOnYLx5iijG+Xxt6eawPcUU7FpQGA1CBg/FDyiVixQKlxopOJ+/boZ4m
         BAHQagAWzXoZEWGwqJiapGsTf1Szg+L8klu9jpsDxmEpOeUveZnldkSIwSDxK4lC4bbG
         XIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O2MgMIBBQEimoJdZbXcMWrscXFrilAA+hSe/6tn94n0=;
        b=ca+s9Xnjcnh8+OQn3GX0bx271xAYB4B4fVX4K6tfxTLk+n2TMhlTM5kYjo5LGgQUd1
         YdOXpKWYdXhcqIKEiQkjae5TmSOA6g57a32LEgAAxHlzILjrA5W/oGJsknhzFMF4g1VQ
         3QAcZHrBlxwGvreMJE5ps0TOw07ZmZIeRQ3MqcNdFNNr4XLMQPOibEBu3IDlV02kdmMv
         dhAIlOvX9GlWLdBH4Ok47qcihwdsIc4Fu9wjxKdNvM4iRJ9hTSRe5+DAAd0QCFcgFSK6
         T0stAY+ZqZIwsRrU1vkkgAUOWjuNCFv5c9J5QjDXSVI5Mgp31RvRWlY2hj8QPpIv2dQ/
         nsFA==
X-Gm-Message-State: ACrzQf0x+6s/7AsYk9x4gUj19LV7ra4UF7lcmU1s0X2UYCG9Oy1p/7Aa
        ivBeOVshK8QA27vED9Be8fkNxg==
X-Google-Smtp-Source: AMsMyM6R0ZkLgcMBtQPLr262w44WE2V1Xm7RMzUhBE1s99vWW45VnpQoNJYie7PdXEyCe8MY/aekDA==
X-Received: by 2002:a05:651c:1795:b0:261:af46:9d12 with SMTP id bn21-20020a05651c179500b00261af469d12mr4837011ljb.122.1663575970979;
        Mon, 19 Sep 2022 01:26:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 15-20020ac25f4f000000b00492e3c8a986sm5082846lfz.264.2022.09.19.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 01:26:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     mchehab@kernel.org, alim.akhtar@samsung.com,
        dmitry.torokhov@gmail.com, linus.walleij@linaro.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
Date:   Mon, 19 Sep 2022 10:26:09 +0200
Message-Id: <166357596576.15357.16775014746077893385.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913164104.203957-1-dmitry.torokhov@gmail.com>
References: <20220913164104.203957-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Tue, 13 Sep 2022 09:41:03 -0700, Dmitry Torokhov wrote:
> According to s5k6a3 driver code, the reset line for the chip appears to
> be active low. This also matches the typical polarity of reset lines in
> general. Let's fix it up as having correct polarity in DTS is important
> when the driver will be switched over to gpiod API.
> 
> 

Applied, thanks!

[1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
      https://git.kernel.org/krzk/linux/c/f539422ddaff0680dd1d4ad94df11be4703ccc93

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
