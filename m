Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA69A220618
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 09:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729266AbgGOHWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 03:22:41 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:38843 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729066AbgGOHWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 03:22:41 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3E77C4000A;
        Wed, 15 Jul 2020 07:22:36 +0000 (UTC)
Date:   Wed, 15 Jul 2020 09:26:08 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, robh+dt@kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        roman.kovalivskyi@globallogic.com
Subject: Re: [PATCH v2 2/3] dt-bindings: media: i2c: Document
 'remote-endpoint'
Message-ID: <20200715072608.hvog74szw7udx4sk@uno.localdomain>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-3-jacopo+renesas@jmondi.org>
 <20200714234535.GN5854@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200714234535.GN5854@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Jul 15, 2020 at 02:45:35AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Jul 14, 2020 at 04:28:55PM +0200, Jacopo Mondi wrote:
> > Document the 'remote-endpoint' property and add it to the list of required
> > endpoint properties in imx219 and ov8856 dt-schema binding files.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
> >  Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > index dfc4d29a4f04..0251e15fe0a7 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > @@ -71,8 +71,13 @@ properties:
> >              description:
> >                Allowed data bus frequencies.
> >
> > +          remote-endpoint:
> > +            description: |-
> > +              phandle to the video receiver input port
> > +
> >          required:
> >            - link-frequencies
> > +          - remote-endpoint
> >
> >  required:
> >    - compatible
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > index 1956b2a32bf4..c1f363bb5aee 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > @@ -84,9 +84,14 @@ properties:
> >                Allowed data bus frequencies. 360000000, 180000000 Hz or both
> >                are supported by the driver.
> >
> > +          remote-endpoint:
> > +            description: |-
> > +              phandle to the video receiver input port
> > +
>
> Extraneous blank line ?
>

Yes indeed.

I'll fix and resend with your comments taken in (this and the one in
the previous patch).

Rob, Hans:
Should this go in through the media tree or through rob ?

Thanks
  j

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >
> >          required:
> >            - link-frequencies
> > +          - remote-endpoint
> >
> >      required:
> >        - endpoint
>
> --
> Regards,
>
> Laurent Pinchart
