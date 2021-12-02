Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9976D4664D8
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 14:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358355AbhLBOBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 09:01:39 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:43753 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhLBOBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 09:01:36 -0500
Received: by mail-ot1-f46.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so18568220otu.10;
        Thu, 02 Dec 2021 05:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=z2HpIZws1sved5YYiAwSOa9ptMHfWgEG147HRUeGxkA=;
        b=FfuZKqmfH1eZowv8SuwXMwD4K3ZrjxZXLXMFKVTK6fhH8CjbPHrJrJCeTd84D3e6RL
         PQiRQwt9l8cMF4YiuaT34eDUT5xZcPYS9CCX3H8NA3BMLYCnHLIvbEBymWmc0O3SZ+Pa
         0nl1VRJWBd9Ag/OeoUHPfOrRzscwW9qumBn75lqJBdsf/4Z8BI2JdsvMQkdKVGI+rgCQ
         TjddxsCTNXBqrFgM0lRUNausBHwebKmg84AfN0aBW6SwvZzSCCqW3M8BoGkwko8Fkl9h
         3sxPKBotl5EqUjsjrOQ1xPeMkWq0Ngp7xwQTbkbUxIRxhYskvKadtr5yTM7v9RAJ2iCX
         5ZLw==
X-Gm-Message-State: AOAM533jT2FUlg7FaZfT56fW17+RbwHTm2EI4ZYciZr9WWWuTEHOuLOv
        do+SQ/zECJ/n/PVqWrrrtQ==
X-Google-Smtp-Source: ABdhPJy674RwGXJHS5FTkNGv7TsgNd2LAzi4mTV02/kC09vSTgF3P3tTTIXMsJHbGzhyDU9YMStGuw==
X-Received: by 2002:a9d:4702:: with SMTP id a2mr11485633otf.262.1638453493418;
        Thu, 02 Dec 2021 05:58:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q10sm1239779oiw.17.2021.12.02.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 05:58:12 -0800 (PST)
Received: (nullmailer pid 3736897 invoked by uid 1000);
        Thu, 02 Dec 2021 13:58:09 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20211202023021.3655384-1-robh@kernel.org>
References: <20211202023021.3655384-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then schema
Date:   Thu, 02 Dec 2021 07:58:09 -0600
Message-Id: <1638453489.547327.3736894.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 01 Dec 2021 20:30:21 -0600, Rob Herring wrote:
> The if/then schema for 'data-lanes' doesn't work as 'compatible' is at a
> different level than 'data-lanes'. To make it work, the if/then schema
> would have to be moved to the top level and then whole hierarchy of
> nodes down to 'data-lanes' created. I don't think it is worth the
> complexity to do that, so let's just drop it.
> 
> The error in this schema is masked by a fixup in the tools causing the
> 'allOf' to get overwritten. Removing the fixup as part of moving to
> json-schema draft 2019-09 revealed the issue:
> 
> Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@30750000: ports:port@0:endpoint:data-lanes:0: [1] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@32e30000: ports:port@0:endpoint:data-lanes:0: [1, 2, 3, 4] is too long
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> 
> The if condition was always true because 'compatible' did not exist in
> 'endpoint' node and a non-existent property is true for json-schema.
> 
> Fixes: 85b62ff2cb97 ("media: dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support")
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml           | 12 ------------
>  1 file changed, 12 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1562521


mipi-csi@30750000: '#address-cells', '#size-cells', 'fsl,csis-hs-settle', 'port@0', 'port@1', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/imx7s-warp.dt.yaml

mipi-csi@30750000: '#address-cells', '#size-cells', 'port@0', 'port@1', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-meerkat96.dt.yaml
	arch/arm/boot/dts/imx7d-nitrogen7.dt.yaml
	arch/arm/boot/dts/imx7d-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx7d-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx7d-pico-nymph.dt.yaml
	arch/arm/boot/dts/imx7d-pico-pi.dt.yaml
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml
	arch/arm/boot/dts/imx7d-sbc-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-sdb.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-sht11.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rmu2.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rpu2.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7s-mba7.dt.yaml

mipi-csi@30750000: 'ports' is a required property
	arch/arm/boot/dts/imx7s-warp.dt.yaml

