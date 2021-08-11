Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D4C3E96CF
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 19:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhHKRZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 13:25:33 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:45745 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhHKRZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 13:25:29 -0400
Received: by mail-pj1-f53.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so6169722pjl.4;
        Wed, 11 Aug 2021 10:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=zA+3b14ofbyiws8ymmMD/m7+Kf0mcNrODar9P3zeNdc=;
        b=ZzOjEqXL7BDfC0MAmvXOo56Yc4Cq+Q8CPqqwrln4rREsPcAvqXCw69s7yRX7XvLvly
         anU3MSc9+iN6eawKSr7TiRZC2dab1UoAoAPLlp7tmUAaRjZLsoB+d002bGcg4wmkcK1j
         S5mto65MSiW7UOzhi7mTtZZUZ+dUsGacLAFe2Bh+cBTeVejGU8eG/zpDu0D3/rpLpsPu
         zJ/ptAXQNmeCTqjqj4csSkcdA541nBIDYdKkOmkiqahsP3nqahreGn0hGiCdTzIz39Sr
         Ve+/CjKAatB8y7NIVqPZp4EFztBV+r/nD2MENxqdGMqn8TOcRjCQnWQ2l9uvDLbwh6x+
         e8Sg==
X-Gm-Message-State: AOAM530gSy1D82uEj9XTW1en4UvdwwDn4Xaw1Eq8CeGFQdk8w2MpbVtB
        SVrvZEDLjWhUFDwDQLxQjQ==
X-Google-Smtp-Source: ABdhPJwKyhBu56kK4nHhyDFKA48JqamDhYuv7Yhdw715/G0+dgoeHXNeYpZU6Tjc7mq1N8YphlmUJw==
X-Received: by 2002:aa7:9415:0:b029:3ca:3205:b1f6 with SMTP id x21-20020aa794150000b02903ca3205b1f6mr20916038pfo.27.1628702704749;
        Wed, 11 Aug 2021 10:25:04 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id f6sm86234pfv.69.2021.08.11.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 10:25:04 -0700 (PDT)
Received: (nullmailer pid 3975942 invoked by uid 1000);
        Wed, 11 Aug 2021 17:24:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>,
        linux-kernel@vger.kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tomasz Figa <tfiga@google.com>, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fritz Koenig <frkoenig@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        George Sun <george.sun@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org
In-Reply-To: <20210811025801.21597-14-yunfei.dong@mediatek.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com> <20210811025801.21597-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Wed, 11 Aug 2021 11:24:53 -0600
Message-Id: <1628702693.304754.3975941.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 11 Aug 2021 10:57:59 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v5: no changes
> 
> This patch depends on "Mediatek MT8192 clock support"[1].
> 
> The definition of decoder clocks are in mt8192-clk.h, need to include them in case of build fail [1].
> 
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:22:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   22 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1515556

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

