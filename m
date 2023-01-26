Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B615A67D461
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 19:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjAZSkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 13:40:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjAZSkF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 13:40:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844843FF2A;
        Thu, 26 Jan 2023 10:40:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6DF1975;
        Thu, 26 Jan 2023 19:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674758402;
        bh=mx/PSBUDTtvmU0+X1iOurPV/is9bFsAWSRTIUBckShU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rbvi57V0x4AqDpwEjUtEmQQCr06nMQH6p9xshBJJkybwnwHrpdMpbAtof8rvEaHdS
         x790km8UbBGC9bDBYPJZFWuET7T1emONtWI3Ku/Jn0K5Ai1U8eyMNOMOWIUDYVe82u
         9Ao8ZBN5T+3IoQLxcNde4X8MbgNGMBjssCLxjHi4=
Date:   Thu, 26 Jan 2023 20:39:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: media: imx8-isi: Use 'port' instead
 of 'ports' for i.MX8MN
Message-ID: <Y9LI//H0a8P8c0gL@pendragon.ideasonboard.com>
References: <20230126170603.11896-1-laurent.pinchart@ideasonboard.com>
 <20230126170603.11896-3-laurent.pinchart@ideasonboard.com>
 <CAHCN7xJNGCd=Sghu3oe9_yjSg0ybXRFHaVLaZmC2guXCy7ty1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xJNGCd=Sghu3oe9_yjSg0ybXRFHaVLaZmC2guXCy7ty1A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Thu, Jan 26, 2023 at 12:31:16PM -0600, Adam Ford wrote:
> On Thu, Jan 26, 2023 at 11:06 AM Laurent Pinchart wrote:
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../bindings/media/nxp,imx8-isi.yaml          | 39 +++++++++++--------
> >  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> Is there a reason not to squash the two bindings into just one patch?

As indicated in the cover letter, I've kept this separate to clearly
show the impact on the bindings. If using a 'port' node is the preferred
option, I can squash this patch, if using a 'ports' unconditionally is
favoured, then I'll just drop it.

> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > index 6038b9b5ab36..121594569395 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > @@ -52,11 +52,21 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: |
> > +      The port represents the Pixel Link input to the ISI. It shall have a
> > +      single endpoint. This property is only used for ISI instances with a
> > +      single port (as in the i.MX8MN). For instances that includes multiple
> > +      ports, the 'ports' property shall be used instead.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      description: |
> >        Ports represent the Pixel Link inputs to the ISI. Their number and
> > -      assignment are model-dependent. Each port shall have a single endpoint.
> > +      assignment are model-dependent. For ISI instances that have a single
> > +      port, the 'port' property should be used instead. Each port shall have a
> > +      single endpoint.
> >
> >  required:
> >    - compatible
> > @@ -65,7 +75,6 @@ required:
> >    - clocks
> >    - clock-names
> >    - fsl,blk-ctrl
> > -  - ports
> >
> >  allOf:
> >    - if:
> > @@ -77,12 +86,11 @@ allOf:
> >        properties:
> >          interrupts:
> >            maxItems: 1
> > -        ports:
> > -          properties:
> > -            port@0:
> > -              description: MIPI CSI-2 RX
> > -          required:
> > -            - port@0
> > +        port:
> > +          description: MIPI CSI-2 RX
> > +        ports: false
> > +      required:
> > +        - port
> >
> >    - if:
> >        properties:
> > @@ -93,6 +101,7 @@ allOf:
> >        properties:
> >          interrupts:
> >            maxItems: 2
> > +        port: false
> >          ports:
> >            properties:
> >              port@0:
> > @@ -102,6 +111,8 @@ allOf:
> >            required:
> >              - port@0
> >              - port@1
> > +      required:
> > +        - ports
> >
> >  additionalProperties: false
> >
> > @@ -122,15 +133,9 @@ examples:
> >          fsl,blk-ctrl = <&disp_blk_ctrl>;
> >          power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_ISI>;
> >
> > -        ports {
> > -            #address-cells = <1>;
> > -            #size-cells = <0>;
> > -
> > -            port@0 {
> > -                reg = <0>;
> > -                isi_in: endpoint {
> > -                    remote-endpoint = <&mipi_csi_out>;
> > -                };
> > +        port {
> > +            isi_in: endpoint {
> > +                remote-endpoint = <&mipi_csi_out>;
> >              };
> >          };
> >      };

-- 
Regards,

Laurent Pinchart
