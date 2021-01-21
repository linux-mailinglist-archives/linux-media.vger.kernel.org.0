Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AAB2FF054
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 17:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387596AbhAUQDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 11:03:02 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:41361 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730948AbhAUQCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 11:02:44 -0500
Received: by mail-ot1-f46.google.com with SMTP id k8so2049079otr.8;
        Thu, 21 Jan 2021 08:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=R7T+rwQb5qFYaX5d/2NvmgUHeg2xX0pNv3pOpEsj5EQ=;
        b=SBbpcdZs75+uuVyamxKETSWX910avja5NY+d6wzMBrQ/Ix8h3qaMtsvhysaK7Bua5E
         09e2LEVWN3ssjaveSoA4mStlCF56nCR9bOWBHKkNU9Agrz6hnWcDH2VGY/Bpms2i9lWt
         ujf+bgWfH1TgkWbTcuqNohkakFwYy+Sl5wuiXlFQYM52UpxbWB/zpS2EYtatlyhgQ79T
         o1ddZ9z41xcBV5h3ShPOOSlNpV9S9UnG/9G9kfJoe8ejtqxi5Q9VEx78d+J9cHcw220b
         uD+GFJZn5qcVWX14Bh8CAI1MhoIRUe0pWAPGmvp2GuKUAAYYF2qUOL1BE52ZPmkkJeDm
         rOIA==
X-Gm-Message-State: AOAM533uzxgOTbUznwquxBjMBxDhVGGi/eFHrP4WFhQoEwEJQou1ob0t
        fLc2WxXULIdJK69ChOibDQ==
X-Google-Smtp-Source: ABdhPJwS6VjtPTdD/z11/eIoNH9msXpk4/83WflzvJ8QoI9+UatXRZ93RUwX3ZrBn6ZL8LWIEaPb3w==
X-Received: by 2002:a9d:66da:: with SMTP id t26mr8416980otm.279.1611244923483;
        Thu, 21 Jan 2021 08:02:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q6sm1115776otm.68.2021.01.21.08.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 08:02:02 -0800 (PST)
Received: (nullmailer pid 2814842 invoked by uid 1000);
        Thu, 21 Jan 2021 16:01:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        max.oss.09@gmail.com, todor.too@gmail.com, mchehab@kernel.org,
        michael@walle.cc,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>, catalin.marinas@arm.com,
        vkoul@kernel.org, shawnguo@kernel.org,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        will@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, robh+dt@kernel.org,
        agx@sigxcpu.org,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        linux-arm-kernel@lists.infradead.org, bjorn.andersson@linaro.org,
        geert+renesas@glider.be, Anson.Huang@nxp.com
In-Reply-To: <20210120134357.1522254-14-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org> <20210120134357.1522254-14-robert.foss@linaro.org>
Subject: Re: [PATCH v2 14/22] dt-bindings: media: camss: Add qcom, msm8996-camss binding
Date:   Thu, 21 Jan 2021 10:01:58 -0600
Message-Id: <1611244918.520900.2814841.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 20 Jan 2021 14:43:49 +0100, Robert Foss wrote:
> Add bindings for qcom,msm8996-camss in order to support the camera
> subsystem on MSM8996.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1:
>  - Laurent: Reworked driver to use dtschema
> 
> 
>  .../bindings/media/qcom,msm8996-camss.yaml    | 418 ++++++++++++++++++
>  1 file changed, 418 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml:418:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1429444

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

