Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A49A67AAF
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 16:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfGMOrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jul 2019 10:47:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:45204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727504AbfGMOrD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jul 2019 10:47:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC2172083B;
        Sat, 13 Jul 2019 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563029222;
        bh=lW5bIDcvdJ3kwdWA9DCCLkrkL9b6UAoY77IbP2qzLaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RtTVOCP4TbiLmdwovgel+a4gNqWIRDKhnUUJetX5R/JRAm2uTsZypdugPokrhP0xJ
         JyPnfqpdk8cyYc3gwXdirU9A8iNM4TyCS6h6gE1kyF4xo0Hfb+tNJPEhkUrcGO5w46
         XFl6Lc1g1LgWrWFF6V9LqwVF0PVoDZk4vuNEakOk=
Date:   Sat, 13 Jul 2019 16:47:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alex Dewar <alex.dewar@gmx.co.uk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [REGRESSION] Xorg segfaults on Asus Chromebook CP101 with Linux
 v5.2 (was Asus C101P Chromeboot fails to boot with Linux 5.2)
Message-ID: <20190713144700.GF5982@kroah.com>
References: <59042b09-7651-be1d-347f-0dc4aa02a91b@gmx.co.uk>
 <CANBLGcyO5wAHgSVjYFB+hcp+SzaKY9d0QJm-hxqnSYbZ4Yv97g@mail.gmail.com>
 <862e98f3-8a89-a05e-1e85-e6f6004da32b@gmx.co.uk>
 <5fe66d5d-0624-323f-3bf8-56134ca85eca@gmx.co.uk>
 <f47f8759-8113-812a-b17a-4be09665369e@gmx.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f47f8759-8113-812a-b17a-4be09665369e@gmx.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 13, 2019 at 12:38:45PM +0100, Alex Dewar wrote:
> Hi all,
> 
> I initially thought my machine was failing to boot entirely, but it
> turns out it was just failing to start the display manager. I managed to
> escape to a tty by hammering the keyboard a bit.
> 
> I suspect the culprit is the rockchip_vpu driver (in staging/media),
> which has been renamed to hantro in this merge window. When I run startx
> from a terminal, X fails to start and Xorg segfaults (log here:
> http://users.sussex.ac.uk/~ad374/xorg.log). X seems to work without any
> issues in v5.1.
> 
> I've also tried running trace on the Xorg process, but the output was
> pretty verbose. I can share if that would be helpful though.

Can you run 'git bisect' to find the offending commit?

thanks,

greg k-h
