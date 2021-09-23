Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D41E415F43
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 15:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241221AbhIWNMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 09:12:31 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:45755 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238588AbhIWNM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 09:12:29 -0400
Received: by mail-ot1-f53.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso8353404otv.12;
        Thu, 23 Sep 2021 06:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=cFspYBLeURdfYGcovqZnYm0YSY7LeEP/BmbI4nCU0mU=;
        b=bTjHAvg7WugVnMOfxjH1AtHQF8aXac9RwivmZNXnwWit+zJ3CzEbDfvf+ZsYZyQQzz
         EDFcATkv6CtbzpCREmPwJ/Af14XIqZNmeccojIykA3pOv0CO8xslocIXN830eYXf8vqF
         3gAMSVlPhY8e+qMt12J8DPUOok8reC3rNtu7w0118ELW4+l8is9f28k5654fwcwu6Ec2
         GRAr77zjVTU8HQ4thxTgLiax3U2ZsEXlZT1b1GKJZmdRS1okQ1ONDj3S8YOrYTyArSGb
         9fzEvT2lOdpzCP5z5IyB2hIyBuj6SymTgkFKy/+qA90HC2okGKQi9HYnETocrzMsT+H2
         mkmg==
X-Gm-Message-State: AOAM532ukkdJuRfMx+FAe7JL5ToYklXXWFnw3nShPjW1UmMUKPi6kW+f
        1lvv+e0fbyLs5+H6fH31NaUmzfUCsQ==
X-Google-Smtp-Source: ABdhPJybDJ7Lb8fIZU10sfK8nNbiDimDfC7u+ouNEMJmW0a2CScZ5nkLpcBFkUpNYos99iZlSTkXAA==
X-Received: by 2002:a9d:4604:: with SMTP id y4mr4229176ote.79.1632402657391;
        Thu, 23 Sep 2021 06:10:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p8sm1262495oti.15.2021.09.23.06.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 06:10:56 -0700 (PDT)
Received: (nullmailer pid 2861278 invoked by uid 1000);
        Thu, 23 Sep 2021 13:10:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        stanimir.varbanov@linaro.org, mchehab@kernel.org,
        devicetree@vger.kernel.org, vgarodia@codeaurora.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <1632377309-25148-1-git-send-email-dikshita@codeaurora.org>
References: <1632377309-25148-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [RESEND PATCH v3] dt-bindings: media: venus: Add sc7280 dt schema
Date:   Thu, 23 Sep 2021 08:10:53 -0500
Message-Id: <1632402653.567694.2861277.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 23 Sep 2021 11:38:29 +0530, Dikshita Agarwal wrote:
> Add a schema description for the venus video encoder/decoder on the sc7280.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/qcom,sc7280-venus.yaml          | 159 +++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dts:24.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/media/qcom,sc7280-venus.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1531553

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

