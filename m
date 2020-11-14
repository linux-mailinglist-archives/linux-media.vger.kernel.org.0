Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8810E2B2CCA
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 11:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgKNK55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 05:57:57 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:50265 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgKNK55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 05:57:57 -0500
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3099320000A;
        Sat, 14 Nov 2020 10:57:52 +0000 (UTC)
Date:   Sat, 14 Nov 2020 11:57:55 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: schema indentation fixes
Message-ID: <20201114105755.xvdza24qapw7jxqv@uno.localdomain>
References: <20201112224951.166313-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201112224951.166313-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Thu, Nov 12, 2020 at 04:49:51PM -0600, Rob Herring wrote:
> Fix a few new indentation warnings found with yamllint (now integrated
> into the checks).
>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Ricardo Ribalda <ribalda@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/i2c/adv7604.yaml       |  4 ++--
>  .../devicetree/bindings/media/i2c/ovti,ov772x.yaml   | 12 ++++++------
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml   | 12 ++++++------

Thank you!

For ov772x and imx214
Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> index 3897af540ddd..407baddfaa1d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> @@ -21,8 +21,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> -        - adi,adv7611
> -        - adi,adv7612
> +          - adi,adv7611
> +          - adi,adv7612
>
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> index 63b3779d7289..6866c2cdac50 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> @@ -75,18 +75,18 @@ properties:
>                  bus-type:
>                    const: 6
>              then:
> -                properties:
> -                  hsync-active: false
> -                  vsync-active: false
> +              properties:
> +                hsync-active: false
> +                vsync-active: false
>
>            - if:
>                properties:
>                  bus-width:
>                    const: 10
>              then:
> -                properties:
> -                  data-shift:
> -                    const: 0
> +              properties:
> +                data-shift:
> +                  const: 0
>
>          required:
>            - bus-type
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> index 0f5e25fa4e9d..1a3590dd0e98 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> @@ -68,13 +68,13 @@ properties:
>              description: See ../video-interfaces.txt
>              anyOf:
>                - items:
> -                - const: 1
> -                - const: 2
> +                  - const: 1
> +                  - const: 2
>                - items:
> -                - const: 1
> -                - const: 2
> -                - const: 3
> -                - const: 4
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
>
>            link-frequencies:
>              $ref: /schemas/types.yaml#/definitions/uint64-array
> --
> 2.25.1
>
