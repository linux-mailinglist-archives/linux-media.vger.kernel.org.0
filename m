Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6122ED3BC
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 16:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbhAGPrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 10:47:51 -0500
Received: from mail-il1-f171.google.com ([209.85.166.171]:36336 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbhAGPrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 10:47:51 -0500
Received: by mail-il1-f171.google.com with SMTP id u12so7144695ilv.3;
        Thu, 07 Jan 2021 07:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=VYV9mW9VGIQs6XlBAT9aPte1dh6zAyieEkbEaZDlIzA=;
        b=PdUziZd5All0qdvQPquc9AM7sc2cN0oul6D34cdPBRZj+cs425w0eLXuMMd0TZpXiV
         nM4GWng6zmb1usD0pr+wdUBSkrZiJyOxCtq0Sxspa578kLMi2hGNAydcmTUQKtIMx8xv
         yzfGlo1RSxy9dQyd3Z27e+N9A0spT4VSvjrrGEIGn/IcXCbt7EJSVSf+7+TEt3LYgRBo
         VY3AX74Q/lb5G2ZWZIrg/+zdPLFkzMdUcr3TnFubX9T9csNuljs7EaltyCDnrZHX5SJh
         2Cb3hAN+Jnp2gJxFHtCZaC3PJ0ev80wc11OPVFVbAHS84hWDSUsjb4jNF9VxtVOreuTw
         0+Fw==
X-Gm-Message-State: AOAM532jLuiFbru+2/7vj0HPIuEURacdgxFtXbaOlIRHqYC5BuLg3da1
        VH22ky65etU0QHoOyB/bPw==
X-Google-Smtp-Source: ABdhPJzu6IB/yYHXV5VWJmKQJzxJTxPazba178YiSWDahPUZgTyO4v4/dFAadaYPZ7WVb2PEbRlTAQ==
X-Received: by 2002:a92:c081:: with SMTP id h1mr3165387ile.46.1610034429707;
        Thu, 07 Jan 2021 07:47:09 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a18sm5020137ilt.52.2021.01.07.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 07:47:08 -0800 (PST)
Received: (nullmailer pid 907942 invoked by uid 1000);
        Thu, 07 Jan 2021 15:47:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210107134101.195426-2-paul.kocialkowski@bootlin.com>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com> <20210107134101.195426-2-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 1/5] dt-bindings: media: rockchip-rga: Add PX30 compatible
Date:   Thu, 07 Jan 2021 08:47:05 -0700
Message-Id: <1610034425.195215.907941.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 07 Jan 2021 14:40:57 +0100, Paul Kocialkowski wrote:
> Add a new compatible for the PX30 Rockchip SoC, which also features
> a RGA block. It is compatible with the RK3288 RGA block.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip-rga.yaml:25:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1423299

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

