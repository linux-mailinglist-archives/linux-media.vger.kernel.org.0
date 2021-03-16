Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B127733E188
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 23:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhCPWka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 18:40:30 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:32989 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhCPWkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 18:40:23 -0400
Received: by mail-io1-f51.google.com with SMTP id n132so38997737iod.0;
        Tue, 16 Mar 2021 15:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/145PC5Hg1ww6ygBvR/0VABqWnQ0iriNEFn+CsJB+Ek=;
        b=WDgZSlVJ3GBfjhf+vHihJeDBTqh6+CA7eG77HAV8NvJTZl7QhinN7N2g099Jjkqx4I
         W7RO87F+Krm1Znwl2gu2cxsuZ6kEgD96wsVhNan303VHWNe1kgop2Tsx/QCEEWxQLLIb
         dih/vJnbiBzDlvvuOzTaeXJ1AQ5teeHTuYKQdiAuEezabaqL3j/eP39NKZZpbjbiDsaJ
         zmUZYRksaJiun6zE89PRPwEukjz4lLqxz4IqhYDe0VWM/7dvkVn5lCy89h+ty/n0xLh4
         KzmiykLiVsFNDp6sHNpRbOcBbdxBCmbD/7wve+XkHjg+JkQtwqC42ma4AeA0xF5k/vLg
         ixOg==
X-Gm-Message-State: AOAM530TeVBkMjF270tLn6tEhl9aPdR/Qo8A4X8vYLG3fZ51v7lzSagA
        WK09MjFAjL9nwky7fU8KFg==
X-Google-Smtp-Source: ABdhPJykYzwpF/s31VOMoMQtq8It7OKYmAJNheq5ayDxQj1CfG2uZLMm4OLqHvdgxQ3LvSglP1l6vw==
X-Received: by 2002:a6b:1415:: with SMTP id 21mr5083540iou.147.1615934422755;
        Tue, 16 Mar 2021 15:40:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a15sm10111499iln.87.2021.03.16.15.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:40:22 -0700 (PDT)
Received: (nullmailer pid 3817711 invoked by uid 1000);
        Tue, 16 Mar 2021 22:40:20 -0000
Date:   Tue, 16 Mar 2021 16:40:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
        narmstrong@baylibre.com, mchehab@kernel.org, a.hajda@samsung.com,
        linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
        shawnguo@kernel.org, linux-media@vger.kernel.org, airlied@linux.ie,
        linux-imx@nxp.com, kernel@pengutronix.de, lee.jones@linaro.org,
        jernej.skrabec@siol.net, s.hauer@pengutronix.de, jonas@kwiboo.se,
        vkoul@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        kishon@ti.com
Subject: Re: [PATCH v5 08/14] dt-bindings: display: bridge: Add i.MX8qxp
 pixel link to DPI binding
Message-ID: <20210316224020.GA3817676@robh.at.kernel.org>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-9-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615370138-5673-9-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 10 Mar 2021 17:55:32 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * No change.
> 
> v3->v4:
> * Add 'fsl,sc-resource' property. (Rob)
> 
> v2->v3:
> * Drop 'fsl,syscon' property. (Rob)
> * Mention the CSR module controls PXL2DPI.
> 
> v1->v2:
> * Use graph schema. (Laurent)
> 
>  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
