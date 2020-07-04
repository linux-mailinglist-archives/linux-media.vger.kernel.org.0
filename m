Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE161214857
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 21:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgGDTXT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jul 2020 15:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGDTXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Jul 2020 15:23:18 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CC1C061794
        for <linux-media@vger.kernel.org>; Sat,  4 Jul 2020 12:23:18 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 98C24C64ED; Sat,  4 Jul 2020 20:23:14 +0100 (BST)
Date:   Sat, 4 Jul 2020 20:23:14 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Petter Selasky <hps@selasky.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [FYI] Unaligned memory access in DVB-X code causes immediate
 kernel panic on arm 32-bit
Message-ID: <20200704192314.GA31798@gofer.mess.org>
References: <91056726-81c7-3f82-7985-66c283ad3fc6@selasky.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91056726-81c7-3f82-7985-66c283ad3fc6@selasky.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sat, Jul 04, 2020 at 03:39:50PM +0200, Hans Petter Selasky wrote:
> Hi,
> 
> Plugging the "TeVii S660" on ARM v7 (32-bit) causes an immediate kernel
> panic, because of unaligned memory access.
> 
> For more information see the following thread:
> 
> https://forums.freebsd.org/threads/tevii-s660-usb-dvb-s2-working.75977/
> 
> The backtrace goes like this (Linux 5.7, Torvald's)
> 
> #0  0x002dafbc in ts2020_read_tuner_gain (fe=<optimized out>, v_agc=0,
> _gain=0x207b31de)
>     at media_tree/drivers/media/dvb-frontends/ts2020.c:380
> 380         *_gain = -((__s64)gain1 * 2650 +

So this is a reference to s64 svalue in struct dtv_stats. This is unaligned
because the struct is packed. Making the struct packed seems like a terrible
idea, but it's in the uapi so we can't change it.

Now, what I don't understand is why this hasn't been spotted before. There
are a few dvb drivers that use struct dtv_stats, and surely someone must
have tried them on arm at some point. Unless they just return bogus stats
on Linux since unaligned does not trap?

The correct solution is wrap all of these in {get,put}_unaligned().

It would be nice to hear what happens on Linux (arm) rather than FreeBSD.


Sean

> [Current thread is 1 (LWP 100158)]
> (gdb) bt
> #0  0x002dafbc in ts2020_read_tuner_gain (fe=<optimized out>, v_agc=0,
> _gain=0x207b31de)
>     at media_tree/drivers/media/dvb-frontends/ts2020.c:380
> #1  ts2020_get_tuner_gain (fe=<optimized out>, _gain=0x207b31de)
>     at media_tree/drivers/media/dvb-frontends/ts2020.c:421
> #2  ts2020_stat_work (work=<optimized out>) at
> media_tree/drivers/media/dvb-frontends/ts2020.c:437
> #3  0x002db21c in ts2020_init (fe=<optimized out>) at
> media_tree/drivers/media/dvb-frontends/ts2020.c:148
> #4  0x00350cc4 in dvb_frontend_init (fe=0x207b2f08) at
> media_tree/drivers/media/dvb-core/dvb_frontend.c:336
> #5  dvb_frontend_thread (data=0x207b2f08) at
> media_tree/drivers/media/dvb-core/dvb_frontend.c:664
> #6  0x00113d98 in kthread_wrapper (arg=0x20c56000) at
> kernel/linux_thread.c:531
> #7  0x2058cd84 in thread_start (curthread=0x20c57000) at
> /usr/src/lib/libthr/thread/thr_create.c:292
> #8  0x2058c830 in _pthread_create (thread=<error reading variable: Cannot
> access memory at address 0xbdae500c>,
>     attr=<optimized out>, start_routine=<optimized out>, arg=<optimized
> out>)
>     at /usr/src/lib/libthr/thread/thr_create.c:188
> 
> --HPS
