Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B2367F6E6
	for <lists+linux-media@lfdr.de>; Sat, 28 Jan 2023 11:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbjA1KIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 05:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbjA1KIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 05:08:35 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAA91E5F7
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 02:08:33 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 0A6D72008B;
        Sat, 28 Jan 2023 12:08:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1674900511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MYzS6TKhHrfpUEBjhI4ad0gmLbI4eu5ZBA/hbFOJW1w=;
        b=MfMoSK317NWUyfSEQ3XpEVAXlSn8cJxRJQsPPHA4j78Ik2WrgJkz+LlRLAFSzUthqeQ9iO
        odo4niTlCucWUc4lqRMCj8dMqPrVNgbsFwyQIBTnqJYevEm6EDV7U6Sqb4tb4zIGBFQvun
        j5MR+6obGi51EhF/dHI2bYZgN7ZykfA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1674900511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MYzS6TKhHrfpUEBjhI4ad0gmLbI4eu5ZBA/hbFOJW1w=;
        b=iU4Q5YfP034ezXBEOnOQLD5n0nWSXMWhEo7LP8ZJcZ3zWO55YIaTWGBQPb4PzXniHgQrS5
        Kl4eI1dIorFWo/JTcpc95DuncJJ98mMfFiACGlH6cxB+40H30y47O9/w00wSMVP6eKYVve
        VcJnOFQG0EC2Wv0i/aEJXn+ZHvOQ4Z4=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1674900511; a=rsa-sha256; cv=none;
        b=PAiRSIfOmn3JDWFbKrS36txeXuI8lDLmmLhU2zNpUUvYsczlNpzbWF1+ooNXKIEGef1gQn
        qBMFS1Vkq/qC6Jrqgqu40DEm/dDPu+p+2p+jKtJ7zTzEmMFdzLJRdFSmfrhBuIcyvXPM+H
        LcVaHQUpipdminzXP2wHMuLEqo9jGBE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4FD26634C91;
        Sat, 28 Jan 2023 12:07:45 +0200 (EET)
Date:   Sat, 28 Jan 2023 12:07:44 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/9] media: dt-bindings: Add OV5670
Message-ID: <Y9Tz8AWds51vGgsM@valkosipuli.retiisi.eu>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
 <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <482b464b-c5fb-8af2-b0f7-4388fccea3fd@linaro.org>
 <20230127181435.3d5rnrg5omxhn6l7@uno.localdomain>
 <00139f11-76b0-138a-2f7b-c67d149eb25e@linaro.org>
 <Y9Q2T3h50eudVbbb@valkosipuli.retiisi.eu>
 <042332a6-3407-2c75-362c-db7b922bd99f@linaro.org>
 <20230128095831.k7ywrlbmiesaewgg@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128095831.k7ywrlbmiesaewgg@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Krzysztof,

On Sat, Jan 28, 2023 at 10:58:31AM +0100, Jacopo Mondi wrote:
> Hi Krzysztof
> 
> On Fri, Jan 27, 2023 at 09:44:25PM +0100, Krzysztof Kozlowski wrote:
> > On 27/01/2023 21:38, Sakari Ailus wrote:
> > > Hi Krzysztof,
> > >
> > > On Fri, Jan 27, 2023 at 08:58:20PM +0100, Krzysztof Kozlowski wrote:
> > >> On 27/01/2023 19:14, Jacopo Mondi wrote:
> > >>> Hi Krzysztof
> > >>>
> > >>> On Fri, Jan 27, 2023 at 03:19:08PM +0100, Krzysztof Kozlowski wrote:
> > >>>> On 26/01/2023 17:59, Jacopo Mondi wrote:
> > >>>>> Add the bindings documentation for Omnivision OV5670 image sensor.
> > >>>>>
> > >>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >>>>> ---
> > >>>>
> > >>>> (...)
> > >>>>
> > >>>>> +
> > >>>>> +  dovdd-supply:
> > >>>>> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
> > >>>>> +
> > >>>>> +  port:
> > >>>>> +    $ref: /schemas/graph.yaml#/$defs/port-base
> > >>>>> +    additionalProperties: false
> > >>>>> +
> > >>>>> +    properties:
> > >>>>> +      endpoint:
> > >>>>> +        $ref: /schemas/media/video-interfaces.yaml#
> > >>>>> +        unevaluatedProperties: false
> > >>>>> +
> > >>>>> +        properties:
> > >>>>> +          data-lanes:
> > >>>>> +            minItems: 1
> > >>>>> +            maxItems: 2
> > >>>>> +            items:
> > >>>>> +              enum: [1, 2]
> > >>>>> +
> > >>>>> +          clock-noncontinuous: true
> > >>>>
> > >>>> You do not need this. Drop.
> > >>>>
> > >>>
> > >>> Is this due to "unevaluatedProperties: false" ?
> > >>>
> > >>> I read you recent explanation to a similar question on the Visconti
> > >>> bindings. Let me summarize my understanding:
> > >>>
> > >>> For a given schema a property could be
> > >>> - required
> > >>>         required:
> > >>>           - foo
> > >>>
> > >>> - optional
> > >>>         by default with "unevaluatedProperties: false"
> > >>>         "foo: true" with "additionalProperties: false"
> > >>>
> > >>> - forbidden
> > >>>         "foo: false" with "unevaluatedProperties: false"
> > >>>         by default wiht "additionalProperties: false"
> > >>>
> > >>> clock-noncontinuous is defined in video-interfaces.yaml. as I specify
> > >>> "unevaluatedProperties: false" does it mean
> > >>> all the properties defined in video-interfaces.yaml are optionally
> > >>> accepted ? If that's the case that's not what I want as
> > >>> clock-noncontinuous is -the only- property from that file we want to
> > >>> accept here (and data-lanes ofc).
> > >>>
> > >>> Should I change "unevaluatedProperties: false" to
> > >>> "additionalProperties: false" and keep "clock-noncontinuous: true"  ?
> > >>>
> > >>
> > >> Why would you disallow other properties? Just because driver does not
> > >> use them? That's not correct, driver change but bindings should stay the
> > >> same.
> > >
> > > The clock-noncontinuous property is relevant for the hardware. There are
> > > some properties not listed here that might be relevant (for all camera
> > > sensors) but most properties in video-interfaces.yaml are not applicable to
> > > this device.
> > >
> > > I also think is be useful to say what is relevant in DT bindings, as the
> > > other sources of information left are hardware datasheets (if you have
> > > access to them) or the driver (which is supposed not to be relevant for the
> > > bindings).
> > >
> >
> > Then it might be meaningful to list all allowed properties - even if not
> > currently supported by the driver - and use additionalProperties:false.
> 
> Have a look at what properties video-interfaces.yaml lists. Some of
> them only apply to CSI-2 sensors (data lanes, link-frequencies etc),
> some of them only to parallel sensors (lines polarities, bus-width
> etc).
> 
> I see most of the bindings in media/i2c reporting
> 
>         $ref: /schemas/media/video-interfaces.yaml#
>         unevaluatedProperties: false
> 
> I think that's actually wrong as there's no way all the properties in
> video-interfaces.yaml can apply to a single device (with the exception
> of a few sensors that support both bus types).

It's been in my plan to split this into multiple files so you could refer
to fewer than all the properties. I have no schedule for this though.

> 
> > This has drawback - whenever video-interfaces gets something new, the
> > bindings here (and other such devices) will have to be explicitly enabled.
> 
> video-interfaces is rarely updated, and when it happes it's to add
> properties required by a newly supported device, so this doesn't
> concern me much personally.

Me neither.

-- 
Kind regards,

Sakari Ailus
