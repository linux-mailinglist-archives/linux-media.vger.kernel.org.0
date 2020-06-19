Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B8F200B09
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 16:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733059AbgFSOJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 10:09:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59398 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732813AbgFSOJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 10:09:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C16F12A53D8
Message-ID: <faecaa804895a7ace1d0a1b0db9b69f2183b282c.camel@collabora.com>
Subject: Re: [PATCH v1 0/1] Add support for meson building
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sean Young <sean@mess.org>,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com
Date:   Fri, 19 Jun 2020 11:09:25 -0300
In-Reply-To: <20200619121013.GA14721@gofer.mess.org>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
         <20200619121013.GA14721@gofer.mess.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Fri, 2020-06-19 at 13:10 +0100, Sean Young wrote:
> On Thu, Jun 18, 2020 at 10:33:02AM -0300, Ariel D'Alessandro wrote:
> > Hi all,
> > 
> > After a couple of RFCs, here's the final patchset adding support for the
> > meson build system.
> > 
> > All functionality provided by the autotools based build was ported to
> > meson, except sync-with-kernel. I guess we can add it at some later
> > point and have this merged anyway.
> 
> sync-with-kernel is a few fragments of shell that live in various parts
> of the tree (Makefiles). It's just static shell, the build system doesn't
> need to do any substitions.
> 
> I think sync-with-kernel doesn't really belong in the build system;

I totally agree there.

> This
> can be moved into its own shell script.
> 
> > Native and cross compilation has been tested with several options. Any
> > feedback, testing or suggestions are welcome. Looking forward to see
> > this merged in the next release hopefully :-)
> > 
> > Here's a simple comparison between meson and autotools performance for a
> > native build:
> > 
> >     $ time meson build/
> >         [...]
> >         real    0m3.172s
> >         user    0m2.698s
> >         sys     0m0.577s
> >     $ time ninja -C build/ -j4
> >         [...]
> >         real    0m19.533s
> >         user    1m11.860s
> >         sys     0m7.956s
> > 
> >     $ time (./bootstrap.sh && ./configure)
> >         [...]
> >         real    0m19.289s
> >         user    0m16.448s
> >         sys     0m2.756s
> >     $ time make -j4
> >         [...]
> >         real    0m55.250s
> >         user    2m29.425s
> >         sys     0m10.829s
> 
> Nice! This will really help when I'm testing on the rpi.
> 

Yup, meson allows really simple and fast cross builds.

My colleague Stéphane has blogged [1] about this
recently.

Cheers,
Ezequiel

[1] https://www.collabora.com/news-and-blog/blog/2020/05/15/cross-compiling-with-gst-build-and-gstreamer/

