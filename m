Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D659A66C688
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 17:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbjAPQVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 11:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbjAPQUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 11:20:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD6F24130;
        Mon, 16 Jan 2023 08:11:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CC82802;
        Mon, 16 Jan 2023 17:11:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673885472;
        bh=epDaYP2YbyIBykxlBWLULPbW/jKptCwX8FkRp6/Wa74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eJ1dkZaVcbIan0HRCt9W5wNGZ7TC4u984EnVG9IwHDygm8yX6+kRQitpU+nKc1x2U
         ka3mdq08Kkcf7N1ksLMuXUroxNb1wX8ku9p6tOH1XZg66kEmSSMITksNQqzQAjelgP
         Q6HZRRculBkAyiwXfkl+uXkBpFgXtPd45nxpR2NU=
Date:   Mon, 16 Jan 2023 18:11:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2.1 02/17] dt-bindings: media: fsl-pxp: convert to yaml
Message-ID: <Y8V3IGGpzaq4eQpR@pendragon.ideasonboard.com>
References: <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
 <20230116113856.1445078-1-m.tretter@pengutronix.de>
 <76f3a771-2283-4e6e-d3b8-fdfcf1f4291f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <76f3a771-2283-4e6e-d3b8-fdfcf1f4291f@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Mon, Jan 16, 2023 at 12:59:23PM +0100, Krzysztof Kozlowski wrote:
> On 16/01/2023 12:38, Michael Tretter wrote:
> > Convert the bindings of the Freescale Pixel Pipeline to YAML.
> > 
> > The conversion drops the previously listed compatibles for several SoCs.
> > It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> > on the existing SoCs and would allow to reuse the already defined
> > compatibles. The missing compatibles should be brought back when the
> > support for the PXP on these SoCs is added.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Changelog:
> > 
> > v2:
> > 
> > - add fsl,imx6sll-pxp and fsl,imx6sx-pxp compatibles
> > - restrict number of interrupts per variant
> > - cleanup syntax
> > 
> > v2.1:
> > 
> > - use enum for compatibles
> > - add power-domains property
> > - fix syntax for specifying the required number of interrupts
> > - fix number of interrupts for fsl,imx6ul-pxp
> 
> Attaching some half-baked patch to existing thread is not the way. It
> might not be supported by workflows at all (b4, patchwork), it messes
> with threads. Don't do it. Send a v3 of entire patchset once you collect
> proper feedback.

This is the only patch in the series that required a new version, and
I've asked Michael to resubmit it alone to avoid spamming all the
recipients.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks. I'll take the whole series in my tree and send a pull request
for v6.3.

-- 
Regards,

Laurent Pinchart
