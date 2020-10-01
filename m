Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A267D27FA43
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 09:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731527AbgJAH1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 03:27:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731349AbgJAH1H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 03:27:07 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1281E2176B;
        Thu,  1 Oct 2020 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601537225;
        bh=5cwFGiQsNUUfmXhEHwsLLEJKyUctOHutaOp3YVdjNGE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cMOuZ5XjM2M9RF3eIl7RPmTc1KXoVRYLlGAoAt8INXXgaDGm2hKn4Lohd0Od8HzD5
         BIufe8ddyYAWPnigsZ4DqWhaN37kWf+2grsoqtrHdyQDGa9xYZdHaFQoPGHoMjWUu/
         S92oCTrcCM4tS9BBaQbIyz8wcDhoQbueoBpP+QOA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNszW-002VRN-3W; Thu, 01 Oct 2020 09:27:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: vidtv: avoid copying data for PES structs
Date:   Thu,  1 Oct 2020 09:27:00 +0200
Message-Id: <00acbe4e3a91bf9471dd909ba32609ae6a6b9c48.1601537213.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <88bc90c42a8af0921b11190c22181cdffc99dc7c.1601537213.git.mchehab+huawei@kernel.org>
References: <88bc90c42a8af0921b11190c22181cdffc99dc7c.1601537213.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Minimize the number of data copies and initialization at
the code, passing them as pointers instead of duplicating
the data.

The only case where we're keeping the data copy is at
vidtv_pes_write_h(), as it needs a copy of the passed
arguments. On such case, we're being more explicit.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  30 ++--
 drivers/media/test-drivers/vidtv/vidtv_pes.c | 178 +++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_pes.h |   2 +-
 3 files changed, 102 insertions(+), 108 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 6127e9ff71a1..80b28aa75d33 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -238,22 +238,28 @@ static u32 vidtv_mux_packetize_access_units(struct vidtv_mux *m,
 					    struct vidtv_encoder *e)
 {
 	u32 nbytes = 0;
-
-	struct pes_write_args args = {};
+	struct pes_write_args args = {
+		.dest_buf           = m->mux_buf,
+		.dest_buf_sz        = m->mux_buf_sz,
+		.pid                = be16_to_cpu(e->es_pid),
+		.encoder_id         = e->id,
+		.stream_id          = be16_to_cpu(e->stream_id),
+		.send_pts           = true,  /* forbidden value '01'... */
+		.send_dts           = false, /* ...for PTS_DTS flags    */
+	};
 	u32 initial_offset = m->mux_buf_offset;
 	struct vidtv_access_unit *au = e->access_units;
-
 	u8 *buf = NULL;
-	struct vidtv_mux_pid_ctx *pid_ctx = vidtv_mux_create_pid_ctx_once(m,
-									  be16_to_cpu(e->es_pid));
+	struct vidtv_mux_pid_ctx *pid_ctx;
 
-	args.dest_buf           = m->mux_buf;
-	args.dest_buf_sz        = m->mux_buf_sz;
-	args.pid                = be16_to_cpu(e->es_pid);
-	args.encoder_id         = e->id;
+	/* see SMPTE 302M clause 6.4 */
+	if (args.encoder_id == S302M) {
+		args.send_dts = false;
+		args.send_pts = true;
+	}
+
+	pid_ctx = vidtv_mux_create_pid_ctx_once(m, be16_to_cpu(e->es_pid));
 	args.continuity_counter = &pid_ctx->cc;
-	args.stream_id          = be16_to_cpu(e->stream_id);
-	args.send_pts           = true;
 
 	while (au) {
 		buf                  = e->encoder_buf + au->offset;
@@ -263,7 +269,7 @@ static u32 vidtv_mux_packetize_access_units(struct vidtv_mux *m,
 		args.pts             = au->pts;
 		args.pcr	     = m->timing.clk;
 
-		m->mux_buf_offset += vidtv_pes_write_into(args);
+		m->mux_buf_offset += vidtv_pes_write_into(&args);
 
 		au = au->next;
 	}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
index 102352d398ed..42464d842e95 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -56,7 +56,7 @@ static u32 vidtv_pes_h_get_len(bool send_pts, bool send_dts)
 	return len;
 }
 
-static u32 vidtv_pes_write_header_stuffing(struct pes_header_write_args args)
+static u32 vidtv_pes_write_header_stuffing(struct pes_header_write_args *args)
 {
 	/*
 	 * This is a fixed 8-bit value equal to '0xFF' that can be inserted
@@ -64,20 +64,20 @@ static u32 vidtv_pes_write_header_stuffing(struct pes_header_write_args args)
 	 * It is discarded by the decoder. No more than 32 stuffing bytes shall
 	 * be present in one PES packet header.
 	 */
-	if (args.n_pes_h_s_bytes > PES_HEADER_MAX_STUFFING_BYTES) {
+	if (args->n_pes_h_s_bytes > PES_HEADER_MAX_STUFFING_BYTES) {
 		pr_warn_ratelimited("More than %d stuffing bytes in PES packet header\n",
 				    PES_HEADER_MAX_STUFFING_BYTES);
-		args.n_pes_h_s_bytes = PES_HEADER_MAX_STUFFING_BYTES;
+		args->n_pes_h_s_bytes = PES_HEADER_MAX_STUFFING_BYTES;
 	}
 
-	return vidtv_memset(args.dest_buf,
-			    args.dest_offset,
-			    args.dest_buf_sz,
+	return vidtv_memset(args->dest_buf,
+			    args->dest_offset,
+			    args->dest_buf_sz,
 			    TS_FILL_BYTE,
-			    args.n_pes_h_s_bytes);
+			    args->n_pes_h_s_bytes);
 }
 
-static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args args)
+static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args *args)
 {
 	u32 nbytes = 0;  /* the number of bytes written by this function */
 
@@ -89,7 +89,7 @@ static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args args)
 	u64 mask2;
 	u64 mask3;
 
-	if (!args.send_pts && args.send_dts)
+	if (!args->send_pts && args->send_dts)
 		return 0;
 
 	mask1 = GENMASK_ULL(32, 30);
@@ -97,80 +97,81 @@ static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args args)
 	mask3 = GENMASK_ULL(14, 0);
 
 	/* see ISO/IEC 13818-1 : 2000 p. 32 */
-	if (args.send_pts && args.send_dts) {
-		pts_dts.pts1 = (0x3 << 4) | ((args.pts & mask1) >> 29) | 0x1;
-		pts_dts.pts2 = cpu_to_be16(((args.pts & mask2) >> 14) | 0x1);
-		pts_dts.pts3 = cpu_to_be16(((args.pts & mask3) << 1) | 0x1);
+	if (args->send_pts && args->send_dts) {
+		pts_dts.pts1 = (0x3 << 4) | ((args->pts & mask1) >> 29) | 0x1;
+		pts_dts.pts2 = cpu_to_be16(((args->pts & mask2) >> 14) | 0x1);
+		pts_dts.pts3 = cpu_to_be16(((args->pts & mask3) << 1) | 0x1);
 
-		pts_dts.dts1 = (0x1 << 4) | ((args.dts & mask1) >> 29) | 0x1;
-		pts_dts.dts2 = cpu_to_be16(((args.dts & mask2) >> 14) | 0x1);
-		pts_dts.dts3 = cpu_to_be16(((args.dts & mask3) << 1) | 0x1);
+		pts_dts.dts1 = (0x1 << 4) | ((args->dts & mask1) >> 29) | 0x1;
+		pts_dts.dts2 = cpu_to_be16(((args->dts & mask2) >> 14) | 0x1);
+		pts_dts.dts3 = cpu_to_be16(((args->dts & mask3) << 1) | 0x1);
 
 		op = &pts_dts;
 		op_sz = sizeof(pts_dts);
 
-	} else if (args.send_pts) {
-		pts.pts1 = (0x1 << 5) | ((args.pts & mask1) >> 29) | 0x1;
-		pts.pts2 = cpu_to_be16(((args.pts & mask2) >> 14) | 0x1);
-		pts.pts3 = cpu_to_be16(((args.pts & mask3) << 1) | 0x1);
+	} else if (args->send_pts) {
+		pts.pts1 = (0x1 << 5) | ((args->pts & mask1) >> 29) | 0x1;
+		pts.pts2 = cpu_to_be16(((args->pts & mask2) >> 14) | 0x1);
+		pts.pts3 = cpu_to_be16(((args->pts & mask3) << 1) | 0x1);
 
 		op = &pts;
 		op_sz = sizeof(pts);
 	}
 
 	/* copy PTS/DTS optional */
-	nbytes += vidtv_memcpy(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.dest_buf_sz,
+	nbytes += vidtv_memcpy(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->dest_buf_sz,
 			       op,
 			       op_sz);
 
 	return nbytes;
 }
 
-static u32 vidtv_pes_write_h(struct pes_header_write_args args)
+static u32 vidtv_pes_write_h(struct pes_header_write_args *args)
 {
 	u32 nbytes = 0;  /* the number of bytes written by this function */
 
 	struct vidtv_mpeg_pes pes_header          = {};
 	struct vidtv_pes_optional pes_optional    = {};
-	struct pes_header_write_args pts_dts_args = args;
-	u32 stream_id = (args.encoder_id == S302M) ? PRIVATE_STREAM_1_ID : args.stream_id;
+	struct pes_header_write_args pts_dts_args;
+	u32 stream_id = (args->encoder_id == S302M) ? PRIVATE_STREAM_1_ID : args->stream_id;
 	u16 pes_opt_bitfield = 0x01 << 15;
 
 	pes_header.bitfield = cpu_to_be32((PES_START_CODE_PREFIX << 8) | stream_id);
 
-	pes_header.length = cpu_to_be16(vidtv_pes_op_get_len(args.send_pts,
-							     args.send_dts) +
-							     args.access_unit_len);
+	pes_header.length = cpu_to_be16(vidtv_pes_op_get_len(args->send_pts,
+							     args->send_dts) +
+							     args->access_unit_len);
 
-	if (args.send_pts && args.send_dts)
+	if (args->send_pts && args->send_dts)
 		pes_opt_bitfield |= (0x3 << 6);
-	else if (args.send_pts)
+	else if (args->send_pts)
 		pes_opt_bitfield |= (0x1 << 7);
 
 	pes_optional.bitfield = cpu_to_be16(pes_opt_bitfield);
-	pes_optional.length = vidtv_pes_op_get_len(args.send_pts, args.send_dts) +
-			      args.n_pes_h_s_bytes -
+	pes_optional.length = vidtv_pes_op_get_len(args->send_pts, args->send_dts) +
+			      args->n_pes_h_s_bytes -
 			      sizeof(struct vidtv_pes_optional);
 
 	/* copy header */
-	nbytes += vidtv_memcpy(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.dest_buf_sz,
+	nbytes += vidtv_memcpy(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->dest_buf_sz,
 			       &pes_header,
 			       sizeof(pes_header));
 
 	/* copy optional header bits */
-	nbytes += vidtv_memcpy(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.dest_buf_sz,
+	nbytes += vidtv_memcpy(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->dest_buf_sz,
 			       &pes_optional,
 			       sizeof(pes_optional));
 
 	/* copy the timing information */
-	pts_dts_args.dest_offset = args.dest_offset + nbytes;
-	nbytes += vidtv_pes_write_pts_dts(pts_dts_args);
+	pts_dts_args = *args;
+	pts_dts_args.dest_offset = args->dest_offset + nbytes;
+	nbytes += vidtv_pes_write_pts_dts(&pts_dts_args);
 
 	/* write any PES header stuffing */
 	nbytes += vidtv_pes_write_header_stuffing(args);
@@ -299,14 +300,31 @@ static u32 vidtv_pes_write_ts_h(struct pes_ts_header_write_args args,
 	return nbytes;
 }
 
-u32 vidtv_pes_write_into(struct pes_write_args args)
+u32 vidtv_pes_write_into(struct pes_write_args *args)
 {
-	u32 unaligned_bytes = (args.dest_offset % TS_PACKET_LEN);
-	struct pes_ts_header_write_args ts_header_args = {};
-	struct pes_header_write_args pes_header_args = {};
-	u32 remaining_len = args.access_unit_len;
+	u32 unaligned_bytes = (args->dest_offset % TS_PACKET_LEN);
+	struct pes_ts_header_write_args ts_header_args = {
+		.dest_buf		= args->dest_buf,
+		.dest_buf_sz		= args->dest_buf_sz,
+		.pid			= args->pid,
+		.pcr		  	= args->pcr,
+		.continuity_counter	= args->continuity_counter,
+	};
+	struct pes_header_write_args pes_header_args = {
+		.dest_buf		= args->dest_buf,
+		.dest_buf_sz		= args->dest_buf_sz,
+		.encoder_id		= args->encoder_id,
+		.send_pts		= args->send_pts,
+		.pts			= args->pts,
+		.send_dts		= args->send_dts,
+		.dts			= args->dts,
+		.stream_id		= args->stream_id,
+		.n_pes_h_s_bytes	= args->n_pes_h_s_bytes,
+		.access_unit_len	= args->access_unit_len,
+	};
+	u32 remaining_len = args->access_unit_len;
 	bool wrote_pes_header = false;
-	u64 last_pcr = args.pcr;
+	u64 last_pcr = args->pcr;
 	bool need_pcr = true;
 	u32 available_space;
 	u32 payload_size;
@@ -317,25 +335,13 @@ u32 vidtv_pes_write_into(struct pes_write_args args)
 		pr_warn_ratelimited("buffer is misaligned, while starting PES\n");
 
 		/* forcibly align and hope for the best */
-		nbytes += vidtv_memset(args.dest_buf,
-				       args.dest_offset + nbytes,
-				       args.dest_buf_sz,
+		nbytes += vidtv_memset(args->dest_buf,
+				       args->dest_offset + nbytes,
+				       args->dest_buf_sz,
 				       TS_FILL_BYTE,
 				       TS_PACKET_LEN - unaligned_bytes);
 	}
 
-	if (args.send_dts && !args.send_pts) {
-		pr_warn_ratelimited("forbidden value '01' for PTS_DTS flags\n");
-		args.send_pts = true;
-		args.pts      = args.dts;
-	}
-
-	/* see SMPTE 302M clause 6.4 */
-	if (args.encoder_id == S302M) {
-		args.send_dts = false;
-		args.send_pts = true;
-	}
-
 	while (remaining_len) {
 		available_space = TS_PAYLOAD_LEN;
 		/*
@@ -344,14 +350,14 @@ u32 vidtv_pes_write_into(struct pes_write_args args)
 		 * the space needed for the TS header _and_ for the PES header
 		 */
 		if (!wrote_pes_header)
-			available_space -= vidtv_pes_h_get_len(args.send_pts,
-							       args.send_dts);
+			available_space -= vidtv_pes_h_get_len(args->send_pts,
+							       args->send_dts);
 
 		/*
 		 * if the encoder has inserted stuffing bytes in the PES
 		 * header, account for them.
 		 */
-		available_space -= args.n_pes_h_s_bytes;
+		available_space -= args->n_pes_h_s_bytes;
 
 		/* Take the extra adaptation into account if need to send PCR */
 		if (need_pcr) {
@@ -386,14 +392,9 @@ u32 vidtv_pes_write_into(struct pes_write_args args)
 		}
 
 		/* write ts header */
-		ts_header_args.dest_buf           = args.dest_buf;
-		ts_header_args.dest_offset        = args.dest_offset + nbytes;
-		ts_header_args.dest_buf_sz        = args.dest_buf_sz;
-		ts_header_args.pid                = args.pid;
-		ts_header_args.pcr		  = args.pcr;
-		ts_header_args.continuity_counter = args.continuity_counter;
-		ts_header_args.wrote_pes_header   = wrote_pes_header;
-		ts_header_args.n_stuffing_bytes   = stuff_bytes;
+		ts_header_args.dest_offset = args->dest_offset + nbytes;
+		ts_header_args.wrote_pes_header	= wrote_pes_header;
+		ts_header_args.n_stuffing_bytes	= stuff_bytes;
 
 		nbytes += vidtv_pes_write_ts_h(ts_header_args, need_pcr,
 					       &last_pcr);
@@ -402,33 +403,20 @@ u32 vidtv_pes_write_into(struct pes_write_args args)
 
 		if (!wrote_pes_header) {
 			/* write the PES header only once */
-			pes_header_args.dest_buf        = args.dest_buf;
-
-			pes_header_args.dest_offset     = args.dest_offset +
-							  nbytes;
-
-			pes_header_args.dest_buf_sz     = args.dest_buf_sz;
-			pes_header_args.encoder_id      = args.encoder_id;
-			pes_header_args.send_pts        = args.send_pts;
-			pes_header_args.pts             = args.pts;
-			pes_header_args.send_dts        = args.send_dts;
-			pes_header_args.dts             = args.dts;
-			pes_header_args.stream_id       = args.stream_id;
-			pes_header_args.n_pes_h_s_bytes = args.n_pes_h_s_bytes;
-			pes_header_args.access_unit_len = args.access_unit_len;
-
-			nbytes           += vidtv_pes_write_h(pes_header_args);
-			wrote_pes_header  = true;
+			pes_header_args.dest_offset = args->dest_offset +
+						      nbytes;
+			nbytes += vidtv_pes_write_h(&pes_header_args);
+			wrote_pes_header = true;
 		}
 
 		/* write as much of the payload as we possibly can */
-		nbytes += vidtv_memcpy(args.dest_buf,
-				       args.dest_offset + nbytes,
-				       args.dest_buf_sz,
-				       args.from,
+		nbytes += vidtv_memcpy(args->dest_buf,
+				       args->dest_offset + nbytes,
+				       args->dest_buf_sz,
+				       args->from,
 				       payload_size);
 
-		args.from += payload_size;
+		args->from += payload_size;
 
 		remaining_len -= payload_size;
 	}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.h b/drivers/media/test-drivers/vidtv/vidtv_pes.h
index a152693233a9..99f45056adc2 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.h
@@ -185,6 +185,6 @@ struct pes_write_args {
  * equal to the size of the access unit, since we need space for PES headers, TS headers
  * and padding bytes, if any.
  */
-u32 vidtv_pes_write_into(struct pes_write_args args);
+u32 vidtv_pes_write_into(struct pes_write_args *args);
 
 #endif // VIDTV_PES_H
-- 
2.26.2

