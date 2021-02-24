Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87FA323A0E
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 10:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbhBXJ6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 04:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234660AbhBXJ6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 04:58:30 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0162AC061574
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 01:57:49 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id ED1B2C6350; Wed, 24 Feb 2021 09:57:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1614160667; bh=7UFin0Xs5Tmt8WpbNgtBcNqTrqU+LnRyE92zlhY9SVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cdbLUniOLk9O7NHrPTH6dE8TvkVIOx+N+ICB3KEhSnH/V3rR5JLZtK4lhmc0I0xgi
         WWitfBjNGBo6FfAQUQg45T78lN0ixnL5/UIh3VCGsz4NDJIB/2BrpHNis+cUIP0IIm
         8Lq+IMOyWrfVgxK9yTcNijzGMU4kU6+fTuiL6IGLEWHFPhI4ggiXsUoV2uWJ/Hybn7
         aUWv4vEIiNBBbwmEBKX5p3DP58oK5wMtfb60xem9g4o2uEOY9xF4n797Rm9+er/JRE
         I/++Wm44L54K1y/C6fOkcWxfK/oZvVY5yF1wxKQUHQJsS3iEhIPL7sSYWGO7kfLzCG
         WVkl1HdTDUBFA==
Date:   Wed, 24 Feb 2021 09:57:47 +0000
From:   Sean Young <sean@mess.org>
To:     Matthias Reichl <hias@horus.com>
Cc:     linux-media@vger.kernel.org,
        Juan =?iso-8859-1?Q?Jes=FAs_Garc=EDa?= de Soria 
        <skandalfo@gmail.com>
Subject: Re: [PATCH 0/6] media: ite-cir driver cleanups
Message-ID: <20210224095747.GA22904@gofer.mess.org>
References: <cover.1613989288.git.sean@mess.org>
 <20210223161307.GB10715@camel2.lan>
 <20210223175001.GA12871@gofer.mess.org>
 <20210223191615.GA9243@lenny.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223191615.GA9243@lenny.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hias,

On Tue, Feb 23, 2021 at 08:16:15PM +0100, Matthias Reichl wrote:
> Hi Sean,
> 
> On Tue, Feb 23, 2021 at 05:50:01PM +0000, Sean Young wrote:
> > On Tue, Feb 23, 2021 at 05:13:07PM +0100, Matthias Reichl wrote:
> > > I could only test receiving (don't have a transmitter on that PC)
> > > and also couldn't test the carrier options (I'm using a demodulating
> > > TSOP receiver here), but your changes look sane to me.
> > 
> > I only have got an eeepc box, with the same limitations. Do you happen to
> > know what hardware there is for this driver? It would be nice to test this
> > properly.
> > 
> > This is the only IR driver that can change the RX carrier range, so it's
> > kinda interesting.
> 
> In the most recent bug report I got (about a month ago) the user was
> using an intel NUC (NUC10i3FNH/NUC10i3FNB according to DMI):
> https://forum.libreelec.tv/thread/23211-intel-nightly-build-problem-with-mce-remote/?postID=148823#post148823
> 
> I've also seen NUCs with Nuvoton CIR though and I suspect they'll
> all probably have a demodulating receiver soldered directly to the
> board, so probably not easy to tinker with (haven't checked though).
> 
> I have only an ancient Pentium 4 mainboard (Gigabyte 8IPE775) with
> an IT8712 here. IR RX/TX and CIR RX/TX are all exposed on a header,
> but the BIOS is somewhat odd and doesn't contain CIR on/off settings
> or announce the CIR via ACPI. So I had to manually patch ACPI tables
> to get that beast working.... ITE8713 pnpid was close enough (couldn't
> find a datasheet for 8713, only 8712 - that does mention demodulating
> though).
> 
> I don't think I have a simple IR diode or transistor here to easily
> test that, only demodulating TSOPs (and some clones) - hooking that
> up to the mainboard wouldn't be too hard.

That's a good point, that's probably the way to go. I'll have a look at
modifying my eeepc box.

Having said that, if all the hardware out there uses TSOP-type IR
receivers, I'm not sure how much use there is having this hooked up in
the driver; same for transmit.


Sean
