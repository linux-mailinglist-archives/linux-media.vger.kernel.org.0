Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E28C326393
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 14:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhBZN6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 08:58:00 -0500
Received: from mail.horus.com ([78.46.148.228]:33485 "EHLO mail.horus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhBZN57 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 08:57:59 -0500
Received: from [192.168.1.20] (62-116-60-6.adsl.highway.telekom.at [62.116.60.6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "E-Mail Matthias Reichl", Issuer "HiassofT CA 2014" (not verified))
        by mail.horus.com (Postfix) with ESMTPSA id 753CB6409C;
        Fri, 26 Feb 2021 14:57:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
        s=20180324; t=1614347835;
        bh=5dxGBbXz8kcfprDgE/5zEMWAEpgBzQAaD4/Vyti9Q+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p81f1aO5XmIGTWPJRjHAONmuS2zAHqOPMObkW+vW0tfkyrSLrDAdJqDsilJGHxZZv
         +ovwWzjEPr8W11Zwq0yBF/KQ6Vtuec+rm99jzjtEIBJ7JB53LtX43qrpu4RbaQyxLV
         W+fmLwLjnGifo1Yt+GXF7BbKFFlEWvS4AI7rD1DU=
Received: by camel2.lan (Postfix, from userid 1000)
        id EB9991C781A; Fri, 26 Feb 2021 14:57:13 +0100 (CET)
Date:   Fri, 26 Feb 2021 14:57:13 +0100
From:   Matthias Reichl <hias@horus.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Juan =?iso-8859-1?Q?Jes=FAs_Garc=EDa?= de Soria 
        <skandalfo@gmail.com>
Subject: Re: [PATCH 0/6] media: ite-cir driver cleanups
Message-ID: <20210226135713.GA10226@camel2.lan>
References: <cover.1613989288.git.sean@mess.org>
 <20210223161307.GB10715@camel2.lan>
 <20210223175001.GA12871@gofer.mess.org>
 <20210223191615.GA9243@lenny.lan>
 <20210224095747.GA22904@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224095747.GA22904@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Wed, Feb 24, 2021 at 09:57:47AM +0000, Sean Young wrote:
> Hi Hias,
> 
> On Tue, Feb 23, 2021 at 08:16:15PM +0100, Matthias Reichl wrote:
> > Hi Sean,
> > 
> > On Tue, Feb 23, 2021 at 05:50:01PM +0000, Sean Young wrote:
> > > On Tue, Feb 23, 2021 at 05:13:07PM +0100, Matthias Reichl wrote:
> > > > I could only test receiving (don't have a transmitter on that PC)
> > > > and also couldn't test the carrier options (I'm using a demodulating
> > > > TSOP receiver here), but your changes look sane to me.
> > > 
> > > I only have got an eeepc box, with the same limitations. Do you happen to
> > > know what hardware there is for this driver? It would be nice to test this
> > > properly.
> > > 
> > > This is the only IR driver that can change the RX carrier range, so it's
> > > kinda interesting.
> > 
> > In the most recent bug report I got (about a month ago) the user was
> > using an intel NUC (NUC10i3FNH/NUC10i3FNB according to DMI):
> > https://forum.libreelec.tv/thread/23211-intel-nightly-build-problem-with-mce-remote/?postID=148823#post148823
> > 
> > I've also seen NUCs with Nuvoton CIR though and I suspect they'll
> > all probably have a demodulating receiver soldered directly to the
> > board, so probably not easy to tinker with (haven't checked though).
> > 
> > I have only an ancient Pentium 4 mainboard (Gigabyte 8IPE775) with
> > an IT8712 here. IR RX/TX and CIR RX/TX are all exposed on a header,
> > but the BIOS is somewhat odd and doesn't contain CIR on/off settings
> > or announce the CIR via ACPI. So I had to manually patch ACPI tables
> > to get that beast working.... ITE8713 pnpid was close enough (couldn't
> > find a datasheet for 8713, only 8712 - that does mention demodulating
> > though).
> > 
> > I don't think I have a simple IR diode or transistor here to easily
> > test that, only demodulating TSOPs (and some clones) - hooking that
> > up to the mainboard wouldn't be too hard.
> 
> That's a good point, that's probably the way to go. I'll have a look at
> modifying my eeepc box.

On a second thought it's probably a bit more involved than just
connecting an IR photo diode/transistor. CIRRX is a digital input
and to get acceptable performance we'd also need an AGC circuit
and a comparator / schmitt-trigger.

It might be easier to just feed a modulated digital signal into CIRRX,
either from CIRTX or from a RPi running pwm-ir-tx.

> Having said that, if all the hardware out there uses TSOP-type IR
> receivers, I'm not sure how much use there is having this hooked up in
> the driver; same for transmit.

If it's not too much hassle I'd vote for keeping the RX demodulation
feature in the driver - it's an interesting feature and might come in
handy at times.

For TX we need to keep carrier function as CIRTX always transmits
modulated singals according to the IT8712 datasheet (unmodulated TX
output would be quite odd, haven't seen that yet).

so long,

Hias
