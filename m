Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D87C460477F
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 15:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbiJSNkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 09:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbiJSNj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 09:39:56 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4AB88DE9
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 06:27:23 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4B06E1B0037A;
        Wed, 19 Oct 2022 16:27:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666186034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GsDfkdEsW9kP285/ufDy4V5qGh/WdG8DQ0GIXYhd1KE=;
        b=v95ans+BCcGq6gRb2wtnGPD5XorDbpBixqbLoAxkBRIUJazx5widEHG1PBmGZLnjxGp76D
        VGO/By7v8+A5pAKlLd1acb0/DQ0El66qn+6clEqGMFlZ6SW4ZNJ6Rl3GNxewdKfsjoSzbt
        HRIL+AwDjd8h6+dlFSWCRC9EAGvULVHJTM5chZ/81hAcQPGfvnrTg7xvhfKKBYtAmW4yXW
        kOKj38QvYetwI1ScxtI1QDEZSgyBYG9bwlLfXjbSkpc2xVw34JvBqGPKEeRwVisIC/rBXc
        koZ58U+Rk4BsS8YPBZpHRpWT45EPBfU7J65ui/+vSlCnlcBr+1l0ZxW7SZptMg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C6860634C93;
        Wed, 19 Oct 2022 16:27:13 +0300 (EEST)
Date:   Wed, 19 Oct 2022 16:27:13 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
Message-ID: <Y0/7Me00bcX/8juC@valkosipuli.retiisi.eu>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com>
 <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
 <Y0uYhiny89r9J8//@pendragon.ideasonboard.com>
 <CAPY8ntDJ0-hLSHWtX5+bHaDR9quu=usP1+gaHFcZupAHtQYAFg@mail.gmail.com>
 <CAPY8ntDm8VSDT1DhvdRmOjUbq3feQ61MN6XQ70p1ZX4d+JwA_g@mail.gmail.com>
 <Y0/SXOIXf3CGjNuv@valkosipuli.retiisi.eu>
 <CAPY8ntBnKFj5eZJspEDE9S7TN9TLpJiQjdb-nQsQ=+JjQhxyXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBnKFj5eZJspEDE9S7TN9TLpJiQjdb-nQsQ=+JjQhxyXg@mail.gmail.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666186034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GsDfkdEsW9kP285/ufDy4V5qGh/WdG8DQ0GIXYhd1KE=;
        b=p49oqjZykgBEdAVFEpW6frQEg0Ht3qBJmrAHOXs5sJscxg9H3km67DyhxmHN3dxT1I/wqR
        dr9BZ+WB6bgA7hoQIZ+p5i0o18IcdLIx7/Ugu4+g1U8+1YWFoAtGOcVmGvdc9c2QnohQQn
        nKpAH+yncGydNiE9PBjI1cpuRnmqk9uLS7Yp6cr9XxUgubhlB5S/1tU4ZwAR0E117Aw/HR
        jGZ6kbNbuvcb0EEgos1EOQvEMDjxZviHau7cJmfZxRLLam8QBSjg+hqMvHx35nQYhOOMB6
        IwUkdH/7nF708KRR9KiamBDG6yaDP/0tCm61b0SqDkMBCMDLf3F/+g20Ydy7jA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666186034; a=rsa-sha256;
        cv=none;
        b=UV3GyZwtW7srgRwMkvYhAWGTyd5GPIgxQpMsnCNKwxm8keWMgzcEQeXKTwNU93NSXiPFG6
        6frGiHW4T0ghNRA19p5YoUbSVCY6/G7bKNPXVaYC1It2iadtQNgRg2BHGKawmve9ugneSW
        7WEVTf70Uf7rQjdg+IV0CyzzHTjtfOYD1sIR3yg7JGlZZt1t8VyvJ+uTn/C8INoHm5qPZL
        SG3gZ9mrLwLua0v0YuL75J5BZN8H96ne+Aigx0VbSHi0PZ3YeT93YptuDmsV/HqM7QoHJD
        MBgQgorjuLtUU9mdhlGU4TOZszlvK8EJm6KBkqZPORarWiFpImtn6Ggs5lGPXQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 19, 2022 at 12:38:21PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> Thanks for the response
> 
> On Wed, 19 Oct 2022 at 11:33, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Dave,
> >
> > On Mon, Oct 17, 2022 at 07:07:20PM +0100, Dave Stevenson wrote:
> > > Hi Laurent
> > >
> > > On Sun, 16 Oct 2022 at 08:34, Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Hi Laurent
> > > >
> > > > On Sun, 16 Oct 2022 at 06:37, Laurent Pinchart
> > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > >
> > > > > Hi Dave,
> > > > >
> > > > > On Mon, Oct 10, 2022 at 11:31:33AM +0100, Dave Stevenson wrote:
> > > > > > Hi Laurent
> > > > > >
> > > > > > Do you have plans for a v2 on this patch set? I also have a number of
> > > > > > patches for imx290 and there's little point in causing grief to each
> > > > > > other with conflicts.
> > > > > > Or I could take the non-controversial patches from your set and send a
> > > > > > combined patch set?
> > > > >
> > > > > I'm working on a v2, I'll send it shortly. Do I assume correctly you'll
> > > > > submit IMX327 support on top ? :-)
> > > >
> > > > Thanks - I'll review it tomorrow and sort my patches on top again.
> > >
> > > I've reworked my patches on top of yours. It gives r/w VBLANK and
> > > HBLANK, and corrects PIXEL_RATE.
> > > I'm testing on our 6.0 branch, but
> > > https://github.com/6by9/linux/commits/linuxtv_imx290/drivers/media/i2c
> > > is against the linux-media branch.
> > >
> > > I've messed something up in the "media: i2c: imx290: Support 60fps in
> > > 2 lane operation" patch at present - I'm looking into what has gone
> > > wrong, as the earlier versions of that patch worked fine. The branch
> > > will get force-pushed once I've fixed it.
> > >
> > > > This driver is effectively IMX327 - max 1920x1080@60fps in 12 bit.
> > > >
> > > > IMX290 adds a 1920x1080@120fps 10bit only mode which isn't currently
> > > > supported by the driver. I have patches to add 10bit support, but I
> > > > don't increase the frame rate in them.
> > > >
> > > > IMX462 adds that 1920x1080@120fps mode in both 10 and 12 bit, but
> > > > again I haven't looked at adding support, partly as I don't have a
> > > > datasheet for that variant. I may see if the change for 120fps 10bit
> > > > on imx290 works in 12 bit mode for IMX462.
> > > > For IMX290, 1080p120 needs a link frequency of 445.5MHz on 4 lanes to
> > > > be supported (2 lanes not permitted), so there will be more link
> > > > frequency messing required to support it. The basic numbers say that
> > > > is fast enough for 12bit as well, so there's hope.
> > >
> > > I guess seeing as I'm messing with the clock setup, I may as well keep
> > > going and look at the 120fps modes. It's a little trickier as the Pi
> > > ISP will be on the edge at those rates, but it should be good enough.
> > >
> > > There is an awkward question with regard link-frequencies. Is there a
> > > need to support multiple sets of link-frequency, or do we support any
> > > set of 2?
> > > ie for imx290, on 4 lanes do we want:
> > > - 891Mbit/s for 1080p120 10bit
> > > - 445.5Mbit/s for 1080p60 10 or 12 bit
> > > - 594Mbit/s for 720p120 10bit
> > > - 297Mbit/s for 720p60 10 and 12 bit
> > > all to be present in DT?
> > > If only 891 and 594 then you're limited to 10 bit images, but
> > > otherwise it should be fully functional. The max frame interval would
> > > be half that of 445.5 and 297 though, so there are compromises, but
> > > who/what then controls the link_frequency to switch between the
> > > ranges?
> >
> > It's up to the user space to set that control in a general case. I guess
> > there are no specific rules on how many you should put to DT, but generally
> > those that are useful should be there.
> 
> Does the driver have to support multiple sets of link frequencies
> simultaneously?

It's up to the driver. A driver may support fewer features than the
hardware allows, and with sensors this is commonly the case. So I don't
think this would be special somehow. Of course if a driver supports just
one and the DT has more, the end result may not be desirable in terms of
what actually works.

With e.g. CCS the user can choose any link frequency for which there is a
valid PLL tree configuration with current settings. Depending on e.g. the
bit depth, for instance, some frequencies may be unavailable.

> 
> The way the driver is currently written you have one link freq for
> 1080p and one for 720p (2/3rds the rate used for 1080p). You could
> retain using only 2 link frequencies at a time.
> 
> If DT/ACPI gives us 222.75MHz and 148.5MHz on 4 lanes, or 445.5MHz and
> 297MHz on 2 lanes, with IMX327, IMX290 or IMX462, then use the current
> configuration that can do 0.03 to 60fps as RAW10 or RAW12.
> If DT/ACPI gives us 445.5MHz and 297MHz on 4 lanes and are on an
> IMX290 (not IMX327), then use a new configuration that can do 0.06 to
> 120fps as RAW10 only.
> If DT/ACPI gives us 445.5MHz and 297MHz on 4 lanes and are on an
> IMX462, then use a new configuration that can do 0.06 to 120fps as
> RAW10 or RAW12.
> If the configuration doesn't fall into any of these categories, then
> it is rejected.

Seems reasonable.

> 
> Whoever is putting together the DT/ACPI for the device can then choose
> whether they value the lower minimum frame rate and RAW12, or the
> higher frame rate but are prepared to sacrifice RAW12. (As we use
> dtoverlays, we can add overrides so that person is the end user).
> Trying to cram that lot in so that it can all be used simultaneously
> will get quite ugly - the register configuration is not quite as
> simple as one might hope, and you'd be filtering the permitted modes
> and bit depths all over the place.
> 
> As I mentioned at the Media Summit in Dublin I've had users wanting
> IMX462 for astronomy use cases, so halving the max exposure time by
> dropping the current max 60fps configuration won't be popular. I guess
> you could incorrectly use an IMX327 compatible string in the DT when
> using an IMX290/462 to force the behaviour, but that feels even more
> of a hack.
> 
> > I wonder why 12 bpp output isn't possible at the double frequency. Of
> > course it is possible the sensor's clock tree makes that impossible but it
> > is still unusual.
> 
> It is a little weird. As noted in the later emails, I have put
> together settings to get 120fps running, and have tried it on both
> IMX462 and IMX290.
> 
> 720p120 RAW12 works fine on both, as do 720p120 and 1080p120 in RAW10.
> However 1080p120 RAW12 doesn't work on either, so I suspect it is
> something in the CSI2 block configuration that can't quite hit that
> data rate without further changes. I'll see if Sony wants to be
> friendly with datasheets for the IMX462.

The receiver block driver could refuse to streamon if the pixel rate * bpp
is too high. But I understand in this case it shouldn't be a limitation.
And it doesn't really help the user to find which configurations would
work.

> 
> > >
> > > I can see another can of worms being opened here!
> >
> > If this is what the sensor does, how else it should be operated?
> 
> As above, link frequency remains read only based on DT or ACPI, and
> that then restricts the configurations that are possible.
> 
> I've never seen a good userspace example of using
> V4L2_CID_LINK_FREQUENCY, so without that it always seems to be a
> setting that is generally only used by the CSI-2 receiver to adapt
> appropriately to the data rate.
> To my mind it falls into the same category as binning and cropping -
> it's lovely to expose the full feature set, but that is just passing
> the buck to some heuristics in userspace. Generally the user of the
> camera doesn't care (they just want their camera to work) so
> realistically you're looking at libcamera, and it doesn't necessarily
> have sufficient information about the sensor or use case to make a
> good decision.

The CCS driver changes the link frequency based on other configuration
(mbus code) if the selected one cannot be used.

As this is a board specific configuration, fixing these values for a sensor
is not a feasible approach in libcamera.

-- 
Kind regards,

Sakari Ailus
