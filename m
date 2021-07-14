Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABBA3C8A5D
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 20:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhGNSGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 14:06:23 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:46602 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhGNSGW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 14:06:22 -0400
Received: by mail-il1-f176.google.com with SMTP id y6so2457864ilj.13;
        Wed, 14 Jul 2021 11:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LEmCBg2ZFVYuVXXstsnNim775J7TAUnbJ8EWRiqQFxY=;
        b=Fc+/S3GvDIbNvIoCkrt4IEjG7YTkaPq0ykMV7RDUIxxE7yAqy9a4SifGD0q7TEWJ28
         Bwoet2vxK31lETSocth6Wc7Y0qCtaWTSAZaJSOkU9zFY/4jlKV9SR5oy3iMVhkG8iomr
         soDcsaUf+8p1E9j5XmW1mT7Ro5E7RWpT1wM3ZzbzlGgB5c2CD0kjgMyHMyWuXuETgN+4
         RxrPFvGWQXl7QiPgD/OFn2JZ/YuXY30vp+yn25cHNELtD+07CDQvrZHO5jEjlLFsjnFT
         94SLQ6rwVPDNVw44qlZMnGmRF8eHR8Asf3g+c6ovO6oOBI/yaxzBkZMRzdAJ7d2GKKKE
         m8bg==
X-Gm-Message-State: AOAM5309IRqB/YLBPS+HKVHKrn1jm0Bu59YQ+/mMST7QoDnI+FoWSgmc
        gdLc+dyvDESzJ8fqxR1dYQ==
X-Google-Smtp-Source: ABdhPJz7MmXKdIbOBmyWQDZX/3y7Sb1bdJ5UO61CJctO0JLTnoDf526DzkAy7KMARNtraPgVgId1CQ==
X-Received: by 2002:a92:7009:: with SMTP id l9mr7533095ilc.24.1626285809628;
        Wed, 14 Jul 2021 11:03:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c19sm1583766ili.62.2021.07.14.11.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:03:28 -0700 (PDT)
Received: (nullmailer pid 2851154 invoked by uid 1000);
        Wed, 14 Jul 2021 18:03:26 -0000
Date:   Wed, 14 Jul 2021 12:03:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (No Subject)
Message-ID: <20210714180326.GA2848788@robh.at.kernel.org>
References: <p79aCzsVmgW6eKQZNSlglPvO40ulVy4id6jcm7aTk@cp7-web-044.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p79aCzsVmgW6eKQZNSlglPvO40ulVy4id6jcm7aTk@cp7-web-044.plabs.ch>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 04:20:24PM +0000, Yassine Oudjana wrote:
> Date: Tue, 22 Jun 2021 20:08:25 +0400
> Subject: [PATCH] media: dt-bindings: media: venus: Add firmware-name
> 
> Support for parsing the firmware-name property was added a while ago [1],
> but the dt-bindings were never updated with the new property. This patch
> adds it to all venus dt-bindings.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20210126084252.238078-1-stanimir.varbanov@linaro.org/
> ---
>  .../devicetree/bindings/media/qcom,msm8916-venus.yaml        | 5 +++++
>  .../devicetree/bindings/media/qcom,msm8996-venus.yaml        | 5 +++++
>  .../devicetree/bindings/media/qcom,sc7180-venus.yaml         | 5 +++++
>  .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml      | 5 +++++
>  .../devicetree/bindings/media/qcom,sdm845-venus.yaml         | 5 +++++
>  5 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> index 59ab16ad12f1..cb1b866d9c37 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> @@ -80,6 +80,11 @@ properties:
>      required:
>        - iommus
>  
> +  firmware-name:
> +    maxItems: 1

Not an array.

Is there a specific pattern and/or default name you can specify?

> +    description: |
> +      Relative firmware image path for venus.
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> index 199f45217b4a..b8809325138f 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> @@ -107,6 +107,11 @@ properties:
>      required:
>        - iommus
>  
> +  firmware-name:
> +    maxItems: 1
> +    description: |
> +      Relative firmware image path for venus.
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index 04013e5dd044..ffd3e2850366 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -99,6 +99,11 @@ properties:
>      required:
>        - iommus
>  
> +  firmware-name:
> +    maxItems: 1
> +    description: |
> +      Relative firmware image path for venus.
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> index 04b9af4db191..cd7a5e1374ce 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> @@ -94,6 +94,11 @@ properties:
>      required:
>        - iommus
>  
> +  firmware-name:
> +    maxItems: 1
> +    description: |
> +      Relative firmware image path for venus.
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
> index 680f37726fdf..ae256238a637 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
> @@ -108,6 +108,11 @@ properties:
>      required:
>        - iommus
>  
> +  firmware-name:
> +    maxItems: 1
> +    description: |
> +      Relative firmware image path for venus.
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.32.0
> 
> 
> 
