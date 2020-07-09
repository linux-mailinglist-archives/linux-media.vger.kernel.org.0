Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4F521A562
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 19:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgGIRBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 13:01:41 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38696 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgGIRBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 13:01:41 -0400
Received: by mail-io1-f67.google.com with SMTP id l1so3088681ioh.5;
        Thu, 09 Jul 2020 10:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Er3giFzIWiCqOJU/xU45i9/BHu6SeSgH1xHICv5tCwU=;
        b=WUUu/BW/WV5cIBYAYLB6EnUqbv/gApbm9eau73sGf4eI8lAWTXhpdNjAcEP+M11afO
         RlZftnArOi8KPqtgNQGsOupFxaSDegWO/GgcqqZGopJ3sHk/ZTAojM3c7qIaOsIRGbA3
         mHfmMfNvS2woIMTdhUAnP6UaEGBlWaFWefu7QbOxaNq6hV49MbVuM3A75Q57E+FABGFm
         xtOe9j8CNi2jacYlFUUtlOBYFBy55un0a1vUjITrZqCCl6Z/4m5XH0Tnz+kovkcaGiC2
         ZoWbNPKvIMrUKH75ySDwddXG0Hr5krqBMsVoOZsBxlIhpcu/AQ+1teAV4JjK5AYTFqli
         u2DQ==
X-Gm-Message-State: AOAM533XIVJjopzoU+r+VaI+o+n19MN1EVgHHidnjvaklom4Styeaxpw
        pEP3Ioel7I0YWJx93GmHvkDBmc4r6A==
X-Google-Smtp-Source: ABdhPJxK2ErXCvsSoquRPWJojKNCsb574lsT1sbXYS2wzkcsb5QNVYolVx6d5J3+bn2mqZD8MIG2Cw==
X-Received: by 2002:a05:6638:22d2:: with SMTP id j18mr36358763jat.55.1594314100341;
        Thu, 09 Jul 2020 10:01:40 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id t12sm2122551ilo.80.2020.07.09.10.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:01:39 -0700 (PDT)
Received: (nullmailer pid 519812 invoked by uid 1000);
        Thu, 09 Jul 2020 17:01:38 -0000
Date:   Thu, 9 Jul 2020 11:01:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     Jerry-ch.Chen@mediatek.com, matthias.bgg@gmail.com,
        keiichiw@chromium.org, tfiga@chromium.org,
        frederic.chen@mediatek.com, christie.yu@mediatek.com,
        jungo.lin@mediatek.com, devicetree@vger.kernel.org,
        Sean.Cheng@mediatek.com, hans.verkuil@cisco.com,
        mchehab@kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, yuzhao@chromium.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        laurent.pinchart+renesas@ideasonboard.com, zwisler@chromium.org,
        linux-media@vger.kernel.org
Subject: Re: [RFC PATCH V7 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200709170138.GA519166@bogus>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708104023.3225-3-louis.kuo@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 08 Jul 2020 18:40:22 +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.yaml       | 223 ++++++++++++++++++
>  1 file changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/media/mediatek-seninf.example.dts:23:18: fatal error: dt-bindings/power/mt8183-power.h: No such file or directory
         #include <dt-bindings/power/mt8183-power.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/media/mediatek-seninf.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/media/mediatek-seninf.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1325155

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

