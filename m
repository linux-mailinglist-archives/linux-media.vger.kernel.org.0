Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA2D394B20
	for <lists+linux-media@lfdr.de>; Sat, 29 May 2021 10:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhE2IwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 May 2021 04:52:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhE2IwS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 May 2021 04:52:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EF456128D
        for <linux-media@vger.kernel.org>; Sat, 29 May 2021 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622278242;
        bh=t85S1V/+b8ZyqLcJ4thrcAZ/YcFPLqwpC4pW2TxCddI=;
        h=Date:From:To:Subject:From;
        b=O1JvpB/4HqGUCI6wFYJ6e+/Nu3Niub7utVn3IEiK/r6Y3vcDqJ+m9uGv05GfvEhu9
         q6GoR21YOMRHLnrgZClY6zZWMw7uf7IxYbgB1ZMKeq169FTzr9dNYeHj1WTgCzawiX
         E9VeynQImjosclM799w+Dmx0GorZTslCDLDORhocJZ4jm5QbjvUs13DiVw7HZO7T2d
         w8g3iEcXG0l93edcgFfht1f6/XdTrSk5PQ4szP3Ae7ZrdegLCXnKMSKJ75D+5y6Zje
         KnN8D0+3Yw+vcpb42itZE04fZxXDl3fc/RrSZoGQcSpiyx36WMk5n8+WtAMxwslWOk
         j+/0/g4JKyCFQ==
Date:   Sat, 29 May 2021 10:50:37 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     linux-media@vger.kernel.org
Subject: [ANNOUNCE] LinuxTV IRC channels are moving to a new network
Message-ID: <20210529105037.5d424f6c@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all,

As reported by lwn.net in https://lwn.net/Articles/856543/ and
https://lwn.net/Articles/857140/, Freenode, the largest IRC network and
the home of our IRC channels, is embroiled in a messy dispute.
There are several of reports from other Open Source communities 
mentioning problems with their channels:

	https://www.gentoo.org/news/2021/05/26/gentoo-freenode-channels-hijacked.html
	https://voidlinux.org/news/2021/05/freenode-takeover.html
	https://www.devever.net/~hl/freenode_abuse
	https://lwn.net/Articles/857252/
	https://twitter.com/bagder/status/1397433855817170949

Freenode has been a very important supporting service. Yet, LinuxTV 
users and developers should feel comfortable to work in a safe
environment. So, after careful consideration, we have decided that
Freenode is not suitable to host the LinuxTV community IRC 
communication channels anymore.

On the bright side, this is an opportunity for us to unify our
IRC channels. Due to historical reasons, we used to have two separate
channels, one for V4L, and the other one for DVB. Since then, the media
subsystem has gained support for remote controllers, software radio
and HDMI CEC, but there was no clear indication about what channel 
would be used for those types of devices.

So, from now on, we'd like to announce that:

1. We're moving our IRC channels to irc.oftc.net this weekend (May 29-30).

2. A single channel will be used for all media-related discussions:
   #linux-media.

The #linux-media channel is the LinuxTV.org community discussion space 
on IRC, is intended for both Linux Kernel media users and developers 
to have general discussions related to the subsystem. It can also be 
used to discuss about related userspace tools that rely at the Linux
Kernel media subsystem support.

As a reminder, all communication at LinuxTV IRC channels and via
e-mail should be polite and respectful, and be pertinent to the 
LinuxTV community discussions.

Additionally, IRC communications are subject to the policies adopted
by OTFC, in particular:

	https://www.oftc.net/Network_Policy/
	https://www.oftc.net/Privacy_Policy/

Regards,
Mauro Carvalho Chehab
Laurent Pinchart
Hans Verkuil
Sakari Ailus
Sean Young
