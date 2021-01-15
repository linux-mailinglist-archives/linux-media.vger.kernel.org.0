Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82ABE2F771C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 12:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbhAOLCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 06:02:12 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:38567 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbhAOLCM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 06:02:12 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 13F7F40029;
        Fri, 15 Jan 2021 11:01:27 +0000 (UTC)
Date:   Fri, 15 Jan 2021 12:01:46 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: ov5647: Fix filename
Message-ID: <20210115110146.yu635kh4emdvbidy@uno.localdomain>
References: <20210115101652.9275-1-jacopo@jmondi.org>
 <c77755a4-4386-f5b0-cb47-64227d022b4b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c77755a4-4386-f5b0-cb47-64227d022b4b@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran

On Fri, Jan 15, 2021 at 10:20:20AM +0000, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 15/01/2021 10:16, Jacopo Mondi wrote:
> > Commit 1b5071af8240 ("media: dt-bindings: media: i2c: Rename
> > ov5647.yaml") renamed the bindings file but did not update the
> > Id: field there.
> >
> > Fix it by using the new filename.
> >
> > Fixes: 1b5071af8240 ("media: dt-bindings: media: i2c: Rename ov5647.yaml")
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>
> I wonder if this could be automatically validated by one of the checkers
> at some point. (I assume it isn't already).
>

The dt validation process complains

../Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml: $id: relative path/filename doesn't match actual path or filename

I can't tell if it's a newly introduced validation or it was there
already when I renamed that file ~6 months ago and I failed to run
validation :/

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> > index 280c62afae13..429566c9ee1d 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/media/i2c/ov5647.yaml#
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5647.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> >  title: Omnivision OV5647 raw image sensor
> > --
> > 2.29.2
> >
>
