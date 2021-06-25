Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F3A3B4038
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 11:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhFYJXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 05:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhFYJXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 05:23:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03076C061574
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 02:21:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 49B961F442A9
Subject: Re: [PATCH 10/12] dt-bindings: media: rockchip-vpu: Add PX30
 compatible
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-11-ezequiel@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <176dce10-8e8c-b34b-8b9c-1a0a6a5501ba@collabora.com>
Date:   Fri, 25 Jun 2021 12:21:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624182612.177969-11-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 24.06.21 21:26, Ezequiel Garcia wrote:
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
> and an encoder (VEPU2).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index b88172a59de7..3b9c5aa91fcc 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -28,6 +28,9 @@ properties:
>         - items:
>             - const: rockchip,rk3228-vpu
>             - const: rockchip,rk3399-vpu
> +      - items:
> +          - const: rockchip,px30-vpu
> +          - const: rockchip,rk3399-vpu

This rk3399 compatible is already mentioned in the last 'items' list, should we add it again?

Thanks,
Dafna

>   
>     reg:
>       maxItems: 1
> 
