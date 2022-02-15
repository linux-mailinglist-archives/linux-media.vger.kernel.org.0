Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02764B6740
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 10:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235736AbiBOJQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 04:16:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbiBOJQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 04:16:19 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF72026107
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 01:16:08 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 114161C0016;
        Tue, 15 Feb 2022 09:16:01 +0000 (UTC)
Date:   Tue, 15 Feb 2022 10:17:11 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] staging: media: imx: Add more compatible strings
Message-ID: <20220215091607.3whcxdkw5s3f7bqb@uno.localdomain>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-4-jacopo@jmondi.org>
 <YgqqO+6FHIVocnW9@pendragon.ideasonboard.com>
 <20220215083631.iajmsywr5tmduupv@uno.localdomain>
 <YgtoNUR+vZ//tqv+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgtoNUR+vZ//tqv+@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 15, 2022 at 10:45:41AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Tue, Feb 15, 2022 at 09:36:31AM +0100, Jacopo Mondi wrote:
> > On Mon, Feb 14, 2022 at 09:15:07PM +0200, Laurent Pinchart wrote:
> > > On Mon, Feb 14, 2022 at 07:43:13PM +0100, Jacopo Mondi wrote:
> > > > The imx7-media-csi driver controls the CSI (CMOS Sensor Interface)
> > > > peripheral available on several SoC of different generations.
> > > >
> > > > The current situation when it comes to compatible strings is rather
> > > > confused:
> > > > - Bindings document imx6ul, imx7 and imx8mm
> > > > - Driver supports imx6ul, imx7 and imx8mq
> > > > - The IMX8MM and IMX8MQ DTS use the correct compatible strings with a
> > > >   fallback to the generic "imx7-csi" identifier:
> > > >   arch/arm64/boot/dts/freescale/imx8mq.dtsi: compatible = "fsl,imx8mq-csi",
> > > >   arch/arm64/boot/dts/freescale/imx8mm.dtsi: compatible = "fsl,imx8mm-csi",
> > > >
> > > > Tidy-up the situation by adding the IMX8MQ compatible string to the
> > > > bindings documentation andathe IMX8MM identifier to the driver, to allow
> > > > to distinguish the SoC the CSI peripheral is integrated on in the
> > > > following patches.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 +
> > > >  drivers/staging/media/imx/imx7-media-csi.c                | 2 ++
> > >
> > > I think Rob would prefer this being split in two patches, and I think it
> > > would make sense, as you're fixing two separate issues.
> > >
> > > >  2 files changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > > > index 4f7b78265336..0f1505d85111 100644
> > > > --- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > > > @@ -21,6 +21,7 @@ properties:
> > > >            - fsl,imx7-csi
> > > >            - fsl,imx6ul-csi
> > > >        - items:
> > > > +          - const: fsl,imx8mq-csi
> > > >            - const: fsl,imx8mm-csi
> > > >            - const: fsl,imx7-csi
> > >
> > > I don't think you intended to require the following:
> > >
> > > 	compatible = "fsl,imx8mq-csi", "fsl,imx8mm-csi", "fsl,imx7-csi";
> >
> > No, I kind of superficially added the mq version where the mm was
> > already and went on :)
> >
> > Care to explain why currently we have two const for the "8mm" and the
> > "imx7" versions ?
>
> Because the imx8mm version was considered compatible with the imx7, so
>
>        - items:
>            - const: fsl,imx8mm-csi
>            - const: fsl,imx7-csi
>
> will validate
>
> 	compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
>
> The first imx8mm compatible string is ignored by the driver, but
> documented to support future drivers changes that would require
> differentiating between the two versions.
>

ah that's why the driver doesn't match on mm, yet

> > > You probably want
> > >
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > >        - enum:
> > > +          - fsl,imx8mq-csi
> > >            - fsl,imx7-csi
> > >            - fsl,imx6ul-csi
> > >        - items:
> > >            - const: fsl,imx8mm-csi
> > >            - const: fsl,imx7-csi
> > >
> > > instead.
> >
> > I'm not aware of how how many revisions of the imx7 and imx6 versions
> > exists, nor how they differ, but the existing distinction feels a bit
> > weird.
> >
> > The const items should be the compatible fallbacks, should them be
> > generic, why is 8mm among them ? Shouldn't we specify the precise SoC
> > version in the list of possible enum items only ?
>
> No, the const items are not the compatible fallbacks. imx8mm isn't a
> generic fallback. "items" requires *all* items to be present in order to
> validate.
>
> > Something like
> >
> >       oneOf:
> >         - enum:
> >           - fsl,imx8mq-csi
> >           - fsl,imx8mm-csi
> >           - fsl,imx6ul-csi
> >         - const:
> >           - fsl,imx7-csi
>
> That's not a valid schema.
>

I meant

       oneOf:
         - enum:
           - fsl,imx8mq-csi
           - fsl,imx8mm-csi
           - fsl,imx6ul-csi
         - items:
           - const: fsl,imx7-csi

But I now understand why 8mm and imx7 were there.

And the oneOf indeed doesn't allow to use imx7 as a fallback but
rather as an alternative to the precise SoC identifiers.

> >
> > In example I see:
> >
> > arch/arm64/boot/dts/freescale/imx8mq.dtsi: compatible = "fsl,imx8mq-csi", "fsl,imx7-csi";
> >
> > Where this should either be
> >                                            compatible = "fsl,imx8mq-csi"
> > or
> >                                            compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
> >
> > ?
> >
> > > > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > > > index 32311fc0e2a4..59100e409709 100644
> > > > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > > > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > > > @@ -162,6 +162,7 @@
> > > >  enum imx_csi_model {
> > > >  	IMX7_CSI_IMX7 = 0,
> > > >  	IMX7_CSI_IMX8MQ,
> > > > +	IMX7_CSI_IMX8MM,
> > > >  };
> > > >
> > > >  struct imx7_csi {
> > > > @@ -1277,6 +1278,7 @@ static int imx7_csi_remove(struct platform_device *pdev)
> > > >
> > > >  static const struct of_device_id imx7_csi_of_match[] = {
> > > >  	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX7_CSI_IMX8MQ },
> > > > +	{ .compatible = "fsl,imx8mm-csi", .data = (void *)IMX7_CSI_IMX8MM },
> > >
> > > This isn't needed, as the i.MX8MM CSI bridgge is considered fully
> > > backward-compatible with the i.MX7 version. I'd introduce this change in
> > > the patch where you start using IMX7_CSI_IMX8MM, and I would then add
> > > the following to the DT binding:
> > >
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > >        - enum:
> > >            - fsl,imx8mq-csi
> > > +          - fsl,imx8mm-csi
> > >            - fsl,imx7-csi
> > >            - fsl,imx6ul-csi
> > >        - items:
> > >            - const: fsl,imx8mm-csi
> > >            - const: fsl,imx7-csi
> > >
> > > to allow setting
> > >
> > > 	compatible = "fsl,imx8mm-csi";
> > >
> > > without the imx7 fallback if we consider the i.MX8MM version different.
> > > If the driver can operate correctly on the i.MX8MM when using the i.MX7
> > > fallback code paths (possibly minor issues that are not considered
> > > fatal, such as missing features) then you could skip this binding
> > > change.
> >
> > Sorry, but shouldn't:
> >
> >         compatible = "fsl,imx8mm-csi", fsl,imx7-csi"
> >
> > allow me to match on imx8mm already, without the above change.
> >
> > I think what I don't get is why imx8mm is a 'generic fallback' in
> > first place.
>
> See above.
>
> > > >  	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7_CSI_IMX7 },
> > > >  	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX7_CSI_IMX7 },
> > > >  	{ },
>
> --
> Regards,
>
> Laurent Pinchart
