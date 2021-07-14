Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C203C87E5
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 17:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239659AbhGNPrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 11:47:03 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:38820 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhGNPrD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 11:47:03 -0400
Received: by mail-io1-f54.google.com with SMTP id k11so2663611ioa.5;
        Wed, 14 Jul 2021 08:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=5YB4Tq0do2Mv/Zmb1piIDXwZsU75wE5dE6JnJKDMhms=;
        b=QfA5odVldPPLNVItksVYirXp060cc7eyjpma3VRLvfJQdHQl1CONNBsFj+dDTNq7so
         ZjwYAlfAVUEV7zUf7sfGen1eZD0zUBwjD1Xv59hdcXO8hDyVLxMqhyUr1dlh+9BzmDCU
         SG4RHMLtA72brIUo+B+SjKecakWDS+DhHJ1JTsRlYTpNxXLTfyUiqN8UwCEYdxHTMzxq
         FRP+Liq1sEjnaRtxqKLWx+8FcUKgAneuiPrJ//XEO48q43zPsp+6tSgmWbPyE5HGWovs
         CS9AqCWfYqgusfq/jF779XX0At2TUFQ7xP8OZ/xdfb25XtRfq2hakwxBb7EIrIYXSLOd
         c7PQ==
X-Gm-Message-State: AOAM5300equMUXDCPNesPgm+c/eGc68qd7QJg8MVcTWLzYYLW5RLxBei
        DFfsbUAhUI7ohAF1LTuQVA==
X-Google-Smtp-Source: ABdhPJyPjXPKcfWDptVloc+ivSzKnBM195jJHUB2Jb10U6MBNPl9P9Vn45YvwEeB2LpgUYCJHEW7Yw==
X-Received: by 2002:a02:90cb:: with SMTP id c11mr9574373jag.53.1626277451015;
        Wed, 14 Jul 2021 08:44:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t15sm1377991ile.28.2021.07.14.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 08:44:09 -0700 (PDT)
Received: (nullmailer pid 2630511 invoked by uid 1000);
        Wed, 14 Jul 2021 15:44:06 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        phone-devel@vger.kernel.org, linux-imx@nxp.com,
        linux-staging@lists.linux.dev, kernel@pengutronix.de,
        m.felsch@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        krzk@kernel.org, shawnguo@kernel.org, kernel@puri.sm,
        slongerbeam@gmail.com, festevam@gmail.com,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210714111931.324485-2-martin.kepplinger@puri.sm>
References: <20210714111931.324485-1-martin.kepplinger@puri.sm> <20210714111931.324485-2-martin.kepplinger@puri.sm>
Subject: Re: [PATCH v6 1/3] dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller
Date:   Wed, 14 Jul 2021 09:44:06 -0600
Message-Id: <1626277446.705587.2630510.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 14 Jul 2021 13:19:29 +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.example.dts:37.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1505152

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

