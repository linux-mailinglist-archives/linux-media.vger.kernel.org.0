Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D3160427C
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 13:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiJSLFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 07:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234963AbiJSLEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 07:04:24 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02BA171CDD
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 03:33:51 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 341E620303;
        Wed, 19 Oct 2022 13:33:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1666175581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VtDO9xKMdp7Zc+J8StFyrYxsSYXv2NrrZhEQ+6abF60=;
        b=WKrjBkYtq+c64YPkXB9syZdf1ediQ+HD4CZS848lQXAcMjrY79TSLBP4umvflssYawjjBW
        ulKjHvYTDoVv/95mKJ+etpqHoLAmkhwMlhVUfYhhaimiG7q72QKznKqugVLmbA76Az8RVo
        LDhcL5gB4ACuc3uqQ83gjLjkjAaGX5k=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 55453634C95;
        Wed, 19 Oct 2022 13:33:00 +0300 (EEST)
Date:   Wed, 19 Oct 2022 13:33:00 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
Message-ID: <Y0/SXOIXf3CGjNuv@valkosipuli.retiisi.eu>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com>
 <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
 <Y0uYhiny89r9J8//@pendragon.ideasonboard.com>
 <CAPY8ntDJ0-hLSHWtX5+bHaDR9quu=usP1+gaHFcZupAHtQYAFg@mail.gmail.com>
 <CAPY8ntDm8VSDT1DhvdRmOjUbq3feQ61MN6XQ70p1ZX4d+JwA_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntDm8VSDT1DhvdRmOjUbq3feQ61MN6XQ70p1ZX4d+JwA_g@mail.gmail.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1666175581; a=rsa-sha256; cv=none;
        b=nzf8BFcZAebzJpkWczvFOsFn5N7y+tTNRbGBCMOVZIk+8vd1QL3rzCSe8dnre0g4ahOILa
        TblkaqyhI1yWAeuY5GWTqxD4nb2u/UtDFbS/kpvbYFRPwWGxJB5kbvKBMm4qR9K6k9METF
        qEKwsGx5SrIR+909NEgDY164mfro+HI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1666175581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VtDO9xKMdp7Zc+J8StFyrYxsSYXv2NrrZhEQ+6abF60=;
        b=Dsd7mCD17nx/uqwfaHuOq50+X3P/hyVCKhP7agyKRezsrlXrJnY2Xmko35YJt40X+atB7h
        Q/WC35kP3RPvZ+yAOLgErDdTmGtAB81JSDKyG0xHHtGSblO9uGAz7y2BREG4S1CNjeFE5k
        g3du0aFKG61oSprhYmTyXatAzUbGS6k=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Mon, Oct 17, 2022 at 07:07:20PM +0100, Dave Stevenson wrote:
> Hi Laurent
> 
> On Sun, 16 Oct 2022 at 08:34, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Laurent
> >
> > On Sun, 16 Oct 2022 at 06:37, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Dave,
> > >
> > > On Mon, Oct 10, 2022 at 11:31:33AM +0100, Dave Stevenson wrote:
> > > > Hi Laurent
> > > >
> > > > Do you have plans for a v2 on this patch set? I also have a number of
> > > > patches for imx290 and there's little point in causing grief to each
> > > > other with conflicts.
> > > > Or I could take the non-controversial patches from your set and send a
> > > > combined patch set?
> > >
> > > I'm working on a v2, I'll send it shortly. Do I assume correctly you'll
> > > submit IMX327 support on top ? :-)
> >
> > Thanks - I'll review it tomorrow and sort my patches on top again.
> 
> I've reworked my patches on top of yours. It gives r/w VBLANK and
> HBLANK, and corrects PIXEL_RATE.
> I'm testing on our 6.0 branch, but
> https://github.com/6by9/linux/commits/linuxtv_imx290/drivers/media/i2c
> is against the linux-media branch.
> 
> I've messed something up in the "media: i2c: imx290: Support 60fps in
> 2 lane operation" patch at present - I'm looking into what has gone
> wrong, as the earlier versions of that patch worked fine. The branch
> will get force-pushed once I've fixed it.
> 
> > This driver is effectively IMX327 - max 1920x1080@60fps in 12 bit.
> >
> > IMX290 adds a 1920x1080@120fps 10bit only mode which isn't currently
> > supported by the driver. I have patches to add 10bit support, but I
> > don't increase the frame rate in them.
> >
> > IMX462 adds that 1920x1080@120fps mode in both 10 and 12 bit, but
> > again I haven't looked at adding support, partly as I don't have a
> > datasheet for that variant. I may see if the change for 120fps 10bit
> > on imx290 works in 12 bit mode for IMX462.
> > For IMX290, 1080p120 needs a link frequency of 445.5MHz on 4 lanes to
> > be supported (2 lanes not permitted), so there will be more link
> > frequency messing required to support it. The basic numbers say that
> > is fast enough for 12bit as well, so there's hope.
> 
> I guess seeing as I'm messing with the clock setup, I may as well keep
> going and look at the 120fps modes. It's a little trickier as the Pi
> ISP will be on the edge at those rates, but it should be good enough.
> 
> There is an awkward question with regard link-frequencies. Is there a
> need to support multiple sets of link-frequency, or do we support any
> set of 2?
> ie for imx290, on 4 lanes do we want:
> - 891Mbit/s for 1080p120 10bit
> - 445.5Mbit/s for 1080p60 10 or 12 bit
> - 594Mbit/s for 720p120 10bit
> - 297Mbit/s for 720p60 10 and 12 bit
> all to be present in DT?
> If only 891 and 594 then you're limited to 10 bit images, but
> otherwise it should be fully functional. The max frame interval would
> be half that of 445.5 and 297 though, so there are compromises, but
> who/what then controls the link_frequency to switch between the
> ranges?

It's up to the user space to set that control in a general case. I guess
there are no specific rules on how many you should put to DT, but generally
those that are useful should be there.

I wonder why 12 bpp output isn't possible at the double frequency. Of
course it is possible the sensor's clock tree makes that impossible but it
is still unusual.

> 
> I can see another can of worms being opened here!

If this is what the sensor does, how else it should be operated?

-- 
Kind regards,

Sakari Ailus
