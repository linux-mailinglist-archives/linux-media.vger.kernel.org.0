Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6810E4DA404
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 21:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351714AbiCOUcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 16:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241887AbiCOUcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 16:32:08 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE88286E7;
        Tue, 15 Mar 2022 13:30:54 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id E86B420B23;
        Tue, 15 Mar 2022 22:30:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1647376252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=snG9Sh9SpqyFLhaSZI/Eu8oN95lAgHlKVKh1BYZrKYY=;
        b=yB75UOdC48QqpjzfKMD9rAAP9fhJxtBjCw7FvoUKnr9NLM5AUhKwGxqusQyVA8YLG+J7m4
        ao/kYN5/Wk4z0FXIQQgtrILef4E6MbzLjb1K8pQI1fo0YpS3IX35QGcJuRkKXDrbxBC4nN
        kijkZK5KoT0mTTEKbSeEXie8zVhI0Oc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 73249634C90;
        Tue, 15 Mar 2022 22:30:51 +0200 (EET)
Date:   Tue, 15 Mar 2022 22:30:51 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: dt-bindings: i2c: Document ov5670
Message-ID: <YjD3e14U0Hcqtob3@valkosipuli.retiisi.eu>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
 <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
 <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
 <58745ae2-40be-65f6-bea6-f62d8935719f@canonical.com>
 <YjCK75F7Xmiy8nGF@valkosipuli.retiisi.eu>
 <YjCOL2H33oc2pOWN@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjCOL2H33oc2pOWN@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1647376252; a=rsa-sha256; cv=none;
        b=x2ukAWIIxapMFtBrPqVUxTTvppIgKd0axPUSAonVNNYMH1a08Bm/75m7+1poSo/EZiHNEi
        a3H8QwNeVzBGVBkzoxUY/yenTqSZu+Zbf/ixzfLwTsIh/kA2eI6YrvrmEuo/+6PF0YvBOt
        O46S8ZyOt5fRJFbiHWJghC3lgF5o6bo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1647376252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=snG9Sh9SpqyFLhaSZI/Eu8oN95lAgHlKVKh1BYZrKYY=;
        b=H1Pjc32zkB4PPTViCAUBpqXyNeWPHeeJwHTDSMWK7MgotykTqWVO/Q6QYpHCRtbvz4IH0/
        5QiVTizQ6GiJqKNE0ij7gGLvWKp0UMP2QmKIcwW92UGcbnkw/5ObVT6XEJAFQ9AydubR6i
        zfhtYvgiEIqt2tLh7W0p+kCTTlmhSQ0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Mar 15, 2022 at 03:01:35PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Mar 15, 2022 at 02:47:43PM +0200, Sakari Ailus wrote:
> > On Tue, Mar 15, 2022 at 09:03:41AM +0100, Krzysztof Kozlowski wrote:
> > > On 15/03/2022 08:59, Sakari Ailus wrote:
> > > > On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
> > > >> On 14/03/2022 17:27, Jacopo Mondi wrote:
> > > >>> Provide the bindings documentation for Omnivision OV5670 image sensor.
> > > >>>
> > > >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > >>>
> > > >>> ---
> > > >>> v1->v2 (comments from Krzysztof)
> > > >>>
> > > >>> - Rename to include manufacturer name
> > > >>> - Add entry to MAINTAINERS
> > > >>> - Add maxItems: to -gpios properties
> > > >>> - Use common clock properties
> > > >>> - Use enum: [1, 2] for data lanes
> > > >>> - Fix whitespace issue in example
> > > >>> ---
> > > >>>
> > > >>>  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
> > > >>>  MAINTAINERS                                   |  1 +
> > > >>>  2 files changed, 100 insertions(+)
> > > >>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > > >>> new file mode 100644
> > > >>> index 000000000000..73cf72203f17
> > > >>> --- /dev/null
> > > >>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > > >>> @@ -0,0 +1,99 @@
> > > >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > >>> +%YAML 1.2
> > > >>> +---
> > > >>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> > > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >>> +
> > > >>> +title: Omnivision OV5670 5 Megapixels raw image sensor
> > > >>> +
> > > >>> +maintainers:
> > > >>> +  - Jacopo Mondi <jacopo@jmondi.org>
> > > >>> +
> > > >>> +description: |-
> > > >>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> > > >>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> > > >>> +  controlled through an I2C compatible control bus.
> > > >>> +
> > > >>> +properties:
> > > >>> +  compatible:
> > > >>> +    const: ovti,ov5670
> > > >>> +
> > > >>> +  reg:
> > > >>> +    maxItems: 1
> > > >>> +
> > > >>> +  assigned-clocks: true
> > > >>> +  assigned-clock-parents: true
> > > >>> +  assigned-clock-rates: true
> > > >>
> > > >> You should not need these. These are coming with schema. You can add
> > > >> these to example schema below and double-check.
> > > > 
> > > > They should probably be required actually.
> > > 
> > > Why required? The hardware can work with different clocks, get their
> > > rate and configure internal PLLs/clocks to new value. Having it required
> > > might have sense for current implementation of driver but this is
> > > independent of bindings. Bindings do not describe driver, but hardware.
> > 
> > We've had this discussion before and the result of that was this (see
> > "Handling clocks"):
> > 
> > Documentation/driver-api/media/camera-sensor.rst
> 
> I don't think those properties should be required in the sensor
> bindings. There are platforms where the clock provided to the sensor
> comes from a fixed-frequency oscillator, assigning a rate or parent
> makes no sense for those (assigning a parent would actually be
> impossible).
> 
> Assigning a parent or rate is fine when applicable, but as it can't be
> required, there's also no point in listing the properties here.

The cases where the clock is fixed are quite rare but admittedly they
exist.

It's just easy to get this wrong.

-- 
Sakari Ailus
