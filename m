Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C5A322FF7
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 18:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbhBWRuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 12:50:44 -0500
Received: from gofer.mess.org ([88.97.38.141]:55269 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233804AbhBWRun (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 12:50:43 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D7971C63FB; Tue, 23 Feb 2021 17:50:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1614102601; bh=t6R0gKcp0NgPA2FfMfUtZVaOzzrW9GdLb/aLJeU1PpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t3JjGyiUFtE/v31FOJg+1b4MQwxPeOaM3HzxVDBVYhrnITcP6UtJe7uD2eMwTm+/u
         O33nf2uN8ugYaaPFS17ld6bt69dovKbbg7ER3c9/5XMZ8d2fQb46G6diCdv/7RzCGy
         8ZoL+13SFAG0ScDOynWV+hpwHiBgotQHl+ktMUPhbtdhlyBsRBDw5UVuInXm0aeolq
         91msmDlj8DY1jLndG+IQX7UJWrATLpDUwoLTk9ebrxdbYaYO7nuQB1TLQBxOHahFx+
         Prgq/lPnPeM8PkoObmw55rWwoxOO1ybvhWsm4oCh6juQRc77tXSX4J/aCfKxs0xb2y
         jvTKoKPhn3EMw==
Date:   Tue, 23 Feb 2021 17:50:01 +0000
From:   Sean Young <sean@mess.org>
To:     Matthias Reichl <hias@horus.com>
Cc:     linux-media@vger.kernel.org,
        Juan =?iso-8859-1?Q?Jes=FAs_Garc=EDa?= de Soria 
        <skandalfo@gmail.com>
Subject: Re: [PATCH 0/6] media: ite-cir driver cleanups
Message-ID: <20210223175001.GA12871@gofer.mess.org>
References: <cover.1613989288.git.sean@mess.org>
 <20210223161307.GB10715@camel2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223161307.GB10715@camel2.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hias,

On Tue, Feb 23, 2021 at 05:13:07PM +0100, Matthias Reichl wrote:
> Hi Sean,
> 
> On Mon, Feb 22, 2021 at 10:43:23AM +0000, Sean Young wrote:
> > This should not be any functional changes, just various cleanups.
> > 
> > Sean Young (6):
> >   media: ite-cir: remove unused fields
> >   media: ite-cir: set parent device
> >   media: ite-cir: use standard logging and reduce noise
> >   media: ite-cir: carrier and duty cycle can be set via ioctl
> >   media: ite-cir: move runtime information into driver data
> >   media: ite-cir: check for receive overflow
> > 
> >  drivers/media/rc/ite-cir.c | 341 +++++++++----------------------------
> >  drivers/media/rc/ite-cir.h |  49 ++----
> >  2 files changed, 91 insertions(+), 299 deletions(-)
> 
> I did a few tests with this series on top of 5.10.17 and so far
> everything looks fine with ITE8713 CIR.

Great, thank you very much!

> I could only test receiving (don't have a transmitter on that PC)
> and also couldn't test the carrier options (I'm using a demodulating
> TSOP receiver here), but your changes look sane to me.

I only have got an eeepc box, with the same limitations. Do you happen to
know what hardware there is for this driver? It would be nice to test this
properly.

This is the only IR driver that can change the RX carrier range, so it's
kinda interesting.

Thanks!

Sean
