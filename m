Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A67567EFA5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 21:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjA0Ui5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 15:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjA0Ui4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 15:38:56 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89CF2116;
        Fri, 27 Jan 2023 12:38:55 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id AB26D1B002FC;
        Fri, 27 Jan 2023 22:38:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1674851932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5KhyN0Q2sGDJOkmy7tcK0emY6Xv02kvPQJ0s5MeFnl8=;
        b=RcCwRPhaSCzB4pXWlRwb8SuR0d9NxuDK083T1WbGiZh3BkazsceigYZy2I4vDH4aO3Fcic
        lpv4c9MgoqOiF9fuv0fiTIUM3AHPSNK2QFJgcBk8CzVHfaoIk6rULXQIPsK7scdCAayPL/
        tehDTN4sUW1EbL86FWNbY51qh2Tb1lHwGz1Upv002eLLg+szg7rWsRz/vrHeFGz4yfu6L0
        saxpTTTDJ/X3IA2rXSw6Gt9SHpMjiWALnklPcglY/I0BcyqsAWlmnQb9x93B6foc+iTjEa
        3DO5c1FPkpLnKOZwg8Y4veXlcomQ3P+D64yxtIkY09YXMyVP4QWHel2Og+zHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1674851932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5KhyN0Q2sGDJOkmy7tcK0emY6Xv02kvPQJ0s5MeFnl8=;
        b=OJ/5cPA8Vv7a5rczNz8/b8aip5kIX7XtkEzgeKcP9UP0isJI8uIJytiiqPlXMv7B15yGco
        yCEiIWtkPebd93KggYI5ya+HVMghj9cFHB9X+KHL0ULYviFGs0X/ovBlXQX5jq8b+s3AUI
        jllG5sRs5pwHuKHZSe3NchQ2CHcrg9dQc/ImEHX/bncx0l8+Cn26PQ5Kh8C7djOvmwJvZ7
        AKKjc6LkmgCMK1jms/j9fJ2i29CLC/Mg/WCDNBeP/KdmuN2GC3LxHwHXEFOMiuATxOjvKt
        Ua3UTVaLCublKfm1TKkf/bk6kiXjWBYnM8UaMV0JYaDUuwclrzAqxpuLi6+rgA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1674851932; a=rsa-sha256;
        cv=none;
        b=OvijUE//NxPNuR/p/SjvDh2wyEdoWLFhl0edb2Nyl8ZnIVpED/gASxT13MpnEv2FC4OaQi
        +ZxGGZ3tRuc4vKU/PFo5bnpdDQBntnItWRs7sNvB7qIGZ6GeRndD67ur1xBGwnHGXiKhCt
        ahnuYogUipyKQBfwV1Cc75I6KpNuWmZWsYe2U065qFXTHwZ72zCnDl+/OaX+3jruhllI2H
        9Nxtsm190ZHmW6in8AtFnB9N2DORilXMz2MVWKd4n9WNyrJwh+A+CNnUbAlV+8NyK9g27M
        al8zIk6cmNZQF6Z82IBdjF4J/DMVyneWWi/tP/OemMnI7J8Rlvg36CXQblA46A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4E61A634C91;
        Fri, 27 Jan 2023 22:38:40 +0200 (EET)
Date:   Fri, 27 Jan 2023 22:38:39 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/9] media: dt-bindings: Add OV5670
Message-ID: <Y9Q2T3h50eudVbbb@valkosipuli.retiisi.eu>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
 <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <482b464b-c5fb-8af2-b0f7-4388fccea3fd@linaro.org>
 <20230127181435.3d5rnrg5omxhn6l7@uno.localdomain>
 <00139f11-76b0-138a-2f7b-c67d149eb25e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00139f11-76b0-138a-2f7b-c67d149eb25e@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Fri, Jan 27, 2023 at 08:58:20PM +0100, Krzysztof Kozlowski wrote:
> On 27/01/2023 19:14, Jacopo Mondi wrote:
> > Hi Krzysztof
> > 
> > On Fri, Jan 27, 2023 at 03:19:08PM +0100, Krzysztof Kozlowski wrote:
> >> On 26/01/2023 17:59, Jacopo Mondi wrote:
> >>> Add the bindings documentation for Omnivision OV5670 image sensor.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>> ---
> >>
> >> (...)
> >>
> >>> +
> >>> +  dovdd-supply:
> >>> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
> >>> +
> >>> +  port:
> >>> +    $ref: /schemas/graph.yaml#/$defs/port-base
> >>> +    additionalProperties: false
> >>> +
> >>> +    properties:
> >>> +      endpoint:
> >>> +        $ref: /schemas/media/video-interfaces.yaml#
> >>> +        unevaluatedProperties: false
> >>> +
> >>> +        properties:
> >>> +          data-lanes:
> >>> +            minItems: 1
> >>> +            maxItems: 2
> >>> +            items:
> >>> +              enum: [1, 2]
> >>> +
> >>> +          clock-noncontinuous: true
> >>
> >> You do not need this. Drop.
> >>
> > 
> > Is this due to "unevaluatedProperties: false" ?
> > 
> > I read you recent explanation to a similar question on the Visconti
> > bindings. Let me summarize my understanding:
> > 
> > For a given schema a property could be
> > - required
> >         required:
> >           - foo
> > 
> > - optional
> >         by default with "unevaluatedProperties: false"
> >         "foo: true" with "additionalProperties: false"
> > 
> > - forbidden
> >         "foo: false" with "unevaluatedProperties: false"
> >         by default wiht "additionalProperties: false"
> > 
> > clock-noncontinuous is defined in video-interfaces.yaml. as I specify
> > "unevaluatedProperties: false" does it mean
> > all the properties defined in video-interfaces.yaml are optionally
> > accepted ? If that's the case that's not what I want as
> > clock-noncontinuous is -the only- property from that file we want to
> > accept here (and data-lanes ofc).
> > 
> > Should I change "unevaluatedProperties: false" to
> > "additionalProperties: false" and keep "clock-noncontinuous: true"  ?
> >
> 
> Why would you disallow other properties? Just because driver does not
> use them? That's not correct, driver change but bindings should stay the
> same.

The clock-noncontinuous property is relevant for the hardware. There are
some properties not listed here that might be relevant (for all camera
sensors) but most properties in video-interfaces.yaml are not applicable to
this device.

I also think is be useful to say what is relevant in DT bindings, as the
other sources of information left are hardware datasheets (if you have
access to them) or the driver (which is supposed not to be relevant for the
bindings).

-- 
Kind regards,

Sakari Ailus
