Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C372D7579
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 13:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395312AbgLKMV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 07:21:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:32800 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391498AbgLKMUy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 07:20:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607689206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ry4k1Jsdm3vlFU20HrZ+MYAC/2X5vwpO1rLuDGEhhFQ=;
        b=SXHKcrSaYtjWWuxEEvh32Gc10GeTx1hiV4s4YLBfKcAK/jJJ/VeiTAxPeDC/7iZ9yHTCqV
        jOnadeJiApbfTaWjEIP5SPZadIJCoR4nHugjRvUpeV/LPDnCUa4Aw+P0pikfvftdcKf8RP
        BrXy8SEoNOqrxsNWCPF7hTByiqSz7is=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BE63CAC10;
        Fri, 11 Dec 2020 12:20:06 +0000 (UTC)
Date:   Fri, 11 Dec 2020 13:20:05 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <X9Nj9U5Vjq/0sN6M@alley>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X9Hdg3lJm+TZAQGX@alley>
 <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
 <20201210135526.GH25763@paasikivi.fi.intel.com>
 <20201210140805.GI4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210140805.GI4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 2020-12-10 16:08:05, Andy Shevchenko wrote:
> On Thu, Dec 10, 2020 at 03:55:27PM +0200, Sakari Ailus wrote:
> > On Thu, Dec 10, 2020 at 03:05:02PM +0200, Andy Shevchenko wrote:
> > > My concerns are:
> > > - not so standard format of representation (why not to use
> > > string_escape_mem() helper?) or is it?
> > 
> > The format string may contain spaces that are not meant to be printed.
> > Other unprintable chacaters should not be present (at least not in V4L2
> > pixelformats). The hexadecimal representation is there to convey the
> > numerical value and that originally came from DRM, not V4L2.
> 
> Yes, but I mean that we usually anticipate the escaped characters in a form of
> '\xNN' (hex) or '\NNN' (octal). The format '(NN)' is quite unusual to me.

It is true that I have been a bit confused when I saw it.


> > > - no compatibility with generic 4cc
> > >   (I would rather have an additional specifier here for v4l2 cases.
> > 
> > What do you mean by "generic 4cc"? There are two users of 4cc codes in the
> > kernel that I know of: V4L2 and DRM. Something that does not refer to
> > in-memory pixel formats?
> 
> Of course. Everything else. 4cc is a generic term to describe something which
> is of 4 characters long [1]. It's not limited by media file formats. And
> moreover some (chip) vendors are using it as well (Synopsys).
> Microsoft uses 4cc in CSRT ACPI table for vendor field and so on...

Honestly, I do not even know where exactly it is going to be used.

I did not have strong opinion. So I just followed the long discussions
about previous revisions. Some people loved it from the beginning.
Some people were concerned. Anyway, there were discussed only
implementation details in the last two revisions, so I assumed that
the idea was more or less accepted.

Would it help to send another revision with some existing DRM and
V4L2 code converted to use it?

It would help me/us to see how much different it is from the current
output. Also it will require ack from the affected subsystem
maintainers and developers.

Best Regqrds,
Petr
