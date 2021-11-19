Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA474568E7
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 05:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhKSEIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 23:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbhKSEIy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 23:08:54 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99D0C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 20:05:52 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so14793809otl.3
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 20:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=va1rat0GrfgBWrdhlc4u3bg8V9PW2k58vGn2hMTXv1Q=;
        b=P+UWQq3u8a7iJXHjxIUFQmJJosShdhe54SSLan51A4o72Wf9lypack0ubaHhCqGPWx
         SYEYiDQjbwCKiju3jwvLHnFAVajsk0vsqYGsQ57eo5+cE+2M2EudGyNx4PWonQ8sg/50
         q9rbfiKECZS0ZDQz4F4ozJVyi02CThaTFV6Q4gZfbrADqKBYF85cOi1rzKoVvZ/5X7f9
         kutaokNH5hS0+adjsmVOqtaV1JoAw4uwMZwSIAX6FCnICuqCVcFL2IqQTWM5AqXeWvD1
         jsQPcYvLO4f0IKnhc+5U6J2gBA0zDxTrfElje0gXRForfisulqbWImsrrglhTRybYq3l
         EB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=va1rat0GrfgBWrdhlc4u3bg8V9PW2k58vGn2hMTXv1Q=;
        b=wswFaWA3F8RckOMk2pwqSXPaZHC7uaVDzfpLX13MqPrpnEfaJ5qYTbYobr+s0Lin0+
         mdRmV8BiZWicLO4N3xkejPinmZJ2tb13PGTbrvloXTl7Z+VmqAAMoRo1CAaC9ojhm+8V
         Elk2ep4w7okjBZO+7mvXaqtc4DVXh2bkUuTOy3Z8Xm+m4jk4sKKFoWSgl0py99eSAC62
         ZN7dSrfCKZAz7TU2JJCHqp5j/y1ANFLUapeeai2SLfINgaxffjTyZOSEzL0Pz/lnZpLk
         ifvDp8b1bPkGr61vLhg4RCeGIak5ryc3S7Rm9S0UkJCQN2YhCbS8P+2m1167Fzsgm+vf
         KF6Q==
X-Gm-Message-State: AOAM530pTVmdn6+W9CQz7lPndDeyrFl5WhJQumss055V/Yi6/ZXF9LIA
        zETabwaLoHy+j3U8b0wQ9w1jIA==
X-Google-Smtp-Source: ABdhPJxrCNnJf4KaXgOkL8IZC/Lwi3eaZT111mFx7rir6XsE8dxIfbN3gDKtogB4iF+vAGDwlqlQtg==
X-Received: by 2002:a05:6830:1392:: with SMTP id d18mr1992695otq.374.1637294752031;
        Thu, 18 Nov 2021 20:05:52 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m12sm525701oiw.23.2021.11.18.20.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 20:05:51 -0800 (PST)
Date:   Thu, 18 Nov 2021 22:05:46 -0600
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
Message-ID: <YZcimsckJmDVk6mE@builder.lan>
References: <20211118124819.1902427-1-robert.foss@linaro.org>
 <20211118124819.1902427-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118124819.1902427-3-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 18 Nov 06:48 CST 2021, Robert Foss wrote:

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
