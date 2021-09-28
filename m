Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8529D41A50B
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 04:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238539AbhI1CD3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 22:03:29 -0400
Received: from mail-oo1-f42.google.com ([209.85.161.42]:43610 "EHLO
        mail-oo1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238494AbhI1CD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 22:03:29 -0400
Received: by mail-oo1-f42.google.com with SMTP id n4-20020a4aa7c4000000b002adb4997965so5018933oom.10;
        Mon, 27 Sep 2021 19:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HBjpaa7sxaSk6yNv0m4ThUeRnu+WwigFczsXL34g8Z4=;
        b=dmj8kM3rk0C3ULo0KJIq/65ReQIjpLM9G558OUnLi7NmnwiECeZhlDTnoE91KKc5Uu
         yB6FK9PUBYiK910vMLMmtV3mb9QcNkFOPUZZeGypGwERQzxXqMgw4cu/QLul+mbtHTNP
         v0ost2MZiZbr3Gf3DPw2lEGKBVqRsLD5H51UtaosZtpzZ7IYDPBAp6fvs0ntX/D/Bubs
         pMxTscz21I/h9i5fNgp2zu8Y+mh94gZBv+jRdVxf5GObkEOlY5Vm6fm09Y9bntc12X9V
         45n7vr68OMSIewBQ/El/L2iXvogHqNiGQinEZZd0Bu6gPrWS7LtSXCqsOseBDVcoaF8e
         sQpg==
X-Gm-Message-State: AOAM530ujZ5fa75XrsYtBcsGk5arSJpcTGek+1M85grDyxkrhJ6F3jtj
        9H7BeBqcl/04/tBHYqKXxQ==
X-Google-Smtp-Source: ABdhPJyiFGpnEaZEJQKQQpvbx8njRVXh5MqJbBRik+vr588di/y93ljmuPTKon6CFW2WQmK11to7cA==
X-Received: by 2002:a4a:c292:: with SMTP id b18mr2723202ooq.64.1632794509836;
        Mon, 27 Sep 2021 19:01:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l28sm4454679oof.30.2021.09.27.19.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:01:49 -0700 (PDT)
Received: (nullmailer pid 84114 invoked by uid 1000);
        Tue, 28 Sep 2021 02:01:48 -0000
Date:   Mon, 27 Sep 2021 21:01:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org, mchehab@kernel.org, agross@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: media: venus: Add sc7280 dt schema
Message-ID: <YVJ3jFKGP6KfSUfM@robh.at.kernel.org>
References: <1632743197-32291-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632743197-32291-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 27 Sep 2021 17:16:37 +0530, Dikshita Agarwal wrote:
> Add a schema description for the venus video encoder/decoder on the sc7280.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> change since v3:
>     Added missing dependency.
> 
>  .../bindings/media/qcom,sc7280-venus.yaml          | 160 +++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dts:37.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1533296

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
