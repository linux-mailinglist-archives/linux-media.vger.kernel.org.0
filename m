Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B8C3ABDF0
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 23:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhFQV2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 17:28:42 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:47027 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbhFQV2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 17:28:41 -0400
Received: by mail-io1-f54.google.com with SMTP id b14so4728616iow.13;
        Thu, 17 Jun 2021 14:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=BK4/yKFERPq5Q5JT9ah7IGyXargZYodEJ6e9CzGiy3M=;
        b=UenFnamiUDIznudDVz6/ZgG0DONGhQ1XSEBhuRoG8jFFHzRTJlYSbs+7rD69fLGuqx
         hqOgmsPpjZjHnrEfaVZyZeIXI5RgXnbW4dPANp6XocH3IDwShKthMCK9FeWxHnBUw/pB
         UEBKqqcN1SK7ej8ZdbRthkxO5xuP4F6n0cDSfx9TDIHuomBW2i6jUOZqKEMjs7kqK/Yh
         NSK9C4Mgh4w3AyC9VXhKBHC16J+Qy7JDVfCxqtfN+4Hp+ow/A0+tk7FCXIOqrrjPSOtb
         koQmSyEz+/VJxkuzZEKn+zX1S5LEAbHYuG6nm7q5NS2ppKYvJWsGYtnxVpgjFjVLsRwD
         f7SQ==
X-Gm-Message-State: AOAM531FiIXxXfavS3u/Jk6ENPynsChkcIWHCWE8cb73qfIJWuPZjE11
        c8udwtoh8XzCITmuiL/hQw==
X-Google-Smtp-Source: ABdhPJyJjIjZ7icIf3FV7WOoRfpkfxMCTq875Gptr5kBUuCdwKnKUEr+eYj/VVIB+lEYT3uweNNoOg==
X-Received: by 2002:a5e:940a:: with SMTP id q10mr5487243ioj.19.1623965192578;
        Thu, 17 Jun 2021 14:26:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x18sm84588ilm.86.2021.06.17.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 14:26:31 -0700 (PDT)
Received: (nullmailer pid 3336123 invoked by uid 1000);
        Thu, 17 Jun 2021 21:26:24 -0000
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     robh+dt@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        ezequiel@collabora.com, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-rockchip@lists.infradead.org
In-Reply-To: <20210617162745.4080975-10-heiko@sntech.de>
References: <20210617162745.4080975-1-heiko@sntech.de> <20210617162745.4080975-10-heiko@sntech.de>
Subject: Re: [PATCH v5 09/10] dt-bindings: media: rkisp1: document px30 isp compatible
Date:   Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.614652.3336122.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Jun 2021 18:27:44 +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Add the compatible for the px30-variant of the rkisp
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../bindings/media/rockchip-isp1.yaml         | 66 ++++++++++++++++++-
>  1 file changed, 65 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/rockchip-isp1.example.dt.yaml:0:0: /example-1/parent/i2c/camera@36: failed to match any schema with compatible: ['ovti,ov5695']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493733

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

