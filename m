Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794CD4421AD
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 21:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhKAUc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 16:32:58 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:36588 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhKAUc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 16:32:57 -0400
Received: by mail-ot1-f46.google.com with SMTP id s23-20020a056830125700b00553e2ca2dccso22117152otp.3;
        Mon, 01 Nov 2021 13:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9oMNIEQqaxWU/IM8w/Ndcf39QnufPi4/bgw6wk3mzDM=;
        b=FLgTNWCwLwqX12LgsgEp/g+f4Bq7cwubuexTbXmM4pjSXcS+53MxiHGzRW7U6mx4p+
         Lfo1tASHMrzRFJ0m46yr5pn96Ig6sX/YaKmXgrwQYywME7M45fYo+ihUMxolkc7dSP6a
         wLhF87aqq8DH5qnLWR1pkbeKkCpG/chj/mLYvCeh23yE9HSe7h6xw0c0oHjN+7DbTKIq
         SPhuC2KGyUD+Gwv4mf/Zp1XFsNGpALCIvLwKf13rKgmZii+JwRbW3TkXe5nbEhYUEUiK
         XxB0T9ip8+J8U4nMMr+alxtQedAhsB0+iww+Be+sca0xIIZtKuHGTFxENVY6dh5TafZA
         y9hg==
X-Gm-Message-State: AOAM531A9v5aT9ZGuFCA0xzFi0yLkI63LgDzDsbpL26ut6svqIGVn1As
        CerqCSm+jiMAEEXQHj1q4LrL46GKlg==
X-Google-Smtp-Source: ABdhPJxilCIZwx40TtnakWQ8SW39n1QYxPshJu8evRs0rwDYLiu4hNz73SRyoQkM9wZ1pDoCkZReTg==
X-Received: by 2002:a9d:774b:: with SMTP id t11mr15106055otl.7.1635798622949;
        Mon, 01 Nov 2021 13:30:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r184sm4299132oia.38.2021.11.01.13.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:30:22 -0700 (PDT)
Received: (nullmailer pid 992011 invoked by uid 1000);
        Mon, 01 Nov 2021 20:30:21 -0000
Date:   Mon, 1 Nov 2021 15:30:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: Re: [PATCH v1 2/2] media: dt-bindings: media: camss: Document
 clock-lanes property
Message-ID: <YYBOXQOXM8USks0G@robh.at.kernel.org>
References: <20211025103322.160913-1-robert.foss@linaro.org>
 <20211025103322.160913-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025103322.160913-2-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 25, 2021 at 12:33:22PM +0200, Robert Foss wrote:
> The clock-lanes property corresponds to a hardware register field
> that is required to be set, in order to enable the CSI clock signal.
> 
> The physical lane of the clock signal is not programmable, but only
> togglable On or Off, which what BIT(7) of the
> CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5) register controls.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,msm8996-camss.yaml        | 5 +++++
>  .../devicetree/bindings/media/qcom,sdm660-camss.yaml         | 5 +++++
>  .../devicetree/bindings/media/qcom,sdm845-camss.yaml         | 5 +++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 38be41e932f0..d4da1fad12cf 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -106,6 +106,11 @@ properties:
>  
>              properties:
>                clock-lanes:
> +                description:
> +                  The index of the clock-lane is not programmable by
> +                  the hardware, but is required to define a CSI port.
> +                  Lane 7 reflects the hardware register field that enables
> +                  the clock lane.

If it is fixed, then it should not be required. Fix the required part.

>                  items:
>                    - const: 7

I don't know how we let that in, but this should be the lane number. 
Each binding can't be making up its own interpretation.

Rob
