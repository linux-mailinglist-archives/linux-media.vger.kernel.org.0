Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06A9C5E9CFA
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 11:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbiIZJJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 05:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234217AbiIZJJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 05:09:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D6A11A14
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 02:09:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D37F1415;
        Mon, 26 Sep 2022 11:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664183383;
        bh=+iivck0p8eYCbWPpNiDX29pEf6iKTHFNxQnGWyJd3A8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LpnLgUYeSyj5UhotOyj/6uk/u+gnDWd29rqlZMSdKWrKnY9bHBQ0h2Odhqk1MNF/r
         Yb0NmSv6WyZq+2pg9d0C6bEFsNSq1EmUjZFTOFQTRy9RuXaKg+7fB6EnwXWPY+eRh/
         SdLtCg2ynLPBkVIIEjcBwwDSwTvo8hnOvGx6wT3M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntCh0eu7BeBOTivba-Ff+PegGDBnmemY7wx6r_tMo-h0bw@mail.gmail.com>
References: <166392656967.56880.6892202016312600929@Monstersaurus> <Yy2EZ4JwG01UKLhX@paasikivi.fi.intel.com> <Yy233GUnCgEXuVyP@pendragon.ideasonboard.com> <CAPY8ntCh0eu7BeBOTivba-Ff+PegGDBnmemY7wx6r_tMo-h0bw@mail.gmail.com>
Subject: Re: [libcamera-devel] RFC: Arducam 64 MP (Hawkeye)
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     libcamera-devel@lists.libcamera.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson via libcamera-devel 
        <libcamera-devel@lists.libcamera.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Mon, 26 Sep 2022 10:09:42 +0100
Message-ID: <166418338224.3974115.11835248476624156258@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dave Stevenson via libcamera-devel (2022-09-23 21:46:36)
> Hi All.
>=20
> On Fri, 23 Sept 2022 at 14:43, Laurent Pinchart via libcamera-devel
> <libcamera-devel@lists.libcamera.org> wrote:
> >
> > Hello,
> >
> > On Fri, Sep 23, 2022 at 10:03:19AM +0000, Sakari Ailus wrote:
> > > On Fri, Sep 23, 2022 at 10:49:29AM +0100, Kieran Bingham wrote:
> > > > Hi Sakari, Laurent,
> > > >
> > > > Last night I hooked up the Arducam 64 MP Hawkeye camera [0], to an =
RPi4,
> > > > and added the camera helper for the RaspberryPi IPA to libcamera, a=
nd
> > > > was able to use the camera directly with dtoverlay=3Darducam_64mp i=
n the
> > > > Raspberry Pi /boot/config.txt using the latest release from Raspber=
ry
> > > > Pi.
> > > >
> > > > Raspberry Pi have already added the driver for this camera [1] to t=
heir
> > > > tree, and I have been given the tuning files from Arducam.
>=20
> I accepted the driver on the basis that Arducam upstream it, based on
> libcamera's requirement of nominally running against mainline kernels.
> Merging tuning files for libcamera should wait until they've made good
> on that.
>=20
> Raspberry Pi are not providing any level of support for it, that's all
> deferred to Arducam.
>=20
> > > > This has allowed me to capture an image with pretty good response to
> > > > changing lighting conditions, and colours. [2] ... The AF isn't yet
> > > > enabled, so that shot is out of focus a little. (That's for later).
> > > >
> > > > Arducam do not wish to name the sensor used in the module, and have
> > > > called it the 'arducam_64mp'. But attempting to upstreaming this wi=
th
> > > > that name worries me.
> > > >
> > > > Furthermore, we would like to maintain libcamera as supporting came=
ras
> > > > that have 'upstream' drivers (or drivers that are on their way
> > > > upstream), so I'm keen to identify how we can upstream the drivers =
to
> > > > create a better experience for users who are currently finding that=
 they
> > > > need to run a fork of libcamera to operate the module.
> > > >
> > > > So ultimately - my open question is ... Is it acceptable to have ca=
mera
> > > > drivers that are named by their 'module/integration' rather than th=
eir
> > > > sensor?
> > >
> > > A lot of users (especially the existing ones) depend on the entity na=
me
> > > currently. I don't think we could change it. For new ones I guess that
> > > would be possible.
> > >
> > > Alternatively this could be a string control I think. That could be a=
dded
> > > to existing drivers as well.
> >
> > The question here, as far as I understand, isn't about the entity name
> > exposed to userspace, but about the driver name. The entity name
> > certainly matters too.
> >
> > Camera sensor drivers we have in the mainline kernel are named after the
> > camera sensor model, and I think we should continue that. If this were a
> > custom silicon made by Arducam they could name it any way they want, but
> > if it's a sensor from a known sensor manufacturer, I don't think the
> > name should be hidden. I wouldn't be surprised if it would be possible
> > to identify the camera sensor relatively easily from the register set
> > anyway, which would render this whole game pointless.
> >
> > One of the major advantages of upstreaming driver is the community
> > maintenance that you get from free, including improvements to the driver
> > from other developers who use the same camera sensor in a different
> > product. We don't want to have multiple drivers for the same hardware in
> > the mainline kernel, there are precedents for that due to historical
> > reasons (mostly people not realizing that the same IP core was used in
> > different SoCs), and there are efforts to fix that. I don't see a reason
> > to go the opposite way.
> >
> > TL;DR: Unless there's a very compeling reason not to follow the usual
> > practice, I don't see why we should make an exception in this case.
>=20
> Arducam have done a pretty good marketing campaign based on this
> sensor, hence not wanting to publicly declare what it is.
>=20
> Jeff Geerling suggested it might be an IMX686 [1], but it's not.
> It is a Sony sensor. Read the ID register (0x0016 IIRC) and all will
> be revealed. Cross reference to https://en.wikipedia.org/wiki/Exmor.
>=20
> If mainline accepts a driver with an alternate name I'll be delighted
> to revert the downstream driver.
> Likewise I'll be happy to merge a PR renaming the driver if someone
> else identifies it - Arducam have asked me not to identify it. (The DT
> overlay needs to keep using the same name, but that is identifying the
> overall module instead of just the sensor)
>=20
>   Dave
>=20
> [1] https://www.youtube.com/watch?v=3D0mYRHrLYmLU&t=3D1s
