Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF3B3877C2
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 13:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240555AbhERLe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 07:34:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240582AbhERLey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 07:34:54 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68FE15A9;
        Tue, 18 May 2021 13:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621337608;
        bh=kmO3XCC2pDO2hN7btUQer2F/7F+XQOYQpLIDEE3wBJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TtVkjvwrfBgny+UH89j4tvdAebLee2M2ma2BoJrUB/Q3UfrPe32d53AGBcdQXTPfs
         KIr2pASy6ixiodBJiBkxu41D522yplFe9HThveEvudNO0ReXSUGLcg9HXhF4Earh/i
         uh04ObQwtWW+MGnwODew5h9P9Fu1P1oWY4PGyqr0=
Date:   Tue, 18 May 2021 14:33:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-imx@nxp.com, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: nxp,imx7-csi: Add i.MX8MM
 support
Message-ID: <YKOmB0L+0i48ziX7@pendragon.ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
 <20210516024216.4576-2-laurent.pinchart@ideasonboard.com>
 <bbe18b43336f73a5c3809b933e07270ef0a45134.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbe18b43336f73a5c3809b933e07270ef0a45134.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, May 18, 2021 at 01:26:21PM +0200, Martin Kepplinger wrote:
> Am Sonntag, dem 16.05.2021 um 05:42 +0300 schrieb Laurent Pinchart:
> > The i.MX8MM integrates a CSI bridge IP core, as the i.MX7. There seems
> > to be no difference between the two SoCs according to the reference
> > manual, but as documentation may not be accurate, add a compatible
> > string for the i.MX8MM, with a fallback on the compatible i.MX7.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx7-csi.yaml      | 12 ++++++++--
> > --
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-
> > csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > index d91575b8ebb9..5922a2795167 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: i.MX7 CMOS Sensor Interface
> > +title: i.MX7 and i.MX8 CSI bridge (CMOS Sensor Interface)
> >  
> >  maintainers:
> >    - Rui Miguel Silva <rmfrfs@gmail.com>
> > @@ -15,9 +15,13 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - fsl,imx7-csi
> > -      - fsl,imx6ul-csi
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx7-csi
> > +          - fsl,imx6ul-csi
> > +      - items:
> > +          - const: fsl,imx8mm-csi
> > +          - const: fsl,imx7-csi
> >  
> >    reg:
> >      maxItems: 1
> 
> isn't the fsl,imx8mm-csi compatible missing in the driver then?

The driver will match on the "fsl,imx7-csi" compatible string, which the
bindings makes mandatory as a fallback for i.MX8MM. If we later find
differences between the CSI bridge in the i.MX7 and i.MX8MM, we can add
the compatible string to the driver to enable device-specific code
without any backward-compatibility issue.

-- 
Regards,

Laurent Pinchart
