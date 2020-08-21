Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388AF24D0BE
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 10:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgHUIsN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 21 Aug 2020 04:48:13 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:60563 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728109AbgHUIsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 04:48:11 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-223-9puSzk3tPJqiaeE2oL8ASg-1; Fri, 21 Aug 2020 09:48:07 +0100
X-MC-Unique: 9puSzk3tPJqiaeE2oL8ASg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 21 Aug 2020 09:48:06 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 21 Aug 2020 09:48:06 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Steven Rostedt' <rostedt@goodmis.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: RE: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
Thread-Topic: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
Thread-Index: AQHWd1MRQFeXK2GIIEihfK8khxWsrqlCP3rw
Date:   Fri, 21 Aug 2020 08:48:05 +0000
Message-ID: <21fae92da07c4566ba4eed3b5e1bce2d@AcuMS.aculab.com>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
        <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
        <20200820102347.15d2f610@oasis.local.home>
        <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home>
In-Reply-To: <20200820203601.4f70bf98@oasis.local.home>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Steven Rostedt
> Sent: 21 August 2020 01:36
> On Fri, 21 Aug 2020 08:13:00 +0800
> Nicolas Boichat <drinkcat@chromium.org> wrote:
> 
> > On Thu, Aug 20, 2020 at 10:23 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > On Thu, 20 Aug 2020 17:14:12 +0800
> > > Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > > Technically, we could only initialize the trace_printk buffers
> > > > when the print env is switched, to avoid the build error and
> > > > unconditional boot-time warning, but I assume this printing
> > > > framework will eventually get removed when the driver moves out
> > > > of staging?
> > >
> > > Perhaps this should be converting into a trace event. Look at what bpf
> > > did for their bpf_trace_printk().
> > >
> > > The more I think about it, the less I like this series.
> >
> > To make it clear, the primary goal of this series is to get rid of
> > trace_printk sprinkled in the kernel by making sure some randconfig
> > builds fail. Since my v2, there already has been one more added (the
> > one that this patch removes), so I'd like to land 2/3 ASAP to prevent
> > even more from being added.
> >
> > Looking at your reply on 1/3, I think we are aligned on that goal? Is
> > there some other approach you'd recommend?
> >
> > Now, I'm not pretending my fixes are the best possible ones, but I
> > would much rather have the burden of converting to trace events on the
> > respective driver maintainers. (btw is there a short
> > documentation/tutorial that I could link to in these patches, to help
> > developers understand what is the recommended way now?)
> >
> 
> I like the goal, but I guess I never articulated the problem I have
> with the methodology.
> 
> trace_printk() is meant to be a debugging tool. Something that people
> can and do sprinkle all over the kernel to help them find a bug in
> areas that are called quite often (where printk() is way too slow).
> 
> The last thing I want them to deal with is adding a trace_printk() with
> their distro's config (or a config from someone that triggered the bug)
> only to have the build to fail, because they also need to add a config
> value.
> 
> I add to the Cc a few developers I know that use trace_printk() in this
> fashion. I'd like to hear their view on having to add a config option
> to make trace_printk work before they test a config that is sent to
> them.

Is it worth having three compile-time options:
1) trace_printk() ignored.
2) trace_printk() enabled.
3) trace_printk() generates a compile time error.

Normal kernel builds would ignore calls.
Either a config option or a module option (etc) would enable it.
A config option that 'rand-config' builds would turn on would
generate compile-time errors.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

