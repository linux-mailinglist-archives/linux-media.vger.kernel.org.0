Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DC931BEA3
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 17:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhBOQOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 11:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhBOQL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 11:11:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB127C0613D6
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 08:10:47 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lBgSS-0001lW-J3; Mon, 15 Feb 2021 17:10:44 +0100
Message-ID: <21810344a6b3659e2084727a9e7950133bf294ac.camel@pengutronix.de>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp
 only
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Philipp Zabel <pza@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 15 Feb 2021 17:10:43 +0100
In-Reply-To: <CAGngYiWxMsko2+6NUt4N0GyBUq4Axz4TRiUrF2ZjNGvZZkTO8A@mail.gmail.com>
References: <20210203163348.30686-1-TheSven73@gmail.com>
         <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
         <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com>
         <20210211143233.GA1360@pengutronix.de>
         <CAGngYiWAohHXYPfd5NJc4URVuMA4GP01jvRV78uM5P+H7zKx-A@mail.gmail.com>
         <10bfc6f5aaa02ad5858186ccee1894424fc0dd39.camel@pengutronix.de>
         <CAGngYiWxMsko2+6NUt4N0GyBUq4Axz4TRiUrF2ZjNGvZZkTO8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, dem 15.02.2021 um 10:54 -0500 schrieb Sven Van Asbroeck:
> Hi Lucas,
> 
> On Mon, Feb 15, 2021 at 5:15 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > 
> > The straight forward way to fix this would be to just disable the PRE
> > when the stride is getting too large, which might not work well with
> > all userspace requirements, as it effectively disables the ability to
> > scan GPU tiled surfaces when the stride is getting too large.
> 
> Thank you for your very knowledgeable input, really appreciate it.
> 
> I am wondering why I am the first to notice this particular corner
> case. Is this perhaps because X+armada plugin allocate a huge bitmap
> that fits all displays, and other software frameworks do not? Are
> people on i.MX6 mostly using X or Wayland? If Wayland allocates a
> separate bitmap for each display, this PRE bug will of course never
> show up...

Yep, I really doubt that there are a lot i.MX6QP, multi-display, X.Org
based devices out there.

While it's not anywhere in a protocol or similar fixed API, Wayland
compositors mostly opted to have a separate surface per display. The
weston reference compositor started out this way (as it makes surface
repaint easier) and other followed the lead, so Wayland based stacks
won't hit this case.

Regards,
Lucas

