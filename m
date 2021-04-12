Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02ADB35CF8E
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 19:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243730AbhDLRhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 13:37:09 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:42021
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241512AbhDLRhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 13:37:09 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AB6KvC6ktcv9yupI+gmW6Ea262EDpDfLN3DAb?=
 =?us-ascii?q?vn1ZSRFFG/GwvcaogfgdyFvImC8cMUtQ/eyoFaGcTRrnnqJdzpIWOd6ZNjXOmG?=
 =?us-ascii?q?ztF4166Jun/juIIUzD38p88YslTKRkEt33CjFB/KPHyS21CcwpztXC0I3Av4fj?=
 =?us-ascii?q?5kxgRw1rdK1shj0RYjqzKUF4SBJLApA0DvOnl6l6jgC9cncaZNnTPBc4dtXEzu?=
 =?us-ascii?q?emqLvbexIcQzYo5A6S5AnYioLSIlyomi0TVD5C2t4ZnFTtmQaR3Mqej80=3D?=
X-IronPort-AV: E=Sophos;i="5.82,216,1613430000"; 
   d="scan'208";a="378452073"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 19:36:49 +0200
Date:   Mon, 12 Apr 2021 19:36:48 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     ascordeiro <alinesantanacordeiro@gmail.com>
cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss:
 Replace macro function by static inline function in file iss.c
In-Reply-To: <babb019f0950cf11857a4bcf20a572f2eace1777.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104121935590.19780@hadrien>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>  <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>  <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>  <7457fd4eb5afbf66b3a6f2fed4dd1e440e6ed422.camel@gmail.com>
  <YHRjPpMVVrhTF7Tc@pendragon.ideasonboard.com> <babb019f0950cf11857a4bcf20a572f2eace1777.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1464564743-1618249009=:19780"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1464564743-1618249009=:19780
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 12 Apr 2021, ascordeiro wrote:

> Em seg, 2021-04-12 às 18:11 +0300, Laurent Pinchart escreveu:
> > Hi Aline,
> >
> > On Mon, Apr 12, 2021 at 10:58:45AM -0300, ascordeiro wrote:
> > > Em seg, 2021-04-12 às 16:40 +0300, Laurent Pinchart escreveu:
> > > > While testing on a device isn't a requirement as you can't be
> > > > expected
> > > > to have the necessary hardware, changes are expected to be at
> > > > least
> > > > compile-tested before being submitted.
> > >
> > > Hi Laurent,
> > >
> > > I thought recompiling the kernel would be enough in this case.
> > > I recompiled it in native Ubuntu 16.04 without errors.
> >
> > Did it compile the driver you modified ?
> >
> I'm sorry, It didn't. I forgot to enable the option to compile the
> driver as a module in "make menuconfig" and now I'm seeing the problems
> I generated.

You can easily compile a single file using make path/foo.o and a single
directory using make path/.

julia
--8323329-1464564743-1618249009=:19780--
