Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8AD1C2AFD
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 11:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgECJu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 05:50:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbgECJu5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 05:50:57 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52588206B8;
        Sun,  3 May 2020 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588499456;
        bh=E/sTWHiOvUIoBBaFZvsl2NpEPvdhm/z5bua77hLK/ho=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=w2COvS66ha4wd5AKHE1T+pOOLqq9GdLedwqPQTZEdeVaH1ltRjSHzWYz05kcZbywJ
         4iK1liYeMOGPQgl5VgBMjz1hfEP0L5G2Qp6yT+l4JkQaU37EGZKttVdxy8tOw72Cgh
         FCDKy2VuZPCG3OqkEOOmwbazUk2o1RPBOKaflvvM=
Date:   Sun, 3 May 2020 11:50:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC, WIP, v4 07/11] media: vidtv: add MPEG TS common code
Message-ID: <20200503115051.273cf845@coco.lan>
In-Reply-To: <de298533-e002-99f0-0db0-0418a284fa9e@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
        <20200502032216.197977-8-dwlsalmeida@gmail.com>
        <20200502090933.171aa862@coco.lan>
        <de298533-e002-99f0-0db0-0418a284fa9e@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 2 May 2020 19:22:06 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro, thanks for reviewing this!
> 
>  > Em Sat,  2 May 2020 00:22:12 -0300
>  > "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
>  >  
>  >> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>  >>
>  >> Add code to work with MPEG TS packets, such as TS headers, adaptation
>  >> fields, PCR packets and NULL packets.
>  >>
>  >> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
>  >> ---
>  >>   drivers/media/test-drivers/vidtv/Makefile   |   2 +-
>  >>   drivers/media/test-drivers/vidtv/vidtv_ts.c | 130 ++++++++++++++++++++
>  >>   drivers/media/test-drivers/vidtv/vidtv_ts.h | 103 ++++++++++++++++
>  >>   3 files changed, 234 insertions(+), 1 deletion(-)
>  >>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
>  >>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
>  >>
>  >> diff --git a/drivers/media/test-drivers/vidtv/Makefile   
> b/drivers/media/test-drivers/vidtv/Makefile
>  >> index 9ea9485d42189..92001bc348615 100644
>  >> --- a/drivers/media/test-drivers/vidtv/Makefile
>  >> +++ b/drivers/media/test-drivers/vidtv/Makefile
>  >> @@ -1,6 +1,6 @@
>  >>   # SPDX-License-Identifier: GPL-2.0
>  >>
>  >>   vidtv_demod-objs := vidtv_common.o
>  >> -vidtv_bridge-objs := vidtv_common.o
>  >> +vidtv_bridge-objs := vidtv_common.o vidtv_ts.o
>  >>
>  >>   obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
>  >> diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c   
> b/drivers/media/test-drivers/vidtv/vidtv_ts.c
>  >> new file mode 100644
>  >> index 0000000000000..f545c45c0fe7c
>  >> --- /dev/null
>  >> +++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
>  >> @@ -0,0 +1,130 @@
>  >> +// SPDX-License-Identifier: GPL-2.0
>  >> +/*
>  >> + * The Virtual DVB test driver serves as a reference DVB driver and   
> helps
>  >> + * validate the existing APIs in the media subsystem. It can also aid
>  >> + * developers working on userspace applications.
>  >> + *
>  >> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
>  >> + */
>  >> +
>  >> +#include <linux/types.h>
>  >> +#include <asm/byteorder.h>
>  >> +#include "vidtv_ts.h"
>  >> +#include "vidtv_common.h"
>  >> +
>  >> +static u32 vidtv_ts_write_pcr_bits(u8 *buf, u64 pcr)
>  >> +{
>  >> +	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
>  >> +	u64 pcr_low = pcr % 300, pcr_high = pcr / 300;
>  >> +
>  >> +	*buf++ = pcr_high >> 25;
>  >> +	*buf++ = pcr_high >> 17;
>  >> +	*buf++ = pcr_high >>  9;
>  >> +	*buf++ = pcr_high >>  1;
>  >> +	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
>  >> +	*buf++ = pcr_low;
>  >> +
>  >> +	return 6;
>  >> +}
>  >> +
>  >> +void vidtv_ts_inc_cc(u8 *continuity_counter)
>  >> +{
>  >> +	++*continuity_counter;
>  >> +	if (*continuity_counter > TS_CC_MAX_VAL)
>  >> +		*continuity_counter = 0;
>  >> +}
>  >> +
>  >> +u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
>  >> +{
>  >> +	u32    nbytes                  = 0;
>  >> +	struct vidtv_mpeg_ts ts_header = {0};
>  >> +
>  >> +	ts_header.sync_byte          = TS_SYNC_BYTE;
>  >> +	ts_header.pid                = TS_NULL_PACKET_PID;
>  >> +	ts_header.payload            = 1;
>  >> +	ts_header.continuity_counter = *args.continuity_counter;
>  >> +
>  >> +	cpu_to_be16s(&ts_header.bitfield);
>  >> +
>  >> +	/* copy TS header */
>  >> +	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
>  >> +			       &ts_header,
>  >> +			       sizeof(ts_header),
>  >> +			       args.dest_offset + nbytes,
>  >> +			       args.buf_sz);  
>  >
>  > Hmm... now I see why you're returning 0 to vidtv_memcpy().
>  >
>  > Yet, if the buffer is full, you should just drop the entire package,
>  > as otherwise you may end copying things that aren't multiple of 188   
> bytes,
>  > causing sync issues at the client.  
> 
> I'd like to provide a counterargument for this.
> 
> The way I am dealing with errors throughout vidtv so far is:
> If we hit any of these WARN_ON macros, pr_err and the like, then all 
> bets are off. This means that the resulting stream will likely be 
> invalid

Losing some data is not really a big issue. 

I mean, a stream with some dropped packages is acceptable. That 
actually happens in practice, as sometimes userspace just can't read
everything in time. 

The only thing is that, if buffer overflow conditions are detected
(and allowed - se more below), the code should ensure that the package
counters should be updated, so the next frame will show a 
discontinuity. This way, userspace can detect packet losses.

> and that something needs to be rewritten in the source code and 
> my main concern is then preventing the whole driver from crashing.

A WARN_ON() won't prevent a crash. It will just output (very noisly)
stuff at dmesg. This can actually cause a crash: if someone is using
a serial console, for example, the amount of data at dmesg will
be so much that the machine will become unresponsive.

Btw, when WARN_ON() is detecting something that would cause crashes,
it should use this pattern:

	if (WARN_ON(...))
		return -EINVAL; // or some other error code like -ENOMEM

> This is exactly the behavior that you see in vidtv_memcpy and 
> vidtv_memset: nothing gets written so we don't end up with an overflow, 
> a diagnostic message is printed and there are no attempts at recovery.

Yeah, after looking how you're using it, I'm ok with the way you're
using vidtv_memcpy (but see the comments I posted today about them).

> 
> In this particular example, I compromised by allowing the size of the 
> buffer to be a module param, i.e.
> 
>  >> +static unsigned int ts_buf_sz = 20 * 188;
>  >> +module_param(ts_buf_sz, uint, 0644);
>  >> +MODULE_PARM_DESC(ts_buf_sz, "Optional size for the TS buffer");  

(Unrelated to this discussion)
What happens if userspace sets ts_buf_sz < 188? What happens if
ts_buf_sz is bigger than the available RAM size? For sure you need
a callback there in order validate its result and ensure it would
between a certain range that would make sense.

> 
> I think that what I am trying to say is better seen in the last patch 
> for this series: [RFC, WIP, v4 11/11] media: vidtv: Add a MPEG Transport 
> Stream Multiplexer.
> 
> The following takes place in vidtv_mux.c:
> 
> 	1. We wake up from sleep, take note of how long we slept for and store 
> it into "elapsed_time". This is usually between 10ms and 20ms.
> 	2. We encode "elapsed_time" miliseconds worth of data into a buffer
> 	3. We call dvb_dmx_swfilter(), passing a pointer to the buffer
> 	4. We clear the buffer, sleep for a bit and then go back to 1.
> 
> If the buffer is somehow full then it means that we are trying to 
> simulate too many fake channels while allocating too little memory, so 
> either we scale down on the amount of fake channels or we choose another 
> value for the "ts_buf_sz" module_param.
> 
> I feel that this is better than adding more logic in an attempt to 
> circumvent the issue, specially since I can add more logic and still 
> fail due to my limited experience. The result is more bloat on the 
> source code for little gain.

Ok, there are some different situations buffer overflow conditions:

1) userspace may not be calling read() fast enough;
2) the buffer is too small for a single stream;
3) the buffer will support a limited number of streams.

The code should work fine with condition (1), not causing warnings
or errors.

The minimal buffer size should be big enough to avoid condition (2).

Different strategies could be used to handle condition (3).

-

Let's forget for a while the Kernel driver, focusing on the other
side of the coin:

This driver is meant to allow testing userspace programs, emulating
a real hardware.

With real hardware, the TV board will receive a signal with some
noise. The signal is encoded with several error detection mechanisms.

When a board hardware detects that a package has issues, it will
discard it. That's why some packets have a continuity_counter,
while others are just continuously repeated.

So, from this aspect, having some packages dropped from a stream
is actually not a bad thing.

Back to the implementation part, in order to simulate a package
drop, we could simply have a rand() call that would be randomly
dropping some packages. Or, we could set the driver to produce
more streams that it would fit into the MPEG-TS stream.

For now, I would just do the latter: if the buffer is too small,
just drop an entire package, preserving the alignment.

> 
>  > A WARN_ON() seems too severe here. Also, if something bad happens, it
>  > will end causing lots of problems that can make the machine very slow,
>  > ad this will flood dmesg.
>  >
>  > So, the best would be to use, instead, dev_warn_ratelimited().  
> 
> You're right, I did not consider this. I will use dev_warn_ratelimited() 
> in place of WARN_ON in the next revisions.

yeah, dev_warn_ratelimited() would work. You could also use
WARN_ON_ONCE(), as probably there's not much value on keep
repeating the message every time.

Thanks,
Mauro
