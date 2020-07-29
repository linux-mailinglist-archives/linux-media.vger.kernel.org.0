Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA698232573
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 21:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgG2Tb7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 15:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgG2Tb6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 15:31:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A238C0619D4
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 12:31:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l12so3818722pgt.13
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 12:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=heIh5b42q1abQ+Nw5f1N785+1Eca4zOLDnob5GQDx/E=;
        b=yKCVxkjUW77JjQhu2NZdAHJQEAoKRqgV2ihMnaeidQRtXVu2UI0HGxIOgtgCrdUEfr
         Ncp2xQ0KBSHxWsZ60dLgpxiKZ5mrncfB7rlCnIPjAGNIl7vtRJgU8Ztrr7hM5gdoKvh4
         csvao3HStnm4CSIfhM+i/wnxfQRrHHlFbKut3sld+WYj7UcbFRO+F/uXWVq7riMlcO8w
         VdT6D6BZlirTkVb9n/3LfyvNmw9IQBt3N6aBGazQpyYR54zLwWurzxh9G5ICqNAS44yY
         Y9z3PbDrHtuXtROHXb4sVO9rH+YljqzsiEf4zExbitSNSbIkH4nSaBZbQiyZQZjVnva0
         pnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=heIh5b42q1abQ+Nw5f1N785+1Eca4zOLDnob5GQDx/E=;
        b=jJ9mACd/CBnOe1oBZXVS2KczOoUwlpg6CfwRb9iRnj+LqgS6QfxQs14jEF7rzEJqsb
         vBL5jILUrZB+B/U01JJ4Y9/kNGg546IKKSPbT3k4N3sJdrg4FGdkclL9QDfYTqnIDwKT
         gl02dc2Ma0DKC6QZqomrm7p4axrGyoIcWzHxMBI25OULwBemWGkQKGmQ2xHcTSooG7NC
         NvjGTzS0qeUvrf/jUZS8hCDdL3Pjkhad1BgOxv+mypAPl18A6yRXyc7YOea3Q93Cz9DA
         NKCAjAHqELnP7KnwJFzB8VwQOvLOUi3xkVyOrJ7LIDFWcRIexhzTZpsgleOh26OFh/HY
         qWOQ==
X-Gm-Message-State: AOAM530CmRBcp6nfD+qH65fAheu171A8ay2q5uPHYc0l3NkN/hiC7p+N
        ohyneYaAsmwp7C8NGF16qrMIvw==
X-Google-Smtp-Source: ABdhPJxx2F5Ceyd7KGPk6bhpkvl6yqGP29s/+ClNuIC+H3z3NPqe1qyJ8bSIppNFM4tFB9tltY3Axg==
X-Received: by 2002:aa7:9419:: with SMTP id x25mr31556391pfo.67.1596051117785;
        Wed, 29 Jul 2020 12:31:57 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b22sm2907600pju.26.2020.07.29.12.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 12:31:57 -0700 (PDT)
Date:   Wed, 29 Jul 2020 12:28:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v5 1/5] dt-bindings: media: venus: Add an optional power
 domain for perf voting
Message-ID: <20200729192828.GH229995@builder.lan>
References: <1596007005-30425-1-git-send-email-rnayak@codeaurora.org>
 <1596007005-30425-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596007005-30425-2-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed 29 Jul 00:16 PDT 2020, Rajendra Nayak wrote:

> Venus needs to vote for the performance state of a power domain (cx)
> to be able to support DVFS. This 'cx' power domain is controlled by
> rpmh and is a common power domain (scalable) not specific to
> venus alone. This is optional in the sense that, leaving this power
> domain out does not really impact the functionality but just makes
> the platform a little less power efficient.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
>  Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index 55f2d67..04e303b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -25,12 +25,16 @@ properties:
>      maxItems: 1
>  
>    power-domains:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    power-domain-names:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: venus
>        - const: vcodec0
> +      - const: cx
>  
>    clocks:
>      maxItems: 5
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> index 157dff8..90013d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> @@ -25,13 +25,17 @@ properties:
>      maxItems: 1
>  
>    power-domains:
> -    maxItems: 3
> +    minItems: 3
> +    maxItems: 4
>  
>    power-domain-names:
> +    minItems: 3
> +    maxItems: 4
>      items:
>        - const: venus
>        - const: vcodec0
>        - const: vcodec1
> +      - const: cx
>  
>    clocks:
>      maxItems: 7
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
