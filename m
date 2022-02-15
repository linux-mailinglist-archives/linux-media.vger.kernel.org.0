Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EB24B666F
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 09:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbiBOIqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 03:46:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234447AbiBOIp7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 03:45:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76FA111DFD
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 00:45:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D394315;
        Tue, 15 Feb 2022 09:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644914748;
        bh=o+iFAqqx/j21WiFPZf3qrfSOJKdcgMM815TkAZyz+BU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H6fTy2WaHQL25JA+f6HEDgg8zo0/6k+zht32T9pTL+9EFo4ki7Ov1jaJ3aiLUknc4
         PAULphmN2uncmApXdkj7eRuspyN2Yz6ZViJV0koEgPUOtjJGg8ex8LngMGQ/zsHoC0
         6uwKzzZYN2I/uH/IaMR0UinoVvf/f+65VBv8q/BA=
Date:   Tue, 15 Feb 2022 10:45:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] staging: media: imx: Add more compatible strings
Message-ID: <YgtoNUR+vZ//tqv+@pendragon.ideasonboard.com>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-4-jacopo@jmondi.org>
 <YgqqO+6FHIVocnW9@pendragon.ideasonboard.com>
 <20220215083631.iajmsywr5tmduupv@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220215083631.iajmsywr5tmduupv@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Feb 15, 2022 at 09:36:31AM +0100, Jacopo Mondi wrote:
> On Mon, Feb 14, 2022 at 09:15:07PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 14, 2022 at 07:43:13PM +0100, Jacopo Mondi wrote:
> > > The imx7-media-csi driver controls the CSI (CMOS Sensor Interface)
> > > peripheral available on several SoC of different generations.
> > >
> > > The current situation when it comes to compatible strings is rather
> > > confused:
> > > - Bindings document imx6ul, imx7 and imx8mm
> > > - Driver supports imx6ul, imx7 and imx8mq
> > > - The IMX8MM and IMX8MQ DTS use the correct compatible strings with a
> > >   fallback to the generic "imx7-csi" identifier:
> > >   arch/arm64/boot/dts/freescale/imx8mq.dtsi: compatible = "fsl,imx8mq-csi",
> > >   arch/arm64/boot/dts/freescale/imx8mm.dtsi: compatible = "fsl,imx8mm-csi",
> > >
> > > Tidy-up the situation by adding the IMX8MQ compatible string to the
> > > bindings documentation andathe IMX8MM identifier to the driver, to allow
> > > to distinguish the SoC the CSI peripheral is integrated on in the
> > > following patches.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 +
> > >  drivers/staging/media/imx/imx7-media-csi.c                | 2 ++
> >
> > I think Rob would prefer this being split in two patches, and I think it
> > would make sense, as you're fixing two separate issues.
> >
> > >  2 files changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > > index 4f7b78265336..0f1505d85111 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > > @@ -21,6 +21,7 @@ properties:
> > >            - fsl,imx7-csi
> > >            - fsl,imx6ul-csi
> > >        - items:
> > > +          - const: fsl,imx8mq-csi
> > >            - const: fsl,imx8mm-csi
> > >            - const: fsl,imx7-csi
> >
> > I don't think you intended to require the following:
> >
> > 	compatible = "fsl,imx8mq-csi", "fsl,imx8mm-csi", "fsl,imx7-csi";
> 
> No, I kind of superficially added the mq version where the mm was
> already and went on :)
> 
> Care to explain why currently we have two const for the "8mm" and the
> "imx7" versions ?

Because the imx8mm version was considered compatible with the imx7, so

       - items:
           - const: fsl,imx8mm-csi
           - const: fsl,imx7-csi

will validate

	compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";

The first imx8mm compatible string is ignored by the driver, but
documented to support future drivers changes that would require
differentiating between the two versions.

> > You probably want
> >
> >  properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - fsl,imx8mq-csi
> >            - fsl,imx7-csi
> >            - fsl,imx6ul-csi
> >        - items:
> >            - const: fsl,imx8mm-csi
> >            - const: fsl,imx7-csi
> >
> > instead.
> 
> I'm not aware of how how many revisions of the imx7 and imx6 versions
> exists, nor how they differ, but the existing distinction feels a bit
> weird.
> 
> The const items should be the compatible fallbacks, should them be
> generic, why is 8mm among them ? Shouldn't we specify the precise SoC
> version in the list of possible enum items only ?

No, the const items are not the compatible fallbacks. imx8mm isn't a
generic fallback. "items" requires *all* items to be present in order to
validate.

> Something like
> 
>       oneOf:
>         - enum:
>           - fsl,imx8mq-csi
>           - fsl,imx8mm-csi
>           - fsl,imx6ul-csi
>         - const:
>           - fsl,imx7-csi

That's not a valid schema.

> 
> In example I see:
> 
> arch/arm64/boot/dts/freescale/imx8mq.dtsi: compatible = "fsl,imx8mq-csi", "fsl,imx7-csi";
> 
> Where this should either be
>                                            compatible = "fsl,imx8mq-csi"
> or
>                                            compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
> 
> ?
> 
> > > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > > index 32311fc0e2a4..59100e409709 100644
> > > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > > @@ -162,6 +162,7 @@
> > >  enum imx_csi_model {
> > >  	IMX7_CSI_IMX7 = 0,
> > >  	IMX7_CSI_IMX8MQ,
> > > +	IMX7_CSI_IMX8MM,
> > >  };
> > >
> > >  struct imx7_csi {
> > > @@ -1277,6 +1278,7 @@ static int imx7_csi_remove(struct platform_device *pdev)
> > >
> > >  static const struct of_device_id imx7_csi_of_match[] = {
> > >  	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX7_CSI_IMX8MQ },
> > > +	{ .compatible = "fsl,imx8mm-csi", .data = (void *)IMX7_CSI_IMX8MM },
> >
> > This isn't needed, as the i.MX8MM CSI bridgge is considered fully
> > backward-compatible with the i.MX7 version. I'd introduce this change in
> > the patch where you start using IMX7_CSI_IMX8MM, and I would then add
> > the following to the DT binding:
> >
> >  properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> >            - fsl,imx8mq-csi
> > +          - fsl,imx8mm-csi
> >            - fsl,imx7-csi
> >            - fsl,imx6ul-csi
> >        - items:
> >            - const: fsl,imx8mm-csi
> >            - const: fsl,imx7-csi
> >
> > to allow setting
> >
> > 	compatible = "fsl,imx8mm-csi";
> >
> > without the imx7 fallback if we consider the i.MX8MM version different.
> > If the driver can operate correctly on the i.MX8MM when using the i.MX7
> > fallback code paths (possibly minor issues that are not considered
> > fatal, such as missing features) then you could skip this binding
> > change.
> 
> Sorry, but shouldn't:
> 
>         compatible = "fsl,imx8mm-csi", fsl,imx7-csi"
> 
> allow me to match on imx8mm already, without the above change.
> 
> I think what I don't get is why imx8mm is a 'generic fallback' in
> first place.

See above.

> > >  	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7_CSI_IMX7 },
> > >  	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX7_CSI_IMX7 },
> > >  	{ },

-- 
Regards,

Laurent Pinchart
