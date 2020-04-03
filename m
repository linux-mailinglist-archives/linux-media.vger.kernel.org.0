Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679A519D5B1
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 13:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390772AbgDCLTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 07:19:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38814 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgDCLTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 07:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=beMmNjLaey68i4T8yERipXx8YLgggyVjmRR12qNqb6k=; b=PP2DPp4NIT2zHNY2CCfe1S4Hym
        btBz0EIpxs9n+QsVzjoxx84RauiDdhXR5t8Bexfjs7lsVQi3DZba10YP7WGtXQ3bCbsvQbdTHL7G+
        HQCYcV4pCt/LrX4EOc1cydfSQzUn6vEnAPE9mbY1l/a5yTrCZQWTnTogh8tXxmlT3jJ0sZ600JgQt
        yMiKT/D2cUsTPpnIvpq3uv9fN9NPPtCJYyr14NUzfcBNwvsKD+bE9ud86yzPsBhBqQWCUNhB6mr6G
        rwoQ9jShaGyazX7N8i3E2NpHqkAmHxTYVR7vfg2386miIlYx49En+S50Ohimu2xdsWk6tds7KLjyM
        kKkUT4gw==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jKKMI-00084w-Gt; Fri, 03 Apr 2020 11:19:34 +0000
Date:   Fri, 3 Apr 2020 13:19:26 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403131926.7caf3288@coco.lan>
In-Reply-To: <20200403104701.GC3172@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
        <20200403102449.GB4882@pendragon.ideasonboard.com>
        <20200403104701.GC3172@kekkonen.localdomain>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 3 Apr 2020 13:47:02 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> > > +static noinline_for_stack
> > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > +		    struct printf_spec spec, const char *fmt)
> > > +{
> > > +#define FOURCC_STRING_BE	"-BE"
> > > +	char s[sizeof(*fourcc) + sizeof(FOURCC_STRING_BE)] = { 0 };
> > > +
> > > +	if (check_pointer(&buf, end, fourcc, spec))
> > > +		return buf;
> > > +
> > > +	if (fmt[1] != 'c' || fmt[2] != 'c')
> > > +		return error_string(buf, end, "(%p4?)", spec);
> > > +
> > > +	put_unaligned_le32(*fourcc & ~BIT(31), s);
> > > +
> > > +	if (*fourcc & BIT(31))
> > > +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> > > +			sizeof(FOURCC_STRING_BE));
> > > +
> > > +	return string(buf, end, s, spec);  
> > 
> > Taking V4L2_PIX_FMT_Y16_BE as an example, this will print 'Y16 -BE'
> > (without quotes). There are other 4CCs that contain spaces and would
> > suffer from a similar issue. Even in little-endian format, it would
> > result in additional spaces in the output string. Is this what we want ?
> > Should the caller always enclose the 4CC in quotes or brackets for
> > clarity ? Or should still be done here ?  
> 
> Good question. Space is indeed a valid character in a 4cc code.
> 
> If I omit one or more spaces, it will no longer be a 4cc, but a 3cc or even
> a 2cc. Jokes aside, there are probably fair arguments both ways.
> 
> I presume there's no 4cc code where the location of a space would make a
> difference but all of the spaces are trailing spaces.

Yes. I guess it doesn't make any sense to allow a 4cc code with an
space before or in the middle.

Btw, on a quick search at the Internet for non-Linux definitions,
a Fourcc code "Y8  " is actually shown at the lists as just "Y8", 
e. g. removing the leading spaces:

	https://www.fourcc.org/codecs.php
	http://abcavi.kibi.ru/fourcc.php
	https://softron.zendesk.com/hc/en-us/articles/207695697-List-of-FourCC-codes-for-video-codecs
	https://www.free-codecs.com/guides/guides.php?f=fourcc

One interesting detail there is that some tables show some codes 
like "BGR(15)". While I'm not sure how this is encoded, I suspect
that the fourcc is actually "BGR\x15".

We don't do that on V4L, nor we have plans to do so. Not sure if
DRM would accept something like that. Of so, then the logic should
have some special handler if the code is below 32.	

> It's also worth noting that the formats printed are mostly for debugging
> purpose and thus even getting a hypothetical case wrong is not a grave
> issue. This would also support just printing them as-is though.
> 
> I'm leaning slightly towards omitting any spaces if the code has them. 

I would just remove trailing spaces, and then use a loop from the end
to remove trailing spaces (and optionally handle codes ending with a
value below 32, if are there any such case with DRM fourcc codes).

On the other hand, I don't mind if you prefer to use just one for()
loop and just trip any spaces inside it.

> This is something that couldn't be done by using a macro...

Well, I suspect that it might be possible to write a macro
for doing that too, for example using preprocessor concatenation
logic that could produce the same results. If you do something 
like that, however, I suspect that te macro would face some 
portability issues, as, as far as I know, not all C compilers
would handle string concatenation the same way.

Thanks,
Mauro
