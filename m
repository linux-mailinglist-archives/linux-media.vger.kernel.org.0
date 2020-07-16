Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE52222C6D
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 21:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbgGPT7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 15:59:16 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41912 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728907AbgGPT7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 15:59:16 -0400
Received: by mail-il1-f194.google.com with SMTP id q3so6150669ilt.8;
        Thu, 16 Jul 2020 12:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FL21avLY/Lnq90kgzzubqkTLnnlFhaGfUjSOp7X5A5k=;
        b=AUmSjAz/saiZ21z4+vGf6TSgHXio+6z4DwnBRQiVOEwmEFkxQqtSBOXtZSB2z0Ja/t
         kPCKTLnEzttyLYKsUQz8B0KqUpGJYfi9bob6bxScuj5WHaf/72xu2TFLh+3JWJKRGJRL
         aakVZ2JhNsXCTopXWjtJrdOm47MplB8P03Wxjz4gNm0rlJzhMjLrFhtMksxZPQCvTUfG
         ChaS43K8Sx8ckup2hYNslQYYYQSuhx81NXmgOaeQC3INyBdW9mBQtEB2QGV6wxkm+Lvd
         7VD27qeFeAM/GJzR304giuusj473WpC+IWL02lQuBB3ipQlD59p/DGU8zQ8JbREQvnEu
         VtPA==
X-Gm-Message-State: AOAM532LrEjoe+IFMYsNIU6gpFnOrccK4VtNcJBCoEPcO8H9xyqykAP+
        USdAKcdQGEtXe0NN01nq5A==
X-Google-Smtp-Source: ABdhPJyk4T63EL//8HysjeLcqxJ6LMeSttLh3+63l5cd1Uk6GocVrUuD6UDDX+TUPYDRhXPwIQVuvA==
X-Received: by 2002:a92:5f12:: with SMTP id t18mr6317395ilb.267.1594929554891;
        Thu, 16 Jul 2020 12:59:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a24sm3268789ioe.46.2020.07.16.12.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 12:59:14 -0700 (PDT)
Received: (nullmailer pid 2747004 invoked by uid 1000);
        Thu, 16 Jul 2020 19:59:13 -0000
Date:   Thu, 16 Jul 2020 13:59:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: venus: Add an optional power
 domain for perf voting
Message-ID: <20200716195913.GA2744252@bogus>
References: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
 <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594878139-3402-2-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 11:12:16AM +0530, Rajendra Nayak wrote:
> Add an optional power domain which when specified can be used for
> setting the performance state of Venus.

The h/w suddenly grew a new power island/domain? Seems like an abuse of 
power-domains...

> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> This is a resend of https://lore.kernel.org/patchwork/patch/1241077/
> 
>  Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
>  Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index 55f2d67..1e8675b 100644
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
> +      - const: opp-pd
>  
>    clocks:
>      maxItems: 5
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> index 157dff8..437286d 100644
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
> +      - const: opp-pd
>  
>    clocks:
>      maxItems: 7
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
