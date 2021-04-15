Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7390360266
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 08:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhDOGa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 02:30:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34409 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhDOGa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 02:30:28 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWvVL-0008Gi-Is
        for linux-media@vger.kernel.org; Thu, 15 Apr 2021 06:29:31 +0000
Received: by mail-ed1-f72.google.com with SMTP id t11-20020aa7d4cb0000b0290382e868be07so4622293edr.20
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 23:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NRLg7NrxywR7fBvgL6LMWlW/vNtrkaaP/eQxawyhh7I=;
        b=mgnN/Ntr2eAorXT8n171TBnbOx0Wm3q67MhK9V2rGCrWNcYvKYvZrw2B8R45pJw/yc
         FToU2bT/7j6hGN9Nnz4ItXGk8pqB8KFHiaIVsSOt+b1wS53T+rsaJBf4ARqxrRh8EFHt
         3gSGPu5uMJQUDDHgnHNk4ngeFNFpHrEMfmMsBQ4KdTR27atJLgzeVxGLhIFW8gE4HRpl
         DHIw/+MJ9p9I2aABKAUEtkMRaHuDUZHQhBjF+blQJJIwxOmYXvsvHVcWBfdYR34DLZPK
         +nuWL5HcFrv5NdJKovBhPfHzWgi7DhHPitzrSb+ZogZf9m9OTpirihoTtA0a7rapDbyG
         pj7Q==
X-Gm-Message-State: AOAM531rp3taRnatZYRnAH2XnUTQemPqVf0tgUJnJ4qyqsYtcJyGEYrQ
        FkAI+oY+uL8sW3md9Cu4qz5rzVYs5+Adla2evWqjTWVL6HY03g907RjdJSNl3VJO8BSsT7NHsTA
        d5OB9PUefMbhOV/0oAJtg6JcPTbrZ9Z1FfjNOOwJf
X-Received: by 2002:aa7:c1c9:: with SMTP id d9mr2170920edp.155.1618468171024;
        Wed, 14 Apr 2021 23:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBeiqLAbwOsnwGyW73gGOeryK5nX+9isdb0+CrOw9a347lzFKbg16hzMOnuydzGrUh1LIJpA==
X-Received: by 2002:aa7:c1c9:: with SMTP id d9mr2170905edp.155.1618468170922;
        Wed, 14 Apr 2021 23:29:30 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id w2sm1259894edd.71.2021.04.14.23.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 23:29:30 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX
 SBC
To:     dillon.minfei@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org,
        krzk@kernel.org, linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
 <1618459535-8141-3-git-send-email-dillon.minfei@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <eb850981-e8bc-0cee-734e-475f79ea64e4@canonical.com>
Date:   Thu, 15 Apr 2021 08:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618459535-8141-3-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/04/2021 06:05, dillon.minfei@gmail.com wrote:
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
> v3: move 'ds,imx6q-sbc' after 'dmo,imx6q-edmqmx6' to follow the alphabetical
> order.
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
