Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265D573F5BD
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 09:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjF0Hav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 03:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjF0Hak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 03:30:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C56F0;
        Tue, 27 Jun 2023 00:30:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f122ff663eso5637297e87.2;
        Tue, 27 Jun 2023 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687851037; x=1690443037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBOWauk2AKi87uOqrydKsQRQF5cnDl3u07xOkoZ/byE=;
        b=GnxOWtGJ4I+rL0SK/BjzAynMJZ052bvLheWsCmME6lRcXIoqHZaEXRQJgCNciZXGhf
         IUep5Ku8f8fv4rgLWlaIJYFf8Ro27RIdKjOT5p+TKnnws6ZMXym/zI/uBOgu+7SUmHGw
         4yzRC9MMEPuxkSrXF3IZ7gh7cMSTbdr6uA8R3KJ0vlSGFnehzkoqTWWVlpTf9wcHwBfu
         r2VjFKzU2Zea9fqlebIKokfC/bbfl8TpWFmGr/knsn2Yf21ehw8o74rUoKs/NQly0hgJ
         4RX7jFNn0qDQwvmh9yfoUvZfthERJSj2egdZZqXRwYC/SnfSIaqtd/6mL8lCdpCoMhCR
         G2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687851037; x=1690443037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBOWauk2AKi87uOqrydKsQRQF5cnDl3u07xOkoZ/byE=;
        b=SVxZwnmJAs0aGqGTfdlC7nugnj/QJShzykRwYYyoDp3KhRzl+xBCyTgP+KY7TbndlD
         Ke0m9rFngbREThURjZr/UtPcKDfFsfI/ADEU148u9fLmDzG7Yi2u/MZwBqYfJ2cwnhD8
         oX9rJniOHNOdONtnLkbdwPq/ym/xEXvOPxl2TSpHXLGnuRLZze/Z1ftMmIhjP2L1HAZA
         PM14uL//Tk8L0AJ5atqmpyxaMree7vdl3chNWKqx+Ixj7MVzMiYUlAADIvQZNc33mO8+
         E0u5PSmUjezERxa5VJUV/zKtBW54rdo9ygO+mw532knlWUpkrSdbMVrpv3B+kGBkOZs7
         bB8w==
X-Gm-Message-State: AC+VfDyA+0UBF0xQOyeEwE0Z0xm1fBthTGV4cLDEGZ0snXz6YohPrXd4
        xyFQQLYhQ0bFavIr8gYaqvvc3CihD6xdVBM0
X-Google-Smtp-Source: ACHHUZ42ZlnD8cSdC4L0BZi7p9xzAOFSNkGx0jJ5GOz1Y6L9Zx65V+g6e1/CFlE7PYqse2IWm54loQ==
X-Received: by 2002:a19:5f4f:0:b0:4f9:5718:70b0 with SMTP id a15-20020a195f4f000000b004f9571870b0mr9979264lfj.41.1687851036335;
        Tue, 27 Jun 2023 00:30:36 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation ([62.19.185.38])
        by smtp.gmail.com with ESMTPSA id o16-20020a1c7510000000b003f9b155b148sm12752503wmc.34.2023.06.27.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:30:35 -0700 (PDT)
Date:   Tue, 27 Jun 2023 09:30:32 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 1/2] media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI
 compatible string
Message-ID: <ZJqQGD2jSpDm46Lv@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
 <20230626032735.49500-2-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626032735.49500-2-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

On Mon, Jun 26, 2023 at 11:27:34AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add the compatible string support for i.MX93 ISI.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 6038b9b5ab36..e4665469a86c 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
> +      - fsl,imx93-isi
>  
>    reg:
>      maxItems: 1
> @@ -72,7 +73,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: fsl,imx8mn-isi
> +            enum:
> +              - fsl,imx8mn-isi
> +              - fsl,imx93-isi
>      then:
>        properties:
>          interrupts:
> -- 
> 2.37.1
> 

Looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>


Regards,
Tommaso
