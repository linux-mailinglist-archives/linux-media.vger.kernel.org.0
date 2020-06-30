Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE8920FE6E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 23:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgF3VDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 17:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgF3VDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 17:03:36 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8A3C03E979
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 14:03:35 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y13so12222150lfe.9
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PjU8LAZRfkKwjEfQp/C6gHlytaYYnBRvg8dwpQ1D6Cw=;
        b=M51V8KCfEOfuNKYbStqI3kDXtEmV7at6P2apYiGE+5bYNNQN5nOi4JygqfIIkYfQGs
         cIKe83j3IJmzY2MNATDv+wll1XgWFTuQKvf1VO5S4n50abTcFmpXtSBNR2BsG5J8hGWN
         LMv6QCT3FFued2MgftsCVkKBNUd5NXrjpnQ+OCGgci6pauVCz+Og1UgfoSS6YM1YLSHy
         9Xl+xYqFV0fymcJ9ECtuTF5EvYJMgUauBKkyDy7iwhlk5Emkafj6RVdCm0K6rrV6eq+Y
         R1+RaIOrHOPcUWmVdD3/iova53XF753UTQUBnR2Yo1tm+jpQBoJte8Lxdeh9x1AvSCX1
         E/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PjU8LAZRfkKwjEfQp/C6gHlytaYYnBRvg8dwpQ1D6Cw=;
        b=MPgkOXbtVUw5td9ZS4zKxsi12RcRGz0kdqI3GQSwO5MIY3JUnEWcODeSg5H3/A+nPe
         flmEF179nlkrRW9lS6Wotax3FVAiSgjaA759KZ81MgG7MgN5ezmBV9bVJmW7fDZ6fDEF
         4TU48xVd45fE4Mr1n6JQXzRZpR5td4io/z3ogNZg+UiuAkDYFwg1cBViAJA1wzF9U3LY
         2cFyifVec5nLBlsx9XN+gxIw0d6KqfVMk6NUBMYr80DSNoTLHp6Ft4RT8ozH3u1eIzzW
         eZkTkN4XpjWM9u3IYXwa1pIP4iOJWbsOTpEMwRUebJKHtDmuT7aLfQvcJIJ2+T57rV00
         v2vA==
X-Gm-Message-State: AOAM533r+iE9s9/+LxYT1Tz9X1mUpItAYc7Vtxn0S1UBYW/Rt08bZcsP
        hDtdz2a8JEY143idWwTs0O85fg==
X-Google-Smtp-Source: ABdhPJwUbEeifJyd/WCrFKRdiRUNY5LgqYyFB6ZwCRtvzJWrwr67EOgsIxyATWjjD/Ovcu5Ey+/Ltw==
X-Received: by 2002:a05:6512:550:: with SMTP id h16mr12999586lfl.155.1593551013088;
        Tue, 30 Jun 2020 14:03:33 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 16sm1088750ljw.127.2020.06.30.14.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:03:32 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:03:32 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: media: renesas,vsp1: Add
 power-domains and resets
Message-ID: <20200630210332.GH2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2020-06-21 03:47:34 +0300, Laurent Pinchart wrote:
> The power-domains and resets properties are used in all DT sources in
> the kernel but are absent from the bindings. Document them and make them
> mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 65e8ee61ce90..990e9c1dbc43 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -29,6 +29,12 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
>    renesas,fcp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -39,6 +45,8 @@ required:
>    - reg
>    - interrupts
>    - clocks
> +  - power-domains
> +  - resets
>  
>  additionalProperties: false
>  
> @@ -59,24 +67,30 @@ examples:
>    - |
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
>  
>      vsp@fe928000 {
>          compatible = "renesas,vsp1";
>          reg = <0xfe928000 0x8000>;
>          interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&cpg CPG_MOD 131>;
> +        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +        resets = <&cpg 131>;
>      };
>  
>    # R8A77951 (R-Car H3) VSP2-BC
>    - |
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
>  
>      vsp@fe920000 {
>          compatible = "renesas,vsp2";
>          reg = <0xfe920000 0x8000>;
>          interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&cpg CPG_MOD 624>;
> +        power-domains = <&sysc R8A7795_PD_A3VP>;
> +        resets = <&cpg 624>;
>  
>          renesas,fcp = <&fcpvb1>;
>      };
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
