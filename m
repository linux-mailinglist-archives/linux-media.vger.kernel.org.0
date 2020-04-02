Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613BA19C0F3
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 14:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbgDBMQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 08:16:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46848 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387730AbgDBMQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 08:16:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id j17so3856549wru.13;
        Thu, 02 Apr 2020 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9100ZMfQ3eWaJVwdNq9pSQeHCEwHDV/UJ/zuKVucMxA=;
        b=ALLV3AjWxKR07II/OzlDnRe+odhQFSFArcf8cWjQukJmd6WXsg9+vyfD8DfKX9gWMN
         o85KGRmQSCApKdFnuQRIdkmUme7sEKjqw5SXiIFrjdPkCVpclHE6AukhNWeb6yNKOhL8
         mSBvda/9k8hhDcs8hxq7Ir3tcfWNZFcNPUaqnc4VZGHD9WT/x2/UGQ7N9VjavMYukKnM
         K8ULMWCC9wgUMpVyfUQ+xkB0QzfidY2ZSgy9eCRnT7acIbLf8oyP71jF6JKhMbcYxj4Q
         HrYzq3IEOcIOy3d+DvXGwz17yj0IpLyHJbIGtAohcctCquPEvV8uOKDwrwF9JRdhOKkc
         77Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9100ZMfQ3eWaJVwdNq9pSQeHCEwHDV/UJ/zuKVucMxA=;
        b=HKHDqahQqZ2Rmnr9v31Oypl1kFosLcJzRYsApOh+2yXMCJuWrgTlHipCl28mgK4X0c
         2QYhgip3EhYMJCPR/mJsT33D6zxnt7rEUb1Ij2SlZt6pd+TQKHL0SI0IQwPIp8KRoz5i
         1gZ14JJu9eyBAkCukK4IihzSAjoYkmBeX3MqNdWLD4ZqK+X1KiOS4hE6xOBfdkqcRhJp
         4e6AhkMAKIZAxF5Tl06mJJJ3/8PclTxFRJohssiuSvC5u+rk8Mbi3Mps9W/QDt6aym4y
         kiNOBkv5CPNHbqtbV9f5vS2TFiiJOvcza9JcX8+7YgjiJ4lKdeWqlzfBfZWTa+IvLkft
         M1CQ==
X-Gm-Message-State: AGi0PuaGmFT/Th+5ksbbLJ4LctIVB2LPLJ6rWC+di4Nu+fPSRplqBHoO
        BWLcgvUHJnuC0Raouw9GerM=
X-Google-Smtp-Source: APiQypKji7UWQsmE5huunWfu+sXG44AGFdjl0/jp9OPk+bxWF6qOU3UNOHuPQ1YmcSNtr/z7NyzQ1g==
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr3212293wrt.414.1585829807916;
        Thu, 02 Apr 2020 05:16:47 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id y12sm4191207wrn.55.2020.04.02.05.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 05:16:47 -0700 (PDT)
To:     helen.koike@collabora.com
Cc:     dafna.hirschfeld@collabora.com, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200402000234.226466-2-helen.koike@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: phy-rockchip-dphy-rx0: move
 rockchip dphy rx0 bindings out of staging
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <bfefe00c-5673-ddcb-4e2a-425eb4771002@gmail.com>
Date:   Thu, 2 Apr 2020 14:16:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402000234.226466-2-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

> # SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> %YAML 1.2
> ---
> $id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy-rx0.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
> title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings
> 
> maintainers:
>   - Helen Koike <helen.koike@collabora.com>
>   - Ezequiel Garcia <ezequiel@collabora.com>
> 
> description: |
>   The Rockchip SoC has a MIPI D-PHY bus with an RX0 entry which connects to
>   the ISP1 (Image Signal Processing unit v1.0) for CSI cameras.
> 
> properties:
>   compatible:
>     const: rockchip,rk3399-mipi-dphy-rx0
> 

>   reg:
>     maxItems: 1

If 'reg' is not used => remove it.

> 
>   clocks:
>     items:
>       - description: MIPI D-PHY ref clock
>       - description: MIPI D-PHY RX0 cfg clock
>       - description: Video in/out general register file clock
> 
>   clock-names:
>     items:
>       - const: dphy-ref
>       - const: dphy-cfg
>       - const: grf
> 
>   '#phy-cells':
>     const: 0
> 
>   power-domains:
>     description: Video in/out power domain.
>     maxItems: 1
> 
> required:
>   - compatible
>   - clocks
>   - clock-names
>   - '#phy-cells'
>   - power-domains
> 
> additionalProperties: false
> 
> examples:
>   - |
> 
>     /*
>      * MIPI D-PHY RX0 use registers in "general register files", it
>      * should be a child of the GRF.
>      *
>      * grf: syscon@ff770000 {
>      *  compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
>      *  ...
>      * };
>      */
> 
>     #include <dt-bindings/clock/rk3399-cru.h>
>     #include <dt-bindings/power/rk3399-power.h>
> 
>     mipi_dphy_rx0: mipi-dphy-rx0 {
>         compatible = "rockchip,rk3399-mipi-dphy-rx0";
>         clocks = <&cru SCLK_MIPIDPHY_REF>,
>                  <&cru SCLK_DPHY_RX0_CFG>,
>                  <&cru PCLK_VIO_GRF>;
>         clock-names = "dphy-ref", "dphy-cfg", "grf";
>         power-domains = <&power RK3399_PD_VIO>;
>         #phy-cells = <0>;
>     };
