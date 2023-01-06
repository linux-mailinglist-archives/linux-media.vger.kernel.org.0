Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D610865FCA8
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 09:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjAFIXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 03:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjAFIXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 03:23:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A06625E5
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 00:23:50 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDi0e-0008GD-J2; Fri, 06 Jan 2023 09:23:28 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDi0d-0007W9-JA; Fri, 06 Jan 2023 09:23:27 +0100
Date:   Fri, 6 Jan 2023 09:23:27 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, linux-imx@nxp.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] media: dt-bindings: media: fsl-pxp: convert to yaml
Message-ID: <20230106082327.GB24101@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, linux-imx@nxp.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-2-m.tretter@pengutronix.de>
 <167297493349.2193688.13768937269097834481.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167297493349.2193688.13768937269097834481.robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 05 Jan 2023 21:18:21 -0600, Rob Herring wrote:
> On Thu, 05 Jan 2023 14:47:22 +0100, Michael Tretter wrote:
> > Convert the bindings of the Freescale Pixel Pipeline to YAML.
> > 
> > The conversion drops the previously listed compatibles for several SoCs.
> > It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> > on the existing SoCs and would allow to reuse the already defined
> > compatibles. The missing compatibles should be brought back when the
> > support for the PXP on these SoCs is added.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  .../bindings/media/fsl,imx6ull-pxp.yaml       | 62 +++++++++++++++++++
> >  .../devicetree/bindings/media/fsl-pxp.txt     | 26 --------
> >  2 files changed, 62 insertions(+), 26 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.

I am surprised that these warnings didn't show up when I ran 'make
dtbs_check'. I will check if there is something wrong with my setup.

> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230105134729.59542-2-m.tretter@pengutronix.de
> 
> 
> pxp@20f0000: compatible:0: 'fsl,imx6sll-pxp' is not one of ['fsl,imx6ul-pxp', 'fsl,imx6ull-pxp', 'fsl,imx7d-pxp']
> 	arch/arm/boot/dts/imx6sll-evk.dtb
> 	arch/arm/boot/dts/imx6sll-kobo-clarahd.dtb
> 	arch/arm/boot/dts/imx6sll-kobo-librah2o.dtb
> 
> pxp@20f0000: compatible: ['fsl,imx6sll-pxp', 'fsl,imx6ull-pxp'] is too long
> 	arch/arm/boot/dts/imx6sll-evk.dtb
> 	arch/arm/boot/dts/imx6sll-kobo-clarahd.dtb
> 	arch/arm/boot/dts/imx6sll-kobo-librah2o.dtb

This is an error in the schema. I dropped the fsl,imx6sll-pxp and
fsl,imx6sx-pxp compatibles, because I thought that they aren't used.

I will send a v2 to fix the schema.

Michael

> 
> pxp@2218000: compatible:0: 'fsl,imx6sx-pxp' is not one of ['fsl,imx6ul-pxp', 'fsl,imx6ull-pxp', 'fsl,imx7d-pxp']
> 	arch/arm/boot/dts/imx6sx-nitrogen6sx.dtb
> 	arch/arm/boot/dts/imx6sx-sabreauto.dtb
> 	arch/arm/boot/dts/imx6sx-sdb.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-mqs.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-reva.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-sai.dtb
> 	arch/arm/boot/dts/imx6sx-softing-vining-2000.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-full.dtb
> 
> pxp@2218000: compatible: ['fsl,imx6sx-pxp', 'fsl,imx6ull-pxp'] is too long
> 	arch/arm/boot/dts/imx6sx-nitrogen6sx.dtb
> 	arch/arm/boot/dts/imx6sx-sabreauto.dtb
> 	arch/arm/boot/dts/imx6sx-sdb.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-mqs.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-reva.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-sai.dtb
> 	arch/arm/boot/dts/imx6sx-softing-vining-2000.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-full.dtb
> 
> pxp@2218000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/imx6sx-nitrogen6sx.dtb
> 	arch/arm/boot/dts/imx6sx-sabreauto.dtb
> 	arch/arm/boot/dts/imx6sx-sdb.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-mqs.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-reva.dtb
> 	arch/arm/boot/dts/imx6sx-sdb-sai.dtb
> 	arch/arm/boot/dts/imx6sx-softing-vining-2000.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dtb
> 	arch/arm/boot/dts/imx6sx-udoo-neo-full.dtb
> 
> 
