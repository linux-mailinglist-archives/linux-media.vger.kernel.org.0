Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE3A50CC9C
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 19:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236632AbiDWRgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 13:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235452AbiDWRgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 13:36:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039141B533D
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 10:33:53 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id y10so21989895ejw.8
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FPklBFUlmlWqLuVXy6B+3oKrHAPe2W9KYrCbAlopSxY=;
        b=Zuuez3XAG2sU2i49PzW0etiCIynSqpbW3ktuqETkfLxBpXyIiXUrXiySHh6pUPgGyM
         GmBuLANXqoDcyR3ohe5bGooD+QYC79g1wUODctvs8FwQNzdWYVLNXgvJ11xC0bGOE5/S
         AUIaoaIceXAoEhdJx7ZkD2+lYtQs9jhGgN1WjSXCtgP9Y1+6RyaSt+7/+GTs2WXYyKmN
         x3Yyky6bF2Iux6CzpZyL/LYOmbDoIQco1JR80MEo8v8XR6+JcZy7kbQVDHf4rB77BLde
         Tque5KqfFReQpNf01t39lCrERDCKR6xSgMqpssRHbJsT/wMURpiJhiSL/3BBh/yj0TRF
         p5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FPklBFUlmlWqLuVXy6B+3oKrHAPe2W9KYrCbAlopSxY=;
        b=LrRybkMlEw2OudY6R36XG15Blt5TVHe1DSEGRzrCsvXeExa9PKNbITiQQUjjB/wZrw
         pqcE+C3yb259QxviequnrD/GcZimYEvU1861O5G5j+YR2Y8e2RBiAFt3cqlsPapAoroR
         lNyaSR3/Ti+RF0r3M/jBL/EcIiz7RN2/EkpdWBknHhAwEDFh13Pre1zASA4p5rYz9eXX
         JODyNCpNjiYI9I69QNyzofcHLozax7nVTo6CH05qHOVQ9VVpNX4BLVuhO5uf2wFl086B
         nf1yPQ5MlliKgfO3ozvF2nYmUUqHNkZ8ACXxemKk/2sFvi4hZUn5wZqOCABv0PXoqdbW
         HukA==
X-Gm-Message-State: AOAM530rMAVjCxm9vo0lLgYfSica26QJ+JQMV0c9vIKGea4JdVkUkjgw
        vG/itPCA4f3Ju+qYXo3nSE3fkQ==
X-Google-Smtp-Source: ABdhPJzX1ijLSyZOHOK2ZNoevNPGU8n24ZXLdosWH8eUXrGskF80qQ+kEgwgsJzoxOJwjbMFW0Sh4A==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id s5-20020a17090699c500b006df82154ccdmr9278893ejn.684.1650735231609;
        Sat, 23 Apr 2022 10:33:51 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm1882903ejj.142.2022.04.23.10.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 10:33:51 -0700 (PDT)
Message-ID: <10d5f3c7-28a0-4337-76d5-b99795b9de9e@linaro.org>
Date:   Sat, 23 Apr 2022 19:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add vdec support for RK3328
Content-Language: en-US
To:     Christopher Obbard <chris.obbard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>,
        Alex Bee <knaerzche@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220422133803.989256-1-chris.obbard@collabora.com>
 <20220422133803.989256-4-chris.obbard@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422133803.989256-4-chris.obbard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2022 15:38, Christopher Obbard wrote:
> The RK3328 has an vdec device with dedicated iommu.
> Describe the device and required power-domains in the
> devicetree.

(...)

> @@ -660,6 +664,25 @@ vpu_mmu: iommu@ff350800 {
>  		power-domains = <&power RK3328_PD_VPU>;
>  	};
>  
> +	vdec: video-codec@ff360000 {
> +		compatible = "rockchip,rk3328-vdec", "rockchip,rk3399-vdec";

This does not match your bindings (according to bindings is incorrect)
Did you test them with dtbs_check?

Best regards,
Krzysztof
