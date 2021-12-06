Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B6B469AFD
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 16:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346524AbhLFPMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 10:12:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348305AbhLFPKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 10:10:01 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F3EC08E9AF
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 07:04:18 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bj13so21963055oib.4
        for <linux-media@vger.kernel.org>; Mon, 06 Dec 2021 07:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2Io/Xh8dFZE8bHDnyIcdrqSLoWwVYmwYPSR/NEey/vE=;
        b=rTbavVM8ee6LjpVu1KJS/5qj9eZU3ww/KOKVhwi/vd2f7481jWwioxHGIGF2kjR0AF
         FRvpER3HL30gB+WY4QM44LiKpXYkRwvES5C+D5QqqF1Uct4Aw7lLv2kZuQM029p4DGq0
         PTbTsgKse2wwreDxuHtcR5aYVmkSibELgWkzIpA/nuKITd//Bn6FhHhrDtx9VUvHREzG
         Sx96Whlx54L3bOF0nshUGu4jM/DNnOjxqa2gIxRaosuwGHw2976EM2Pc/2B0j1wBrYe+
         sMgibt7K5cigwS5U3VWhaf5VyMlvDjta9EIT8f7H3RDH1S86hx9jw8IQ9tmHj+3gLNoy
         EUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2Io/Xh8dFZE8bHDnyIcdrqSLoWwVYmwYPSR/NEey/vE=;
        b=7/LY8WAN8n8AI26ZCiL6r9huno2xPKDqDyXgEo9WhMAwekw4Hfn5/U3bfakq4f2V3k
         eT0lvc6hIV6LshVyXiswBAJDAtrniSFAqJSDoiQrkijeQcnxWqvbM9aigZJ3xdGdzgyR
         OgoJSJG2sW6+8KLHMCCi+7HTqfDLv2Xf3OfBdAUSKTM1NjoTicX+6DbjzpnCXtbDlsX6
         hSCUcjd09SctCtsDTHtNSr99jXPVED3863BgDuWAtPHarlVYgifjpS9/b/zTiUio+w+c
         tUJH43jcjD5Je5G2IlUzcX64HIN+GmMpVjT+k2z7KfiAj2caUQQx1Z/kfaF0UyEdt1Kp
         Vd4w==
X-Gm-Message-State: AOAM531LXt3lNpkTnI/IQ3Od3jxpXg4NXawKC71IRvD/IhMs2rfmTIm6
        K5hPlC9L0+oTE5FhnlWFPXV/mA==
X-Google-Smtp-Source: ABdhPJx6hiAhWrAYWuW1XztEWbyAKTRxB2t7IXl8WGdKYMOWw2vLdxiwScJh9qVXn0rVLoMxD1Qxiw==
X-Received: by 2002:aca:eb02:: with SMTP id j2mr24589458oih.3.1638803058189;
        Mon, 06 Dec 2021 07:04:18 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g17sm2706062oiy.14.2021.12.06.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:04:17 -0800 (PST)
Date:   Mon, 6 Dec 2021 07:05:44 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v3 2/4] media: dt-bindings: media: camss: Remove
 clock-lane property
Message-ID: <Ya4myL8t3aW1EaXB@ripper>
References: <20211118124819.1902427-1-robert.foss@linaro.org>
 <20211118124819.1902427-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118124819.1902427-3-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 18 Nov 04:48 PST 2021, Robert Foss wrote:

> The clock-lanes property is not programmable by the hardware,
> and as such it should not be exposed in the dt-binding.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../bindings/media/qcom,msm8916-camss.yaml    | 10 ----------
>  .../bindings/media/qcom,msm8996-camss.yaml    | 20 -------------------
>  .../bindings/media/qcom,sdm660-camss.yaml     | 20 -------------------
>  .../bindings/media/qcom,sdm845-camss.yaml     | 17 ----------------
>  4 files changed, 67 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 304908072d72..12ec3e1ea869 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -83,10 +83,6 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 1
> -
>                data-lanes:
>                  description:
>                    An array of physical data lanes indexes.
> @@ -99,7 +95,6 @@ properties:
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@1:
> @@ -114,16 +109,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 1
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 38be41e932f0..6aeb3d6d02d5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -105,10 +105,6 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  description:
>                    An array of physical data lanes indexes.
> @@ -121,7 +117,6 @@ properties:
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@1:
> @@ -136,16 +131,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@2:
> @@ -160,16 +150,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@3:
> @@ -184,16 +169,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 841a1aafdd13..338ab28d5f3b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -111,16 +111,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@1:
> @@ -135,16 +130,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@2:
> @@ -159,16 +149,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@3:
> @@ -183,16 +168,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 9ca5dfa7f226..9404d6b9db54 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -105,15 +105,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@1:
> @@ -128,16 +124,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                items:
> -                  - const: 7
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@2:
> @@ -152,15 +143,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>        port@3:
> @@ -175,15 +162,11 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                data-lanes:
>                  minItems: 1
>                  maxItems: 4
>  
>              required:
> -              - clock-lanes
>                - data-lanes
>  
>    reg:
> -- 
> 2.32.0
> 
