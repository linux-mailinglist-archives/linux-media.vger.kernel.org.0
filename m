Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F9B3FED64
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 14:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343954AbhIBMFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 08:05:00 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:44547 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343933AbhIBME7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 08:04:59 -0400
Received: by mail-oi1-f182.google.com with SMTP id c79so2164667oib.11;
        Thu, 02 Sep 2021 05:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=DqbDBOn9LbPv6mE+TZV/se5KZ66whWGBwMTUDdN1R0w=;
        b=jpAm6ZHWXVTiWU1Vtd3s6fVVxr3+K6cVEXrYsEFjFtWMBYSHuPvizBn7PCN6veZSvi
         qewj+GgMkBSr5eE1qgOZpfywLP/NM/Uj0TMpIi/ei0wUz6qRpzUzDTWOOiD6zDn+SgXC
         e1Kc26Li76t8kZMZhxUG0EO4yOrfMCcmj/LciVSeOkOr85TVRZOjM3YQbsLHtbGWb+i2
         9RGPCt67pvCKOd8O4Z5QAR7cTse/yzKmUcOxOKg36StuDUDLoRcnsp/VqoXBcxAxrx3v
         UbWi/4Ggpx7vSdhSxSf81r8jBNYRKCpCi9wUU11ze2AxiNsGzYsGQiA4iRyqj0meMkbx
         t6tQ==
X-Gm-Message-State: AOAM531MTgaW04iejORq8hEM2GXjjaczbWZYdRl2JJbkN7r+aqanAnYf
        Vf+KiLvxLN6OVvmz7Gf9bA==
X-Google-Smtp-Source: ABdhPJy5zHgT3CYbVHjqBlaKAIqyikhF9TQAXsaSbQ2sq9Ke9YuXUA+5Iro8Kv4/IbpBmwXXV+8GSg==
X-Received: by 2002:a05:6808:d53:: with SMTP id w19mr1890899oik.135.1630584240956;
        Thu, 02 Sep 2021 05:04:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c10sm305218ots.48.2021.09.02.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 05:04:00 -0700 (PDT)
Received: (nullmailer pid 685596 invoked by uid 1000);
        Thu, 02 Sep 2021 12:03:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tzung-Bi Shih <tzungbi@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-mediatek@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>
In-Reply-To: <20210901083215.25984-14-yunfei.dong@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com> <20210901083215.25984-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v6, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Thu, 02 Sep 2021 07:03:59 -0500
Message-Id: <1630584239.076177.685595.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 01 Sep 2021 16:32:13 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v6: add decoder block diagram for Laurent's comments.
> 
> This patch depends on "Mediatek MT8192 clock support"[1].
> 
> The definition of decoder clocks are in mt8192-clk.h, and this patch already in clk tree[1].
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 192 ++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: properties:compatible: [{'enum': ['mediatek,mt8192-vcodec-dec', 'mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-core']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:22:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   22 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1522931

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

