Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3973190CC
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 18:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhBKRRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 12:17:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:60780 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232160AbhBKRPR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 12:15:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613063670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mcuoRXtEa/nDf+6F/H9Cm8q3y+Xf0u4aKVKpBc1dPAg=;
        b=rVOMqNm0xz/UOpIECtOGpp5eLSDA+3x0vtnDtgNDnoda7aNlAe8gd4PVojI/1AZf1qOsKF
        B7uot8B0SiunkYWRP/rpYV4OLgwKhsS0XdG7qfu5hrOhfU35xUCCat0J8oUSj0VljRmH/8
        ur31KaCvUn7nn9jtvaCvdlV2ne/xMbc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 19F8BAC43;
        Thu, 11 Feb 2021 17:14:30 +0000 (UTC)
Date:   Thu, 11 Feb 2021 18:14:28 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
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
Subject: Re: [PATCH v6 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCVl9BWZQn1TgT2Q@alley>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-2-sakari.ailus@linux.intel.com>
 <CAHp75VciFMKrWM2zJZ6dppuL5M-7BLPGQfcnzkd9pQzY1bRWsQ@mail.gmail.com>
 <20210209092032.GC32460@paasikivi.fi.intel.com>
 <YCJc0LWBiQLwdmkN@smile.fi.intel.com>
 <20210209174755.GH32460@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210209174755.GH32460@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 2021-02-09 19:47:55, Sakari Ailus wrote:
> Hi Andy,
> 
> On Tue, Feb 09, 2021 at 11:58:40AM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 09, 2021 at 11:20:32AM +0200, Sakari Ailus wrote:
> > > On Mon, Feb 08, 2021 at 10:43:30PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Feb 8, 2021 at 10:11 PM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > 
> > ...
> > 
> > > > > +       %p4cc   BG12 little-endian (0x32314742)
> > > > 
> > > > This misses examples of the (strange) escaping cases and wiped
> > > > whitespaces to make sure everybody understands that 'D 12' will be the
> > > > same as 'D1 2' (side note: which I disagree on, perhaps something
> > > > should be added into documentation why).
> > > 
> > > The spaces are expected to be at the end only. I can add such example if
> > > you like. There are no fourcc codes with spaces in the middle in neither
> > > V4L2 nor DRM, and I don't think the expectation is to have them either.
> > 
> > But then the code suggests otherwise. Perhaps we need to extract
> > skip_trailing_spaces() from strim() and use it here.
> 
> But this wouldn't affect the result in this case, would it?

Is there any existing implementation that would skip spaces, please?

IMHO, this might just hide problems. We should show exactly what
is stored unless anyone explicitly ask for skipping that spaces.

> > 
> > ...
> > 
> > > > > +static noinline_for_stack
> > > > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > > > +                   struct printf_spec spec, const char *fmt)
> > > > > +{
> > > > 
> > > > > +       char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > > > 
> > > > Do we have any evidence / document / standard that the above format is
> > > > what people would find good? From existing practices (I consider other
> > > > printings elsewhere and users in this series) I find '(xx)' form for
> > > > hex numbers is weird. The standard practice is to use \xHH (without
> > > > parentheses).
> > > 
> > > Earlier in the review it was proposed that special handling of codes below
> > > 32 should be added, which I did. Using the parentheses is apparently an
> > > existing practice elsewhere.
> > 
> > Where? \xHH is quite well established format for escaping. Never heard about
> > '(xx)' variant before this very series.

> Mauro referred to FourCC codes while reviewing an earlier version of this,
> such as RGB(15).

This is quite easy to parse. The problem is that it is not clear
whether it is hexa or decimal number.

> Does \× imply only the next two characters are hexadecimal? I have to admit
> I don't remember seeting that, nor \x notation is common.

Hmm, the /xyy format might be hard to parse.

What about using the same approach as drm_get_format_name()?
I mean printing '?' when the character is not printable.
The exact value is printed later anyway.

The advantage is that it will always printk 4 characters.


> > > Note that neither DRM nor V4L2 currently has such fourcc codes currently.
> > 
> > ...
> > 
> > > > > +       p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > > > +                              sizeof(u32));
> > > > 
> > > > This is perfectly one line (in this file we have even longer lines).

Ailus, please do not take this as a criticism of your patch.
I understand that it might have sounded like this but Andy did
not mean it.

Andy prefers slightly longer lines over wrapping only few characters.
It makes sense to me. There are more people with the same opinion.
Even checkpatch.pl tolerates lines up to 100 characters these days.

Of course, this is a subsystem specific preference. You did not have
any chance to know it. There is no need to fight over it.

Best Regards,
Petr
