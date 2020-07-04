Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5FF214634
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 15:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgGDNr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jul 2020 09:47:58 -0400
Received: from turbocat.net ([88.99.82.50]:56078 "EHLO mail.turbocat.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727083AbgGDNr6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jul 2020 09:47:58 -0400
X-Greylist: delayed 464 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 Jul 2020 09:47:58 EDT
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 76C432602E8
        for <linux-media@vger.kernel.org>; Sat,  4 Jul 2020 15:40:12 +0200 (CEST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Petter Selasky <hps@selasky.org>
Subject: [FYI] Unaligned memory access in DVB-X code causes immediate kernel
 panic on arm 32-bit
Message-ID: <91056726-81c7-3f82-7985-66c283ad3fc6@selasky.org>
Date:   Sat, 4 Jul 2020 15:39:50 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Plugging the "TeVii S660" on ARM v7 (32-bit) causes an immediate kernel 
panic, because of unaligned memory access.

For more information see the following thread:

https://forums.freebsd.org/threads/tevii-s660-usb-dvb-s2-working.75977/

The backtrace goes like this (Linux 5.7, Torvald's)

#0  0x002dafbc in ts2020_read_tuner_gain (fe=<optimized out>, v_agc=0, 
_gain=0x207b31de)
     at media_tree/drivers/media/dvb-frontends/ts2020.c:380
380         *_gain = -((__s64)gain1 * 2650 +
[Current thread is 1 (LWP 100158)]
(gdb) bt
#0  0x002dafbc in ts2020_read_tuner_gain (fe=<optimized out>, v_agc=0, 
_gain=0x207b31de)
     at media_tree/drivers/media/dvb-frontends/ts2020.c:380
#1  ts2020_get_tuner_gain (fe=<optimized out>, _gain=0x207b31de)
     at media_tree/drivers/media/dvb-frontends/ts2020.c:421
#2  ts2020_stat_work (work=<optimized out>) at 
media_tree/drivers/media/dvb-frontends/ts2020.c:437
#3  0x002db21c in ts2020_init (fe=<optimized out>) at 
media_tree/drivers/media/dvb-frontends/ts2020.c:148
#4  0x00350cc4 in dvb_frontend_init (fe=0x207b2f08) at 
media_tree/drivers/media/dvb-core/dvb_frontend.c:336
#5  dvb_frontend_thread (data=0x207b2f08) at 
media_tree/drivers/media/dvb-core/dvb_frontend.c:664
#6  0x00113d98 in kthread_wrapper (arg=0x20c56000) at 
kernel/linux_thread.c:531
#7  0x2058cd84 in thread_start (curthread=0x20c57000) at 
/usr/src/lib/libthr/thread/thr_create.c:292
#8  0x2058c830 in _pthread_create (thread=<error reading variable: 
Cannot access memory at address 0xbdae500c>,
     attr=<optimized out>, start_routine=<optimized out>, arg=<optimized 
out>)
     at /usr/src/lib/libthr/thread/thr_create.c:188

--HPS
