Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446B72722DE
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgIULoK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:44:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgIULnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5999A21BE5;
        Mon, 21 Sep 2020 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688630;
        bh=cfZ3759PHWbGBaOK5UasqeNhEVO5N2orjlOL9Az5Fk0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C/KHznOyKS5sGVaTfYVfebz0q23Uwa2Hpz48shy7MVCfgsPkYseE02zrbKcGeSNCe
         hpVqJuAueIi1C+dDKHG2oPHJIW4ePNywiJyFzzyG7hlG8uLqHS9xm0Licqq/v+BOoN
         l9qbMqBXjGHYOn6TiMn/0M2UAHAjaoN5mCIgao1M=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEW-0004VO-8S; Mon, 21 Sep 2020 13:43:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 8/9] media: vidtv: rewrite the adaption field logic
Date:   Mon, 21 Sep 2020 13:43:45 +0200
Message-Id: <a8090a47e53c06c2e7fa09a3858294a2463e312c.1600688419.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600688419.git.mchehab+huawei@kernel.org>
References: <cover.1600688419.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When compared with a stream generated via ffmpeg, it can be
noticed that the PES doesn't contain any PCR info. That could
cause problems with userspace decoding. So, rewrite the
logic that fills the adaptation info, in order to allow it
to add PCR frames without breaking frame alignment.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |   1 +
 drivers/media/test-drivers/vidtv/vidtv_pes.c | 198 ++++++++++++-------
 drivers/media/test-drivers/vidtv/vidtv_pes.h |   2 +
 3 files changed, 128 insertions(+), 73 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 6a3123c51cc4..082740ae9d44 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -254,6 +254,7 @@ static u32 vidtv_mux_packetize_access_units(struct vidtv_mux *m,
 		args.access_unit_len = au->nbytes;
 		args.dest_offset     = m->mux_buf_offset;
 		args.pts             = au->pts;
+		args.pcr	     = m->timing.clk;
 
 		m->mux_buf_offset += vidtv_pes_write_into(args);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
index de0ce5529d06..57c7ed4fb3b5 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -43,10 +43,13 @@ static u32 vidtv_pes_op_get_len(bool send_pts, bool send_dts)
 	return len;
 }
 
+#define SIZE_PCR (6 + sizeof(struct vidtv_mpeg_ts_adaption))
+
 static u32 vidtv_pes_h_get_len(bool send_pts, bool send_dts)
 {
+	u32 len = 0;
+
 	/* PES header length notwithstanding stuffing bytes */
-	u32 len = 0;
 
 	len += sizeof(struct vidtv_mpeg_pes);
 	len += vidtv_pes_op_get_len(send_pts, send_dts);
@@ -176,39 +179,58 @@ static u32 vidtv_pes_write_h(struct pes_header_write_args args)
 	return nbytes;
 }
 
+static u32 vidtv_pes_write_pcr_bits(u8 *to, u32 to_offset, u64 pcr)
+{
+	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
+	u64 div;
+	u64 rem;
+	u8 *buf = to + to_offset;
+	u64 pcr_low;
+	u64 pcr_high;
+
+	div = div64_u64_rem(pcr, 300, &rem);
+
+	pcr_low = rem; /* pcr_low = pcr % 300 */
+	pcr_high = div; /* pcr_high = pcr / 300 */
+
+	*buf++ = pcr_high >> 25;
+	*buf++ = pcr_high >> 17;
+	*buf++ = pcr_high >>  9;
+	*buf++ = pcr_high >>  1;
+	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
+	*buf++ = pcr_low;
+
+	return 6;
+}
+
 static u32 vidtv_pes_write_stuffing(struct pes_ts_header_write_args *args,
-				    u32 dest_offset)
+				    u32 dest_offset, bool need_pcr,
+				    u64 *last_pcr)
 {
-	u32 nbytes = 0;
 	struct vidtv_mpeg_ts_adaption ts_adap = {};
-	u32 stuff_nbytes;
+	int stuff_nbytes;
+	u32 nbytes = 0;
 
 	if (!args->n_stuffing_bytes)
-		goto out;
+		return 0;
 
-	if (args->n_stuffing_bytes > PES_TS_HEADER_MAX_STUFFING_BYTES) {
-		pr_warn_ratelimited("More than %d stuffing bytes for a PES packet!\n",
-				    PES_TS_HEADER_MAX_STUFFING_BYTES);
-
-		args->n_stuffing_bytes = PES_TS_HEADER_MAX_STUFFING_BYTES;
-	}
-
-	/* the AF will only be its 'length' field with a value of zero */
-	if (args->n_stuffing_bytes == 1) {
-		nbytes += vidtv_memset(args->dest_buf,
-				       dest_offset + nbytes,
-				       args->dest_buf_sz,
-				       0,
-				       args->n_stuffing_bytes);
-		goto out;
-	}
-
-	stuff_nbytes = args->n_stuffing_bytes - sizeof(ts_adap);
+	ts_adap.random_access = 1;
 
 	/* length _immediately_ following 'adaptation_field_length' */
-	ts_adap.length = sizeof(ts_adap) -
-			 sizeof(ts_adap.length) +
-			 stuff_nbytes;
+	if (need_pcr) {
+		ts_adap.PCR = 1;
+		ts_adap.length = SIZE_PCR;
+	} else {
+		ts_adap.length = sizeof(ts_adap);
+	}
+	stuff_nbytes = args->n_stuffing_bytes - ts_adap.length;
+
+	ts_adap.length -= sizeof(ts_adap.length);
+
+	if (unlikely(stuff_nbytes < 0))
+		stuff_nbytes = 0;
+
+	ts_adap.length += stuff_nbytes;
 
 	/* write the adap after the TS header */
 	nbytes += vidtv_memcpy(args->dest_buf,
@@ -217,23 +239,37 @@ static u32 vidtv_pes_write_stuffing(struct pes_ts_header_write_args *args,
 			       &ts_adap,
 			       sizeof(ts_adap));
 
-	/* write the stuffing bytes */
-	nbytes += vidtv_memset(args->dest_buf,
-			       dest_offset + nbytes,
-			       args->dest_buf_sz,
-			       TS_FILL_BYTE,
-			       stuff_nbytes);
+	/* write the optional PCR */
+	if (need_pcr) {
+		nbytes += vidtv_pes_write_pcr_bits(args->dest_buf,
+						   dest_offset + nbytes,
+						   args->pcr);
 
-out:
+		*last_pcr = args->pcr;
+	}
+
+	/* write the stuffing bytes, if are there anything left */
+	if (stuff_nbytes)
+		nbytes += vidtv_memset(args->dest_buf,
+				       dest_offset + nbytes,
+				       args->dest_buf_sz,
+				       TS_FILL_BYTE,
+				       stuff_nbytes);
+
+	/*
+	 * The n_stuffing_bytes contain a pre-calculated value of
+	 * the amount of data that this function would read, made from
+	 * vidtv_pes_h_get_len(). If something went wrong, print a warning
+	 */
 	if (nbytes != args->n_stuffing_bytes)
 		pr_warn_ratelimited("write size was %d, expected %d\n",
-				    nbytes,
-				    args->n_stuffing_bytes);
+				    nbytes, args->n_stuffing_bytes);
 
 	return nbytes;
 }
 
-static u32 vidtv_pes_write_ts_h(struct pes_ts_header_write_args args)
+static u32 vidtv_pes_write_ts_h(struct pes_ts_header_write_args args,
+				bool need_pcr, u64 *last_pcr)
 {
 	/* number of bytes written by this function */
 	u32 nbytes = 0;
@@ -258,43 +294,35 @@ static u32 vidtv_pes_write_ts_h(struct pes_ts_header_write_args args)
 			       sizeof(ts_header));
 
 	/* write stuffing, if any */
-	nbytes += vidtv_pes_write_stuffing(&args, args.dest_offset + nbytes);
+	nbytes += vidtv_pes_write_stuffing(&args, args.dest_offset + nbytes,
+					   need_pcr, last_pcr);
 
 	return nbytes;
 }
 
 u32 vidtv_pes_write_into(struct pes_write_args args)
 {
-	u32 nbytes_past_boundary = (args.dest_offset % TS_PACKET_LEN);
-	bool aligned = (nbytes_past_boundary == 0);
-
+	u32 unaligned_bytes = (args.dest_offset % TS_PACKET_LEN);
 	struct pes_ts_header_write_args ts_header_args = {};
-	struct pes_header_write_args pes_header_args   = {};
-
-	/* number of bytes written by this function */
-	u32 nbytes        = 0;
+	struct pes_header_write_args pes_header_args = {};
 	u32 remaining_len = args.access_unit_len;
-
 	bool wrote_pes_header = false;
+	u64 last_pcr = args.pcr;
+	bool need_pcr = true;
+	u32 available_space;
+	u32 payload_size;
+	u32 stuff_bytes;
+	u32 nbytes = 0;
 
-	/* whether we need to stuff the TS packet to align the buffer */
-	bool should_insert_stuffing_bytes = false;
-
-	u32 available_space    = 0;
-	u32 payload_write_len  = 0;
-	u32 num_stuffing_bytes = 0;
-
-	if (!aligned) {
-		pr_warn_ratelimited("Cannot start a PES packet in a misaligned buffer\n");
+	if (unaligned_bytes) {
+		pr_warn_ratelimited("buffer is misaligned, while starting PES\n");
 
 		/* forcibly align and hope for the best */
 		nbytes += vidtv_memset(args.dest_buf,
 				       args.dest_offset + nbytes,
 				       args.dest_buf_sz,
 				       TS_FILL_BYTE,
-				       TS_PACKET_LEN - nbytes_past_boundary);
-
-		aligned = true;
+				       TS_PACKET_LEN - unaligned_bytes);
 	}
 
 	if (args.send_dts && !args.send_pts) {
@@ -310,44 +338,68 @@ u32 vidtv_pes_write_into(struct pes_write_args args)
 	}
 
 	while (remaining_len) {
+		available_space = TS_PAYLOAD_LEN;
 		/*
 		 * The amount of space initially available in the TS packet.
 		 * if this is the beginning of the PES packet, take into account
 		 * the space needed for the TS header _and_ for the PES header
 		 */
-		available_space = (!wrote_pes_header) ?
-				  TS_PAYLOAD_LEN -
-				  vidtv_pes_h_get_len(args.send_pts, args.send_dts) :
-				  TS_PAYLOAD_LEN;
+		if (!wrote_pes_header)
+			available_space -= vidtv_pes_h_get_len(args.send_pts,
+							       args.send_dts);
 
-		/* if the encoder has inserted stuffing bytes in the PES
+		/*
+		 * if the encoder has inserted stuffing bytes in the PES
 		 * header, account for them.
 		 */
 		available_space -= args.n_pes_h_s_bytes;
 
-		/* whether stuffing bytes are needed to align the buffer */
-		should_insert_stuffing_bytes = remaining_len < available_space;
+		/* Take the extra adaptation into account if need to send PCR */
+		if (need_pcr) {
+			available_space -= SIZE_PCR;
+			stuff_bytes = SIZE_PCR;
+		} else {
+			stuff_bytes = 0;
+		}
 
 		/*
 		 * how much of the _actual_ payload should be written in this
 		 * packet.
 		 */
-		payload_write_len = (should_insert_stuffing_bytes) ?
-				    remaining_len :
-				    available_space;
+		if (remaining_len >= available_space) {
+			payload_size = available_space;
+		} else {
+			/* Last frame should ensure 188-bytes PS alignment */
+			payload_size = remaining_len;
+			stuff_bytes += available_space - payload_size;
 
-		num_stuffing_bytes = available_space - payload_write_len;
+			/*
+			* Ensure that the stuff bytes will be within the
+			* allowed range, decrementing the number of payload
+			* bytes to write if needed.
+			*/
+			if (stuff_bytes > PES_TS_HEADER_MAX_STUFFING_BYTES) {
+				u32 tmp = stuff_bytes - PES_TS_HEADER_MAX_STUFFING_BYTES;
+
+				stuff_bytes = PES_TS_HEADER_MAX_STUFFING_BYTES;
+				payload_size -= tmp;
+			}
+		}
 
 		/* write ts header */
 		ts_header_args.dest_buf           = args.dest_buf;
 		ts_header_args.dest_offset        = args.dest_offset + nbytes;
 		ts_header_args.dest_buf_sz        = args.dest_buf_sz;
 		ts_header_args.pid                = args.pid;
+		ts_header_args.pcr		  = args.pcr;
 		ts_header_args.continuity_counter = args.continuity_counter;
 		ts_header_args.wrote_pes_header   = wrote_pes_header;
-		ts_header_args.n_stuffing_bytes   = num_stuffing_bytes;
+		ts_header_args.n_stuffing_bytes   = stuff_bytes;
 
-		nbytes += vidtv_pes_write_ts_h(ts_header_args);
+		nbytes += vidtv_pes_write_ts_h(ts_header_args, need_pcr,
+					       &last_pcr);
+
+		need_pcr = false;
 
 		if (!wrote_pes_header) {
 			/* write the PES header only once */
@@ -375,11 +427,11 @@ u32 vidtv_pes_write_into(struct pes_write_args args)
 				       args.dest_offset + nbytes,
 				       args.dest_buf_sz,
 				       args.from,
-				       payload_write_len);
+				       payload_size);
 
-		args.from += payload_write_len;
+		args.from += payload_size;
 
-		remaining_len -= payload_write_len;
+		remaining_len -= payload_size;
 	}
 
 	return nbytes;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.h b/drivers/media/test-drivers/vidtv/vidtv_pes.h
index 84628780d8c6..0ea9e863024d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.h
@@ -125,6 +125,7 @@ struct pes_ts_header_write_args {
 	u8 *continuity_counter;
 	bool wrote_pes_header;
 	u32 n_stuffing_bytes;
+	u64 pcr;
 };
 
 /**
@@ -168,6 +169,7 @@ struct pes_write_args {
 	u64 dts;
 
 	u32 n_pes_h_s_bytes;
+	u64 pcr;
 };
 
 /**
-- 
2.26.2

