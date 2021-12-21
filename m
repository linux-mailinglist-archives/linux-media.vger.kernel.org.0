Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7294847C958
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 23:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233860AbhLUWpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 17:45:40 -0500
Received: from mail-qt1-f174.google.com ([209.85.160.174]:35335 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbhLUWpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 17:45:39 -0500
Received: by mail-qt1-f174.google.com with SMTP id j17so315667qtx.2;
        Tue, 21 Dec 2021 14:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=x/A60G0kM02XRH/dAeHery1JpbFGVP5ZMcG3xwB6KGo=;
        b=5lNJ3M+BdAl6j03THWwFQwCGRszv4B5h5RHgE0VkBnZDghK8NIkiVgj4EIYxja+9n2
         5NAknyl0uvm9Pt7wRhpXxD4/OqYbdiD+0NvnXIs8Oz2doGhJ8tASdRpstN4A8jIaFOhV
         yLRQwHd42lWWxbAZxF0jjnJCo5G9//P3/YtTAJ2Y2JlUNXNOQGPRKIy/EGxe5WQstgQ9
         bFlxv2D8SjmH0Nzhe/9KJ0lofhMwgEUrqXtYSJX4pCTzYD43MWOWpe02n3Mm2leUVC1l
         sgm+VoFauwcOODvu1aC8IZCeTLt1iX9QiJiSdYcYYK9hOsfSaN/hA/pIkIlOvNZ+bgtV
         9xaw==
X-Gm-Message-State: AOAM533ASCtsZZar9qmEK+5RN/n5RE5yiZyLATVHUEzapEK33suiJNwX
        r5K1TaloVf4GAgejQ5ViSQ==
X-Google-Smtp-Source: ABdhPJx0GBuZaiayfR04hPbCCwiohMvoN3CZEUJd+pEe4HxNmjTC8HaesqCBlAG9ffXl20qmAmRlFg==
X-Received: by 2002:ac8:5993:: with SMTP id e19mr297744qte.239.1640126738858;
        Tue, 21 Dec 2021 14:45:38 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id a16sm220047qta.94.2021.12.21.14.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 14:45:38 -0800 (PST)
Received: (nullmailer pid 1654438 invoked by uid 1000);
        Tue, 21 Dec 2021 22:45:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20211221161224.71258-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211221161224.71258-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] dt-bindings: i2c: maxim,max96712: Add bindings for Maxim Integrated MAX96712
Date:   Tue, 21 Dec 2021 18:45:31 -0400
Message-Id: <1640126731.367259.1654437.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 21 Dec 2021 17:12:24 +0100, Niklas Söderlund wrote:
> Add bindings for Maxim Integrated MAX96712 deserializer. The MAX96712
> deserializer converts GMSL2 or GMSL1 serial inputs into MIPI CSI-2 D-PHY
> or C-PHY formatted outputs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> * Changes since v1
> - Fixed spelling in binding description.
> - Drop 'staging' per Rob's suggestion.
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/i2c/maxim,max96712.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1571752

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

