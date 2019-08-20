Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B484396885
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 20:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfHTSYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 14:24:02 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:32824 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbfHTSYC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 14:24:02 -0400
Received: by mail-io1-f66.google.com with SMTP id z3so14232330iog.0;
        Tue, 20 Aug 2019 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=uHnpurbv4P4p0F5RuiK25V2aB0GwEuZwO3y6lowyu+M=;
        b=gYbVKNyGNRgt75nq8hcRa1qtMbEjxj2dCo4RPtWb+81U/Y4cAE2ijyJtFn+lgtuhiE
         7GqiLfgo2VtL8EzXPKVAfWRWYmUHW2jisB37JSptOTQJnk9V/0geUQMZsQHY/iE7gAxM
         5Jk5KGXuIvtZC0WQEHtV8Rd7fh7VmgYScyjklqQitmOCc69OFxEA6PT5A2XChvcvTIkq
         2s2uIPNRIWzL/QwVh4tnOmdI7mMI5lf6TTJpT67UztMY76bnZILkqXJf/zSkvmo6KHpf
         c8F3N1CXiMoNAGOyzA2o7R7PXYACqt4Klql9YBZwnqGMRalxP0rKd3BqskvAL5oxDDK6
         Or9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=uHnpurbv4P4p0F5RuiK25V2aB0GwEuZwO3y6lowyu+M=;
        b=lGdhY9ICOw+41dI7zCNlGbc0n5DNBeg0wB3vW5+7HiSlgIf5utbecAMvWvYk/Guo7O
         1YnRtThVCA1RZpPkzvWa9QF8SvWAwG6hNOQPW5XeJKWeSEqjip3yRtWoi7TIBC0x4+2Z
         8ILsaOVAPL0GYXyEVeEfindAJUxzyezwmcP/WzlJ/hx9e88mBpxRKItp0VrgVfBSMXap
         bXGBwE19JE+X6PBlvWYUOpwHrSFH03nqh7iOW00iXXMvRLyTI5o7fybZpqjT3XTIMg80
         kUChVPw7gQ6j/5D9d1CV1sY9onfeGDBPbNUINwmdq5R4B9BjNoj2GQzIoA+NAKyui9Oh
         +jzg==
X-Gm-Message-State: APjAAAWhSnAXg2bVLOUw6G06k5aJelzVPSytpEj3ed7mCg5vSW+IEtzJ
        IQ8KKV4oDv8zki5PzCh/dUo=
X-Google-Smtp-Source: APXvYqxs6kWHYzMycFstHU+fT+10ExIDJ0/Pp36tFMh4TnF/CwI5LAoOMEFKt9k2gPjBSo+b5DQEcw==
X-Received: by 2002:a6b:ea12:: with SMTP id m18mr33580734ioc.173.1566325441159;
        Tue, 20 Aug 2019 11:24:01 -0700 (PDT)
Received: from [10.164.9.36] (cos-128-210-107-27.science.purdue.edu. [128.210.107.27])
        by smtp.gmail.com with ESMTPSA id i3sm15060845ion.9.2019.08.20.11.24.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 11:24:00 -0700 (PDT)
From:   Hui Peng <benquike@gmail.com>
To:     Hui Peng <benquike@gmail.com>
Cc:     Mathias Payer <mathias.payer@nebelwelt.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kees Cook <keescook@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, security@kernel.org
Subject: Re: [PATCH] Fix an OOB access bug in technisat_usb2_get_ir
References: <20190820181921.7921-1-benquike@gmail.com>
Message-ID: <b9b256cb-95f2-5fa1-9956-5a602a017c11@gmail.com>
Date:   Tue, 20 Aug 2019 14:24:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820181921.7921-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following is the kasan report. This bug was found in v4.20-rc2, but
it is present in the latest version.

BUG: KASAN: slab-out-of-bounds in technisat_usb2_get_ir
drivers/media/usb/dvb-usb/technisat-usb2.c:664 [inline]
BUG: KASAN: slab-out-of-bounds in technisat_usb2_rc_query+0x598/0x5f0
drivers/media/usb/dvb-usb/technisat-usb2.c:679
Read of size 1 at addr ffff88805ee3d3a8 by task kworker/2:3/8681

CPU: 2 PID: 8681 Comm: kworker/2:3 Not tainted 4.20.0-rc2 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
Workqueue: events dvb_usb_read_remote_control
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xd2/0x148 lib/dump_stack.c:113
 print_address_description+0x71/0x239 mm/kasan/report.c:256
 kasan_report_error mm/kasan/report.c:354 [inline]
 kasan_report.cold.5+0x242/0x30b mm/kasan/report.c:412
 __asan_report_load1_noabort+0x19/0x20 mm/kasan/report.c:430
 technisat_usb2_get_ir drivers/media/usb/dvb-usb/technisat-usb2.c:664
[inline]
 technisat_usb2_rc_query+0x598/0x5f0
drivers/media/usb/dvb-usb/technisat-usb2.c:679
 dvb_usb_read_remote_control+0xbd/0x150
drivers/media/usb/dvb-usb/dvb-usb-remote.c:261
 process_one_work+0x816/0x14d0 kernel/workqueue.c:2153
 worker_thread+0x9b/0xce0 kernel/workqueue.c:2296
 kthread+0x33d/0x400 kernel/kthread.c:246
 ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

On 8/20/19 2:19 PM, Hui Peng wrote:
> In the while loop of technisat_usb2_get_ir, it scans through
> a fix-sized buffer read from the device side, the termination
> condition of the loop is `*b == 0xff`. If no `0xff` byte is read
> from the device side, OOB access happens.
>
> This patch fixes the bug by adding an upper bound in the while loop.
>
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/technisat-usb2.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
> index c659e18b358b..181f5f97af45 100644
> --- a/drivers/media/usb/dvb-usb/technisat-usb2.c
> +++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
> @@ -612,6 +612,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  	u8 *b;
>  	int ret;
>  	struct ir_raw_event ev;
> +	int i = 0;
>  
>  	buf[0] = GET_IR_DATA_VENDOR_REQUEST;
>  	buf[1] = 0x08;
> @@ -656,11 +657,15 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  
>  	ev.pulse = 0;
>  	while (1) {
> +		// only `ret` bytes are read from the device side
> +		if (i >= ret)
> +			break;
>  		ev.pulse = !ev.pulse;
>  		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
>  		ir_raw_event_store(d->rc_dev, &ev);
>  
>  		b++;
> +		i++;
>  		if (*b == 0xff) {
>  			ev.pulse = 0;
>  			ev.duration = 888888*2;
