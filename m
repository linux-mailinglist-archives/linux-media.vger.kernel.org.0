Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2225A7DA7BF
	for <lists+linux-media@lfdr.de>; Sat, 28 Oct 2023 17:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjJ1PVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Oct 2023 11:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjJ1PVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Oct 2023 11:21:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16467F7;
        Sat, 28 Oct 2023 08:21:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8093720;
        Sat, 28 Oct 2023 17:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698506465;
        bh=rIFG5RylCOrTsOn92CCprYkaBaOXGGGb94LhEdMHo6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IcSid5K3h0a21RAtVO/krZPPkG0GttN+9U7eZF9NoXTFeILnjgO2C/eRJ7qyAC3Kw
         pIUdiPqSgTjpCNU8+Kkj3r6HvuXHAcDugM2HRYgNJXARRi2e3iFyGDFenihoqc/tqi
         9Z6pzAJPY8PaThxiRvwdRmhwy8b3QyKB6XJjg7wk=
Date:   Sat, 28 Oct 2023 18:21:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231028152125.GC20465@pendragon.ideasonboard.com>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-2-laurent.pinchart@ideasonboard.com>
 <ZTulSCwfyEF9exu9@valkosipuli.retiisi.eu>
 <20231027121929.GC12144@pendragon.ideasonboard.com>
 <ZTuueXYFeEqqpD6Z@valkosipuli.retiisi.eu>
 <20231027124634.GB19539@pendragon.ideasonboard.com>
 <ZTvOtnbRrykdr7oW@valkosipuli.retiisi.eu>
 <20231027153649.GE12144@pendragon.ideasonboard.com>
 <ZTvk6RRXBQib_Qow@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTvk6RRXBQib_Qow@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 27, 2023 at 04:27:21PM +0000, Sakari Ailus wrote:
> On Fri, Oct 27, 2023 at 06:36:49PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 27, 2023 at 02:52:38PM +0000, Sakari Ailus wrote:
> > > On Fri, Oct 27, 2023 at 03:46:34PM +0300, Laurent Pinchart wrote:
> > > > > > > > +  port:
> > > > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > > +    additionalProperties: false
> > > > > > > > +
> > > > > > > > +    properties:
> > > > > > > > +      endpoint:
> > > > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > > > +        unevaluatedProperties: false
> > > > > > > > +
> > > > > > > > +        properties:
> > > > > > > > +          data-lanes:
> > > > > > > > +            description:
> > > > > > > > +              This property is for lane reordering between the THP7312 and the
> > > > > > > > +              SoC. The sensor supports either two-lane, or four-lane operation.
> > > > > > > > +              If this property is omitted four-lane operation is assumed. For
> > > > > > > > +              two-lane operation the property must be set to <1 2>.
> > > > > > > 
> > > > > > > How are link frequencies determined by the device?
> > > > > > 
> > > > > > The link frequency is not under direct control of the host. There are
> > > > > > registers to select between mode presets, each of them producing a
> > > > > > particular link frequency.
> > > > > 
> > > > > If they are known, one could only allow setting the modes with known-good
> > > > > link requencies. This could be added later on, too, affecting systems with
> > > > > link-frequencies set. I guess you could also add it now, as optional.
> > > > 
> > > > I vote for later :-)
> > > > 
> > > > > Where's the link frequency information available? In documentation or in
> > > > > on the firmware API?
> > > > 
> > > > In the documentation (which is not public I'm afraid).
> > > 
> > > Could you add this information in the driver?
> > > 
> > > Co-incidentally, the driver is lacking the LINK_FREQ control. It should be
> > > added.
> > 
> > Oops. Seems I got caught red-handed. I'll fix that (and add the
> > PIXEL_RATE control too).
> 
> :-)
> 
> The PIXEL_RATE is intended to be the pixel rate on the pixel array. The
> driver doesn't have HBLANK or VBLANK so is it even useful to have
> PIXEL_RATE?

I don't mind leaving it out, it's easier.

-- 
Regards,

Laurent Pinchart
