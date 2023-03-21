Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83AC6C2AC7
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 07:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjCUGul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 02:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCUGui (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 02:50:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C70E3CE24
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 23:50:05 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id y4so55793271edo.2
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=yfBGAkzYkRznU9Ng945BSIqo31Bk5T0PtagdkfIHR2Q1BeqH5OnMJ4fsG1zFEiehiS
         KZ3/pYphUZP+d7j+TETF5ibJ22qi8JxUtbeR5/rMsVWBLbLtVafpphEGHOgtkfufvthr
         kfFqq23RxghjFGHcvf7wzurvqXl77TX0lreCe4zdMXibkctRdAIFIHy2nFlymDviILbG
         cJHWfu2Mf2f0H4Zek7CU3vs712CDHZtYrkN+Dnj8r9iTZ3wsTUFj2dPI9y02J/EmUF03
         XuUbrwNwkbxeyyaBiz152Yt33fiVzez/AHc3FxXutFCupBB3a+cT+4yKOMj9xOon+xKG
         WmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=U32qEmQFVcYFFGD1NGEZ3EtcOkTz7pAg+AlOIYbSdYgFLvQUNP+Bc4E8URkH5pTUqD
         2k2gVKwVeohWwoga3ZXkQv7tJLNUqsUeqcpdIX2mVE68ws4YcpQJ9dRGSuLEs2W+YIiQ
         YRTuizZBGBstUZxbPWKYF6He94EkajuWhqEuHbmyZD6Nc030Ucz17XULH/p1/30Ff8gU
         CuraoQrVQ4JgGncARzdy3Bj/f1zyP9QzsciftLP7DTomMvKsX0rXkxdFwF15vgGsZiZI
         coekPP8vFHJmZUqY1tRW/N/Np14SKeHA0Xpk5DnatYixOwIJ8lA8jd1UB+BKPQpIM8Ob
         5PpQ==
X-Gm-Message-State: AO0yUKVDWWX9x2neNXqYLkqbZ1/O0so1Pqif44An2t9rtec74s9ynRlA
        ApIIVN6x5EqXVgNDs6R9mMhFkw==
X-Google-Smtp-Source: AK7set8eB3GSlawOodRmMBJ+h20F9+s+seoY5Xp11h5THWtKB+BDrw+xLcE75DD32t4gpHpf4nRxYg==
X-Received: by 2002:a17:906:6449:b0:8b2:abcd:624 with SMTP id l9-20020a170906644900b008b2abcd0624mr1888422ejn.0.1679381404434;
        Mon, 20 Mar 2023 23:50:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906715000b00930894eb708sm5361112ejj.223.2023.03.20.23.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:50:03 -0700 (PDT)
Message-ID: <c9365b87-3cd5-9df6-7f2c-e4e848165062@linaro.org>
Date:   Tue, 21 Mar 2023 07:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] media: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Joe Tessler <jrt@google.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Benoit Parrot <bparrot@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20230320233944.2920964-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233944.2920964-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

