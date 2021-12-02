Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F870466C0B
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 23:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241820AbhLBWZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 17:25:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39512 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236904AbhLBWZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 17:25:19 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27848B7E;
        Thu,  2 Dec 2021 23:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638483715;
        bh=AE6jJUbpyJopjkDAQQP9mx+UEpDNMFGeRZm5YRhAzJQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r+Mgui+r+0V+NeP16OIAS342to6QXNTj3XsKtqwqREPzRCqo7fHkDEnF1Vngn1PWu
         pgMATWX2RqfqPZmayL3fmWjmVbrYtGsxM2c9OkIBAzCnrpQwCeVWcyi2Kt7Po8oq0k
         ZGgM8xeObrmkMcDf+6Mt7rt5/F3modbiBRLDtCD0=
Date:   Fri, 3 Dec 2021 00:21:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then
 schema
Message-ID: <YalG6C+EtgRf/A32@pendragon.ideasonboard.com>
References: <20211202023021.3655384-1-robh@kernel.org>
 <1638453489.547327.3736894.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1638453489.547327.3736894.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Thu, Dec 02, 2021 at 07:58:09AM -0600, Rob Herring wrote:
> On Wed, 01 Dec 2021 20:30:21 -0600, Rob Herring wrote:
> > The if/then schema for 'data-lanes' doesn't work as 'compatible' is at a
> > different level than 'data-lanes'. To make it work, the if/then schema
> > would have to be moved to the top level and then whole hierarchy of
> > nodes down to 'data-lanes' created. I don't think it is worth the
> > complexity to do that, so let's just drop it.
> > 
> > The error in this schema is masked by a fixup in the tools causing the
> > 'allOf' to get overwritten. Removing the fixup as part of moving to
> > json-schema draft 2019-09 revealed the issue:
> > 
> > Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@30750000: ports:port@0:endpoint:data-lanes:0: [1] is too short
> > 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@32e30000: ports:port@0:endpoint:data-lanes:0: [1, 2, 3, 4] is too long
> > 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > 
> > The if condition was always true because 'compatible' did not exist in
> > 'endpoint' node and a non-existent property is true for json-schema.
> > 
> > Fixes: 85b62ff2cb97 ("media: dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support")
> > Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/media/nxp,imx7-mipi-csi2.yaml           | 12 ------------
> >  1 file changed, 12 deletions(-)
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.

Fixes available in
https://lore.kernel.org/all/20211202221903.21882-1-laurent.pinchart@ideasonboard.com
:-)

> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1562521
> 
> 
> mipi-csi@30750000: '#address-cells', '#size-cells', 'fsl,csis-hs-settle', 'port@0', 'port@1', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/imx7s-warp.dt.yaml
> 
> mipi-csi@30750000: '#address-cells', '#size-cells', 'port@0', 'port@1', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml
> 	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
> 	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml
> 	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
> 	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml
> 	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
> 	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
> 	arch/arm/boot/dts/imx7d-mba7.dt.yaml
> 	arch/arm/boot/dts/imx7d-meerkat96.dt.yaml
> 	arch/arm/boot/dts/imx7d-nitrogen7.dt.yaml
> 	arch/arm/boot/dts/imx7d-pico-dwarf.dt.yaml
> 	arch/arm/boot/dts/imx7d-pico-hobbit.dt.yaml
> 	arch/arm/boot/dts/imx7d-pico-nymph.dt.yaml
> 	arch/arm/boot/dts/imx7d-pico-pi.dt.yaml
> 	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml
> 	arch/arm/boot/dts/imx7d-sbc-imx7.dt.yaml
> 	arch/arm/boot/dts/imx7d-sdb.dt.yaml
> 	arch/arm/boot/dts/imx7d-sdb-reva.dt.yaml
> 	arch/arm/boot/dts/imx7d-sdb-sht11.dt.yaml
> 	arch/arm/boot/dts/imx7d-zii-rmu2.dt.yaml
> 	arch/arm/boot/dts/imx7d-zii-rpu2.dt.yaml
> 	arch/arm/boot/dts/imx7s-colibri-aster.dt.yaml
> 	arch/arm/boot/dts/imx7s-colibri-eval-v3.dt.yaml
> 	arch/arm/boot/dts/imx7s-mba7.dt.yaml
> 
> mipi-csi@30750000: 'ports' is a required property
> 	arch/arm/boot/dts/imx7s-warp.dt.yaml
> 

-- 
Regards,

Laurent Pinchart
