Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B548D314126
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 22:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbhBHVBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 16:01:46 -0500
Received: from mga01.intel.com ([192.55.52.88]:26363 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233030AbhBHVAt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 16:00:49 -0500
IronPort-SDR: WW9omUM8ga/juAx1MUrGgcXgWuh9rXI03rgPXfdQT7nqkyLnoVIj2Xtrey3ff/ynODhDpQUmJg
 Oh1q9Y3jgtBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="200844088"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; 
   d="scan'208";a="200844088"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 12:59:01 -0800
IronPort-SDR: xI+wR9shPytXsExmurvrnFJimgsZjNsYASJNJlJ/tIqUMmIipi+s6krvnVr/PH3Y6ShSXi12HR
 LkMo27ukJxJw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; 
   d="scan'208";a="418346627"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 12:58:58 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l9DcV-0033nx-B3; Mon, 08 Feb 2021 22:58:55 +0200
Date:   Mon, 8 Feb 2021 22:58:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
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
Message-ID: <YCGmD1d1Zn+EhrDH@smile.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:

...

> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +                   struct printf_spec spec, const char *fmt)
> > +{
> 
> > +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> 
> Do we have any evidence / document / standard that the above format is
> what people would find good? From existing practices (I consider other
> printings elsewhere and users in this series) I find '(xx)' form for
> hex numbers is weird. The standard practice is to use \xHH (without
> parentheses).

> > +       val = *fourcc & ~BIT(31);
> > +
> > +       for (i = 0; i < sizeof(*fourcc); i++) {
> > +               unsigned char c = val >> (i * 8);
> 
> ...
> 
> > +               /* Weed out spaces */
> > +               if (c == ' ')
> > +                       continue;
> 
> None of the existing users does that. Why?
> 
> > +               /* Print non-control ASCII characters as-is */
> > +               if (isascii(c) && isprint(c)) {
> > +                       *p++ = c;
> > +                       continue;
> > +               }
> > +
> > +               *p++ = '(';
> > +               p = hex_byte_pack(p, c);
> > +               *p++ = ')';
> > +       }


To be on constructive side, I would propose to replace above with something
like:

__le32 val;

val = cpu_to_le32(*fourcc & ~BIT(31));

p += string_escape_mem(&val, sizeof(*fourcc), output, sizeof(output), ESCAPE_NP | ESCAPE_HEX, NULL);


-- 
With Best Regards,
Andy Shevchenko


