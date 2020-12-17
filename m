Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461CB2DD8B4
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgLQSvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:51:20 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:46421 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgLQSvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:51:20 -0500
Received: by mail-ot1-f53.google.com with SMTP id w3so28346460otp.13;
        Thu, 17 Dec 2020 10:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=0J3vl1MTUsZMronAIrs9qpBUzg0oJyXdy+TBq+BXRGg=;
        b=T8l0slvmQau/xppvK7jwZX08C/YACfJ34VfoDnVGsHz8LgvozZtraMLZ8zVxcCtACp
         H2zH1K01/HJP8KV+UsefXzJxVVlqn/PTt8w/fC8b1aL3+l/9y+3HZLWkdbEVO+7nv2Y6
         HVgD1yuMqb/IPKRsqtl0m7uWZ1/mVi1YHC34WRqnq6RGij52+Po7u5RrBYPRqvH1HqEB
         3cYLYns9HbHz/L1CP15E1XACmXVVgld7M06aYPEPKfyYagv5GaBTTHBizahWdprjVPZb
         ZKS2xUfRD6s0rO8W7ys5EWb43aq3UXDRquv6ZbIb/SXPgJqHcnO80FY/AEdl4YPHA7Rb
         qC1g==
X-Gm-Message-State: AOAM5310j4gJZYfvZCzY5snSO0KUsDwtluuBjnW02zng0GsGsnzFGSCb
        X53iIzggSi7lkeTJ8r5nww==
X-Google-Smtp-Source: ABdhPJyupopTHCyOI1kXrI4SvwIdqGJXu/0CPZvamUq8qDnn0fuulgPaAICVXyoXi8ycIfF3QKPJBw==
X-Received: by 2002:a9d:2254:: with SMTP id o78mr245009ota.24.1608231038964;
        Thu, 17 Dec 2020 10:50:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l21sm1417234otd.0.2020.12.17.10.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:50:37 -0800 (PST)
Received: (nullmailer pid 50648 invoked by uid 1000);
        Thu, 17 Dec 2020 18:50:36 -0000
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, jernej.skrabec@siol.net,
        Laurent.pinchart@ideasonboard.com, robh+dt@kernel.org,
        a.hajda@samsung.com, vkoul@kernel.org, linux-media@vger.kernel.org,
        s.hauer@pengutronix.de, airlied@linux.ie,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, jonas@kwiboo.se, festevam@gmail.com,
        narmstrong@baylibre.com, daniel@ffwll.ch, shawnguo@kernel.org,
        mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, kishon@ti.com
In-Reply-To: <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com> <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
Date:   Thu, 17 Dec 2020 12:50:36 -0600
Message-Id: <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp pixel combiner.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dts:19:18: fatal error: dt-bindings/clock/imx8-lpcg.h: No such file or directory
   19 |         #include <dt-bindings/clock/imx8-lpcg.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1417599

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

