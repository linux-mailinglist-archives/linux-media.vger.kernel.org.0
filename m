Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC7A39180F
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 14:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhEZM5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 08:57:38 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40919 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbhEZM5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 08:57:37 -0400
Received: by mail-ot1-f54.google.com with SMTP id 80-20020a9d08560000b0290333e9d2b247so890664oty.7;
        Wed, 26 May 2021 05:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WDr90ifdj3u4jYGhMgen8Q6MrQ4gfRqH3T4/ru0a4II=;
        b=Qj7b8p2dNtsvq7T1B31iBI9d5i0TdoaWEUALhShc1tK1NptnHoHXdgyd0jYcEHBbrb
         AZkORoRKulecduL2t7ed/jfeE9R6Eay5zOwrgFixYjUANZ+Os9aecNoP2cBjgG7MMV9O
         aC8Id/hA9AkNBht/VzO2VVKg7KdoB1l9usknDeTKqzJ+kZkbOHvammFCkbKg0Ug6YUgk
         Lhstell3d2sz8C+vKXuT54zN8+P0oaEx0BvR6Dv+1HHGWSBJrVKwCiMoonyhb1gidVXn
         lmgv1HfPAvOeLlCet9EH0SqXHaJ892k71yvPm77LBEVt9GRNg90fWWuAuxDtSBzhcbFa
         AYrw==
X-Gm-Message-State: AOAM531n1FNe0IKSnNnNHq7LwHHZWLHzKCeHTUrXPkUDIiNFKiBWiiLf
        0Xb1msmgYGmZr7EIUJtdzw==
X-Google-Smtp-Source: ABdhPJy3kdIks/OI8CbwKalMBM56yICQjALGsg75Oj3b8ExULJoXEYRQiX3P5w2JcRHh7aqnH9h4qQ==
X-Received: by 2002:a9d:6d04:: with SMTP id o4mr2124928otp.57.1622033766082;
        Wed, 26 May 2021 05:56:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x65sm4410986otb.59.2021.05.26.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:56:05 -0700 (PDT)
Received: (nullmailer pid 2377033 invoked by uid 1000);
        Wed, 26 May 2021 12:56:03 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alex Bee <knaerzche@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-rockchip@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-staging@lists.linux.dev, Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20210525152225.154302-9-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com> <20210525152225.154302-9-knaerzche@gmail.com>
Subject: Re: [PATCH 08/10] media: dt-bindings: media: rockchip-vpu: add new compatibles
Date:   Wed, 26 May 2021 07:56:03 -0500
Message-Id: <1622033763.765019.2377032.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 25 May 2021 17:22:23 +0200, Alex Bee wrote:
> Add compatibles for RK3036, RK3066, RK3188 and RK3228. Also reflect the
> changes to the additional clocks for RK3066/RK3188.
> 
> Checked with:
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  .../bindings/media/rockchip-vpu.yaml          | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:54:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/rockchip-vpu.yaml:57:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1483524

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

