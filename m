Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3742D134B
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 15:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgLGONR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 09:13:17 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:54135 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726112AbgLGONR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 09:13:17 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id mHFek5QcT2G8DmHFikuk1c; Mon, 07 Dec 2020 15:12:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607350354; bh=5a6I7kUjv6ZRPRq1NNht+JG5Y/ts1HItAMG8G2dPFqk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vy3U/khkAd5ELYYoyRh5Zof5yWXCMj08bNHjORf86QDpbyUB4TFwGW6kcCcgafWC1
         zF8P/FEHIGzjCssy2qaygyhyPBKWkkpKONwWZLHw+NemkuaPypuhOmB6IGJ7rtKxXP
         BSm13YIABwGak6fXPo3AjR6ELHVcOiW0rcaCwFIqzzk7KcAQT9MUNdpm0S5xBwlG2M
         uHOy7+x+qa50xJwPkbsW2YGnRUK7L3j3L1r5Dcbfdo9sZ/HuOr1C0y+ggyQJRZUuxc
         K9CKovzQMKUQszTU96D8QZvOkvCslbXY25sUjPgFYLQgUqyoFVameGQS+nhifc2dYn
         BGPgfRI9FUmJw==
Subject: Re: [PATCH] media: dt-bindings: schema indentation fixes
To:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-media@vger.kernel.org
References: <20201112224951.166313-1-robh@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0a04509a-6ebc-f349-738c-78e61f82ac8f@xs4all.nl>
Date:   Mon, 7 Dec 2020 15:12:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201112224951.166313-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBt8YcqIbbUamaeP5ofJyyBDeAbPWJ9kFv8xEooDknY9T1YFSsb+7F6xI90mmIgxI369WN6kIFtEMxAbzFdtELVgkYFDzSnA3nz4PcVsmjAC3/JLkkAv
 F6exLxSY46SX05UQpUlIRst+sR/m1FQRnpQImfdv2i0m12MNLKimLBsBLqF7OeRalcd8+FzRSymI+PwKtUFX1i2HXWEhak334phY2371Vx0/3nQYYBJk7jj8
 fYv+ovovLeNeaf7/hFyc0PzwPZd2+U7ZrfYU3s7u9/uzcgWlxY1npJ1v7KN+lpUsSOZY4eaS4M39hZg44psAITP1VylEKN2+rLWGR3I3Bx6G+m7iy+S+7vGp
 s1OBmiX0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/11/2020 23:49, Rob Herring wrote:
> Fix a few new indentation warnings found with yamllint (now integrated
> into the checks).
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Ricardo Ribalda <ribalda@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

For adv7604:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../devicetree/bindings/media/i2c/adv7604.yaml       |  4 ++--
>  .../devicetree/bindings/media/i2c/ovti,ov772x.yaml   | 12 ++++++------
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml   | 12 ++++++------
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
> 

