Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBFA2FF064
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 17:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387954AbhAUQcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 11:32:11 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:41370 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732253AbhAUQCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 11:02:52 -0500
Received: by mail-ot1-f43.google.com with SMTP id k8so2049358otr.8;
        Thu, 21 Jan 2021 08:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=iPS8KYGvDCMZBW9Bd66TN2/ZYPxfM8AgyY5LXqUt8EA=;
        b=C+bjC7wATEX4YcbBkrprKraGj4A08ABZdWo/0dNaluWyQmKDe3OmG+PV+0k/cEgkx9
         VyNcLKXdAerifWDsSd+8oScrwdznn850pqcEudQlexv7DY/f1aW7U8vP4Oq4TNm0cM9E
         5G1xs6DU9vDo9hPVuvDh8i7IOmXIDrxoJolGWatdXmWk2FjM+zjrWEXbk0yaCzQk8bS/
         tHfWL7aVu5f6hTUqaqyV4AXOYspwHH/dVsy+uioGb64qMAUCFiGzRIwSctgYuH+IdH5u
         MfyVPc99QgWZwBQzPN00Gd+mkeUdWnxDJhmFXj0ebDHUmMcJFGW+Y08ERAE373ej6Mxh
         bKWg==
X-Gm-Message-State: AOAM533aZAIlRbkmNGLHKYwN/4uO8NTMsF4grSqKThe3Z8u+MKkDht4X
        xYcixQohD8p6mZzxksUAHw==
X-Google-Smtp-Source: ABdhPJzn834Px5M7k9xi4eRDYRx+iVifQaTS4PmZA5nghDXcJpx0MLp8oEr2SSf1ujrQ0M2iXhI2VA==
X-Received: by 2002:a9d:8c9:: with SMTP id 67mr10410484otf.29.1611244927549;
        Thu, 21 Jan 2021 08:02:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e20sm849213otr.14.2021.01.21.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 08:02:06 -0800 (PST)
Received: (nullmailer pid 2814844 invoked by uid 1000);
        Thu, 21 Jan 2021 16:01:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        michael@walle.cc, shawnguo@kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        agross@kernel.org, leoyang.li@nxp.com, agx@sigxcpu.org,
        Anson.Huang@nxp.com, linux-arm-kernel@lists.infradead.org,
        todor.too@gmail.com,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        linux-kernel@vger.kernel.org, vkoul@kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        will@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, catalin.marinas@arm.com,
        max.oss.09@gmail.com, Jonathan Marek <jonathan@marek.ca>,
        mchehab@kernel.org, bjorn.andersson@linaro.org,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        geert+renesas@glider.be, Tomasz Figa <tfiga@chromium.org>
In-Reply-To: <20210120134357.1522254-15-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org> <20210120134357.1522254-15-robert.foss@linaro.org>
Subject: Re: [PATCH v2 15/22] dt-bindings: media: camss: Add qcom, sdm660-camss binding
Date:   Thu, 21 Jan 2021 10:01:58 -0600
Message-Id: <1611244918.532478.2814843.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 20 Jan 2021 14:43:50 +0100, Robert Foss wrote:
> Add bindings for qcom,sdm660-camss in order to support the camera
> subsystem on SDM630/660 and SDA variants.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1:
>  - Laurent: Reworked driver to use dtschema
> 
> 
>  .../bindings/media/qcom,sdm660-camss.yaml     | 416 ++++++++++++++++++
>  1 file changed, 416 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,sdm660-camss.example.dts:21:18: fatal error: dt-bindings/clock/qcom,mmcc-sdm660.h: No such file or directory
   21 |         #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/media/qcom,sdm660-camss.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1429447

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

