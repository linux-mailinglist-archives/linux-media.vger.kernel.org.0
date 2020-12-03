Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81432CD9EE
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 16:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgLCPMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 10:12:41 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:35053 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgLCPMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 10:12:41 -0500
Received: by mail-il1-f194.google.com with SMTP id t13so2230071ilp.2;
        Thu, 03 Dec 2020 07:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T2NXqCKj/vyKRDvXLPBjyutHi/gmz0N+XyWPmKZhldc=;
        b=IoBX+in2gvhcDjQ6N/9hRel968T280ddh9jJKfn89qA1EtRlQGswSXSw/rBm5/2AzE
         tGRGY0jgXcIUV1EDu+U4gAW0cj3q8bI3ZxaeOTyQ7+Jpi8RyPclkLdT3lwpOfwg65r3F
         Vo0JGZsGPjFih/OlR3bmLEzT8e7G76LcyCADteP3tDOmymHtu+ef0yIiOA3lHNntqAtm
         kByMRYUhFt5eNDPie+bTjD6erHMiL5/SkgdGcYmXr+Qv3AJ6R0MHAv1liKH6g+pRqSv/
         gYrZKOip9OMSu8PccvQIZtXDi1g/EbslMXRXcqR/OYJgbY038y7rr9WSed0K1rM/ROUP
         wlJQ==
X-Gm-Message-State: AOAM5331fv8ECYQA+fLy9iw5vXxEcprM1/zfYqWovv/UqP4tEyL5pKLS
        2P3x6GR0uo5b8CQCGcyK8/JbXO0J9Q==
X-Google-Smtp-Source: ABdhPJwSc+Am97WYw1M1RsUP2sk9x4PlemQ1b5N14TfVMYyWV2HNmruqM7AXd/qrW3AyLSF5jBECkw==
X-Received: by 2002:a92:cb43:: with SMTP id f3mr3198069ilq.50.1607008320283;
        Thu, 03 Dec 2020 07:12:00 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p18sm988330ile.27.2020.12.03.07.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:11:59 -0800 (PST)
Received: (nullmailer pid 392062 invoked by uid 1000);
        Thu, 03 Dec 2020 15:11:57 -0000
Date:   Thu, 3 Dec 2020 08:11:57 -0700
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: schema indentation fixes
Message-ID: <20201203151157.GB2644458@robh.at.kernel.org>
References: <20201112224951.166313-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112224951.166313-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

Ping! This should go via the media tree.

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
> -- 
> 2.25.1
> 
