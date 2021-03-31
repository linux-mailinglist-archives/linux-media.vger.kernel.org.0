Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CFC350190
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 15:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235942AbhCaNlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 09:41:35 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37756 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235943AbhCaNlJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 09:41:09 -0400
Received: by mail-ot1-f50.google.com with SMTP id t23-20020a0568301e37b02901b65ab30024so18972947otr.4;
        Wed, 31 Mar 2021 06:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Ysq2futYM+aXUbEnhYTDLe/Ns9IPCloyqMjrGa/P5Hs=;
        b=GxsGX2gJThBMV9Rz4EWMnD0+e/P+wy1Pa2ny6/ieej8Ppl0VrJBWKZzhGU/dQLjDI9
         Ho5e8SxSm4L9n3QFusROUs37XcLIq7R1kjjPKhVW5vs3PSxGauh4b5S2OSYMVYVR4/Gs
         UsrdDcG7x+aMPSq0IPLgnOrmuDcJv0tTMcl0XLvDZv+0vv8AK/LfUDqdlKoYkvBnNK0u
         Hly+0hFtWmb+xSfxGfDRJT9MMRZmoniv87CRaRoLhJGV/jOv86/lzWeDa4S6EZlxreQs
         ecKLEKqaJxz5SODmuh4wik86io9lFNzsb2zzXJ7PHCHs6mSnW+iKvxSdtrO0D1Fv9rUX
         Ugaw==
X-Gm-Message-State: AOAM531AcrjO3ErV5tlzBFEkXgqaUdwM1Wut8mSR/2zplsi+EVBnuMgX
        x4Ee5lg3Uv4+YycDJmQydA==
X-Google-Smtp-Source: ABdhPJzTBBb/qkQn5k2zhMOHhTWR+p65BoV9tJQb6+MMqLy1cPlSH5hPasP869gBKLq+qYaQeEzuHA==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr2738828otj.351.1617198068778;
        Wed, 31 Mar 2021 06:41:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm468460oth.14.2021.03.31.06.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 06:41:07 -0700 (PDT)
Received: (nullmailer pid 2074861 invoked by uid 1000);
        Wed, 31 Mar 2021 13:40:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        robh+dt@kernel.org, kishon@ti.com, linux-imx@nxp.com,
        marcel.ziswiler@toradex.com, linux-arm-kernel@lists.infradead.org,
        s.hauer@pengutronix.de, lee.jones@linaro.org,
        jernej.skrabec@siol.net, shawnguo@kernel.org,
        Laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        a.hajda@samsung.com, jonas@kwiboo.se, narmstrong@baylibre.com,
        robert.foss@linaro.org, vkoul@kernel.org
In-Reply-To: <1617172405-12962-8-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com> <1617172405-12962-8-git-send-email-victor.liu@nxp.com>
Subject: Re: [PATCH v7 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module binding
Date:   Wed, 31 Mar 2021 08:40:59 -0500
Message-Id: <1617198059.605916.2074860.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 31 Mar 2021 14:33:18 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v6->v7:
> * Add Rob's R-b tag.
> 
> v5->v6:
> * Drop 'select' schema. (Rob)
> 
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/pxl2dpi: failed to match any schema with compatible: ['fsl,imx8qxp-pxl2dpi']
Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/ldb: failed to match any schema with compatible: ['fsl,imx8qxp-ldb']
Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/phy@56228300: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-dphy']

See https://patchwork.ozlabs.org/patch/1460356

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

