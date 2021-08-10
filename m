Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C493E5C3C
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 15:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241986AbhHJNxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 09:53:17 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:35668 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241985AbhHJNxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 09:53:16 -0400
Received: by mail-io1-f44.google.com with SMTP id s184so32376961ios.2;
        Tue, 10 Aug 2021 06:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=n0pQptOPLSLX5QIJ3YjoYTw0YmHkHPJHCW1Ja2cSyMo=;
        b=V1c4zjkhhnB+pdUELhG0WzBxByYShwBNI66ug+B2Po62RO2Aj/WxQ0CLhHrHxLYzaI
         O5EqtcCwnZ6v5w8Ml97WOp3c5+lD8GX5L4b2KpjJZ7luUiG0OrHNcJbGwuBF8OL71yft
         g4c8zqM3DCf8+mJ/BZM55MMi/BXAsjC2mwo2RQcIydSdAvoTm04cmXfAcqjLKL6uWl8G
         21fY4xpnsM1Rzwe3mfDpQ/143bcrA5uzBQmesc8ZZ6UVc51CHt/xJr8tPR0nlFkmv0TH
         E2jyyT22Jp2lf8lJxwykHh/Ug+PqKdlf1ZLj2Ffpt2hUfa1S5Q4OR6c7UmngwKYYcYmH
         QpRg==
X-Gm-Message-State: AOAM533hN8HS3GNSc+dhbwfsBqxKv2eyOS6C3rI8R6XM6UsRtpZcqu8T
        nCCJqWdv19iZMCwmErTe0Q==
X-Google-Smtp-Source: ABdhPJxbfBYGw8RHYSAjad8JbTAHBSwUTqo3bLN+N1qARLZk4PyFRs8m9FCgFlBHdl8i3mVv/aeDHw==
X-Received: by 2002:a6b:f813:: with SMTP id o19mr315560ioh.49.1628603574396;
        Tue, 10 Aug 2021 06:52:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e12sm1423228ilc.16.2021.08.10.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 06:52:53 -0700 (PDT)
Received: (nullmailer pid 1500790 invoked by uid 1000);
        Tue, 10 Aug 2021 13:52:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Rob Herring <robh+dt@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Tomasz Figa <tfiga@google.com>, linux-media@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-mediatek@lists.infradead.org,
        George Sun <george.sun@mediatek.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>
In-Reply-To: <20210810083047.16693-14-yunfei.dong@mediatek.com>
References: <20210810083047.16693-1-yunfei.dong@mediatek.com> <20210810083047.16693-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v4, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
Date:   Tue, 10 Aug 2021 07:52:51 -0600
Message-Id: <1628603571.555258.1500789.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 10 Aug 2021 16:30:45 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Change-Id: I2c482fa6c0a91b5fc4f1950dd563cbc4d6c35da1
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v4: fix yaml file check fail
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

See https://patchwork.ozlabs.org/patch/1515305

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

