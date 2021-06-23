Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB653B1A7B
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFWMur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 08:50:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:32770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230170AbhFWMuq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 08:50:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54E9161076;
        Wed, 23 Jun 2021 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624452509;
        bh=K+5dKr3zilSP240WS+KJeqCS0bnQZKIHN+HX2HUn7OE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sCJw1ayGLuOTZs4Hff+aKc4eNrqPCmQvHfow6DF/QjPGPJGbpWUicXPGr7pT31l+f
         FFI5YgWc+Wb+PYcyQW1U+08NCX2awskg6q6ooUo0NiUdq+vvXgKk0Nd4fbRaYoSqvw
         JyCVek6MwPiYT7pWueI96ad53zm82TyIGkLHiOi0pjx3CumBGxjhk4vfNNSIdplq7B
         8ytCLJdt+dfVq+5Xpb1GNT0aRRinYxMg/ZDL+MqiWgz5sFKSbhglJ3VIZwN4L8TJJe
         YutPnirY67aHZtRWumJL7YqrkRas4wGzVA9yMXYrD2fQ76fCtIm9nBMIvZzKjFLWpL
         jj1qBlxe9h+dA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lw2It-0007CT-M6; Wed, 23 Jun 2021 14:48:28 +0200
Date:   Wed, 23 Jun 2021 14:48:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YNMtmyc95nuF5qlP@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <YKZktqzkddh3amqX@hovoldconsulting.com>
 <20210521113954.GA21275@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521113954.GA21275@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry about the late reply on this one.

On Fri, May 21, 2021 at 12:39:54PM +0100, Sean Young wrote:
> On Thu, May 20, 2021 at 03:31:34PM +0200, Johan Hovold wrote:
> > On Mon, May 17, 2021 at 11:35:22AM +0100, Sean Young wrote:
> > > On Mon, May 17, 2021 at 11:30:39AM +0200, Johan Hovold wrote:

> > > > Thanks for that pointer. Judging from a quick look, the new driver
> > > > appears to based on this one. By abstracting the serial interface bits
> > > > in a generic RC serdev/ldisc driver you may be able reuse more code,
> > > > even if I'm not in a position to judge how much of the IR protocol bits
> > > > that can be shared.
> > > 
> > > Yes, I agree. Once hotplugging is in place. If you have patches for that,
> > > please CC me and I can see if will work for IR drivers.
> > 
> > Let's hope someone steps up to fund that work then.
> 
> I'm just a volunteer. I've literally never heard anything about kernel work
> being funded by anyone.

Someone always pays whether it's a client, an employer or you yourself
with your spare time.

> Would you mind giving a brief summary what is needed to implement hotplugging
> for serdev? I get the impression it's not a lot of work, but I'm probably
> missing something obvious.

First, it's the matching bits we already touched on where we would like
to be able to use something like devicetree overlays to avoid rolling a
new mechanism for every bus. But devicetree overlays has its issues
currently (e.g. theres no user-space interface for providing them and
last time I checked they could not be reverted).

Second, serdev does not use the file abstraction and does not support
hangups which is used to implement tty hotplugging (e.g. by signalling
the consumer and making all file operations become noops after a
disconnect).

This would take some thinking-through to get right, and hopefully it can
be done without having to update every current serdev driver.

Retrofitting serdev into the tty layer wasn't painless and broke things
here and there. Supporting hotplugging should be doable but it's not as
straight-forward as it may sound.

Johan
