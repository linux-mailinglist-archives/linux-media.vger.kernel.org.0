Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38A52582E6
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 22:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgHaUkX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 16:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgHaUkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 16:40:23 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1244C061573;
        Mon, 31 Aug 2020 13:40:22 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 5F523634C87;
        Mon, 31 Aug 2020 23:40:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kCqaz-0000zO-9s; Mon, 31 Aug 2020 23:40:05 +0300
Date:   Mon, 31 Aug 2020 23:40:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: media: imx274: Move clock and
 supplies to required properties
Message-ID: <20200831204005.GF844@valkosipuli.retiisi.org.uk>
References: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
 <1598903558-9691-4-git-send-email-skomatineni@nvidia.com>
 <20200831201757.GC844@valkosipuli.retiisi.org.uk>
 <5c341ed9-6077-e935-de50-ff9f5f17edcf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c341ed9-6077-e935-de50-ff9f5f17edcf@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 31, 2020 at 01:37:21PM -0700, Sowjanya Komatineni wrote:
> 
> On 8/31/20 1:17 PM, Sakari Ailus wrote:
> > Hi Sowjanya,
> > 
> > On Mon, Aug 31, 2020 at 12:52:37PM -0700, Sowjanya Komatineni wrote:
> > > Clock and supplies are external to IMX274 sensor and are dependent
> > > on camera module design.
> > > 
> > > So, this patch moves them to required properties.
> > > 
> > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > ---
> > >   Documentation/devicetree/bindings/media/i2c/imx274.txt | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > > index d0a5c899..b43bed6 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > > @@ -10,15 +10,15 @@ at 1440 Mbps.
> > >   Required Properties:
> > >   - compatible: value should be "sony,imx274" for imx274 sensor
> > >   - reg: I2C bus address of the device
> > > -
> > > -Optional Properties:
> > > -- reset-gpios: Sensor reset GPIO
> > >   - clocks: Reference to the input clock.
> > >   - clock-names: Should be "inck".
> > >   - vana-supply: Sensor 2.8v analog supply.
> > >   - vdig-supply: Sensor 1.8v digital core supply.
> > >   - vddl-supply: Sensor digital IO 1.2v supply.
> > If these have been optional in the past I don't think we can start
> > requiring them now.
> > 
> > The framework will just give the driver a dummy regulator if one isn't
> > found.
> These were added recently with my patches. So I hope should be ok to make
> them required as they are external to sensor

The bindings were added back in 2017, so they're not really recent.

-- 
Sakari Ailus
