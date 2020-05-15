Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8620E1D49E3
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 11:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgEOJmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 05:42:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727898AbgEOJmu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 05:42:50 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 456E1206F1;
        Fri, 15 May 2020 09:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589535769;
        bh=lK/+9lSsDVI643XAd17QKQZk09WF3OpBDvJdAsYbaaU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mcWwniCH44dNUJlmXULdqmrQEUpYrtAAyHj/lIw16e7zk4VQaGYdtHNikrJm03lde
         DINnNd+FpswcSS27b5lSbM/m9z4xiXA3A7T4KCGzBrqI9VL7+PkelnA7cIH1aSfrw4
         qSEMUlYAVz24ByiFU+8nJcl2glN5WQ9br8MMzNZg=
Date:   Fri, 15 May 2020 11:42:45 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200515114245.266a6fc8@coco.lan>
In-Reply-To: <be0935ce-4d88-e7de-5013-6651b8c4edac@redhat.com>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
        <20200504104934.7873cee3@coco.lan>
        <20200504124539.77eac397@ASUS>
        <20200504140833.11dd5622@coco.lan>
        <20200504154420.5dcf505f@ASUS>
        <20200515103232.47b2a35e@coco.lan>
        <be0935ce-4d88-e7de-5013-6651b8c4edac@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 15 May 2020 11:10:21 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi all,
> 
> On 5/15/20 10:32 AM, Mauro Carvalho Chehab wrote:
> > Em Mon, 4 May 2020 15:44:20 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >   
> >>>> Maybe this is related to my partial build (only the module to test if
> >>>> it builds). I'll now do a full build of the kernel.  
> >>>
> >>> Yeah, either that or there are some config options with different values.
> >>>
> >>> I was able to do a full build here without the above errors, although
> >>> I had to turn of some CONFIG options that were otherwise failing.  
> >>
> >> Strange - I do not get it :-/ ... can you send me the .config file and
> >> Makefile you use; probably I missed something.  
> > 
> > I posted an alternate version, with the driver from the Yocto Aero tree
> > ported to Kernel 5.7-rc2. The Kernel sources used are at this directory:
> > 
> > 	https://download.01.org/aero/deb/pool/main/l/linux-4.4.76-aero-1.3/
> > 
> > Such port is at the atomisp_yocto_v1:
> > 
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_yocto_v1
> > 
> > The goal of this port is not for upstreaming it. Instead, it is meant
> > to be used just for testing, using a version that should work - at least
> > with the Intel Aero board with the Aero drone's camera (tests needed, as
> > I don't have myself such hardware). This version is ISP2401 only.
> > 
> > The firmware for it is at:
> > 	https://download.01.org/aero/deb/pool/main/f/firmware-atomisp/firmware-atomisp_0.1.orig.tar.xz
> > 
> > If the ISP revision is equal or bigger than rev 02, this file should be
> > renamed to:
> > 
> > 	shisp_2401b0_v21.bin
> > 
> > Before getting excited, this version didn't work so far on my hardware:
> > 
> > 	atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
> > 	atomisp-isp2 0000:00:03.0: css load fw failed.
> > 	atomisp-isp2 0000:00:03.0: Failed to init css.
> > 
> > (I didn't try to check why it is failing yet - maybe it is just
> > some version port related issue)
> > 
> > If someone has access to the Intel Aero board, I'd appreciate if you
> > could test it and send the results. If it fails too, it would be
> > nice to have the dmesg output of this version and the dmesg from
> > a version which works.  
> 
> Mauro, first of all thank you for working on this.
> 
> I wonder if you have tried to build and run the linux-4.4.76-aero-1.3
> kernel on your T101HA ? It would be interesting to see if that one
> does (not) have the "css load fw failed" errors and who knows you
> might even be able to get that to actually show some sort of picture
> from one of the 2 sensors on the T101HA ?

Yes, I tried, but the Kernel doesn't even boot. Grub2 simply doesn't 
show any messages when trying to boot a Kernel 4.4 Kernel on it.

As this device doesn't have any physical serial ports, and the only 
USB cables I have are based on a chipset not supported by GRUB[1], I
can't see where it is failing.

[1] A side note to myself: I need to spend some time checking what
serial cables would work with grub2 and try to buy one such cable.

Thanks,
Mauro
