Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA0061E0D8
	for <lists+linux-media@lfdr.de>; Sun,  6 Nov 2022 09:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiKFIXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Nov 2022 03:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiKFIXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Nov 2022 03:23:50 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12C9AE77;
        Sun,  6 Nov 2022 01:23:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id d26so22948940eje.10;
        Sun, 06 Nov 2022 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqOjl3YDp3QYyk+XJ1fvBqeCjQn4CSk3UbMru12Aw9k=;
        b=chtVFA0fINNDwSTrhNohv2ylebukOXjdIOLme0UNr0YKQBTDy5BFLLXn1ewMdByTgV
         OmkvS0UcU2qlF90CPy07nGMslYCsloBfFa8VOEUDWISPAo3UKfASK4iRs4PzF/qoeDfn
         AyTxOgLESYqCA9yoE7A/kiM9n7/OkRNprRF4Rg5juH6GjCXmdxq6v1YGW1I2D/NEnWt5
         yJN/AIjkaI3/PYHx9omSUNs8S5uWR4lRLeMva+s2FphaOMlT430DngI6TRKxJQJLFuTs
         y21OboH4Y0GMFmNNMKpVAufCFWU5EPgOb32vSjBilLeZrrj2zcgql2c9msTezP55JHc2
         nxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqOjl3YDp3QYyk+XJ1fvBqeCjQn4CSk3UbMru12Aw9k=;
        b=h+yVDyvd48OURAzWd/tdBVGYdOHCuRvBmo1XYP762gajjDYLs+gYxfzH0hWp2MLUT9
         8o/TbMsEWu0YRJvP6nSVYDsFda/9N+jBYgwTNTnExN0/MHfKakwV+q4maRlsggBQpdLE
         6DUUR+BOM9RRQ+7wcXrzqgiYWL0AcVJfkzOv8Vt3Un4aZA5kWXMH+TC9tBI6m+pdQk6X
         OZYwvShtxjC8mLU5u0SwJ4jpHpVvV2zndXmcICPG1aGGt2ipsocrz039Gyj5qlI8pl2J
         urdeVncnq64iibn7rvso68SUEWaKx1zsWrS6PA8Og/4xd2ReH3orXh6TcR/fP7WSKhSV
         jfBw==
X-Gm-Message-State: ACrzQf28xRSsPR03rn2pp652/o4FwM+6pAccN9Yu6D7FRL68wjARIJsT
        tZsboGlm8O05ArsDJZltKR4=
X-Google-Smtp-Source: AMsMyM6lL15jO4UmwUaSfbq3sXOjsrZl8ilqlrBJASTBMYjpaSCB7eW0FcFUAg6mrxdez4OEBMMVrg==
X-Received: by 2002:a17:907:3f93:b0:7ae:3241:da1 with SMTP id hr19-20020a1709073f9300b007ae32410da1mr11357768ejc.177.1667723028212;
        Sun, 06 Nov 2022 01:23:48 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o19-20020a170906769300b00722e50dab2csm1861200ejm.109.2022.11.06.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:23:47 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 7/9] ARM: dts: suniv: f1c100s: add CIR DT node
Date:   Sun, 06 Nov 2022 09:23:46 +0100
Message-ID: <1876938.taCxCBeP46@jernej-laptop>
In-Reply-To: <20221101141658.3631342-8-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com> <20221101141658.3631342-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne torek, 01. november 2022 ob 15:16:56 CET je Andre Przywara napisal(a):
> The CIR (infrared receiver) controller in the Allwinner F1C100s series
> of SoCs is compatible to the ones used in other Allwinner SoCs.
> 
> Add the DT node describing the resources of the controller.
> There are multiple possible pinmuxes, but none as them seem to be an
> obvious choice, so refrain from adding any pincontroller subnodes for
> now.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


