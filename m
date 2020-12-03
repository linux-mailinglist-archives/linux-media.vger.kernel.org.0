Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655C22CDA83
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 16:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731074AbgLCP6N convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 3 Dec 2020 10:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgLCP6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 10:58:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34515C061A4F
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 07:57:33 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkqz2-0003yW-G6; Thu, 03 Dec 2020 16:57:28 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkqz2-00008A-41; Thu, 03 Dec 2020 16:57:28 +0100
Message-ID: <a306bc26edf7d3b009126859a96750cda2c1160c.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: dt-bindings: coda: Add missing
 'additionalProperties'
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Date:   Thu, 03 Dec 2020 16:57:28 +0100
In-Reply-To: <9147a168f368e7ed4e25f155c03394421b74511c.camel@pengutronix.de>
References: <20201117200752.4004368-1-robh@kernel.org>
         <9147a168f368e7ed4e25f155c03394421b74511c.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-12-03 at 16:51 +0100, Philipp Zabel wrote:
> On Tue, 2020-11-17 at 14:07 -0600, Rob Herring wrote:
> > 'additionalProperties' is now required by the meta-schema. Add it for
> > coda. As a result, 'interrupts', 'interrupt-names' and 'power-domains'
> > need to be reworked to be defined at the top level.
> > 
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/media/coda.yaml       | 42 +++++++++----------
> >  1 file changed, 21 insertions(+), 21 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
> > index 7bac0057faf7..36781ee4617f 100644
> > --- a/Documentation/devicetree/bindings/media/coda.yaml
> > +++ b/Documentation/devicetree/bindings/media/coda.yaml
> > @@ -44,6 +44,21 @@ properties:
> >        - const: per
> >        - const: ahb
> >  
> > +  interrupts:
> > +    minItems: 1
> > +    items:
> > +      - description: BIT processor interrupt
> > +      - description: JPEG unit interrupt
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    items:
> > +      - const: bit
> > +      - const: jpeg
> 
> I understand this would require a property
> 
> 	interrupt-names = "bit";
> 
> in the arch/arm/boot/dts/imx{27,51,53}.dtsi device trees.
> That property is currently not required nor present, with only one
> interrupt on those devices. Is it possible to set "minItems: 0"?

Never mind, sorry for the noise. interrupt-names is still not required.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
