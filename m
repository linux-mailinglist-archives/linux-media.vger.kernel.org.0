Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5726B361CEB
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 12:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240673AbhDPJE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 05:04:29 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:4502 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235192AbhDPJE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 05:04:28 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AlZylv6CjwDucrYrlHelN55DYdL4zR+YMi2QD?=
 =?us-ascii?q?/UZ3VBBTb4ikh9mj9c5rsSPcpT4NVBgb8uyoF7KHRRrnn6JdwY5UBru6WRmjhW?=
 =?us-ascii?q?3AFuBfxK/D5xGlJCHk7O5a0s5bAs1DIfn9F0Jzg8q/wCTQKbYd6eKK+qypmuvS?=
 =?us-ascii?q?pk0FJT1CUK1u4xx0DQyWCCRNNWp7LKAkH5mR7NcvnVSdUEkQB/7WOlA4ReTZ4/?=
 =?us-ascii?q?XEmJX6CCR2ZSIP2U2+yQml77P3CHGjsys2WTkn+9gfzVQ=3D?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613430000"; 
   d="scan'208";a="503548861"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 11:03:53 +0200
Date:   Fri, 16 Apr 2021 11:03:53 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
cc:     Julia Lawall <julia.lawall@inria.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
In-Reply-To: <20210416085431.GM3@paasikivi.fi.intel.com>
Message-ID: <alpine.DEB.2.22.394.2104161101250.8503@hadrien>
References: <20210415170819.GA17534@focaruja> <20210415171409.GC2531743@casper.infradead.org> <20210415194955.GI3@paasikivi.fi.intel.com> <20210415195704.GE2531743@casper.infradead.org> <20210415195941.GF2531743@casper.infradead.org> <20210415212158.GK3@paasikivi.fi.intel.com>
 <20210416054941.GF6021@kadam> <20210416083728.GL3@paasikivi.fi.intel.com> <alpine.DEB.2.22.394.2104161045140.8503@hadrien> <20210416085431.GM3@paasikivi.fi.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Fri, 16 Apr 2021, Sakari Ailus wrote:

> On Fri, Apr 16, 2021 at 10:46:54AM +0200, Julia Lawall wrote:
> > > > If you're running into the 80 character limit, then it's fine to use
> > > > two tabs.  I think we have been rejecting patches that push align the
> > > > parameters but push past the 80 character limit.  Using one tab is
> > > > confusing because it makes the decalarations line up with the code.
> > >
> > > Interesting. Do you have an example of this? I've thought checkpatch.pl
> > > gave a warning if the line ended with an opening parenthesis no matter
> > > what.
> >
> > Checkpatch is a perl script that searches for patterns that often indicate
> > code that is hard to understand.  It is not a precise definition of what
> > is allowed in the Linux kernel.  Humans have to amke compromises.
>
> Yeah... but I'd think if this is a preferred style then the warning could
> be omitted. It might not be that difficult.

No idea.  It involves looking at two successive lines, which may make it
more complicated.  Probably the biggest problem would be knowing whether
the line being looked at represents a function header.  Maybe that could
be detected by the fact that there is normally no space at the beginning
of the line?

julia
