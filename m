Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA7531BAA7
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 15:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhBON6n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 08:58:43 -0500
Received: from mga12.intel.com ([192.55.52.136]:54240 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230142AbhBON6m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 08:58:42 -0500
IronPort-SDR: gkRB5Bnv847FhE1w+SBAWD5r7xsNS/vJ2XF38NlxcOCDDSuDThmcsIsg2CNBa30BvLxC8KvPqL
 bC0KpyGuQ8gA==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="161821380"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="161821380"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:56:55 -0800
IronPort-SDR: MCMVenlFtazkKpfPbx4Daz53OkltSvdknM8NTJ5obPb3zrvw6toEcdwjMcEZssL6gBW0lDrEWA
 NQJeQrFvrZiA==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="512208434"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:56:52 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5AA8D20345;
        Mon, 15 Feb 2021 15:56:50 +0200 (EET)
Date:   Mon, 15 Feb 2021 15:56:50 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v7 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20210215135650.GI3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
 <YCp3sdZoalFSUS7u@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCp3sdZoalFSUS7u@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Feb 15, 2021 at 03:31:29PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> 
> This version I almost like, feel free to add
> Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> after considering addressing below nit-picks.
> 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > ---
> >  Documentation/core-api/printk-formats.rst | 16 ++++++++++
> >  lib/test_printf.c                         | 17 ++++++++++
> >  lib/vsprintf.c                            | 39 +++++++++++++++++++++++
> >  scripts/checkpatch.pl                     |  6 ++--
> >  4 files changed, 76 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index 160e710d992f..da2aa065dc42 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -567,6 +567,22 @@ For printing netdev_features_t.
> >  
> >  Passed by reference.
> >  
> > +V4L2 and DRM FourCC code (pixel format)
> > +---------------------------------------
> > +
> > +::
> > +
> > +	%p4cc
> > +
> > +Print a FourCC code used by V4L2 or DRM, including format endianness and
> > +its numerical value as hexadecimal.
> > +
> > +Passed by reference.
> > +
> > +Examples::
> > +
> > +	%p4cc	BG12 little-endian (0x32314742)
> 
> No examples with spaces / non-printable / non-ascii characters

I can sure add an example that has a space. But do you think I really
should add an example where invalid information is being printed?

> 
> > +
> >  Thanks
> >  ======
> >  
> > diff --git a/lib/test_printf.c b/lib/test_printf.c
> > index 7d60f24240a4..9848510a2786 100644
> > --- a/lib/test_printf.c
> > +++ b/lib/test_printf.c
> > @@ -647,6 +647,22 @@ static void __init fwnode_pointer(void)
> >  	software_node_unregister_nodes(softnodes);
> >  }
> >  
> > +static void __init fourcc_pointer(void)
> > +{
> > +	struct {
> > +		u32 code;
> > +		char *str;
> > +	} const try[] = {
> > +		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
> > +		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
> > +		{ 0x10111213, ".... little-endian (0x10111213)", },
> > +	};
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(try); i++)
> > +		test(try[i].str, "%p4cc", &try[i].code);
> > +}
> > +
> >  static void __init
> >  errptr(void)
> >  {
> > @@ -692,6 +708,7 @@ test_pointer(void)
> >  	flags();
> >  	errptr();
> >  	fwnode_pointer();
> > +	fourcc_pointer();
> >  }
> >  
> >  static void __init selftest(void)
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 3b53c73580c5..432b5a2d1e90 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1733,6 +1733,42 @@ char *netdev_bits(char *buf, char *end, const void *addr,
> >  	return special_hex_number(buf, end, num, size);
> >  }
> >  
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> > +	char output[sizeof("1234 little-endian (0x01234567)")];
> 
> 1234 -> ABCD ? (Or XY12 to be closer to the reality)

I count in numbers... albeit the hexadecimal number there starts from zero.

I guess both would work though.

0123 would be consistent.

-- 
Regards,

Sakari Ailus
