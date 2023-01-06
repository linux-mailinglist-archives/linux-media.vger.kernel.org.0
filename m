Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38AC365FA0B
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 04:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjAFDSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 22:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjAFDS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 22:18:26 -0500
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE284625C9;
        Thu,  5 Jan 2023 19:18:25 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id m15so528898ilj.8;
        Thu, 05 Jan 2023 19:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZOnIW/A3jIdiVWRwgHX4rB5TbYZO3GMET4Ygn0mlBw=;
        b=pDazbjBTIiRbfOw+XALkcIdy5PjBP0zhCSTBHID8zvdF17ETJrxNuz2FBJVgA4EnKt
         EOByc9JET1CPfju4YcC4GMcY3+2Uq1UZl9c0F9+4SsSindpLQZpW8MMD1dYZaY/zhCs5
         +Gs+I+PKpUa4XWXg6K2QWkpyNtt9rAvWwwrKFgpVEaFIF7oBTlNmmSnVRvapBvNryInE
         T6A7R6uS/X9Exyyi1bph3URQns3IcAbqxg285hynkNjg88HCfR73Bdq9C1mJiKchaN/B
         nBn+WA0NLYaLJbodugU47DEcOo9Nn3eWQqvuB0i3UhhOHBDN05t4QaLGrX0hFVqnZtrI
         vDfQ==
X-Gm-Message-State: AFqh2kosJTIdbHIr7kBayN0b9JfeZcftJcXB+k9niGqpKj5/zXWrVAHj
        oKJdNsB+PaCQfhSUKrp9ZQ==
X-Google-Smtp-Source: AMrXdXvW6c+lNsmShN3+QIbZc3yt5Q0Zr8M8EgW6NPwCGdUJw6F0CI7ZtvGYgqV4lTdGJfR+t1FmFg==
X-Received: by 2002:a05:6e02:1054:b0:30d:7b25:8d04 with SMTP id p20-20020a056e02105400b0030d7b258d04mr3749152ilj.8.1672975105143;
        Thu, 05 Jan 2023 19:18:25 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c2-20020a023f42000000b0039decb5b452sm1322jaf.65.2023.01.05.19.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 19:18:24 -0800 (PST)
Received: (nullmailer pid 2198649 invoked by uid 1000);
        Fri, 06 Jan 2023 03:18:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, linux-imx@nxp.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org
In-Reply-To: <20230105134729.59542-2-m.tretter@pengutronix.de>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-2-m.tretter@pengutronix.de>
Message-Id: <167297493349.2193688.13768937269097834481.robh@kernel.org>
Subject: Re: [PATCH 1/8] media: dt-bindings: media: fsl-pxp: convert to yaml
Date:   Thu, 05 Jan 2023 21:18:21 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Thu, 05 Jan 2023 14:47:22 +0100, Michael Tretter wrote:
> Convert the bindings of the Freescale Pixel Pipeline to YAML.
> 
> The conversion drops the previously listed compatibles for several SoCs.
> It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> on the existing SoCs and would allow to reuse the already defined
> compatibles. The missing compatibles should be brought back when the
> support for the PXP on these SoCs is added.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../bindings/media/fsl,imx6ull-pxp.yaml       | 62 +++++++++++++++++++
>  .../devicetree/bindings/media/fsl-pxp.txt     | 26 --------
>  2 files changed, 62 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230105134729.59542-2-m.tretter@pengutronix.de


pxp@20f0000: compatible:0: 'fsl,imx6sll-pxp' is not one of ['fsl,imx6ul-pxp', 'fsl,imx6ull-pxp', 'fsl,imx7d-pxp']
	arch/arm/boot/dts/imx6sll-evk.dtb
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dtb
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dtb

pxp@20f0000: compatible: ['fsl,imx6sll-pxp', 'fsl,imx6ull-pxp'] is too long
	arch/arm/boot/dts/imx6sll-evk.dtb
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dtb
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dtb

pxp@2218000: compatible:0: 'fsl,imx6sx-pxp' is not one of ['fsl,imx6ul-pxp', 'fsl,imx6ull-pxp', 'fsl,imx7d-pxp']
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dtb
	arch/arm/boot/dts/imx6sx-sabreauto.dtb
	arch/arm/boot/dts/imx6sx-sdb.dtb
	arch/arm/boot/dts/imx6sx-sdb-mqs.dtb
	arch/arm/boot/dts/imx6sx-sdb-reva.dtb
	arch/arm/boot/dts/imx6sx-sdb-sai.dtb
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dtb

pxp@2218000: compatible: ['fsl,imx6sx-pxp', 'fsl,imx6ull-pxp'] is too long
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dtb
	arch/arm/boot/dts/imx6sx-sabreauto.dtb
	arch/arm/boot/dts/imx6sx-sdb.dtb
	arch/arm/boot/dts/imx6sx-sdb-mqs.dtb
	arch/arm/boot/dts/imx6sx-sdb-reva.dtb
	arch/arm/boot/dts/imx6sx-sdb-sai.dtb
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dtb

pxp@2218000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dtb
	arch/arm/boot/dts/imx6sx-sabreauto.dtb
	arch/arm/boot/dts/imx6sx-sdb.dtb
	arch/arm/boot/dts/imx6sx-sdb-mqs.dtb
	arch/arm/boot/dts/imx6sx-sdb-reva.dtb
	arch/arm/boot/dts/imx6sx-sdb-sai.dtb
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dtb
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dtb

