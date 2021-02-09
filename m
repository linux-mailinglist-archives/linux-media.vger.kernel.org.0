Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD2831558A
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 19:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbhBIR7U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 12:59:20 -0500
Received: from mga07.intel.com ([134.134.136.100]:55202 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233274AbhBIRu2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 12:50:28 -0500
IronPort-SDR: 7Og6+6OZo4Ws5JYlM8s0mSOAoMpW9HYZ+Wam8K16p6kBsyzgOS/0EuEZeawvGec8ZDD4rMoxoM
 fEJCd58geyXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245993819"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245993819"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 09:48:01 -0800
IronPort-SDR: HPhu5z9yJh72sOfRkpkjg9hixdDE/CUxkO+VD0EDwuENlRnGe0Kf3BBJG5zYOxKI0UzYuHEK1g
 SrmgntlQAWGg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359251282"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 09:47:58 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EDB7A206D0; Tue,  9 Feb 2021 19:47:55 +0200 (EET)
Date:   Tue, 9 Feb 2021 19:47:55 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
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
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20210209174755.GH32460@paasikivi.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
 <20210209092032.GC32460@paasikivi.fi.intel.com>
 <YCJc0LWBiQLwdmkN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCJc0LWBiQLwdmkN@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, Feb 09, 2021 at 11:58:40AM +0200, Andy Shevchenko wrote:
> On Tue, Feb 09, 2021 at 11:20:32AM +0200, Sakari Ailus wrote:
> > On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> > > On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> 
> ...
> 
> > > > +       %p4cc   BG12 little-endian (0x32314742)
> > > 
> > > This misses examples of the (strange) escaping cases and wiped
> > > whitespaces to make sure everybody understands that 'D 12' will be the
> > > same as 'D1 2' (side note: which I disagree on, perhaps something
> > > should be added into documentation why).
> > 
> > The spaces are expected to be at the end only. I can add such example if
> > you like. There are no fourcc codes with spaces in the middle in neither
> > V4L2 nor DRM, and I don't think the expectation is to have them either.
> 
> But then the code suggests otherwise. Perhaps we need to extract
> skip_trailing_spaces() from strim() and use it here.

But this wouldn't affect the result in this case, would it?

> 
> ...
> 
> > > > +static noinline_for_stack
> > > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > > +                   struct printf_spec spec, const char *fmt)
> > > > +{
> > > 
> > > > +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > > 
> > > Do we have any evidence / document / standard that the above format is
> > > what people would find good? From existing practices (I consider other
> > > printings elsewhere and users in this series) I find '(xx)' form for
> > > hex numbers is weird. The standard practice is to use \xHH (without
> > > parentheses).
> > 
> > Earlier in the review it was proposed that special handling of codes below
> > 32 should be added, which I did. Using the parentheses is apparently an
> > existing practice elsewhere.
> 
> Where? \xHH is quite well established format for escaping. Never heard about
> '(xx)' variant before this very series.

Mauro referred to FourCC codes while reviewing an earlier version of this,
such as RGB(15).

Does \× imply only the next two characters are hexadecimal? I have to admit
I don't remember seeting that, nor \x notation is common.

> 
> > Note that neither DRM nor V4L2 currently has such fourcc codes currently.
> 
> ...
> 
> > > > +       p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > > +                              sizeof(u32));
> > > 
> > > This is perfectly one line (in this file we have even longer lines).
> > 
> > Sure, you can do that, and I can then review your patch and point to the
> > coding style documentation. :-)
> 
> Yes, you can. The problem is that we agreed with others to improve readability
> by letting some lines to be longer, so the code can lie on one line rather be
> broken on two or more.

Making the end of the line invisible without scrolling vertically doesn't
improve readability for me. It does depend on window width though. I'd
simply only use that if 80 isn't enough.

-- 
Regards,

Sakari Ailus
