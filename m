Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5B21C2AA0
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 09:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgECHvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 03:51:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727092AbgECHvO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 03:51:14 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5C112078E;
        Sun,  3 May 2020 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588492271;
        bh=gWyIIK/nrdvzERPOtreUHxDjhZ0zdML6J/AYop1NgCU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=xq1MDdkX4MouteyNDwEyeh56fEdsLGPWUuBXDVFmlc/OT68i9KxxS5FEzj9Hxs3/X
         rPGW2Sms55yNPuJDmIm/uUXTnPYvGidRmVaK5kYCgxXzs3daobf4oTt2WCwdujrzuO
         FqcELYYNyNXsDGbScXB1liCJinQYqzr3suxJJCKM=
Date:   Sun, 3 May 2020 09:51:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC, WIP, v4 08/11] media: vidtv: implement a PSI generator
Message-ID: <20200503095105.6b8f0d3f@coco.lan>
In-Reply-To: <20200502032216.197977-9-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
        <20200502032216.197977-9-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat,  2 May 2020 00:22:13 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> PSI packets contain general information about a MPEG Transport Stream.
> A PSI generator is needed so userspace apps can retrieve information
> about the Transport Stream and eventually tune into a (dummy) channel.
> 
> Because the generator is implemented in a separate file, it can be
> reused elsewhere in the media subsystem.
> 
> Currently this commit adds support for working with 3 PSI tables:
> PAT, PMT and SDT.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/Makefile    |    2 +-
>  drivers/media/test-drivers/vidtv/vidtv_psi.c | 1137 ++++++++++++++++++
>  drivers/media/test-drivers/vidtv/vidtv_psi.h |  357 ++++++
>  3 files changed, 1495 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
> 
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> index 92001bc348615..e4f744aa53136 100644
> --- a/drivers/media/test-drivers/vidtv/Makefile
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  vidtv_demod-objs := vidtv_common.o
> -vidtv_bridge-objs := vidtv_common.o vidtv_ts.o
> +vidtv_bridge-objs := vidtv_common.o vidtv_ts.o vidtv_psi.o
>  
>  obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> new file mode 100644
> index 0000000000000..191d37a248923
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -0,0 +1,1137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This file contains the logic to work with MPEG Program-Specific Information.
> + * These are defined both in ISO/IEC 13818-1 (systems) and ETSI EN 300 468.
> + * PSI is carried in the form of table structures, and although each table might
> + * technically be broken into one or more sections, we do not do this here,
> + * hence 'table' and 'section' are interchangeable for us.
> + *
> + * This code currently supports three tables: PAT, PMT and SDT. These are the
> + * bare minimum to get userspace to recognize our MPEG transport stream. It can
> + * be extended to support more PSI tables in the future.
> + *
> + * A note on endianness: MPEG layout is big-endian, therefore:
> + * - All fields spanning more than a byte must undergo 'cpu_to_beXX()' before
> + * serialization. These convertions are done in the *_write_into() functions.
> + *
> + * - All byte sized bitfields must have their ordering reversed if
> + *  __LITTLE_ENDIAN_BITFIELD is defined.
> + *
> + * Written by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/crc32.h>
> +#include <linux/string.h>
> +#include <linux/printk.h>
> +
> +#include "vidtv_psi.h"
> +#include "vidtv_common.h"
> +#include "vidtv_ts.h"
> +
> +#define CRC_SIZE_IN_BYTES 4
> +
> +static u32 vidtv_psi_ts_psi_write_stuffing(void *to,
> +					   u32 len,
> +					   u32 offset,
> +					   u32 buf_sz)
> +{
> +	return vidtv_memset(to, 0xff, len, offset, buf_sz);
> +}

Instead, add thid define:

	#define TS_FILL_BYTE 0xff

And just use vidtv_memset() when needed.



> +
> +static u32
> +vidtv_psi_ts_psi_write_into(struct psi_write_args args)
> +{
> +	/*
> +	 * Packetize PSI sections into TS packets:
> +	 * push a TS header (4bytes) every 184 bytes
> +	 * manage the continuity_counter
> +	 * add stuffing after the CRC
> +	 */
> +
> +	u32  nbytes_past_boundary = (args.dest_offset % TS_PACKET_LEN);
> +	bool aligned              = nbytes_past_boundary == 0;
> +
> +	/*
> +	 * whether we need to fragment the data into multiple ts packets
> +	 * if we are aligned we need to spare one byte for the pointer_field
> +	 */
> +	bool split = (aligned) ?
> +		     args.len > TS_PAYLOAD_LEN - 1 :
> +		     nbytes_past_boundary + args.len > TS_PACKET_LEN;
> +
> +	/* how much we can write in this packet */
> +	u32 payload_write_len = (split) ?
> +				(aligned)     ? TS_PAYLOAD_LEN       :
> +				TS_PACKET_LEN - nbytes_past_boundary :
> +				args.len;
> +
> +	struct psi_write_args new_args = {0};
> +	struct vidtv_mpeg_ts ts_header = {0};
> +
> +	u32 nbytes = 0;  /* number of bytes written by this function */
> +	u32 temp   = 0;
> +
> +	/* Just a sanity check, should not really happen because we stuff
> +	 * the packet when we finish a section, i.e. when we write the crc at
> +	 * the end. But if this happens then we have messed up the logic
> +	 * somewhere.
> +	 */
> +	WARN_ON(args.new_psi_section && !aligned);

Please use a ratelimited printk instead (here and on all similar cases
at the TS generator).

Also, I think that, on such case, the driver should be filling the
remaining frame with pad bytes. E. g.:

	/* 
	 * Assuming that vidtv_memset() args from patch 06/11 were changed 
	 * according with this prototype: 
	 */
	size_t vidtv_memset(void *to, size_t to_offset, size_t to_size,
			    u8 c, size_t len);


	#define TS_FILL_BYTE 0xff

	if (args.new_psi_section && !aligned) {
		pr_warn_ratelimit("Warning: PSI not aligned. Re-aligning it\n");

		vidtv_memset(args.dest_buf,
			     args.dest_offset + nbytes_past_boundary,
			     args.dest_buf_sz,
			     TS_FILL_BYTE,	
			     TS_PACKET_LEN - nbytes_past_boundary);
		args.dest_offset += TS_PACKET_LEN - nbytes_past_boundary;
		aligned = 1;
		nbytes_past_boundary = 0;
	}

> +
> +	if (aligned) {
> +		/* if at a packet boundary, write a new TS header */
> +		ts_header.sync_byte          = TS_SYNC_BYTE;
> +		ts_header.tei                = 0;
> +		ts_header.payload_start      = 1;
> +		ts_header.pid                = args.pid;
> +		ts_header.priority           = 0;
> +		ts_header.scrambling         = 0;
> +		ts_header.continuity_counter = *args.continuity_counter;
> +		ts_header.payload            = 1;
> +		/* no adaptation field */
> +		ts_header.adaptation_field = 0;
> +
> +		cpu_to_be16s(&ts_header.bitfield);
> +
> +		/* copy the header */
> +		nbytes += vidtv_memcpy(args.dest_buf +
> +				       args.dest_offset +
> +				       nbytes,
> +				       &ts_header,
> +				       sizeof(ts_header),
> +				       args.dest_offset + nbytes,
> +				       args.dest_buf_sz);
> +
> +		be16_to_cpus(&ts_header.bitfield);
> +
> +		/*
> +		 * increment the countinuity counter since we have started
> +		 * a new packet
> +		 */
> +		vidtv_ts_inc_cc(args.continuity_counter);
> +	}
> +
> +	if (args.new_psi_section) {
> +		/* write the pointer_field in the first byte of the payload
> */
> +		temp = vidtv_memset(args.dest_buf + args.dest_offset +
> nbytes,
> +				    0x0,
> +				    1,
> +				    args.dest_offset + nbytes,
> +				    args.dest_buf_sz);
> +		/* one byte was used by the pointer field*/
> +		nbytes += temp;
> +		if (payload_write_len == TS_PAYLOAD_LEN)
> +			payload_write_len -= temp;
> +	}
> +
> +	/* write as much of the payload as we possibly can */
> +	nbytes += vidtv_memcpy(args.dest_buf + args.dest_offset + nbytes,
> +			       args.from,
> +			       payload_write_len,
> +			       args.dest_offset + nbytes,
> +			       args.dest_buf_sz);
> +
> +	if (split) {
> +		/* 'payload_write_len' written from a total of 'len' requested*/
> +		args.len -= payload_write_len;
> +		/*
> +		 * recursively write the rest of the data until we do not
> +		 * need to split it anymore
> +		 */
> +		memcpy(&new_args, &args, sizeof(struct psi_write_args));
> +		new_args.from            = args.from + payload_write_len;
> +		new_args.dest_offset     = args.dest_offset + nbytes;
> +		new_args.new_psi_section = false;
> +
> +		nbytes += vidtv_psi_ts_psi_write_into(new_args);
> +	}
> +
> +	/*
> +	 * as the CRC is last in the section, stuff the rest of the
> +	 * packet if there is any remaining space in there
> +	 */
> +	if (args.is_crc)
> +		nbytes += vidtv_psi_ts_psi_write_stuffing(args.dest_buf +
> +							  args.dest_offset +
> +							  nbytes,
> +							  TS_PACKET_LEN -
> +							  payload_write_len,
> +							  args.dest_offset +
> +							  nbytes,
> +							  args.dest_buf_sz);
> +
> +	return nbytes;
> +}
> +
> +static u32 table_section_crc32_write_into(struct crc32_write_args args)
> +{
> +	/* the CRC is the last entry in the section */
> +	u32 nbytes = 0;
> +	u32 crc;
> +	struct psi_write_args psi_args = {0};
> +
> +	crc = crc32_be(0, args.dest_buf, args.dest_offset);
> +
> +	psi_args.dest_buf           = args.dest_buf;
> +	psi_args.from               = &crc;
> +	psi_args.len                = CRC_SIZE_IN_BYTES;
> +	psi_args.dest_offset        = args.dest_offset;
> +	psi_args.pid                = args.pid;
> +	psi_args.new_psi_section    = false;
> +	psi_args.continuity_counter = args.continuity_counter;
> +	psi_args.is_crc             = true;
> +	psi_args.dest_buf_sz        = args.dest_buf_sz;
> +
> +	cpu_to_be32s(&crc);
> +	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
> +	be32_to_cpus(&crc);
> +
> +	return nbytes;
> +}
> +
> +struct vidtv_psi_desc *vidtv_psi_desc_init(struct vidtv_psi_desc *head,
> +					   u8 type,
> +					   u8 length)
> +{
> +	struct vidtv_psi_desc *desc;
> +
> +	/* alloc enough memory for the flexible array too */
> +	desc = kzalloc(sizeof(*desc) + length, GFP_KERNEL);
> +
> +	desc->type   = type;
> +	desc->length = length;
> +
> +	if (head) {
> +		while (head->next)
> +			head = head->next;
> +
> +		head->next = desc;
> +	}
> +
> +	return desc;
> +}
> +
> +void vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc)
> +{
> +	struct vidtv_psi_desc *curr = desc;
> +	struct vidtv_psi_desc *tmp  = NULL;
> +
> +	while (curr) {
> +		tmp  = curr;
> +		curr = curr->next;
> +		kfree(tmp);
> +	}
> +}
> +
> +static u32
> +vidtv_psi_desc_comp_len(struct vidtv_psi_desc *desc)
> +{
> +	u32 length = 0;
> +
> +	if (!desc)
> +		return 0;
> +
> +	while (desc) {
> +		length += desc->length;
> +		desc    = desc->next;
> +	}
> +
> +	return length;
> +}
> +
> +void vidtv_psi_desc_assign(struct vidtv_psi_desc **to,
> +			   struct vidtv_psi_desc *desc)
> +{
> +	/*
> +	 * Caller must recompute the section length afterwards at some point
> +	 * This function transfers ownedship of desc.
> +	 * Start by cleaning the old data
> +	 */
> +	if (*to)
> +		vidtv_psi_desc_destroy(*to);
> +
> +	*to = desc;  /* reassign pointer */
> +}
> +
> +static void vidtv_psi_desc_to_be(struct vidtv_psi_desc *desc)
> +{
> +	/*
> +	 * Convert descriptor endianness to big-endian on a field-by-field
> basis
> +	 * where applicable
> +	 */
> +
> +	switch (desc->type) {
> +	/* nothing do do */
> +	case SERVICE_DESCRIPTOR:
> +		break;
> +	case REGISTRATION_DESCRIPTOR:
> +		cpu_to_be32s(&((struct vidtv_psi_desc_registration *)
> +			     desc)->format_identifier);
> +		pr_alert("%s: descriptor type %d found\n",
> +			 __func__,
> +			 desc->type);
> +		pr_alert("%s: change 'additional_info' endianness before
> calling\n",
> +			 __func__);

The above pr_alert() calls sound weird. Why are you unconditionally
calling it (and still doing the BE conversion) for all
REGISTRATION_DESCRIPTOR types?

> +		break;
> +	default:
> +		pr_err("%s: descriptor type %d not implemented, skipping\n",
> +		       __func__,
> +		       desc->type);

please use pr_*_ratelimited() everywhere, as otherwise the driver
could cause Kernel to be too slow if something bad happens.

> +		break;
> +	}
> +}
> +
> +static void vidtv_psi_desc_to_cpu(struct vidtv_psi_desc *desc)
> +{
> +	/*
> +	 * Convert descriptor endianness to native on a field-by-field basis
> +	 * where applicable
> +	 */
> +
> +	switch (desc->type) {
> +	/* nothing do do */
> +	case SERVICE_DESCRIPTOR:
> +		break;
> +	case REGISTRATION_DESCRIPTOR:
> +		be32_to_cpus(&((struct vidtv_psi_desc_registration *)
> +			     desc)->format_identifier);
> +		pr_alert("%s: descriptor type %d found\n",
> +			 __func__,
> +			 desc->type);
> +		pr_alert("%s: change 'additional_info' endianness before
> calling\n",
> +			 __func__);

The above pr_alert() calls sound weird.

> +		break;
> +	default:
> +		pr_err("%s: descriptor type %d not implemented, skipping\n",
> +		       __func__,
> +		       desc->type);
> +		break;
> +	}
> +}
> +
> +static u32 vidtv_psi_desc_write_into(struct desc_write_args args)
> +{
> +	/* the number of bytes written by this function */
> +	u32    nbytes                  = 0;
> +	struct psi_write_args psi_args = {0};
> +
> +	psi_args.dest_buf = args.dest_buf;
> +	psi_args.from     = args.desc;
> +
> +	psi_args.len      = sizeof_field(struct vidtv_psi_desc, type) +
> +			    sizeof_field(struct vidtv_psi_desc, length);
> +
> +	psi_args.dest_offset        = args.dest_offset;
> +	psi_args.pid                = args.pid;
> +	psi_args.new_psi_section    = false;
> +	psi_args.continuity_counter = args.continuity_counter;
> +	psi_args.is_crc             = false;
> +	psi_args.dest_buf_sz        = args.dest_buf_sz;
> +
> +	vidtv_psi_desc_to_be(args.desc);
> +
> +	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
> +
> +	/* move 'from' pointer to point to u8 data[] */
> +	psi_args.from = args.desc +
> +			sizeof_field(struct vidtv_psi_desc, type) +
> +			sizeof_field(struct vidtv_psi_desc, length) +
> +			sizeof(struct vidtv_psi_desc *);
> +
> +	psi_args.len         = args.desc->length;
> +	psi_args.dest_offset = args.dest_offset + nbytes;
> +
> +	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
> +
> +	vidtv_psi_desc_to_cpu(args.desc);
> +
> +	return nbytes;
> +}
> +
> +static u32
> +vidtv_psi_table_header_write_into(struct header_write_args args)
> +{
> +	/* the number of bytes written by this function */
> +	u32    nbytes                  = 0;
> +	struct psi_write_args psi_args = {0};
> +
> +	psi_args.dest_buf           = args.dest_buf;
> +	psi_args.from               = args.h;
> +	psi_args.len                = sizeof(struct vidtv_psi_table_header);
> +	psi_args.dest_offset        = args.dest_offset;
> +	psi_args.pid                = args.pid;
> +	psi_args.new_psi_section    = true;
> +	psi_args.continuity_counter = args.continuity_counter;
> +	psi_args.is_crc             = false;
> +	psi_args.dest_buf_sz        = args.dest_buf_sz;
> +
> +	cpu_to_be16s(&args.h->bitfield);
> +	cpu_to_be16s(&args.h->id);
> +
> +	nbytes += vidtv_psi_ts_psi_write_into(psi_args);
> +
> +	be16_to_cpus(&args.h->bitfield);
> +	be16_to_cpus(&args.h->id);
> +
> +	return nbytes;
> +}
> +
> +void
> +vidtv_psi_pat_table_comp_sec_len(struct vidtv_psi_table_pat *pat)
> +{
> +	/* see ISO/IEC 13818-1 : 2000 p.43 */
> +	u16 length = 0;
> +	u32 i;
> +
> +	/* from immediately after 'section_length' until
> 'last_section_number'*/
> +	length += PAT_LEN_UNTIL_LAST_SECTION_NUMBER;
> +
> +	/* do not count the pointer */
> +	for (i = 0; i < pat->programs; ++i)
> +		length += sizeof(struct vidtv_psi_table_pat_program) -
> +			  sizeof(struct vidtv_psi_table_pat_program *);
> +
> +	length += CRC_SIZE_IN_BYTES;
> +
> +	WARN_ON(length > MAX_SECTION_LEN);

Please get rid of all WARN_ON, in favor of pr_*_ratelimited() calls.

> +	pat->header.section_length = length;
> +}
> +
> +void vidtv_psi_pmt_table_comp_sec_len(struct vidtv_psi_table_pmt *pmt)
> +{
> +	/* see ISO/IEC 13818-1 : 2000 p.46 */
> +	u16    length                        = 0;
> +	struct vidtv_psi_table_pmt_stream *s = pmt->stream;
> +
> +	/* from immediately after 'section_length' until
> 'program_info_length'*/
> +	length += PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH;
> +
> +	pmt->desc_length  = vidtv_psi_desc_comp_len(pmt->descriptor);
> +	length           += pmt->desc_length;
> +
> +	while (s) {
> +		/* skip both pointers at the end */
> +		length += sizeof(struct vidtv_psi_table_pmt_stream) -
> +			  sizeof(struct vidtv_psi_desc *) -
> +			  sizeof(struct vidtv_psi_table_pmt_stream *);
> +
> +		s->desc_length  = vidtv_psi_desc_comp_len(s->descriptor);
> +		length         += s->desc_length;
> +
> +		s = s->next;
> +	}
> +
> +	length += CRC_SIZE_IN_BYTES;
> +
> +	WARN_ON(length > MAX_SECTION_LEN);
> +	pmt->header.section_length = length;
> +}
> +
> +void vidtv_psi_sdt_table_comp_sec_len(struct vidtv_psi_table_sdt *sdt)
> +{
> +	/* see ETSI EN 300 468 V 1.10.1 p.24 */
> +	u16    length                         = 0;
> +	struct vidtv_psi_table_sdt_service *s = sdt->service;
> +
> +	/*
> +	 * from immediately after 'section_length' until
> +	 * 'reserved_for_future_use'
> +	 */
> +	length += SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE;
> +
> +	while (s) {
> +		/* skip both pointers at the end */
> +		length += sizeof(struct vidtv_psi_table_sdt_service) -
> +			  sizeof(struct vidtv_psi_desc *) -
> +			  sizeof(struct vidtv_psi_table_sdt_service *);
> +
> +		s->desc_length  = vidtv_psi_desc_comp_len(s->descriptor);
> +		length         += s->desc_length;
> +
> +		s = s->next;
> +	}
> +
> +	length += CRC_SIZE_IN_BYTES;
> +
> +	WARN_ON(length > MAX_SECTION_LEN);
> +	sdt->header.section_length = length;
> +}
> +
> +struct vidtv_psi_table_pat_program*
> +vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
> +			   u16 service_id,
> +			   u16 pid)
> +{
> +	/*
> +	 * if 'head' is attached to a table, caller should recompute
> +	 * the section length afterwards at some point
> +	 */
> +	struct vidtv_psi_table_pat_program *program;
> +
> +	program = kzalloc(sizeof(*program), GFP_KERNEL);
> +
> +	program->service_id = service_id;
> +	/* pid for the PMT section in the TS */
> +	program->pid        = pid;
> +	program->next       = NULL;
> +	program->reserved   = 0x7;
> +
> +	if (head) {
> +		while (head->next)
> +			head = head->next;
> +
> +		head->next = program;
> +	}
> +
> +	return program;
> +}
> +
> +void
> +vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p)
> +{
> +	struct vidtv_psi_table_pat_program *curr = p;
> +	struct vidtv_psi_table_pat_program *tmp  = NULL;
> +
> +	while (curr) {
> +		tmp  = curr;
> +		curr = curr->next;
> +		kfree(tmp);
> +	}
> +}
> +
> +void
> +vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
> +			     struct vidtv_psi_table_pat_program *p)
> +{
> +	/* This function transfers ownership of p to the table */
> +
> +	u16    program_count                        = 0;
> +	struct vidtv_psi_table_pat_program *program = p;
> +	struct vidtv_psi_table_pat_program *temp    = pat->program;
> +
> +	while (program) {
> +		++program_count;
> +		program = program->next;
> +	}
> +
> +	pat->programs = program_count;
> +	pat->program  = p;
> +
> +	/* Recompute section length */
> +	vidtv_psi_pat_table_comp_sec_len(pat);
> +
> +	/* reassign if the new size is too big */
> +	if (pat->header.section_length > MAX_SECTION_LEN)
> +		vidtv_psi_pat_program_assign(pat, temp);
> +	else
> +		vidtv_psi_pat_program_destroy(temp);
> +}
> +
> +void vidtv_psi_pat_table_init(struct vidtv_psi_table_pat *pat,
> +			      bool update_version_num,
> +			      u16 transport_stream_id)
> +{
> +	static u8 pat_version;
> +
> +	pat->header.table_id = 0x0;
> +	pat->header.syntax   = 0x1;
> +	pat->header.zero     = 0x0;
> +	pat->header.one      = 0x03;
> +
> +	/* transport stream ID, at will */
> +	pat->header.id           = transport_stream_id;
> +	pat->header.current_next = 0x1;
> +
> +	/* ETSI 300 468: indicates changes in the TS described by this
> table*/
> +	if (update_version_num)
> +		++pat_version;
> +
> +	pat->header.version = pat_version;
> +
> +	pat->header.one2         = 0x03;
> +	pat->header.section_id   = 0x0;
> +	pat->header.last_section = 0x0;
> +
> +	pat->programs = 0;
> +
> +	vidtv_psi_pat_table_comp_sec_len(pat);
> +}
> +
> +u32 vidtv_psi_pat_write_into(char *buf,
> +			     u32 offset,
> +			     struct vidtv_psi_table_pat *pat,
> +			     u32 buf_sz,
> +			     u8 *continuity_counter)
> +{
> +	/* the number of bytes written by this function */
> +	u32   nbytes      = 0;
> +	const u16 pat_pid = VIDTV_PAT_PID;
> +
> +	struct vidtv_psi_table_pat_program *p = pat->program;
> +	struct header_write_args h_args       = {0};
> +	struct psi_write_args args            = {0};
> +	struct crc32_write_args c_args        = {0};
> +
> +	vidtv_psi_pat_table_comp_sec_len(pat);
> +
> +	h_args.dest_buf           = buf;
> +	h_args.dest_offset        = offset;
> +	h_args.h                  = &pat->header;
> +	h_args.pid                = pat_pid;
> +	h_args.continuity_counter = continuity_counter;
> +	h_args.dest_buf_sz        = buf_sz;
> +
> +	nbytes += vidtv_psi_table_header_write_into(h_args);
> +
> +	/* note that the field 'u16 programs' is not really part of the PAT
> */ +
> +	args.dest_buf           = buf;
> +	args.pid                = pat_pid;
> +	args.new_psi_section    = false;
> +	args.continuity_counter = continuity_counter;
> +	args.is_crc             = false;
> +	args.dest_buf_sz        = buf_sz;
> +
> +	while (p) {
> +		/* copy the PAT programs */
> +		cpu_to_be16s(&p->service_id);
> +		cpu_to_be16s(&p->bitfield);
> +
> +		args.from = p;
> +		/* skip the pointer */
> +		args.len = sizeof(*p) -
> +			   sizeof(struct vidtv_psi_table_pat_program *);
> +		args.dest_offset = offset + nbytes;
> +
> +		nbytes += vidtv_psi_ts_psi_write_into(args);
> +
> +		be16_to_cpus(&p->service_id);
> +		be16_to_cpus(&p->bitfield);
> +
> +		p = p->next;
> +	}
> +
> +	c_args.dest_buf           = buf;
> +	c_args.dest_offset        = offset + nbytes;
> +	c_args.pid                = pat_pid;
> +	c_args.continuity_counter = continuity_counter;
> +	c_args.dest_buf_sz        = buf_sz;
> +
> +	nbytes += table_section_crc32_write_into(c_args);
> +
> +	return nbytes;
> +}
> +
> +void
> +vidtv_psi_pat_table_destroy(struct vidtv_psi_table_pat *p)
> +{
> +	vidtv_psi_pat_program_destroy(p->program);
> +}
> +
> +struct vidtv_psi_table_pmt_stream*
> +vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
> +			  enum vidtv_psi_stream_types stream_type,
> +			  u16 es_pid)
> +{
> +	struct vidtv_psi_table_pmt_stream *stream;
> +
> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +
> +	stream->type           = stream_type;
> +	stream->elementary_pid = es_pid;
> +	stream->reserved       = 0x07;
> +
> +	stream->desc_length = vidtv_psi_desc_comp_len(stream->descriptor);
> +
> +	stream->zero      = 0x0;
> +	stream->reserved2 = 0x0f;
> +
> +	if (head) {
> +		while (head->next)
> +			head = head->next;
> +
> +		head->next = stream;
> +	}
> +
> +	return stream;
> +}
> +
> +void vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s)
> +{
> +	struct vidtv_psi_table_pmt_stream *curr_stream = s;
> +	struct vidtv_psi_table_pmt_stream *tmp_stream  = NULL;
> +
> +	while (curr_stream) {
> +		tmp_stream  = curr_stream;
> +		curr_stream = curr_stream->next;
> +		kfree(tmp_stream);
> +	}
> +}
> +
> +void vidtv_psi_pmt_stream_assign(struct vidtv_psi_table_pmt *pmt,
> +				 struct vidtv_psi_table_pmt_stream *s)
> +{
> +	/* This function transfers ownership of s to the table */
> +	struct vidtv_psi_table_pmt_stream *stream = s;
> +	struct vidtv_psi_desc *desc               = s->descriptor;
> +	struct vidtv_psi_table_pmt_stream *temp   = pmt->stream;
> +
> +	while (stream)
> +		stream = stream->next;
> +
> +	while (desc)
> +		desc = desc->next;
> +
> +	pmt->stream = s;
> +	/* Recompute section length */
> +	vidtv_psi_pmt_table_comp_sec_len(pmt);
> +
> +	/* reassign if the new size is too big */
> +	if (pmt->header.section_length > MAX_SECTION_LEN)
> +		vidtv_psi_pmt_stream_assign(pmt, temp);
> +	else
> +		vidtv_psi_pmt_stream_destroy(temp);
> +}
> +
> +u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
> +			  struct vidtv_psi_table_pat *pat)
> +{
> +	struct vidtv_psi_table_pat_program *program = pat->program;
> +
> +	/*
> +	 * service_id is the same as program_number in the
> +	 * corresponding program_map_section
> +	 * see ETSI EN 300 468 v1.15.1 p. 24
> +	 */
> +	while (program) {
> +		if (program->service_id == section->header.id)
> +			return pat->program->pid;
> +
> +		program = program->next;
> +	}
> +
> +	return TS_LAST_VALID_PID + 1; /* not found */
> +}
> +
> +void vidtv_psi_pmt_table_init(struct vidtv_psi_table_pmt *pmt,
> +			      bool update_version_num,
> +			      u16 program_number,
> +			      u16 pcr_pid)
> +{
> +	static u8 pmt_version;
> +
> +	pmt->header.table_id = 0x2;
> +	pmt->header.syntax   = 0x1;
> +	pmt->header.zero     = 0x0;
> +	pmt->header.one      = 0x3;
> +
> +	pmt->header.id           = program_number;
> +	pmt->header.current_next = 0x1;
> +
> +	/* ETSI 300 468: indicates changes in the TS described by this
> table*/
> +	if (update_version_num)
> +		++pmt_version;
> +
> +	pmt->header.version = pmt_version;
> +
> +	pmt->header.one2         = 0x3;
> +	pmt->header.section_id   = 0;
> +	pmt->header.last_section = 0;
> +
> +	pmt->pcr_pid   = (pcr_pid) ? pcr_pid : 0x1fff;
> +	pmt->reserved2 = 0x03;
> +
> +	pmt->reserved3 = 0x0f;
> +	pmt->zero3     = 0x0;
> +
> +	pmt->desc_length = vidtv_psi_desc_comp_len(pmt->descriptor);
> +
> +	vidtv_psi_pmt_table_comp_sec_len(pmt);
> +}
> +
> +u32 vidtv_psi_pmt_write_into(char *buf,
> +			     u32 offset,
> +			     struct vidtv_psi_table_pmt *pmt,
> +			     u16 pid,
> +			     u32 buf_sz,
> +			     u8 *continuity_counter)
> +{
> +	/* the number of bytes written by this function */
> +	u32    nbytes                             = 0;
> +	struct vidtv_psi_desc *table_descriptor   = pmt->descriptor;
> +	struct vidtv_psi_table_pmt_stream *stream = pmt->stream;
> +	struct vidtv_psi_desc *stream_descriptor  = (stream) ?
> +						    pmt->stream->descriptor :
> +						    NULL;
> +
> +	struct header_write_args h_args = {0};
> +	struct psi_write_args args      = {0};
> +	struct desc_write_args d_args   = {0};
> +	struct crc32_write_args c_args  = {0};
> +
> +	vidtv_psi_pmt_table_comp_sec_len(pmt);
> +
> +	h_args.dest_buf           = buf;
> +	h_args.dest_offset        = offset;
> +	h_args.h                  = &pmt->header;
> +	h_args.pid                = pid;
> +	h_args.continuity_counter = continuity_counter;
> +	h_args.dest_buf_sz        = buf_sz;
> +
> +	nbytes += vidtv_psi_table_header_write_into(h_args);
> +
> +	/* write the two bitfields */
> +	cpu_to_be16s(&pmt->bitfield);
> +	cpu_to_be16s(&pmt->bitfield2);
> +
> +	args.dest_buf = buf;
> +	args.from     = pmt + sizeof(struct vidtv_psi_table_header);
> +	args.len      = sizeof_field(struct vidtv_psi_table_pmt, bitfield) +
> +			sizeof_field(struct vidtv_psi_table_pmt, bitfield2);
> +	args.dest_offset        = offset + nbytes;
> +	args.pid                = pid;
> +	args.new_psi_section    = false;
> +	args.continuity_counter = continuity_counter;
> +	args.is_crc             = false;
> +	args.dest_buf_sz        = buf_sz;
> +
> +	nbytes += vidtv_psi_ts_psi_write_into(args);
> +
> +	be16_to_cpus(&pmt->bitfield);
> +	be16_to_cpus(&pmt->bitfield2);
> +
> +	while (table_descriptor) {
> +		/* write the descriptors, if any */
> +		d_args.dest_buf           = buf;
> +		d_args.dest_offset        = offset + nbytes;
> +		d_args.desc               = table_descriptor;
> +		d_args.pid                = pid;
> +		d_args.continuity_counter = continuity_counter;
> +		d_args.dest_buf_sz        = buf_sz;
> +
> +		vidtv_psi_desc_to_be(d_args.desc);
> +		nbytes += vidtv_psi_desc_write_into(d_args);
> +		vidtv_psi_desc_to_cpu(d_args.desc);
> +
> +		table_descriptor = table_descriptor->next;
> +	}
> +
> +	while (stream) {
> +		/* write the streams, if any */
> +		args.from = stream;
> +		args.len  = sizeof_field(struct vidtv_psi_table_pmt_stream,
> +					 type) +
> +			    sizeof_field(struct vidtv_psi_table_pmt_stream,
> +					 bitfield) +
> +			    sizeof_field(struct vidtv_psi_table_pmt_stream,
> +					 bitfield2);
> +		args.dest_offset = offset + nbytes;
> +
> +		cpu_to_be16s(&stream->bitfield);
> +		cpu_to_be16s(&stream->bitfield2);
> +
> +		nbytes += vidtv_psi_ts_psi_write_into(args);
> +
> +		be16_to_cpus(&stream->bitfield);
> +		be16_to_cpus(&stream->bitfield2);
> +
> +		while (stream_descriptor) {
> +			/* write the stream descriptors, if any */
> +			d_args.desc        = stream_descriptor;
> +			d_args.dest_offset = offset + nbytes;
> +
> +			vidtv_psi_desc_to_be(d_args.desc);
> +
> +			nbytes += vidtv_psi_desc_write_into(d_args);
> +
> +			vidtv_psi_desc_to_cpu(d_args.desc);
> +
> +			stream_descriptor = stream_descriptor->next;
> +		}
> +
> +		stream = stream->next;
> +	}
> +
> +	c_args.dest_buf           = buf;
> +	c_args.dest_offset        = offset + nbytes;
> +	c_args.pid                = pid;
> +	c_args.continuity_counter = continuity_counter;
> +	c_args.dest_buf_sz        = buf_sz;
> +
> +	nbytes += table_section_crc32_write_into(c_args);
> +
> +	return nbytes;
> +}
> +
> +void vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt)
> +{
> +	struct vidtv_psi_desc *curr_desc = pmt->descriptor;
> +	struct vidtv_psi_desc *tmp_desc  = NULL;
> +
> +	while (curr_desc) {
> +		tmp_desc  = curr_desc;
> +		curr_desc = curr_desc->next;
> +		vidtv_psi_desc_destroy(tmp_desc);
> +		kfree(tmp_desc);
> +	}
> +
> +	vidtv_psi_pmt_stream_destroy(pmt->stream);
> +}
> +
> +void vidtv_psi_sdt_table_init(struct vidtv_psi_table_sdt *sdt,
> +			      bool update_version_num,
> +			      u16 transport_stream_id)
> +{
> +	static u8 sdt_version;
> +
> +	sdt->header.table_id = 0x42;
> +
> +	sdt->header.one  = 0x3;
> +	sdt->header.zero = 0x1;
> +	/*
> +	 * The PAT, PMT, and CAT all set this to 0.
> +	 * Other tables set this to 1.
> +	 */
> +	sdt->header.syntax = 0x1;
> +
> +	/*
> +	 * This is a 16-bit field which serves as a label for identification
> +	 * of the TS, about which the SDT informs, from any other multiplex
> +	 * within the delivery system.
> +	 */
> +	sdt->header.id           = transport_stream_id;
> +	sdt->header.current_next = 0x1;
> +
> +	/* ETSI 300 468: indicates changes in the TS described by this
> table*/
> +	if (update_version_num)
> +		++sdt_version;
> +
> +	sdt->header.version = sdt_version;
> +
> +	sdt->header.one2         = 0x3;
> +	sdt->header.section_id   = 0;
> +	sdt->header.last_section = 0;
> +
> +	sdt->network_id = transport_stream_id;
> +	sdt->reserved   = 0xff;
> +
> +	vidtv_psi_sdt_table_comp_sec_len(sdt);
> +}
> +
> +u32 vidtv_psi_sdt_write_into(char *buf,
> +			     u32 offset,
> +			     struct vidtv_psi_table_sdt *sdt,
> +			     u32 buf_sz,
> +			     u8 *continuity_counter)
> +{
> +	u32 nbytes  = 0;              /* the number of bytes written */
> +	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
> +
> +	struct vidtv_psi_table_sdt_service *service = sdt->service;
> +	struct vidtv_psi_desc *service_desc = (sdt->service) ?
> +					      sdt->service->descriptor :
> +					      NULL;
> +
> +	struct header_write_args h_args = {0};
> +	struct psi_write_args args      = {0};
> +	struct desc_write_args d_args   = {0};
> +	struct crc32_write_args c_args  = {0};
> +
> +	vidtv_psi_sdt_table_comp_sec_len(sdt);
> +
> +	h_args.dest_buf           = buf;
> +	h_args.dest_offset        = offset;
> +	h_args.h                  = &sdt->header;
> +	h_args.pid                = sdt_pid;
> +	h_args.continuity_counter = continuity_counter;
> +	h_args.dest_buf_sz        = buf_sz;
> +
> +	nbytes += vidtv_psi_table_header_write_into(h_args);
> +
> +	args.dest_buf = buf;
> +	args.from     = sdt + sizeof(struct vidtv_psi_table_header);
> +
> +	args.len      = sizeof_field(struct vidtv_psi_table_sdt, network_id)
> +
> +			sizeof_field(struct vidtv_psi_table_sdt, reserved);
> +
> +	args.dest_offset        = offset + nbytes;
> +	args.pid                = sdt_pid;
> +	args.new_psi_section    = false;
> +	args.continuity_counter = continuity_counter;
> +	args.is_crc             = false;
> +	args.dest_buf_sz        = buf_sz;
> +
> +	/* copy u16 network_id + u8 reserved)*/
> +	cpu_to_be16s(&sdt->network_id);
> +
> +	nbytes += vidtv_psi_ts_psi_write_into(args);
> +
> +	be16_to_cpus(&sdt->network_id);
> +
> +	while (service) {
> +		/* copy the services, if any */
> +		args.from = service;
> +		/* skip both pointers at the end */
> +		args.len = sizeof(struct vidtv_psi_table_sdt_service) -
> +			   sizeof(struct vidtv_psi_desc *) -
> +			   sizeof(struct vidtv_psi_table_sdt_service *);
> +		args.dest_offset = offset + nbytes;
> +
> +		cpu_to_be16s(&service->service_id);
> +		cpu_to_be16s(&service->bitfield);
> +
> +		nbytes += vidtv_psi_ts_psi_write_into(args);
> +
> +		be16_to_cpus(&service->service_id);
> +		be16_to_cpus(&service->bitfield);
> +
> +		while (service_desc) {
> +			/* copy the service descriptors, if any */
> +			d_args.dest_buf           = buf;
> +			d_args.dest_offset        = offset + nbytes;
> +			d_args.desc               = service_desc;
> +			d_args.pid                = sdt_pid;
> +			d_args.continuity_counter = continuity_counter;
> +			d_args.dest_buf_sz        = buf_sz;
> +
> +			vidtv_psi_desc_to_be(d_args.desc);
> +
> +			nbytes += vidtv_psi_desc_write_into(d_args);
> +
> +			vidtv_psi_desc_to_cpu(d_args.desc);
> +
> +			service_desc = service_desc->next;
> +		}
> +
> +		service = service->next;
> +	}
> +
> +	c_args.dest_buf           = buf;
> +	c_args.dest_offset        = offset + nbytes;
> +	c_args.pid                = sdt_pid;
> +	c_args.continuity_counter = continuity_counter;
> +	c_args.dest_buf_sz        = buf_sz;
> +
> +	nbytes += table_section_crc32_write_into(c_args);
> +
> +	return nbytes;
> +}
> +
> +void vidtv_psi_sdt_table_destroy(struct vidtv_psi_table_sdt *sdt)
> +{
> +	struct vidtv_psi_table_sdt_service *curr_service = sdt->service;
> +	struct vidtv_psi_table_sdt_service *tmp_service  = NULL;
> +	struct vidtv_psi_desc *curr_desc = (sdt->service) ?
> +					   sdt->service->descriptor : NULL;
> +	struct vidtv_psi_desc *tmp_desc = NULL;
> +
> +	while (curr_service) {
> +		curr_desc = curr_service->descriptor;
> +
> +		while (curr_desc) {
> +			/* clear all descriptors for the service */
> +			tmp_desc  = curr_desc;
> +			curr_desc = curr_desc->next;
> +			vidtv_psi_desc_destroy(tmp_desc);
> +			kfree(tmp_desc);
> +		}
> +
> +		/* then clear the current service */
> +		tmp_service  = curr_service;
> +		curr_service = curr_service->next;
> +		kfree(tmp_service);
> +	}
> +}
> +
> +struct vidtv_psi_table_sdt_service
> +*vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
> +			    u16 service_id)
> +{
> +	/*
> +	 * if 'head' is attached to a table, caller should recompute
> +	 * the section length afterwards at some point
> +	 */
> +	struct vidtv_psi_table_sdt_service *service;
> +
> +	service = kzalloc(sizeof(*service), GFP_KERNEL);
> +
> +	/*
> +	 * ETSI 300 468: this is a 16bit field which serves as a label to
> +	 * identify this service from any other service within the TS.
> +	 * The service id is the same as the program number in the
> +	 * corresponding program_map_section
> +	 */
> +	service->service_id            = service_id;
> +	service->EIT_schedule          = 0x0;         /* TODO */
> +	service->EIT_present_following = 0x0;         /* TODO */
> +	service->reserved              = 0x3f;        /* all bits on */
> +	service->free_CA_mode          = 0x0;         /* not scrambled */
> +	service->running_status        = RUNNING;
> +
> +	if (head) {
> +		while (head->next)
> +			head = head->next;
> +
> +		head->next = service;
> +	}
> +
> +	return service;
> +}
> +
> +void
> +vidtv_psi_sdt_service_destroy(struct vidtv_psi_table_sdt_service *service)
> +{
> +	struct vidtv_psi_table_sdt_service *curr = service;
> +	struct vidtv_psi_table_sdt_service *tmp  = NULL;
> +
> +	while (curr) {
> +		tmp  = curr;
> +		curr = curr->next;
> +		kfree(tmp);
> +	}
> +}
> +
> +void
> +vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
> +			     struct vidtv_psi_table_sdt_service *service)
> +{
> +	struct vidtv_psi_table_sdt_service *temp = sdt->service;
> +
> +	sdt->service = service;
> +
> +	/* recompute section length */
> +	vidtv_psi_sdt_table_comp_sec_len(sdt);
> +
> +	/* reassign if the new size is too big */
> +	if (sdt->header.section_length > MAX_SECTION_LEN)
> +		vidtv_psi_sdt_service_assign(sdt, temp);
> +	else
> +		vidtv_psi_sdt_service_destroy(temp);
> +}
> +
> +void
> +vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
> +					    struct vidtv_psi_table_pmt sec[])
> +
> +{
> +	/*
> +	 * PMTs contain information about programs. For each program,
> +	 * there is one PMT section. This function will create a section
> +	 * for each program found in the PAT
> +	 */
> +	struct vidtv_psi_table_pat_program *program = pat->program;
> +	u32    i                                    = 0;
> +
> +	while (program) {
> +		vidtv_psi_pmt_table_init(&sec[i],
> +					 false,
> +					 sec[i].header.id,
> +					 0);
> +
> +		++i;
> +		program = program->next;
> +	}
> +}
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h
> b/drivers/media/test-drivers/vidtv/vidtv_psi.h new file mode 100644
> index 0000000000000..c5c8c143f0e4a
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
> @@ -0,0 +1,357 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file contains the logic to work with MPEG Program-Specific
> Information.
> + * These are defined both in ISO/IEC 13818-1 (systems) and ETSI EN 300 468.
> + * PSI is carried in the form of table structures, and although each table
> might
> + * technically be broken into one or more sections, we do not do this here,
> + * hence 'table' and 'section' are interchangeable for us.
> + *
> + * This code currently supports three tables: PAT, PMT and SDT. These are the
> + * bare minimum to get userspace to recognize our MPEG transport stream. It
> can
> + * be extended to support more PSI tables in the future.
> + *
> + * A note on endianness: MPEG layout is big-endian, therefore:
> + * - All fields spanning more than a byte must undergo 'cpu_to_beXX()' before
> + * serialization. These convertions are done in the *_write_into() functions.
> + *
> + * - All byte sized bitfields must have their ordering reversed if
> + *  __LITTLE_ENDIAN_BITFIELD is defined.
> + *
> + * Written by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_PSI_H
> +#define VIDTV_PSI_H
> +
> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +
> +/*
> + * all section lengths start immediately after the 'section_length' field
> + * see ISO/IEC 13818-1 : 2000 and ETSI EN 300 468 V 1.10.1 for
> + * reference
> + */
> +#define PAT_LEN_UNTIL_LAST_SECTION_NUMBER 5
> +#define PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH 9
> +#define SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE 8
> +#define MAX_SECTION_LEN 1021
> +#define VIDTV_PAT_PID 0
> +#define VIDTV_SDT_PID 0x0011
> +
> +enum vidtv_psi_descriptors {
> +	REGISTRATION_DESCRIPTOR	= 0x05,
> +	SERVICE_DESCRIPTOR = 0x48,
> +};
> +
> +enum vidtv_psi_stream_types {
> +	/* see ISO/IEC 13818-1 2000 p. 48 */
> +	STREAM_PRIVATE_DATA = 0x06,
> +};
> +
> +struct vidtv_psi_desc {
> +	u8 type;
> +	u8 length;
> +	struct vidtv_psi_desc *next;
> +	u8 data[];
> +} __packed;
> +
> +struct vidtv_psi_desc_service {
> +	u8 type;
> +	u8 length;
> +	struct vidtv_psi_desc *next;
> +
> +	u8 service_type;
> +	char *name;
> +	char *name_emph;
> +	char *provider;
> +	char *provider_emph;
> +} __packed;
> +
> +struct vidtv_psi_desc_registration {
> +	u8 type;
> +	u8 length;
> +	struct vidtv_psi_desc *next;
> +
> +	/*
> +	 * The format_identifier is a 32-bit value obtained from a
> Registration
> +	 * Authority as designated by ISO/IEC JTC 1/SC 29.
> +	 */
> +	u32 format_identifier;
> +	/*
> +	 * The meaning of additional_identification_info bytes, if any, are
> +	 * defined by the assignee of that format_identifier, and once
> defined
> +	 * they shall not change.
> +	 */
> +	u8 additional_identification_info[];
> +} __packed;
> +
> +struct vidtv_psi_table_header {
> +	u8  table_id;
> +	union {
> +		u16 bitfield;
> +		struct {
> +			u8  syntax:1;
> +			u8  zero:1;
> +			u8  one:2;
> +			u16 section_length:12;
> +		} __packed;
> +	} __packed;
> +
> +	u16 id;			/* TS ID */
> +#if defined(__LITTLE_ENDIAN_BITFIELD)
> +	u8  current_next:1;
> +	u8  version:5;
> +	u8  one2:2;
> +#elif defined(__BIG_ENDIAN_BITFIELD)
> +	u8  one2:2;
> +	u8  version:5;
> +	u8  current_next:1;
> +#else
> +#error  "Please fix <asm/byteorder.h>"

I would change the message. I mean, if something has changed there,
and, for example, one of the defines was renamed, then the vidtv code
is the one that would require changes, not asm/byteorder.

> +#endif
> +	u8  section_id;		/* section_number */
> +	u8  last_section;		/* last_section_number */
> +} __packed;
> +
> +struct vidtv_psi_table_pat_program {
> +	u16 service_id;
> +	union {
> +		u16 bitfield;
> +		struct {
> +			u8  reserved:3;
> +			u16 pid:13;
> +		} __packed;
> +	} __packed;
> +	struct vidtv_psi_table_pat_program *next;
> +} __packed;
> +
> +struct vidtv_psi_table_pat {
> +	struct vidtv_psi_table_header header;
> +	u16 programs;
> +	struct vidtv_psi_table_pat_program *program;
> +} __packed;
> +
> +struct vidtv_psi_table_sdt_service {
> +	u16 service_id;
> +#if defined(__LITTLE_ENDIAN_BITFIELD)
> +	u8 EIT_present_following:1;
> +	u8 EIT_schedule:1;
> +	u8 reserved:6;
> +#elif defined(__BIG_ENDIAN_BITFIELD)
> +	u8 reserved:6;
> +	u8 EIT_schedule:1;
> +	u8 EIT_present_following:1;
> +#else
> +#error  "Please fix <asm/byteorder.h>"
> +#endif
> +	union {
> +		u16 bitfield;
> +		struct {
> +			u16 running_status:3;
> +			u16 free_CA_mode:1;
> +			u16 desc_length:12;
> +		} __packed;
> +	} __packed;
> +	struct vidtv_psi_desc *descriptor;
> +	struct vidtv_psi_table_sdt_service *next;
> +} __packed;
> +
> +struct vidtv_psi_table_sdt {
> +	struct vidtv_psi_table_header header;
> +	u16 network_id; /* original_network_id */
> +	u8  reserved;
> +	struct vidtv_psi_table_sdt_service *service;
> +} __packed;
> +
> +enum service_running_status {
> +	RUNNING,
> +};
> +
> +enum service_type {
> +	/* see ETSI EN 300 468 v1.15.1 p. 77 */
> +	DIGITAL_TELEVISION_SERVICE = 0x1,
> +};
> +
> +struct vidtv_psi_table_pmt_stream {
> +	u8 type;
> +	union {
> +		u16 bitfield;
> +		struct {
> +			u16 reserved:3;
> +			u16 elementary_pid:13;
> +		} __packed;
> +	} __packed;
> +	union {
> +		u16 bitfield2;
> +		struct {
> +			u16 reserved2:4;
> +			u16 zero:2;
> +			u16 desc_length:10;
> +		} __packed;
> +	} __packed;
> +	struct vidtv_psi_desc *descriptor;
> +	struct vidtv_psi_table_pmt_stream *next;
> +} __packed;
> +
> +struct vidtv_psi_table_pmt {
> +	struct vidtv_psi_table_header header;
> +	union {
> +		u16 bitfield;
> +		struct {
> +			u16 reserved2:3;
> +			u16 pcr_pid:13;
> +		} __packed;
> +	} __packed;
> +
> +	union {
> +		u16 bitfield2;
> +		struct {
> +			u16 reserved3:4;
> +			u16 zero3:2;
> +			u16 desc_length:10; /* program_info_length */
> +		} __packed;
> +	} __packed;
> +	struct vidtv_psi_desc *descriptor;
> +	struct vidtv_psi_table_pmt_stream *stream;
> +} __packed;
> +
> +struct psi_write_args {
> +	void *dest_buf; /* the buffer to write into */
> +	void *from;
> +	size_t len; /* how much to write */
> +	u32 dest_offset; /* where to start writing in the buffer */
> +	u16 pid; /* TS packet ID */
> +	bool new_psi_section; /* set when starting a table section */
> +	u8 *continuity_counter; /* TS: incremented on every new packet */
> +	bool is_crc; /* set when writing the CRC at the end */
> +	u32 dest_buf_sz; /* protect against overflow if not zero */
> +};
> +
> +struct desc_write_args {
> +	void *dest_buf;
> +	u32 dest_offset;
> +	struct vidtv_psi_desc *desc;
> +	u16 pid;
> +	u8 *continuity_counter;
> +	u32 dest_buf_sz;
> +};
> +
> +struct crc32_write_args {
> +	void *dest_buf;
> +	u32 dest_offset;
> +	u16 pid;
> +	u8 *continuity_counter;
> +	u32 dest_buf_sz;
> +};
> +
> +struct header_write_args {
> +	void *dest_buf;
> +	u32 dest_offset;
> +	struct vidtv_psi_table_header *h;
> +	u16 pid;
> +	u8 *continuity_counter;
> +	u32 dest_buf_sz;
> +};
> +
> +struct vidtv_psi_desc *vidtv_psi_desc_init(struct vidtv_psi_desc *head,
> +					   u8 type,
> +					   u8 length);
> +
> +void vidtv_psi_pat_table_init(struct vidtv_psi_table_pat *pat,
> +			      bool update_version_num,
> +			      u16 transport_stream_id);
> +
> +struct vidtv_psi_table_pat_program*
> +vidtv_psi_pat_program_init(struct vidtv_psi_table_pat_program *head,
> +			   u16 service_id,
> +			   u16 pid);
> +
> +struct vidtv_psi_table_pmt_stream*
> +vidtv_psi_pmt_stream_init(struct vidtv_psi_table_pmt_stream *head,
> +			  enum vidtv_psi_stream_types stream_type,
> +			  u16 es_pid);
> +
> +void vidtv_psi_pmt_table_init(struct vidtv_psi_table_pmt *pmt,
> +			      bool update_version_num,
> +			      u16 program_number,
> +			      u16 pcr_pid);
> +
> +void
> +vidtv_psi_sdt_table_init(struct vidtv_psi_table_sdt *sdt,
> +			 bool update_version_num,
> +			 u16 transport_stream_id);
> +
> +struct vidtv_psi_table_sdt_service*
> +vidtv_psi_sdt_service_init(struct vidtv_psi_table_sdt_service *head,
> +			   u16 service_id);
> +
> +void
> +vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc);
> +
> +void
> +vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p);
> +
> +void
> +vidtv_psi_pat_table_destroy(struct vidtv_psi_table_pat *p);
> +
> +void
> +vidtv_psi_pmt_stream_destroy(struct vidtv_psi_table_pmt_stream *s);
> +
> +void
> +vidtv_psi_pmt_table_destroy(struct vidtv_psi_table_pmt *pmt);
> +
> +void
> +vidtv_psi_sdt_table_destroy(struct vidtv_psi_table_sdt *sdt);
> +
> +void
> +vidtv_psi_sdt_service_destroy(struct vidtv_psi_table_sdt_service *service);
> +
> +void
> +vidtv_psi_desc_destroy(struct vidtv_psi_desc *desc);
> +
> +void
> +vidtv_psi_pat_program_destroy(struct vidtv_psi_table_pat_program *p);
> +
> +void
> +vidtv_psi_sdt_service_assign(struct vidtv_psi_table_sdt *sdt,
> +			     struct vidtv_psi_table_sdt_service *service);
> +
> +void vidtv_psi_desc_assign(struct vidtv_psi_desc **to,
> +			   struct vidtv_psi_desc *desc);
> +
> +void vidtv_psi_pat_program_assign(struct vidtv_psi_table_pat *pat,
> +				  struct vidtv_psi_table_pat_program *p);
> +
> +void vidtv_psi_pmt_stream_assign(struct vidtv_psi_table_pmt *pmt,
> +				 struct vidtv_psi_table_pmt_stream *s);
> +void
> +vidtv_psi_pmt_create_sec_for_each_pat_entry(struct vidtv_psi_table_pat *pat,
> +					    struct vidtv_psi_table_pmt *sec);
> +
> +u16 vidtv_psi_pmt_get_pid(struct vidtv_psi_table_pmt *section,
> +			  struct vidtv_psi_table_pat *pat);
> +
> +void vidtv_psi_pat_table_comp_sec_len(struct vidtv_psi_table_pat *pat);
> +void vidtv_psi_pmt_table_comp_sec_len(struct vidtv_psi_table_pmt *pmt);
> +void vidtv_psi_sdt_table_comp_sec_len(struct vidtv_psi_table_sdt *sdt);
> +
> +u32 vidtv_psi_pat_write_into(char *buf,
> +			     u32 offset,
> +			     struct vidtv_psi_table_pat *pat,
> +			     u32 buf_sz,
> +			     u8 *continuity_counter);
> +
> +u32 vidtv_psi_sdt_write_into(char *buf,
> +			     u32 offset,
> +			     struct vidtv_psi_table_sdt *sdt,
> +			     u32 buf_sz,
> +			     u8 *continuity_counter);
> +
> +u32 vidtv_psi_pmt_write_into(char *buf,
> +			     u32 offset,
> +			     struct vidtv_psi_table_pmt *pmt,
> +			     u16 pid,
> +			     u32 buf_sz,
> +			     u8 *continuity_counter);
> +
> +#endif // VIDTV_PSI_H



Thanks,
Mauro
