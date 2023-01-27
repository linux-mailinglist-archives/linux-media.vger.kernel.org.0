Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E1D67ED54
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 19:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbjA0SUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 13:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235386AbjA0SUE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 13:20:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979D7CC01;
        Fri, 27 Jan 2023 10:19:44 -0800 (PST)
Received: from ideasonboard.com (host-212-171-97-20.pool212171.interbusiness.it [212.171.97.20])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD5762B3;
        Fri, 27 Jan 2023 19:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674843279;
        bh=432fOub6+T9ejfd3EjZ2DVOwmKtgtJLdRjADvmgtqIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gFxLHR9PzItUTulp0FkdHEZoMG/AHpzMnywXBptQeiG7IludHniQ6Zq9yJApojkbk
         lrwxdKMyuiUZnytnJZ3+Yr+XXR5AGbR3IZWcmiBp8fb8nUv2oBvm2sKVyIauXvsPFC
         3S7Etj0VLi8yP9+u11Yw1JLfBlPianzgnMNqXLMM=
Date:   Fri, 27 Jan 2023 19:14:35 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/9] media: dt-bindings: Add OV5670
Message-ID: <20230127181435.3d5rnrg5omxhn6l7@uno.localdomain>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
 <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <482b464b-c5fb-8af2-b0f7-4388fccea3fd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <482b464b-c5fb-8af2-b0f7-4388fccea3fd@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof

On Fri, Jan 27, 2023 at 03:19:08PM +0100, Krzysztof Kozlowski wrote:
> On 26/01/2023 17:59, Jacopo Mondi wrote:
> > Add the bindings documentation for Omnivision OV5670 image sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
>
> (...)
>
> > +
> > +  dovdd-supply:
> > +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            minItems: 1
> > +            maxItems: 2
> > +            items:
> > +              enum: [1, 2]
> > +
> > +          clock-noncontinuous: true
>
> You do not need this. Drop.
>

Is this due to "unevaluatedProperties: false" ?

I read you recent explanation to a similar question on the Visconti
bindings. Let me summarize my understanding:

For a given schema a property could be
- required
        required:
          - foo

- optional
        by default with "unevaluatedProperties: false"
        "foo: true" with "additionalProperties: false"

- forbidden
        "foo: false" with "unevaluatedProperties: false"
        by default wiht "additionalProperties: false"

clock-noncontinuous is defined in video-interfaces.yaml. as I specify
"unevaluatedProperties: false" does it mean
all the properties defined in video-interfaces.yaml are optionally
accepted ? If that's the case that's not what I want as
clock-noncontinuous is -the only- property from that file we want to
accept here (and data-lanes ofc).

Should I change "unevaluatedProperties: false" to
"additionalProperties: false" and keep "clock-noncontinuous: true"  ?

Thanks
   j

> > +
>
> Best regards,
> Krzysztof
>
