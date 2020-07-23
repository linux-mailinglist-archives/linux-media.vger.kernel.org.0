Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4A422B953
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 00:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgGWWXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 18:23:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:36588 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726417AbgGWWXa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 18:23:30 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id C9FFE634C87;
        Fri, 24 Jul 2020 01:22:59 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jyjcB-0000TY-KR; Fri, 24 Jul 2020 01:22:59 +0300
Date:   Fri, 24 Jul 2020 01:22:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 08/13] dt-bindings: media: ov5640: Remove data-shift
Message-ID: <20200723222259.GB829@valkosipuli.retiisi.org.uk>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-9-jacopo+renesas@jmondi.org>
 <20200717205722.GJ5961@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717205722.GJ5961@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 17, 2020 at 11:57:22PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> (CC'ing Sakari)
> 
> Thank you for the patch.
> 
> On Fri, Jul 17, 2020 at 03:28:54PM +0200, Jacopo Mondi wrote:
> > The value of the data-shift property solely depend on the selected
> > bus width and it's not freely configurable.
> > 
> > Remove it from the bindings document and update its users accordingly.
> 
> Hmmmm that's an interesting one. Sakari, what do you think ?
> 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 9 ---------
> >  arch/arm/boot/dts/stm32mp157c-ev1.dts                   | 1 -
> >  2 files changed, 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > index 5e1662e848bd..ab700a1830aa 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > @@ -92,12 +92,6 @@ properties:
> >                parallel bus.
> >              enum: [8, 10]
> > 
> > -          data-shift:
> > -            description: |
> > -              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
> > -              <0> for 10 bits parallel bus.
> > -            enum: [0, 2]
> 
> Should you document in the description of bus-width that data-shift is
> implied ?

The purpose of the datas-shift property is to convey how the parallel bus
lines are connected for a given bus width for devices where it is
configurable. As this device does not not support that, then indeed this
property is not relevant for the device IMO.

> 
> > -
> >            hsync-active:
> >              enum: [0, 1]
> > 
> > @@ -115,7 +109,6 @@ properties:
> >              then:
> >                  properties:
> >                    bus-width: false
> > -                  data-shift: false
> >                    hsync-active: false
> >                    vsync-active: false
> >                    pclk-sample: false
> > @@ -135,7 +128,6 @@ properties:
> >                  - remote-endpoint
> >                  - bus-type
> >                  - bus-width
> > -                - data-shift
> >                  - hsync-active
> >                  - vsync-active
> >                  - pclk-sample
> > @@ -204,7 +196,6 @@ examples:
> >                      remote-endpoint = <&parallel_from_ov5640>;
> >                      bus-type = <5>;
> >                      bus-width = <10>;
> > -                    data-shift = <0>;
> >                      hsync-active = <1>;
> >                      vsync-active = <1>;
> >                      pclk-sample = <1>;
> > diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> > index 613ede73b65b..96f96202ca63 100644
> > --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> > +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> > @@ -192,7 +192,6 @@ ov5640_0: endpoint {
> >  				remote-endpoint = <&dcmi_0>;
> >  				bus-type = <5>;
> >  				bus-width = <8>;
> > -				data-shift = <2>; /* lines 9:2 are used */
> >  				hsync-active = <0>;
> >  				vsync-active = <0>;
> >  				pclk-sample = <1>;
> 

-- 
Kind regards,

Sakari Ailus
