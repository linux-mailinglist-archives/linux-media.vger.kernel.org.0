Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1C21CA5A4
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 10:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgEHICy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 04:02:54 -0400
Received: from gofer.mess.org ([88.97.38.141]:51477 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbgEHICy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 04:02:54 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 73043C6429; Fri,  8 May 2020 09:02:52 +0100 (BST)
Date:   Fri, 8 May 2020 09:02:52 +0100
From:   Sean Young <sean@mess.org>
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rosen Penev <rosenp@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v3 1/1] Add support for meson building
Message-ID: <20200508080252.GA30803@gofer.mess.org>
References: <20200429151639.5003-1-ariel@vanguardiasur.com.ar>
 <20200429151639.5003-2-ariel@vanguardiasur.com.ar>
 <20200501081819.GA29107@gofer.mess.org>
 <CADutaf3s91o8D+2389iMH-TmuX4euC+m3Gu2St0uDb+6RoJ-ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADutaf3s91o8D+2389iMH-TmuX4euC+m3Gu2St0uDb+6RoJ-ZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ariel,

On Mon, May 04, 2020 at 01:27:22PM -0300, Ariel D'Alessandro wrote:
> On Fri, May 1, 2020 at 5:18 AM Sean Young <sean@mess.org> wrote:
> > There seems to be no way overriding systemd_systemdir or udevdir. This
> > would be very useful.
> 
> There's a way, as follows:
> 
> Meson way:
>     $ meson -Dsystemdsystemunitdir=$my_path build/
>     $ meson -Dudevdir=$my_path build/
> 
> Autoconf way:
>     $ ./configure --with-systemdsystemunitdir=$my_path
>     $ ./configure --with-udevdir=$my_path
> 
> The above will set systemd_systemdir or udevdir with the specified path.

Great, thank you!

> > I don't think this can be done with autoconf either, so this is probably
> > a nice to have. However with autoconf I can do "make -k install" to
> > skip installing system udev/systemd files, but I don't know how to do
> > with ninja.
> 
> Shall we provide an option to skip installing these system files?

With the above options, I don't think it is needed.

> > Lastly the meson build does not support sync-with-kernel. We can add
> > this at some later point, I suppose.
> 
> True, that's not done yet. We should support it in the meson build in order
> to replace autotools completely. I'll try to tackle that down ASAP.

I would think it's not needed for an initial version of the meson build
system to be merged, just speaking for myself of course.


Thanks for the great work!

Sean
