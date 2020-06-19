Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90DA200866
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 14:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730792AbgFSMKU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 08:10:20 -0400
Received: from gofer.mess.org ([88.97.38.141]:51589 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgFSMKS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 08:10:18 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7781B11A001; Fri, 19 Jun 2020 13:10:13 +0100 (BST)
Date:   Fri, 19 Jun 2020 13:10:13 +0100
From:   Sean Young <sean@mess.org>
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com
Subject: Re: [PATCH v1 0/1] Add support for meson building
Message-ID: <20200619121013.GA14721@gofer.mess.org>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 10:33:02AM -0300, Ariel D'Alessandro wrote:
> Hi all,
> 
> After a couple of RFCs, here's the final patchset adding support for the
> meson build system.
> 
> All functionality provided by the autotools based build was ported to
> meson, except sync-with-kernel. I guess we can add it at some later
> point and have this merged anyway.

sync-with-kernel is a few fragments of shell that live in various parts
of the tree (Makefiles). It's just static shell, the build system doesn't
need to do any substitions.

I think sync-with-kernel doesn't really belong in the build system; This
can be moved into its own shell script.

> Native and cross compilation has been tested with several options. Any
> feedback, testing or suggestions are welcome. Looking forward to see
> this merged in the next release hopefully :-)
> 
> Here's a simple comparison between meson and autotools performance for a
> native build:
> 
>     $ time meson build/
>         [...]
>         real    0m3.172s
>         user    0m2.698s
>         sys     0m0.577s
>     $ time ninja -C build/ -j4
>         [...]
>         real    0m19.533s
>         user    1m11.860s
>         sys     0m7.956s
> 
>     $ time (./bootstrap.sh && ./configure)
>         [...]
>         real    0m19.289s
>         user    0m16.448s
>         sys     0m2.756s
>     $ time make -j4
>         [...]
>         real    0m55.250s
>         user    2m29.425s
>         sys     0m10.829s

Nice! This will really help when I'm testing on the rpi.


Sean
