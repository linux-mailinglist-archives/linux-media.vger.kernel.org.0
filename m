Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6A62ED3B9
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 16:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbhAGPry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 10:47:54 -0500
Received: from mail-il1-f172.google.com ([209.85.166.172]:38951 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbhAGPrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 10:47:53 -0500
Received: by mail-il1-f172.google.com with SMTP id q1so7143965ilt.6;
        Thu, 07 Jan 2021 07:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=EFvubgNg2DnmOPkDfoaERPy8UEjZfnIKtkw4s3eQ4y8=;
        b=sG216gqm6cWxCBpp/Fe2MgfVhF6mNyWyc6ZAP7+c/GoELLk9MZA1uLrimTEjLWekdN
         Ys5FLgKGYbhy5ZWnOEgYlxWy/bRZNkYC0GwFz5I6CrO3FJkRTcSqF50e91Q4dYQYf6uV
         NeSQg+BTqRSuOpRFphDmPTokSjVa1QLYIYmKPeouW5/GCw3bhN3Z8kxqA/Z0A8x6u8F9
         3L+GWCa/K0QuGT5XufNxsST0CywuCs1ogv1Cqhmw79c/J2wPjZJd7/3Rdg7WV0w59nZM
         ggecY4kTnNiLHqmqYwGc69nm6bK8abM5kcG7RDw+6ZFu/2XIhEzy0XumhzT4uXmW+zpt
         fdzw==
X-Gm-Message-State: AOAM533vc2/+k1RZ9G8Ijfmul3pYL1InbUiJ8/YU4s979BDzS6iBPOgX
        jztodFvGvKV1J/GshyF0kHWUHZcnmA==
X-Google-Smtp-Source: ABdhPJzWIw7GRMQcaSe+m/tRZb/B+liDGhOIlES2tHNkuZBjMlXU4n/TvVLDxcrPd++qzPI4GJCjSw==
X-Received: by 2002:a92:cccb:: with SMTP id u11mr9488057ilq.44.1610034432686;
        Thu, 07 Jan 2021 07:47:12 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id x3sm3510521ila.29.2021.01.07.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 07:47:11 -0800 (PST)
Received: (nullmailer pid 907945 invoked by uid 1000);
        Thu, 07 Jan 2021 15:47:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20210107134101.195426-4-paul.kocialkowski@bootlin.com>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com> <20210107134101.195426-4-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 3/5] dt-bindings: media: rockchip-vpu: Add PX30 compatible
Date:   Thu, 07 Jan 2021 08:47:05 -0700
Message-Id: <1610034425.207068.907944.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 07 Jan 2021 14:40:59 +0100, Paul Kocialkowski wrote:
> The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
> and an encoder (VEPU2). It is similar to the RK3399's VPU but takes an
> extra clock (SCLK).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/rockchip-vpu.yaml          | 25 +++++++++++++------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:47:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:50:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1423300

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

