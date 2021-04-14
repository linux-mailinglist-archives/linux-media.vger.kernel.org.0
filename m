Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2438F35F46C
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 15:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351077AbhDNNAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 09:00:39 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36356 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbhDNNA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 09:00:28 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWf7l-00018P-7i
        for linux-media@vger.kernel.org; Wed, 14 Apr 2021 13:00:05 +0000
Received: by mail-ed1-f72.google.com with SMTP id t11-20020aa7d4cb0000b0290382e868be07so3291427edr.20
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 06:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=irHnM0N6YXz5tYQ++DF6/Rjy5fbDV4uUdW4SKyf56fY=;
        b=m5lMtKO6Aa8GxPrffunZLGJSR8pykazME8aJNpkhNHWUelrt4NBLTJAHF78cpw++cz
         o6Ycsi5IteqEwihwqEtpjqTrpLG0LJnwncrnnIwymrStRKfLRM4bHWK3YmU6tA3PODyW
         MIOrF0/n+hdDZn+f2Oyjiqu+eZIXkLF0Z4iGpJCb/gISK8cNSK4PToCZFcH8UZfd5c7A
         zVqHwELgBC+vNBJesENFQ9hI0pBOY/VLYiHENeVrQB1clF9j9TiOYideGjUL7nzAoSyl
         3Q0t9YuqJBV37xVRnLOmv+EqVJDOAsMdxzxbSO9pJIzQszR78waQ6EH9ZRGi8bGlI7vK
         7LOg==
X-Gm-Message-State: AOAM530Wpe40LLPH9b69XDj7tKgTppqBWzeHm8wdEx7PWvCdWc76C18M
        P8gxzZPCVT0ErJMQ2uIVfMQ14dCW07dkcA1kThHxUnVFBRIucW1wjLg1+DvxIgX1ohsvVCh8b3n
        nbh3b1D2XOx1+JaGjl87O2FuoFcpmg8rC26N5Iq7B
X-Received: by 2002:a17:906:af84:: with SMTP id mj4mr18235696ejb.195.1618405204444;
        Wed, 14 Apr 2021 06:00:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTkebU3A/QNq+HZhYySOXaAmDUrYhKt4+4jSXk3XZFDrf7d4xCgORuv00qre/OyoVQMCTqzA==
X-Received: by 2002:a17:906:af84:: with SMTP id mj4mr18235656ejb.195.1618405204218;
        Wed, 14 Apr 2021 06:00:04 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id gb22sm9891595ejc.78.2021.04.14.06.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 06:00:03 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX
 SBC board dts support
To:     dillon.minfei@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org,
        krzk@kernel.org, linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org
References: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
 <1618383117-17179-2-git-send-email-dillon.minfei@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6d8a5d4c-b741-dc7a-7cfb-eb66a642cb6f@canonical.com>
Date:   Wed, 14 Apr 2021 15:00:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618383117-17179-2-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2021 08:51, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> The DaSheng Com-9xx is and ARM based signle board computer (SBC)
> featuring:
> - i.MX6Q
> - 2GiB LPDDR3 DRAM
> - 8GiB eMMC 5.0 FLASH
> - 4MiB SPI Flash
> - USB 2.0 Host/Device
> - Multiple multi-protocol RS232/RS485 Serial ports
> - microSD socket
> - 5V DC power input
> - HDMI1.4a,1080p@60
> - RGMIIx1 Gigabit Ethernet
> - CSI0x1, connect with ov2659
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> v2: no changes
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 297c87f45db8..24bdfbd4853f 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -206,6 +206,7 @@ properties:
>                - fsl,imx6q-sabreauto
>                - fsl,imx6q-sabrelite
>                - fsl,imx6q-sabresd
> +              - ds,imx6q-sbc              # Da Sheng COM-9XX Modules

You break here the alphabetical order. Should be after dmo,imx6q-edmqmx6.


Best regards,
Krzysztof
