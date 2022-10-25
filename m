Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FB060CE60
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 16:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbiJYOHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 10:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbiJYOGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 10:06:30 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD4254655
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 07:02:35 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 5C96D1B0029D;
        Tue, 25 Oct 2022 17:02:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666706552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hCyE1n3THxidR5T1cAoiTUYo89Nns3cMlpUn1JLZd/o=;
        b=HQeJowZfa6R2bgJs8iZwg65ojmRdB+IpEFaiwmigU5YLm7WNmYCEqBDJ75kTPREdLwr2FQ
        u9hyQX2mBMyTJdlB0V5rPqZTiIzuv8JYNB48wvlQLmjsl8+F31wlpBk+Zhay0f7aJZ0jB+
        DTLnWzT98lp5wSzo3kZ52E/8JGXeKBlxbKENaMw+sg2oucyZUgSyYthANWz+h/WhVA26XM
        XyNZcYEpR54vopW6dJqwqz0Di1VkpjTdu8f5LhyEfAvwHwBlqo06UsK38xEq781dOzpeP9
        oEt1ukque4aNf9ObO/4KDt7vAsm0HtBfx5SsEdlehmyLaqM8q/xmBHa7igT8/A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 046F8634DB0;
        Tue, 25 Oct 2022 17:02:32 +0300 (EEST)
Date:   Tue, 25 Oct 2022 17:02:31 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Y1fsd3fPZWZ0fH16@valkosipuli.retiisi.eu>
References: <20221022092015.208592-1-jacopo@jmondi.org>
 <20221022092015.208592-3-jacopo@jmondi.org>
 <CAPY8ntCxsZwVqNzQpA-TBbdJ6zmd_cZgrcVqm5b31ngF-CiH7w@mail.gmail.com>
 <20221024123105.fgqu4g44luauhza6@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024123105.fgqu4g44luauhza6@uno.localdomain>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666706552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hCyE1n3THxidR5T1cAoiTUYo89Nns3cMlpUn1JLZd/o=;
        b=vRChyh20lTo9R1YoKzRgD9xOphZaXgN50GtSTkKnWFb3V9D0EibaNGZzsIlxH1d7KXNFrM
        GC2reRa5uWrOX1YODDakjYpBOD9XXqJ4bE1eBdX+S1G9SS/p2xdj4RXBdLl5YZii5qVU4T
        ji1jd/P7kRv65yk7BZarRKnG690yzM8QQ5adJ0tbu7uhsnLoA8gadl6C+z3V02U0kiYTjO
        RH+461R0YUpO0X12WBbAmTkZWHcziiiZ/f3HIw5LmMkPqK5Eb4OsJHBCMa9PS0z1JyBOqr
        vpS/8wxcN0HhIL8FegzUFWz6915+p/CCk3ptuVum9arIC36J7IsJe6gg7eEc2Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666706552; a=rsa-sha256;
        cv=none;
        b=k2z1CGeq4M+VXn7IB0nI06WeCry4g5z5udoNM8eeO7WZnawBc/oAPo3/UR+erETSXM71lr
        RJHJK7gpyVnnHVuQOpvTe+/nkccECJU9pRuMFueUxhifHaBlsd/jn5WgDcyPC/aIn0bKwp
        dIYltOoZ4ESAKXx+HPPXo7pRnd82dk82FZYflO/Od/h2QEb8Z6R6GJiqAFNlaQ7lkZnRmk
        YBoB3HMLf6XbQKpCM3XuOcADT3rBI0iLCPKT/wXODUHTfJuJfdjfsDbKuw1CN6CMzkyJ+O
        XjcmLeuPQbC/Z1QyNUlDYnkEUA69OX5++51MVmO4iBW3RbIykdx3q4SiUx633g==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Oct 24, 2022 at 02:31:05PM +0200, Jacopo Mondi wrote:
> Hi Dave,
> 
> On Mon, Oct 24, 2022 at 01:13:58PM +0100, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > On Sat, 22 Oct 2022 at 11:47, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > >
> > > Add support for V4L2_CID_ANALOG_GAIN. The control programs the global
> > > gain register which applies to all color channels.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ar0521.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > index 0daa61df2603..ba169f0218a9 100644
> > > --- a/drivers/media/i2c/ar0521.c
> > > +++ b/drivers/media/i2c/ar0521.c
> > > @@ -35,6 +35,11 @@
> > >  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> > >  #define AR0521_TOTAL_WIDTH_MIN      2968u
> > >
> > > +#define AR0521_ANA_GAIN_MIN            0x00
> > > +#define AR0521_ANA_GAIN_MAX            0x3f
> >
> > The register reference I have says it is u3.4 format, which would make
> > the max value 0x7f rather than 0x3f.
> >
> > Functionally it makes no real difference, but a max gain of nearly x7
> > 15/16ths  is preferable to nearly x3 15/16ths.
> >
> > If it is u3.4 I'd have expected the minimum to be 0x10 to avoid a gain
> > of less than x1 (does it even work?)
> >
> 
> The value of the 0x3280 register is written in the 7 low bits of the
> 0x305e register. Whatever is written to 0x305e is similalrly reflected
> in the 0x3280 one. The 0x305e[6:4] bits are the coarse analog gain
> value and the lower 4 bits are the fine analog gain value. I wonder if
> u3.4 is used there to describe the that, even if u3.4 has a different
> meaning
> 
> > Looking at the listed m0, c0, m1, c1 values for gain (1, 0, 0, and 4
> > respectively), that maps to a formula:
> > gain = code / 4
> > Min and max codes are 0 and 0x1f, so that implies it will do a gain of
> > less than x1, and goes up to x7.75.
> 
> The sensor does not use the CCS gain model, but an exponential
> piecewise function documented as a table of register values/gains in
> the application manual.
> 
> The sensor exposes a list of CCS-compatible registers, including
> "0x0204 analogue_gain_code_global", from which I presume one should
> contorl the gain if the CCS compatible model works. From my tests,
> writing to that register is a no-op.
> 
> I presume the CCS compatible interface is not plumbed, or maybe it
> depdends on the FW version, or else :)

It is also possible this is a sensor developed based on an earlier one that
was compatible with e.g. SMIA. If the newer CCS-only registers aren't
defined, it is unlikely it would be compatible.

-- 
Regards,

Sakari Ailus

Ps. this would be a good time to get patches towards upstream. :-)
