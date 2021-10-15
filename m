Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3790442FD97
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 23:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243168AbhJOVrl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 17:47:41 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:38864 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238695AbhJOVrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 17:47:40 -0400
Received: by mail-oi1-f171.google.com with SMTP id t4so14951505oie.5;
        Fri, 15 Oct 2021 14:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NYOyme/cinRUC3bVzCpIQa4360myarzWLY66zGOmnyw=;
        b=em9lMnAlGSyml7XvWGy4vWsm+YZZNN5iIpW+anlCUECLGDMwa5u7nPYny51pWSnEvj
         HwbuJJRw3TkTqDUdgiyQU0nZsIvfSflinbL4ES0hhLCciWPs2CZ5Gu7lIhBVjuk9AKU6
         jbxtXsjN1hsICwL4ekhqMuT4NIgddwdE5hoWYgDFF89RFKv8B0dOnsIybtLfkeS/CyUw
         foBgHhRL0dEVpgEzffu6Pb/TwEL6XPzBr9EAEqs9htZWkNMzSRSjEpn+k3rZBgxYCjqz
         IXSWrAuadhEvAGwWiLBkM84o4oYEb86aC5GTGN0rcMyv9Psg89SLqq/5+/vVx7Rcj5FO
         Insg==
X-Gm-Message-State: AOAM533H93c3rkvi0jwS78hxlvCoc/Lmug1uhwnhCMs/8dTzdTjNT9DU
        vOMvjuLzJdqlVMYTkFydmg==
X-Google-Smtp-Source: ABdhPJyxArKeXBHH7sHkPc47Cnex9p1URhiMiWu4n0F61RgItK1JWSN1OQ8mY/jCwu8apIz9fTyk1g==
X-Received: by 2002:aca:d64a:: with SMTP id n71mr14261693oig.40.1634334333530;
        Fri, 15 Oct 2021 14:45:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m7sm1261843oiw.49.2021.10.15.14.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 14:45:32 -0700 (PDT)
Received: (nullmailer pid 2254012 invoked by uid 1000);
        Fri, 15 Oct 2021 21:45:31 -0000
From:   Rob Herring <robh@kernel.org>
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     acourbot@chromium.org, srv_heupstream@mediatek.com,
        pihsun@chromium.org, linux-mediatek@lists.infradead.org,
        Rob Landley <rob@landley.net>, allen-kh.cheng@mediatek.com,
        randy.wu@mediatek.com, tfiga@chromium.org,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        linux-media@vger.kernel.org,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        sj.huang@mediatek.com, menghui.lin@mediatek.com,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, drinkcat@chromium.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, hsinyi@google.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211015123832.17914-6-moudy.ho@mediatek.com>
References: <20211015123832.17914-1-moudy.ho@mediatek.com> <20211015123832.17914-6-moudy.ho@mediatek.com>
Subject: Re: [PATCH v8 5/7] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
Date:   Fri, 15 Oct 2021 16:45:31 -0500
Message-Id: <1634334331.594718.2254011.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 15 Oct 2021 20:38:30 +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,ccorr.yaml |  59 +++++
>  .../bindings/arm/mediatek/mediatek,rdma.yaml  | 211 ++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,wdma.yaml  |  70 ++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  68 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  70 ++++++
>  5 files changed, 478 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/arm/mediatek/mediatek,rdma.yaml:211:7: [error] no new line character at the end of file (new-line-at-end-of-file)
./Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1541634

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

