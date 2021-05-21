Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E04838C5D6
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 13:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbhEULl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 07:41:29 -0400
Received: from gofer.mess.org ([88.97.38.141]:37575 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234235AbhEULlV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 07:41:21 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7A7DCC636F; Fri, 21 May 2021 12:39:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1621597194; bh=nNH5XtoC9UBrAOPRpJUJWpS23rVXETysVj2i/d51D0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P+4WBeMiu084vUEE/3HYe+wchXQ7CoiJE4PmxI9sktnApV3/9FWvmhaig16AOhMPv
         hvAM7mxe6sNjWTbkwFMRbxZXNGs6vu5JS+YSqbiHinMTnVAXg2R2ckrcJUJ8dlRpTh
         X+4cHxVBFp5l2N4cZGZq4hSGwebNwnuv/40q75P6pQ9KG1N7nyNzJkMKMRy0ZVDdgU
         gg5FQGi/UtOPQs7ApMOpJU4G/ptquuB/36r/AP5vIQk6phM3BEZaJVRY1Q1bHgnpJS
         KD/FS74abHH9rudh8/KIQYjk3xCCXBzUkP/HEqe7xO0bI9GX03UmiUAjYedIdE9NZG
         oTVdfoFEOo3mQ==
Date:   Fri, 21 May 2021 12:39:54 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <20210521113954.GA21275@gofer.mess.org>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <YKZktqzkddh3amqX@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKZktqzkddh3amqX@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 20, 2021 at 03:31:34PM +0200, Johan Hovold wrote:
> On Mon, May 17, 2021 at 11:35:22AM +0100, Sean Young wrote:
> > On Mon, May 17, 2021 at 11:30:39AM +0200, Johan Hovold wrote:
> > > On Sat, May 15, 2021 at 10:22:26AM +0100, Sean Young wrote:
> > > > The other nice thing is that IR TX feeds data from an urb interrupt handler,
> > > > so you don't need to rely userspace being scheduled quickly enough to feed
> > > > more data before the device runs out.
> > > 
> > > The tty layer and tty drivers provide write buffering so that need not
> > > be an issue.
> >  
> > Ok. I don't know what the size of the write buffer is or what the maximum
> > TX size is; the IR device supports infinite streaming.
> 
> Our tty drivers typically have at least a 4k buffer for transmission.
> Surely that should be enough for a remote control but perhaps there are
> other more demanding applications?

That's more than enough. The most demanding consumer IR I know of, is
an air conditioner which encodes temperature and a few others things. That's
a maximum of 439 pulse/spaces which should into 1k.
> 
> > > Thanks for that pointer. Judging from a quick look, the new driver
> > > appears to based on this one. By abstracting the serial interface bits
> > > in a generic RC serdev/ldisc driver you may be able reuse more code,
> > > even if I'm not in a position to judge how much of the IR protocol bits
> > > that can be shared.
> > 
> > Yes, I agree. Once hotplugging is in place. If you have patches for that,
> > please CC me and I can see if will work for IR drivers.
> 
> Let's hope someone steps up to fund that work then.

I'm just a volunteer. I've literally never heard anything about kernel work
being funded by anyone.

Would you mind giving a brief summary what is needed to implement hotplugging
for serdev? I get the impression it's not a lot of work, but I'm probably
missing something obvious.


Sean
