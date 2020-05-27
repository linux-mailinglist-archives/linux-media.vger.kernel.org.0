Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6191E4E4E
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 21:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgE0Tgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 15:36:43 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38226 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgE0Tgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 15:36:42 -0400
Received: by mail-io1-f67.google.com with SMTP id d7so27457174ioq.5;
        Wed, 27 May 2020 12:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=io7JL+6QWqwr5UMM9NElEX66dtm9kKXNvmpsHXQSLm8=;
        b=l2gERoQnmyqHY8g+/VuMbG3/10li/MIaPvO/8px7BVVZWCEVDOBlMF2pEVD74TODpG
         qGbW+IvIXcikiqr39TrQOrpGpBPF2BTBYp07rnWDuDG99Q1ufjf4A7OyR9slT68I6zb+
         92HFVPP6kBot1Uh9xVuyLy7HGra6HpUv7XD2Dw9O0rLPSU71GCS4BuFUMQ0YAl0Db6LM
         6QDC4M7sZFaMueMEJVVLWxIBHKrkhmQR2SHLAq4Lj+2jGNh7qazKcApN65MtgO6vKQlB
         fjemnw+Cg/f4NJD9Cx0qqkxvSydyRYkWN2VdikOX+HnQNQ4yyhvOklcenbYwdFztUfbL
         nDTw==
X-Gm-Message-State: AOAM530JNaydLIhkgzGt6ELdQTT8Pj7SuB0/7sItLIo9XSuv+Aa4yzXS
        x9e5SozDSSIDaKTr2X4kWA==
X-Google-Smtp-Source: ABdhPJzja/44mLPDsRi9Us+9wAPvOQ/J+0Wdpj6Prbtm0EAoaesENU75sSr4Wx7bmnNEdQs7rA6GEg==
X-Received: by 2002:a02:740d:: with SMTP id o13mr606075jac.42.1590608200163;
        Wed, 27 May 2020 12:36:40 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o70sm2146812ild.3.2020.05.27.12.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 12:36:39 -0700 (PDT)
Received: (nullmailer pid 2608242 invoked by uid 1000);
        Wed, 27 May 2020 19:36:38 -0000
Date:   Wed, 27 May 2020 13:36:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v2] dt-bindings: media: venus: Add an optional power
 domain for perf voting
Message-ID: <20200527193638.GA2604206@bogus>
References: <1589349807-10163-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589349807-10163-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 13, 2020 at 11:33:27AM +0530, Rajendra Nayak wrote:
> Add an optional power domain which when specified can be used for
> setting the performance state of Venus.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 6 +++++-
>  Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index 764affa..ac1ed64 100644
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

Humm, looks suspicious. This is a phyical power island in this block? 
Because that's what 'power-domains' are supposed to represent. Not $os 
pm-domain construct.

Rob
