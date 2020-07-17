Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE87422421A
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 19:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgGQRly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 13:41:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgGQRly (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 13:41:54 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6552A20B1F;
        Fri, 17 Jul 2020 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595007713;
        bh=IHtosK/cU7rm8auOB6C6086pQzaynAGkPV8Dk9VgPrY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dnpzmbFDpuALSjdys73ua8kwP+uNpa99Kol16c25V8MYnXE5KrYB+Ih7FUvaqod9S
         CQiyZ9n9CSHYnUmGCnMdXDSZUvEyPdIWKMYWS1XeVoxqGhRQsVU1konXWZJBjLQrtG
         FNG9B6OJkRqUfMlTYXwFrB510NiDAVHnRp/VxnE8=
Received: by mail-ot1-f42.google.com with SMTP id e90so7468832ote.1;
        Fri, 17 Jul 2020 10:41:53 -0700 (PDT)
X-Gm-Message-State: AOAM532NMVuKVyLaaAFIMWDC9yCKgMLB1ZkazeSmXVHPGlYQEHmz64cD
        gKj1765dirVz8wnxe8srvBawatoqDmfCiFrMsQ==
X-Google-Smtp-Source: ABdhPJzkf9BqpjBd74nnbCjOXAfw7dQeRZj8mdtmLdN6QAW26s3IWlXrcYqoTVfbQTiEkfvKsnxzes0AvpYpbmRVQv4=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr9971353ots.192.1595007712689;
 Fri, 17 Jul 2020 10:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200702191322.2639681-1-helen.koike@collabora.com> <20200702191322.2639681-3-helen.koike@collabora.com>
In-Reply-To: <20200702191322.2639681-3-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 17 Jul 2020 11:41:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+5vW2cCz1oxVE-R3MW7gQfSHKrR_YrGm5ZHnjCCd9_Vw@mail.gmail.com>
Message-ID: <CAL_Jsq+5vW2cCz1oxVE-R3MW7gQfSHKrR_YrGm5ZHnjCCd9_Vw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] media: staging: dt-bindings: rkisp1: add required
 items in i2c example
To:     Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, karthik.poduval@gmail.com,
        Johan Jonker <jbx6244@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 2, 2020 at 1:13 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add missing required items in Rockchip ISP1 dt-bindings example for
> a complete i2c node.
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>
> Changes in v2:
> - new patch in the series
> ---
>  .../devicetree/bindings/media/rockchip-isp1.yaml             | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> index a77b6ec500c95..8c7904845788d 100644
> --- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> +++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> @@ -169,6 +169,11 @@ examples:
>          };
>
>          i2c7: i2c@ff160000 {
> +            compatible = "rockchip,rk3399-i2c";
> +            reg = <0x0 0xff160000 0x0 0x1000>;

This will give a warning now as the default cell sizes are 1.

> +            interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH 0>;
> +            clocks = <&cru SCLK_I2C7>, <&cru PCLK_I2C7>;
> +            clock-names = "i2c", "pclk";

Just drop the unit address rather than adding all this.

>              clock-frequency = <400000>;
>              #address-cells = <1>;
>              #size-cells = <0>;
> --
> 2.26.0
>
