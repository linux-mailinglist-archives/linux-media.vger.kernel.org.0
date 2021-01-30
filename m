Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F10E30972D
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 18:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhA3RY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 12:24:26 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37195 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhA3RYZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 12:24:25 -0500
Received: by mail-ot1-f50.google.com with SMTP id h14so11952748otr.4;
        Sat, 30 Jan 2021 09:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=pXuQbzH1HhbE+f1usaw5pbQpp7LXrV9fgnnlovgh3z8=;
        b=FrJFyt9H2afVCY5Fua7uTzevccdwrBh0s3FmT3EJ16onBevk7/uzWYztdO5G1mqOs2
         IyDxlyCR69iZmE0J96AKA6LBduTZRJQWgMWQqIQsZO8/NWKWJ+MzbcG8TTzkN7itPD+s
         fmm+wclsi8r2ajvxJE9qXZeH91lMBu2ptt9e5kTsZIuUL2alG88oTHB8DaJIPhXVc2dG
         rQ1TDHiLY6ZOzXS81lVyQ1Uv+r6koZChKGjeTy53501/Fk8tobo7IMJj8EXjJQY6lE/z
         6tZvUrqTcR4Tlgpqr03K3Q19JNfL8OyI1oo4FVvoYhMiO6VbNH41u7wFE/h+FdMkcyVl
         TE8Q==
X-Gm-Message-State: AOAM530WJFkYITHyIsTO4i1EWW8MGmoWOyy/tcTsmnPKTLG+1x/wIhPJ
        ecs4YSWEhWtivu09/soIBA==
X-Google-Smtp-Source: ABdhPJyC2w56EW+vPolgtnxys1vpJEGvBhlMP/2uRtJ5IE0ERqsRBTtx7mfXHFhBD2cviSyGXrCBNg==
X-Received: by 2002:a05:6830:230b:: with SMTP id u11mr6704466ote.184.1612027424559;
        Sat, 30 Jan 2021 09:23:44 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t16sm2842618otc.30.2021.01.30.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 09:23:42 -0800 (PST)
Received: (nullmailer pid 1419425 invoked by uid 1000);
        Sat, 30 Jan 2021 17:23:40 -0000
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     michael@walle.cc, leoyang.li@nxp.com, linux-media@vger.kernel.org,
        todor.too@gmail.com, bjorn.andersson@linaro.org,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        catalin.marinas@arm.com, mchehab@kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Anson.Huang@nxp.com, geert+renesas@glider.be, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Marek <jonathan@marek.ca>, shawnguo@kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        agx@sigxcpu.org, Tomasz Figa <tfiga@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        max.oss.09@gmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        will@kernel.org, agross@kernel.org
In-Reply-To: <20210127144930.2158242-16-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org> <20210127144930.2158242-16-robert.foss@linaro.org>
Subject: Re: [PATCH v3 15/22] dt-bindings: media: camss: Add qcom, sdm660-camss binding
Date:   Sat, 30 Jan 2021 11:23:40 -0600
Message-Id: <1612027420.831924.1419424.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 27 Jan 2021 15:49:23 +0100, Robert Foss wrote:
> Add bindings for qcom,sdm660-camss in order to support the camera
> subsystem on SDM630/660 and SDA variants.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v2
>  - Rob: Add new line at end of file
>  - Rob: Remove redundant descriptions
>  - Rob: Add power domain description
>  - Rob: Make clock-lanes a constant
>  - Rob: Rework to conform to new port schema
>  - Add max & minItems to data-lanes
>  - Remove ports requirement - endpoint & reg
>  - Added Angelo as binding maintainer
>  - Removed Todor as binding maintainer
> 
> 
>  .../bindings/media/qcom,sdm660-camss.yaml     | 398 ++++++++++++++++++
>  1 file changed, 398 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1432255

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

