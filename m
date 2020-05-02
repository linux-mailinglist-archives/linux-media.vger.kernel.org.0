Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C34E1C23BA
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 09:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgEBHJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 03:09:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:39926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgEBHJj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 03:09:39 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41B9E216FD;
        Sat,  2 May 2020 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588403378;
        bh=wpohAt1R/38lcPWwqw8Do1FRmBAZ9PTDAgFAhK5mktc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=t5MpKA1fNUqo2kkHAR/Flp3j0h0A/C46z3or+10Sc+FNFlKYJuq8e3cWl4ObP4rZn
         vYsd1JQ4+09BI4aoRXADs006FoECK9yIEnW6Z5yIUh3M1Lh5QQyV+eJ2H8wTq6kYXC
         fgHVLAg3PNTk4aAsZxQ1dbTv/EKlQ+0tmwDv5IlM=
Date:   Sat, 2 May 2020 09:09:33 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC, WIP, v4 07/11] media: vidtv: add MPEG TS common code
Message-ID: <20200502090933.171aa862@coco.lan>
In-Reply-To: <20200502032216.197977-8-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
        <20200502032216.197977-8-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat,  2 May 2020 00:22:12 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Add code to work with MPEG TS packets, such as TS headers, adaptation
> fields, PCR packets and NULL packets.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/Makefile   |   2 +-
>  drivers/media/test-drivers/vidtv/vidtv_ts.c | 130 ++++++++++++++++++++
>  drivers/media/test-drivers/vidtv/vidtv_ts.h | 103 ++++++++++++++++
>  3 files changed, 234 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
> 
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> index 9ea9485d42189..92001bc348615 100644
> --- a/drivers/media/test-drivers/vidtv/Makefile
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  vidtv_demod-objs := vidtv_common.o
> -vidtv_bridge-objs := vidtv_common.o
> +vidtv_bridge-objs := vidtv_common.o vidtv_ts.o
>  
>  obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
> new file mode 100644
> index 0000000000000..f545c45c0fe7c
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +#include "vidtv_ts.h"
> +#include "vidtv_common.h"
> +
> +static u32 vidtv_ts_write_pcr_bits(u8 *buf, u64 pcr)
> +{
> +	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
> +	u64 pcr_low = pcr % 300, pcr_high = pcr / 300;
> +
> +	*buf++ = pcr_high >> 25;
> +	*buf++ = pcr_high >> 17;
> +	*buf++ = pcr_high >>  9;
> +	*buf++ = pcr_high >>  1;
> +	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
> +	*buf++ = pcr_low;
> +
> +	return 6;
> +}
> +
> +void vidtv_ts_inc_cc(u8 *continuity_counter)
> +{
> +	++*continuity_counter;
> +	if (*continuity_counter > TS_CC_MAX_VAL)
> +		*continuity_counter = 0;
> +}
> +
> +u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
> +{
> +	u32    nbytes                  = 0;
> +	struct vidtv_mpeg_ts ts_header = {0};
> +
> +	ts_header.sync_byte          = TS_SYNC_BYTE;
> +	ts_header.pid                = TS_NULL_PACKET_PID;
> +	ts_header.payload            = 1;
> +	ts_header.continuity_counter = *args.continuity_counter;
> +
> +	cpu_to_be16s(&ts_header.bitfield);
> +
> +	/* copy TS header */
> +	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
> +			       &ts_header,
> +			       sizeof(ts_header),
> +			       args.dest_offset + nbytes,
> +			       args.buf_sz);

Hmm... now I see why you're returning 0 to vidtv_memcpy().

Yet, if the buffer is full, you should just drop the entire package,
as otherwise you may end copying things that aren't multiple of 188 bytes,
causing sync issues at the client.

> +
> +	be16_to_cpus(&ts_header.bitfield);
> +
> +	vidtv_ts_inc_cc(args.continuity_counter);
> +
> +	/* fill the rest with empty data */
> +	nbytes += vidtv_memset(args.dest_buf + args.dest_offset + nbytes,
> +			       0xff,
> +			       TS_PACKET_LEN - nbytes,
> +			       args.dest_offset + nbytes,
> +			       args.buf_sz);
> +
> +	/* we should have written exactly _one_ 188byte packet */
> +	WARN_ON(nbytes != TS_PACKET_LEN);

A WARN_ON() seems too severe here. Also, if something bad happens, it
will end causing lots of problems that can make the machine very slow,
ad this will flood dmesg.

So, the best would be to use, instead, dev_warn_ratelimited().

PS.: same notes here apply to the function below (and on next patches).

> +
> +	return nbytes;
> +}
> +
> +u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
> +{
> +	u32    nbytes                         = 0;
> +	struct vidtv_mpeg_ts ts_header        = {0};
> +	struct vidtv_mpeg_ts_adaption ts_adap = {0};
> +
> +	ts_header.sync_byte     = TS_SYNC_BYTE;
> +	ts_header.tei           = 0;
> +	ts_header.payload_start = 0;
> +	ts_header.pid           = args.pid;
> +	ts_header.priority      = 0;
> +	ts_header.scrambling    = 0;
> +	/* cc is not incremented, see 13818-1 clause 2.4.3.3 */
> +	ts_header.continuity_counter = *args.continuity_counter;
> +	ts_header.payload            = 0;
> +	ts_header.adaptation_field   = 1;
> +
> +	/* 13818-1 clause 2.4.3.5 */
> +	ts_adap.length = 183;
> +	ts_adap.PCR    = 1;
> +
> +	cpu_to_be16s(&ts_header.bitfield);
> +
> +	/* copy TS header */
> +	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
> +			       &ts_header,
> +			       sizeof(ts_header),
> +			       args.dest_offset + nbytes,
> +			       args.buf_sz);
> +
> +	be16_to_cpus(&ts_header.bitfield);
> +
> +	/* write the adap after the TS header */
> +	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
> +			       &ts_adap,
> +			       sizeof(ts_adap),
> +			       args.dest_offset + nbytes,
> +			       args.buf_sz);
> +
> +	/* write the PCR optional */
> +	cpu_to_be64s(&args.pcr);
> +	nbytes += vidtv_ts_write_pcr_bits(args.dest_buf +
> +					  args.dest_offset +
> +					  nbytes,
> +					  args.pcr);
> +	be64_to_cpus(&args.pcr);
> +
> +	nbytes += vidtv_memset(args.dest_buf + args.dest_offset + nbytes,
> +			       0xff,
> +			       TS_PACKET_LEN - nbytes,
> +			       args.dest_offset + nbytes,
> +			       args.buf_sz);
> +
> +	/* we should have written exactly _one_ 188byte packet */
> +	WARN_ON(nbytes != TS_PACKET_LEN);
> +
> +	return nbytes;
> +}
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
> new file mode 100644
> index 0000000000000..2c07bddc46119
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_TS_H
> +#define VIDTV_TS_H
> +
> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +
> +#define TS_SYNC_BYTE 0x47
> +#define TS_PACKET_LEN 188
> +#define TS_PAYLOAD_LEN 184
> +#define TS_NULL_PACKET_PID 0x1fff
> +#define TS_CC_MAX_VAL 0x0f /* 4 bits */
> +#define TS_LAST_VALID_PID 8191
> +
> +struct vidtv_mpeg_ts_adaption {
> +	u8 length;
> +	struct {
> +#if defined(__LITTLE_ENDIAN_BITFIELD)
> +		u8 extension:1;
> +		u8 private_data:1;
> +		u8 splicing_point:1;
> +		u8 OPCR:1;
> +		u8 PCR:1;
> +		u8 priority:1;
> +		u8 random_access:1;
> +		u8 discontinued:1;
> +#elif defined(__BIG_ENDIAN_BITFIELD)
> +		u8 discontinued:1;
> +		u8 random_access:1;
> +		u8 priority:1;
> +		u8 PCR:1;
> +		u8 OPCR:1;
> +		u8 splicing_point:1;
> +		u8 private_data:1;
> +		u8 extension:1;
> +#else
> +#error  "Please fix <asm/byteorder.h>"
> +#endif
> +	} __packed;
> +	u8 data[];
> +} __packed;
> +
> +struct vidtv_mpeg_ts {
> +	u8 sync_byte;
> +	union {
> +		u16 bitfield;
> +		struct {
> +			u16 pid:13;
> +			u16 priority:1;
> +			u16 payload_start:1;
> +			u16 tei:1;
> +		} __packed;
> +	} __packed;
> +	struct {
> +#if defined(__LITTLE_ENDIAN_BITFIELD)
> +		u8 continuity_counter:4;
> +		u8 payload:1;
> +		u8 adaptation_field:1;
> +		u8 scrambling:2;
> +#elif defined(__BIG_ENDIAN_BITFIELD)
> +		u8 scrambling:2;
> +		u8 adaptation_field:1;
> +		u8 payload:1;
> +		u8 continuity_counter:4;
> +#else
> +#error  "Please fix <asm/byteorder.h>"
> +#endif
> +	} __packed;
> +	struct vidtv_mpeg_ts_adaption adaption[];
> +} __packed;
> +
> +struct pcr_write_args {
> +	void *dest_buf; /* The buffer to write into */
> +	u32 dest_offset; /* The byte offset into the buffer */
> +	u16 pid; /* the TS PID for the PCR packets */
> +	u32 buf_sz; /* protect against overflow when this field is not zero */
> +	u8 *continuity_counter;
> +	u64 pcr; /* A sample from the system clock */
> +};
> +
> +struct null_packet_write_args {
> +	void *dest_buf;/* The buffer to write into */
> +	u32 dest_offset;/* The byte offset into the buffer */
> +	u32 buf_sz; /* protect against overflow when this field is not zero */
> +	u8 *continuity_counter;
> +};
> +
> +/* Increment the continuity counter */
> +void vidtv_ts_inc_cc(u8 *continuity_counter);
> +
> +u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
> +
> +u32 vidtv_ts_pcr_write_into(struct pcr_write_args args);
> +
> +#endif //VIDTV_TS_H



Thanks,
Mauro
