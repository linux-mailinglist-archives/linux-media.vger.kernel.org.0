Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562F93FBEB3
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 00:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238797AbhH3WHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 18:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhH3WHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 18:07:43 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7ECC061575;
        Mon, 30 Aug 2021 15:06:49 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i21so34354431ejd.2;
        Mon, 30 Aug 2021 15:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dVz7KNxNw9dPiD9LMKJTxCQFFumEXaLDXEl8yIFI81o=;
        b=oyV0YgMfgDuf0NQe8PGi/vWw6gTEujwa3IrPoPmXIGZYQ/6zTxalOVEeBHBAj3uFLZ
         1Vg9Ae50Tv1j3tpP1wkmpVr1/Vz5baU6YKW97ZJdMgiPJkN9TWazrTHvMBRxkU0nw+kB
         P0ExVIZGFQ1uamubwwBAfgg+Azwty/KZmIv0mLYvLSgbC+qMuPNBnyYCu8BOK6HylJEe
         jbcCixzBOt3kwvYlY8SU9Sqtlqq4uhYAtH56XBFji277Sr/3ekOq3W7bCsMH94BhE4V1
         bk23K/mjg6t0GpHPIJaqBJe1nutrH1YqJP9LJIv7tNI80VkPhF4OYGS5sOF6OI4FBj3H
         CRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dVz7KNxNw9dPiD9LMKJTxCQFFumEXaLDXEl8yIFI81o=;
        b=KnYcEJxuLUg5itOYBrRb9LgWHGh1qkqYWMo5Qjh9f5rG9REoeaDyoOSLLPpZPlhsWz
         GhkBGs55msjKF0IcDFLA+7ChoEpaeCBdPFkCtN0tnHI5qWPS8enyprqugFPMNja/ui9p
         dJcVVHl6rx4+gW8o2yleGsqitZ+VIJVyjqUF8urGyvw5vP8UVcs5OB2OwTS+R2Kga+Kb
         6RiJIje1zwEROhbmZOtDQgyyadCTiDCmEVPd9xN4Fwx0btBcMF+L0lD8jqUeBal6QiBF
         rkAzxLrYX5F/P0SoHiLEymLgc2rXNiLsSNOv2lEiXRt0FeKEJ3Adjl6Lo4Luex9CaXMa
         lvxQ==
X-Gm-Message-State: AOAM532/oDkUD9XV83VvKxpjkx3GvN4mQ8v3bmI0/4D2AHAGjt7SxVPH
        02wOFELJsGfDC93qJP6i5p6hlqigF6XZnF1l
X-Google-Smtp-Source: ABdhPJw8aJhh+udRsP+f/0yjasvxRfiwvoKOJsTIHAwic+oU4cgejSuEQaa04/YieQ01NqaZvbqZHQ==
X-Received: by 2002:a17:906:8481:: with SMTP id m1mr27749345ejx.459.1630361207997;
        Mon, 30 Aug 2021 15:06:47 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id r2sm8297876edv.78.2021.08.30.15.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 15:06:47 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] dt-bindings: phy: phy-rockchip-dphy-rx0: add
 support for tx1rx1 phy
From:   Johan Jonker <jbx6244@gmail.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
 <20210830180758.251390-5-mike.rudenko@gmail.com>
 <60aa055c-d872-3e5c-3c85-09300215a60e@gmail.com>
Message-ID: <a9ce814a-d23e-2f5d-0299-4ffbb76609da@gmail.com>
Date:   Tue, 31 Aug 2021 00:06:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <60aa055c-d872-3e5c-3c85-09300215a60e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mikhail,

The file in the link below is in need for a YAML conversion.
Could you help?

Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt

- compatible: one of
	"rockchip,px30-mipi-dsi", "snps,dw-mipi-dsi"
	"rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi"
	"rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi"

On 8/30/21 11:00 PM, Johan Jonker wrote:

> Some comments below. Have a look if it is useful.
> 
