Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4A55FCB24
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 20:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiJLSze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 14:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiJLSzG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 14:55:06 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED49624977
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 11:54:58 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D05581B0036A;
        Wed, 12 Oct 2022 21:54:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1665600895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gamqM9rQ7URLiGM1go0PxM2LXY4RqqxTgEABCVPazls=;
        b=vj/UkM5S8kvcOqh2e+TiBNtuEq8EopkwK5pP9LbFEEn4VD4jPjRNj3C/DlC3OLYjLrLkXc
        6oEwelZYLZjftnfaKuXqxUDFK5ExmaMqu+sDYBCj4vfSH95hDAiNkfNP7NkIrH5IZpyPc8
        cFqXxalsCdfelbZ3qHJS8WtwN0Hw7pXhsSZ9cR/mLdb1nNwgVKSY9dQRgKwIayoKh6Vuvr
        vGY24aVo3JAf+ffpRttG2GXOSVdtp+//ryepLixjD/sFcBwTK8RCE0hO05uM/xy3sgEKpY
        1pLazFgD0uxuUQWU5E3yMLdMIpnBMHzfJAfiVvgi2LUXQgLBfU2DIjcqZpHzwQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 66484634C93;
        Wed, 12 Oct 2022 21:54:54 +0300 (EEST)
Date:   Wed, 12 Oct 2022 21:54:54 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Y0cNfkt4d5dzAN2i@valkosipuli.retiisi.eu>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <CAPY8ntB48837t+UN_6k5DJ6QBJvgz0Ohc4w4=7044amrdCy1=A@mail.gmail.com>
 <20221006150015.7p7qlab4dbaldnsg@uno.localdomain>
 <Yz7u0LT2kwhyhc8x@pendragon.ideasonboard.com>
 <m3wn9c5hip.fsf@t19.piap.pl>
 <Yz/hPRyc13LmY3Lh@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz/hPRyc13LmY3Lh@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1665600895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gamqM9rQ7URLiGM1go0PxM2LXY4RqqxTgEABCVPazls=;
        b=SMTr+07kGH393bN0irNmETQRURwaTBShnaOXm6LjzWT3D2jkyYqbaJ+tFh7LWq3phiSUR9
        RuLqaDGFRPpUc1d00z1qTO78HUUkqfqIhae9YkikCd3Wv2P/IQ0WXfbJbmdjvQfevpLftw
        NBKlcly4ZryQBa2QGTMvXRTckNmaVuhiIWTW3CYgRHiNZ0IgSJJigSX0YTWHW4aog8ZUpp
        Jt0b27k2112vzdY+buPo75mo8LEC4A1tW226lFynDxsU9DLHi2zFfcAHzheinTv9JYnZV0
        nNkHoVlIHbRtRVs6V3uouo/lfEkbtZoYdyTysHAMZOrJukA0RwC06WEbplU+5A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1665600895; a=rsa-sha256;
        cv=none;
        b=ViFSZ7w4C+xQm/Xz01X6HbIxhx09PhS5g5PAizzVPOuLnBK4nTfNIzL2VccI2fHuwXF+f5
        48SCgRfn5tTGm5xdRIEHGf+QnaB/gGjgctEkRqTb4KFOyD46VxdeHAq0wwmovkqLa+WTEi
        AzY08c5IXkP+3tsLvslPAZKp8nvr4uHXlXoJ+BZt8CawhBzfRggSuhY8CqIMMknCfpLwEW
        /UE9+izJmEf4OhslYV76WcmtR+WYMNBk00CNGlD7O9fa3vbRdNWWcTwsra/Vmir4O/QiDl
        PgdoUVdR+X0/U61wy8ei8s000w6UL8UBALN4l7k/eE2yV0YrXjH+KfXfyeDHNA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 07, 2022 at 11:20:13AM +0300, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Fri, Oct 07, 2022 at 07:28:46AM +0200, Krzysztof Hałasa wrote:
> > Laurent Pinchart writes:
> > 
> > > I'm tempted to drop support for the colour gains really, and turn the
> > > V4L2_CID_GAIN into V4L2_CID_DIGITAL_GAIN. Digital colour gains can still
> > > be useful on platforms that have no ISP, but I think we need an array of
> > > gains in that case, not abusing V4L2_CID_RED_BALANCE and
> > > V4L2_CID_BLUE_BALANCE. Any objection ?
> > 
> > I'm fine with spliting it into analog/digital as long as there is a way
> > to set individual R/G/B (digital) gain values.
> 
> With the controls we have today in V4L2, we could map
> V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE to the red and blue
> digital gains, with V4L2_CID_DIGITAL_GAIN setting the global digital
> gain.
> 
> I'm tempted to bite the bullet and define a new
> V4L2_CID_DIGITAL_COLOR_GAINS control that would expose an array of
> gains, but if we extend the API for that, I think we should also include
> support for HDR at the same time, with at least T1/T2 sets of gains.
> 
> Sakari, any opinion ?

Would you use multiple controls for that or just a single one?

The size of a matrix control is not changeable dynamically so I presume the
driver would create as large control as needed, and program to hardware as
much as needed.

-- 
Regards,

Sakari Ailus
