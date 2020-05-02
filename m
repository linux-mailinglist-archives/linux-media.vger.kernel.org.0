Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B181C288A
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 00:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbgEBWWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 18:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728530AbgEBWWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 18:22:15 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8F4C061A0E;
        Sat,  2 May 2020 15:22:14 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f83so5483735qke.13;
        Sat, 02 May 2020 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9fR1xjvWV4IM5l6CDx6CaIGRS9rKxnG2GxWOgEdzvQs=;
        b=cppCNrreH/DpN1wsjmKOqNfWJGQRx8xUsNCRu0/oMKasKK7I/+EvufC+BLHXq2QGh8
         HeibKoHVXX1Xud4Nk/vwrSDMJPoMUPwSj0+JV2elaQA01L5qdh+ZMeF2WA8zVO1nW9Bt
         BdqMg/ZCiP99p0Wp5BE9Ja499volTuvDfkihxeTN17mJehh0+KVXf+y244OORBpo0wt6
         8a4Z/Pf3T7uchpVKYgtRs8ZT5m3LnL0PhS2aPQlPUlZJEhVR9u9SeecIPQ0udNNzeJU6
         svbTnp9FizLGabUQLa1tIyvRnU89xfSxbxQOPKWMWu6UT0LRG5FHN7gm3CcqyesiANmw
         Djsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9fR1xjvWV4IM5l6CDx6CaIGRS9rKxnG2GxWOgEdzvQs=;
        b=QNzKiiCpCztHumeB8imbWc9CW+b/A/TD6leQdqPi6lMc8jQ8m7jxX1oIAwHRUg9Q58
         7rZYjuE7Z6bmV8V0KSPfXFkGFT2d+DK/Ib/lmYdU1lQdYSYprpvf3r5w5xqGyBCEq6dl
         wMkoYHFQQ1SDSlCCX3AySCtTkhp66zA6A9s7kZJyTV2b6ZtOGjkqjMw6xMCiE1M8k/zE
         J0BrbS37+LLY2FmPQZouFr0qtIyf9+XbFmbArNsvL2wCaT/NUPyfKpeYlBUFz8Z4uDVb
         eSBodoT9248Es6MhhG5MIZig4Si4Zl3BHAycNg/rc56XByeW6xH7byincV0Sa2pLfwUl
         ABVA==
X-Gm-Message-State: AGi0PuZoXj0dlKJqztMfEdweDHWvy1mZkuRB108E/X7S5BsR9HklKuo/
        l6A6fMoCSHoLYjFFFcrOLMnKaRVt7sQ=
X-Google-Smtp-Source: APiQypLP4CKg7ugDjfJSwNoBC3po3Jl+RH/1WiYVQg5l4meRKQqK+7qUg+fOUbp6G1GrHwzwFWK/jw==
X-Received: by 2002:a05:620a:1405:: with SMTP id d5mr10404746qkj.329.1588458132880;
        Sat, 02 May 2020 15:22:12 -0700 (PDT)
Received: from ?IPv6:2804:18:700c:ffc5:f528:88fe:f276:acfe? ([2804:18:700c:ffc5:f528:88fe:f276:acfe])
        by smtp.gmail.com with ESMTPSA id t1sm6298244qtd.65.2020.05.02.15.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 15:22:12 -0700 (PDT)
Subject: Re: [RFC, WIP, v4 07/11] media: vidtv: add MPEG TS common code
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
 <20200502032216.197977-8-dwlsalmeida@gmail.com>
 <20200502090933.171aa862@coco.lan>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <de298533-e002-99f0-0db0-0418a284fa9e@gmail.com>
Date:   Sat, 2 May 2020 19:22:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502090933.171aa862@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, thanks for reviewing this!

 > Em Sat,  2 May 2020 00:22:12 -0300
 > "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
 >
 >> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
 >>
 >> Add code to work with MPEG TS packets, such as TS headers, adaptation
 >> fields, PCR packets and NULL packets.
 >>
 >> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
 >> ---
 >>   drivers/media/test-drivers/vidtv/Makefile   |   2 +-
 >>   drivers/media/test-drivers/vidtv/vidtv_ts.c | 130 ++++++++++++++++++++
 >>   drivers/media/test-drivers/vidtv/vidtv_ts.h | 103 ++++++++++++++++
 >>   3 files changed, 234 insertions(+), 1 deletion(-)
 >>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 >>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
 >>
 >> diff --git a/drivers/media/test-drivers/vidtv/Makefile 
b/drivers/media/test-drivers/vidtv/Makefile
 >> index 9ea9485d42189..92001bc348615 100644
 >> --- a/drivers/media/test-drivers/vidtv/Makefile
 >> +++ b/drivers/media/test-drivers/vidtv/Makefile
 >> @@ -1,6 +1,6 @@
 >>   # SPDX-License-Identifier: GPL-2.0
 >>
 >>   vidtv_demod-objs := vidtv_common.o
 >> -vidtv_bridge-objs := vidtv_common.o
 >> +vidtv_bridge-objs := vidtv_common.o vidtv_ts.o
 >>
 >>   obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
 >> diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c 
b/drivers/media/test-drivers/vidtv/vidtv_ts.c
 >> new file mode 100644
 >> index 0000000000000..f545c45c0fe7c
 >> --- /dev/null
 >> +++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
 >> @@ -0,0 +1,130 @@
 >> +// SPDX-License-Identifier: GPL-2.0
 >> +/*
 >> + * The Virtual DVB test driver serves as a reference DVB driver and 
helps
 >> + * validate the existing APIs in the media subsystem. It can also aid
 >> + * developers working on userspace applications.
 >> + *
 >> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
 >> + */
 >> +
 >> +#include <linux/types.h>
 >> +#include <asm/byteorder.h>
 >> +#include "vidtv_ts.h"
 >> +#include "vidtv_common.h"
 >> +
 >> +static u32 vidtv_ts_write_pcr_bits(u8 *buf, u64 pcr)
 >> +{
 >> +	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
 >> +	u64 pcr_low = pcr % 300, pcr_high = pcr / 300;
 >> +
 >> +	*buf++ = pcr_high >> 25;
 >> +	*buf++ = pcr_high >> 17;
 >> +	*buf++ = pcr_high >>  9;
 >> +	*buf++ = pcr_high >>  1;
 >> +	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
 >> +	*buf++ = pcr_low;
 >> +
 >> +	return 6;
 >> +}
 >> +
 >> +void vidtv_ts_inc_cc(u8 *continuity_counter)
 >> +{
 >> +	++*continuity_counter;
 >> +	if (*continuity_counter > TS_CC_MAX_VAL)
 >> +		*continuity_counter = 0;
 >> +}
 >> +
 >> +u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
 >> +{
 >> +	u32    nbytes                  = 0;
 >> +	struct vidtv_mpeg_ts ts_header = {0};
 >> +
 >> +	ts_header.sync_byte          = TS_SYNC_BYTE;
 >> +	ts_header.pid                = TS_NULL_PACKET_PID;
 >> +	ts_header.payload            = 1;
 >> +	ts_header.continuity_counter = *args.continuity_counter;
 >> +
 >> +	cpu_to_be16s(&ts_header.bitfield);
 >> +
 >> +	/* copy TS header */
 >> +	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
 >> +			       &ts_header,
 >> +			       sizeof(ts_header),
 >> +			       args.dest_offset + nbytes,
 >> +			       args.buf_sz);
 >
 > Hmm... now I see why you're returning 0 to vidtv_memcpy().
 >
 > Yet, if the buffer is full, you should just drop the entire package,
 > as otherwise you may end copying things that aren't multiple of 188 
bytes,
 > causing sync issues at the client.

I'd like to provide a counterargument for this.

The way I am dealing with errors throughout vidtv so far is:
If we hit any of these WARN_ON macros, pr_err and the like, then all 
bets are off. This means that the resulting stream will likely be 
invalid and that something needs to be rewritten in the source code and 
my main concern is then preventing the whole driver from crashing.

This is exactly the behavior that you see in vidtv_memcpy and 
vidtv_memset: nothing gets written so we don't end up with an overflow, 
a diagnostic message is printed and there are no attempts at recovery.

In this particular example, I compromised by allowing the size of the 
buffer to be a module param, i.e.

 >> +static unsigned int ts_buf_sz = 20 * 188;
 >> +module_param(ts_buf_sz, uint, 0644);
 >> +MODULE_PARM_DESC(ts_buf_sz, "Optional size for the TS buffer");

I think that what I am trying to say is better seen in the last patch 
for this series: [RFC, WIP, v4 11/11] media: vidtv: Add a MPEG Transport 
Stream Multiplexer.

The following takes place in vidtv_mux.c:

	1. We wake up from sleep, take note of how long we slept for and store 
it into "elapsed_time". This is usually between 10ms and 20ms.
	2. We encode "elapsed_time" miliseconds worth of data into a buffer
	3. We call dvb_dmx_swfilter(), passing a pointer to the buffer
	4. We clear the buffer, sleep for a bit and then go back to 1.

If the buffer is somehow full then it means that we are trying to 
simulate too many fake channels while allocating too little memory, so 
either we scale down on the amount of fake channels or we choose another 
value for the "ts_buf_sz" module_param.

I feel that this is better than adding more logic in an attempt to 
circumvent the issue, specially since I can add more logic and still 
fail due to my limited experience. The result is more bloat on the 
source code for little gain.

 > A WARN_ON() seems too severe here. Also, if something bad happens, it
 > will end causing lots of problems that can make the machine very slow,
 > ad this will flood dmesg.
 >
 > So, the best would be to use, instead, dev_warn_ratelimited().

You're right, I did not consider this. I will use dev_warn_ratelimited() 
in place of WARN_ON in the next revisions.
