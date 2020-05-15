Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0261D5BE8
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 23:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgEOVtT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 17:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727780AbgEOVtS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 17:49:18 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD93C05BD09;
        Fri, 15 May 2020 14:49:18 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id g20so1856183qvb.9;
        Fri, 15 May 2020 14:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KKGa38uxXwNrwd7G8J1MqYTiY8aGYfpyANfqn6cPtD4=;
        b=BGhFHQidsT8bC23eROhdhfuWkHNFfcxQlD+CxzGtIwYsWvhWkjcgLWvAuuatXlYXdb
         mDJmc7uk/72GSe2OmFeEDXRCvVXVjHJvFTuuq/3ME2XlyeMfJWCLJhRessY3MZPjQc/Z
         zZUzWBeCG5t78eZQqXPdSHW062sqb2nrimF2jeeQ6OmsoV1PjZHrcD3H68sFJteUih58
         4VDGVAEyq3L4EfeEAcyD/psPeylfOn8X0FBMKNH/lCxj6qZ25paokLXFVR8CKyWbVmuA
         eR/0aAZZjV6c9/4b+A8DD5TPnAsycQe0z5aNyHShntjOG5gqxH+xqgGf+eZ6F7u9d5JV
         YqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKGa38uxXwNrwd7G8J1MqYTiY8aGYfpyANfqn6cPtD4=;
        b=Mpr7kSFyOz3M8TMyd4xfRipMBPZvlQ2J04gU70bgKLdCXi0o0Bxpp+FPeNG5qL3HSX
         a8kN5KDmHDn4moPh5d6//8bu/RgPcXPHw+Dkv52azE/GyTsDojAoQENvhTrnHriP2s+p
         XdWvITnli20kVDvt8FZeKrntM1TgH6qxkrshldMjltW/qlHmVumJrxwbi67D5AvLAwtM
         dz0MTtNdJVg2K9DOmsEAwyJUkGfXXTxqPImuWo76W+bMlEI0qRy+QPoyTalw7wfEWhxy
         hnl42jW516OSFHET36j6AUecd6o7Vv6DOlWZdXWbSzBRgotW/PpDNAMEnfKIsyUdW1nR
         TrvA==
X-Gm-Message-State: AOAM533ifY5gz6dFxzTP4EA1TtdN6oOk13/8fcyDPXrfdRfh+5AVsrtK
        5lxKGGstC8OeJd6AEXUpI0c=
X-Google-Smtp-Source: ABdhPJyAui3tVpdTlo4JW5N5eW2crFAVjx36kRF12qFVLnZepzRPDCNDF/rMNcBZfmufJNbc/XNP2Q==
X-Received: by 2002:a0c:9ad5:: with SMTP id k21mr5738152qvf.2.1589579356995;
        Fri, 15 May 2020 14:49:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
        by smtp.gmail.com with ESMTPSA id m21sm2495019qkh.50.2020.05.15.14.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:49:16 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v5 08/10] media: vidtv: implement a PES packetizer
Date:   Fri, 15 May 2020 18:48:13 -0300
Message-Id: <20200515214815.15514-9-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515214815.15514-1-dwlsalmeida@gmail.com>
References: <20200515214815.15514-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Implement the PES logic to convert encoder data into MPEG TS packets.
These TS packets can then be fed into a TS multiplexer and eventually
into userspace.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_common.h   |   2 +
 drivers/media/test-drivers/vidtv/vidtv_pes.c  | 450 ++++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  | 186 ++++++++
 3 files changed, 638 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
index a3cb303cc7423..1a31973f3ac61 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_common.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -24,4 +24,6 @@ u32 vidtv_memset(void *to,
 		 int c,
 		 size_t len);
 
+u64 vidtv_extract_bits(u64 value, u8 start_bit, u8 nbits);
+
 #endif // VIDTV_COMMON_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
new file mode 100644
index 0000000000000..8614868972eaa
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the logic to translate the ES data for one access unit
+ * from an encoder into MPEG TS packets. It does so by first encapsulating it
+ * with a PES header and then splitting it into TS packets.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/types.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+
+#include "vidtv_pes.h"
+#include "vidtv_common.h"
+#include "vidtv_ts.h"
+
+#define PRIVATE_STREAM_1_ID 0xbd /* private_stream_1. See SMPTE 302M-2007 p.6 */
+#define PES_HEADER_MAX_STUFFING_BYTES 32
+#define PES_TS_HEADER_MAX_STUFFING_BYTES 182
+
+static u32 vidtv_pes_op_get_regular_len(bool send_pts, bool send_dts)
+{
+	u32 len = 0;
+
+	/* the flags must always be sent */
+	len += sizeof(struct vidtv_pes_optional);
+
+	/* From all optionals, we might send these for now */
+	if (send_pts && send_dts)
+		len += sizeof(struct vidtv_pes_optional_pts_dts);
+	else if (send_pts)
+		len += sizeof(struct vidtv_pes_optional_pts);
+
+	return len;
+}
+
+static u32 vidtv_pes_h_get_regular_len(bool send_pts, bool send_dts)
+{
+	/* PES header length notwithstanding stuffing bytes */
+	u32 len = 0;
+
+	len += sizeof(struct vidtv_mpeg_pes);
+	len += vidtv_pes_op_get_regular_len(send_pts, send_dts);
+
+	return len;
+}
+
+static u32 vidtv_pes_write_header_stuffing(struct vidtv_mpeg_pes *pes_h,
+					   struct pes_header_write_args args)
+{
+	/*
+	 * This is a fixed 8-bit value equal to '1111 1111' that can be inserted
+	 * by the encoder, for example to meet the requirements of the channel.
+	 * It is discarded by the decoder. No more than 32 stuffing bytes shall
+	 * be present in one PES packet header.
+	 */
+	if (args.n_pes_h_s_bytes > PES_HEADER_MAX_STUFFING_BYTES) {
+		pr_warn_ratelimited("More than 32 stuffing bytes in PES packet header\n");
+		args.n_pes_h_s_bytes = PES_HEADER_MAX_STUFFING_BYTES;
+	}
+
+	/* gives the length of the remainder of the PES header in bytes */
+	pes_h->length += args.n_pes_h_s_bytes;
+
+	return vidtv_memset(args.dest_buf,
+			    args.dest_offset,
+			    args.dest_buf_sz,
+			    TS_FILL_BYTE,
+			    args.n_pes_h_s_bytes);
+}
+
+static u32 vidtv_pes_write_pts_dts(struct pes_header_write_args args)
+{
+	u32 nbytes = 0;  /* the number of bytes written by this function */
+
+	struct vidtv_pes_optional_pts pts         = {0};
+	struct vidtv_pes_optional_pts_dts pts_dts = {0};
+	void   *op                                = NULL;
+	size_t op_sz                              = 0;
+
+	if (!args.send_pts && args.send_dts)
+		return 0;
+
+	/* see ISO/IEC 13818-1 : 2000 p. 32 */
+
+	if (args.send_pts && args.send_dts) {
+		pts_dts.three = 0x3;
+
+		pts_dts.pts1    = (args.pts & GENMASK(32, 30)) >> 30;
+		pts_dts.marker1 = 0x1;
+		pts_dts.pts2    = (args.pts & GENMASK(29, 15)) >> 15;
+		pts_dts.marker2 = 0x1;
+		pts_dts.pts3    = args.pts & GENMASK(14, 0);
+		pts_dts.marker3 = 0x1;
+
+		pts_dts.one = 0x1;
+
+		pts_dts.dts1    = (args.dts & GENMASK(32, 30)) >> 30;
+		pts_dts.marker1 = 0x1;
+		pts_dts.dts2    = (args.dts & GENMASK(29, 15)) >> 15;
+		pts_dts.marker2 = 0x1;
+		pts_dts.dts3    = args.dts & GENMASK(14, 0);
+		pts_dts.marker3 = 0x1;
+
+		op    = &pts_dts;
+		op_sz = sizeof(pts_dts);
+
+	} else if (args.send_pts) {
+		pts.two     = 0x2;
+		pts_dts.pts1    = (args.pts & GENMASK(32, 30)) >> 30;
+		pts_dts.marker1 = 0x1;
+		pts_dts.pts2    = (args.pts & GENMASK(29, 15)) >> 15;
+		pts_dts.marker2 = 0x1;
+		pts_dts.pts3    = args.pts & GENMASK(14, 0);
+		pts_dts.marker3 = 0x1;
+
+		op    = &pts;
+		op_sz = sizeof(pts);
+	}
+
+	/* copy PTS/DTS optional */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       op,
+			       op_sz);
+
+	return nbytes;
+}
+
+static u32 vidtv_pes_write_h(struct pes_header_write_args args)
+{
+	u32 nbytes = 0;  /* the number of bytes written by this function */
+
+	struct vidtv_mpeg_pes pes_header          = {0};
+	struct vidtv_pes_optional pes_optional    = {0};
+	struct pes_header_write_args pts_dts_args = args;
+
+	pes_header.packet_start_code_prefix = PES_START_CODE_PREFIX;
+
+	pes_header.stream_id = (args.is_s302m_pkt) ?
+				PRIVATE_STREAM_1_ID :
+				args.stream_id;
+
+	pes_header.length = vidtv_pes_op_get_regular_len(args.send_pts,
+							 args.send_dts);
+
+	pes_optional.two     = 0x2;
+
+	pes_optional.PTS_DTS = (args.send_pts && args.send_dts) ?
+			       0x3 :
+			       (args.send_pts) ?
+			       0x2 :
+			       0x0;
+
+	/* copy header */
+
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       &pes_header,
+			       sizeof(pes_header));
+
+	/* copy optional header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       &pes_optional,
+			       sizeof(pes_optional));
+
+	pts_dts_args.dest_offset  = args.dest_offset + nbytes;
+	nbytes                   += vidtv_pes_write_pts_dts(pts_dts_args);
+
+	/* write any PES header stuffing */
+	nbytes += vidtv_pes_write_header_stuffing(&pes_header, args);
+
+	return nbytes;
+}
+
+static u32 vidtv_pes_write_stuffing(struct vidtv_mpeg_ts *ts_h,
+				    void *dest_buf,
+				    u32 dest_offset,
+				    u32 n_stuffing_bytes,
+				    u32 buf_sz)
+{
+	/*
+	 * For Transport Stream packets carrying PES packets, stuffing is
+	 * needed when there is insufficient PES packet data to completely
+	 * fill the Transport Stream packet payload bytes. Stuffing is
+	 * accomplished by defining an adaptation field longer than the sum of
+	 * the lengths of the data elements in it, so that the payload bytes
+	 * remaining after the adaptation field exactly accommodates the
+	 * available PES packet data. The extra space in the adaptation field
+	 * is filled with stuffing bytes.
+	 *
+	 */
+
+	/* the number of bytes written by this function */
+	u32    nbytes                         = 0;
+	struct vidtv_mpeg_ts_adaption ts_adap = {0};
+
+	if (!n_stuffing_bytes)
+		return nbytes;
+
+	ts_h->adaptation_field = 1;
+
+	if (n_stuffing_bytes > PES_TS_HEADER_MAX_STUFFING_BYTES) {
+		pr_warn_ratelimited("More than %d stuffing bytes for a PES packet",
+				    PES_TS_HEADER_MAX_STUFFING_BYTES);
+
+		n_stuffing_bytes = PES_TS_HEADER_MAX_STUFFING_BYTES;
+	}
+
+	/* the AF will only be its 'length' field with a value of zero */
+	if (n_stuffing_bytes == 1) {
+		nbytes += vidtv_memset(dest_buf,
+				       dest_offset + nbytes,
+				       buf_sz,
+				       0,
+				       n_stuffing_bytes);
+
+		return nbytes;
+	}
+
+	n_stuffing_bytes -= sizeof(ts_adap);
+
+	/* length _immediately_ following 'adaptation_field_length' */
+	ts_adap.length = sizeof(ts_adap) -
+			 sizeof(ts_adap.length) +
+			 n_stuffing_bytes;
+
+	/* write the adap after the TS header */
+	nbytes += vidtv_memcpy(dest_buf,
+			       dest_offset + nbytes,
+			       buf_sz,
+			       &ts_adap,
+			       sizeof(ts_adap));
+
+	/* write the stuffing bytes */
+	nbytes += vidtv_memset(dest_buf,
+			       dest_offset + nbytes,
+			       buf_sz,
+			       TS_FILL_BYTE,
+			       n_stuffing_bytes);
+
+	return nbytes;
+}
+
+static u32 vidtv_pes_write_ts_h(struct pes_ts_header_write_args args)
+{
+	/* number of bytes written by this function */
+	u32    nbytes                  = 0;
+	struct vidtv_mpeg_ts ts_header = {0};
+
+	ts_header.sync_byte        = TS_SYNC_BYTE;
+	ts_header.tei              = 0;
+	ts_header.pid              = args.pid;
+	ts_header.priority         = 0;
+	ts_header.scrambling       = 0;             /* not scrambled */
+	ts_header.adaptation_field = 0;
+	ts_header.payload          = 1;
+
+	ts_header.payload_start      = (!args.wrote_pes_header) ? 1 : 0;
+	ts_header.continuity_counter = *args.continuity_counter;
+
+	/*
+	 * This will trigger a discontinuity if the buffer is full, which is
+	 * what we want: the continuity counter will be incremented but nothing
+	 * will get copied by vidtv_memcpy/vidtv_memset, effectively dropping
+	 * the packet.
+	 */
+	vidtv_ts_inc_cc(args.continuity_counter);
+
+	/* write the TS header */
+	nbytes += vidtv_memcpy(args.dest_buf,
+			       args.dest_offset + nbytes,
+			       args.dest_buf_sz,
+			       &ts_header,
+			       sizeof(ts_header));
+
+	/* write stuffing, if any */
+	nbytes += vidtv_pes_write_stuffing(&ts_header,
+					   args.dest_buf,
+					   args.dest_offset + nbytes,
+					   args.n_stuffing_bytes,
+					   args.dest_buf_sz);
+
+	return nbytes;
+}
+
+u32 vidtv_pes_write_into(struct pes_write_args args)
+{
+	u32 nbytes_past_boundary = (args.dest_offset % TS_PACKET_LEN);
+	bool aligned = (nbytes_past_boundary == 0);
+
+	struct pes_ts_header_write_args ts_header_args = {0};
+	struct pes_header_write_args pes_header_args   = {0};
+
+	/* number of bytes written by this function */
+	u32 nbytes        = 0;
+	u32 remaining_len = args.access_unit_len;
+
+	bool wrote_pes_header = false;
+
+	/* whether we need to stuff the TS packet to align the buffer */
+	bool stuff            = false;
+
+	u32 available_space    = 0;
+	u32 payload_write_len  = 0;
+	u32 num_stuffing_bytes = 0;
+
+	/* Just a sanity check, should not really happen because we stuff the
+	 * TS packet when we finish writing the PES data, but if this happens
+	 * then we have messed up the logic somewhere.
+	 *
+	 * Also note that, unlike packets for PSI data, we need to carry PES
+	 * packets aligned with the payload of transport packets, that is the
+	 * first byte of each PES header must be the first byte in the payload
+	 * of a transport packet. As a consequence, the last byte of a PES
+	 * packet must be the last byte of the payload of a transport packet.
+	 */
+	if (!aligned) {
+		pr_warn_ratelimited("Cannot start a PES packet in a misaligned buffer\n");
+
+		/* forcibly align and hope for the best */
+		nbytes += vidtv_memset(args.dest_buf,
+				       args.dest_offset + nbytes,
+				       args.dest_buf_sz,
+				       TS_FILL_BYTE,
+				       TS_PACKET_LEN - nbytes_past_boundary);
+
+		aligned = true;
+	}
+
+	if (args.send_dts && !args.send_pts) {
+		pr_warn_ratelimited("forbidden value '01' for PTS_DTS flags\n");
+		args.send_pts = true;
+		args.pts      = args.dts;
+	}
+
+	/* see SMPTE 302M clause 6.4 */
+	if (args.is_s302m_pkt) {
+		args.send_dts = false;
+		args.send_pts = true;
+	}
+
+	while (remaining_len) {
+		/*
+		 * The amount of space initially available in the TS packet.
+		 * if this is the beginning of the PES packet, we need to
+		 * take into account the space needed for the TS header _and_
+		 * for the PES header
+		 */
+		available_space = (!wrote_pes_header) ?
+				  TS_PAYLOAD_LEN -
+				  vidtv_pes_h_get_regular_len(args.send_pts,
+							      args.send_dts) :
+				  TS_PAYLOAD_LEN;
+
+		/* if the encoder has inserted stuffing bytes in the PES
+		 * header, account for them.
+		 */
+		available_space -= args.n_pes_h_s_bytes;
+
+		/* whether we need to stuff the TS packet to align the buffer */
+		stuff = remaining_len < available_space;
+
+		/*
+		 * how much of the _actual_ payload we should write in this
+		 * packet.
+		 */
+		payload_write_len = (stuff) ?
+				    remaining_len :
+				    available_space;
+
+		num_stuffing_bytes = available_space - payload_write_len;
+
+		/* write ts header */
+		ts_header_args.dest_buf           = args.dest_buf;
+		ts_header_args.dest_offset        = args.dest_offset + nbytes;
+		ts_header_args.dest_buf_sz        = args.dest_buf_sz;
+		ts_header_args.pid                = args.pid;
+		ts_header_args.continuity_counter = args.continuity_counter;
+		ts_header_args.wrote_pes_header   = wrote_pes_header;
+		ts_header_args.n_stuffing_bytes   = num_stuffing_bytes;
+
+		nbytes += vidtv_pes_write_ts_h(ts_header_args);
+
+		if (!wrote_pes_header) {
+			/* write the PES header only once */
+			pes_header_args.dest_buf        = args.dest_buf;
+
+			pes_header_args.dest_offset     = args.dest_offset +
+							  nbytes;
+
+			pes_header_args.dest_buf_sz     = args.dest_buf_sz;
+			pes_header_args.is_s302m_pkt    = args.is_s302m_pkt;
+			pes_header_args.send_pts        = args.send_pts;
+			pes_header_args.pts             = args.pts;
+			pes_header_args.send_dts        = args.send_dts;
+			pes_header_args.dts             = args.dts;
+			pes_header_args.stream_id       = args.stream_id;
+			pes_header_args.n_pes_h_s_bytes = args.n_pes_h_s_bytes;
+
+			nbytes           += vidtv_pes_write_h(pes_header_args);
+			wrote_pes_header  = true;
+		}
+
+		/* write as much of the payload as we possibly can */
+		nbytes += vidtv_memcpy(args.dest_buf,
+				       args.dest_offset + nbytes,
+				       args.dest_buf_sz,
+				       args.from,
+				       payload_write_len);
+
+		args.from        += payload_write_len;
+		args.dest_offset += nbytes;
+
+		/* Sanity check for underflow. Should not really happen. */
+		if (remaining_len - payload_write_len > remaining_len) {
+			pr_err_ratelimited("Underflow detected\n");
+
+			/* recompute the alignment */
+			nbytes_past_boundary = (args.dest_offset + nbytes) %
+						TS_PACKET_LEN;
+
+			/* forcibly align */
+			nbytes += vidtv_memset(args.dest_buf,
+					       args.dest_offset + nbytes,
+					       args.dest_buf_sz,
+					       TS_FILL_BYTE,
+					       TS_PACKET_LEN -
+					       nbytes_past_boundary);
+
+			/* bailing out is the best that we can do */
+			return nbytes;
+		}
+
+		remaining_len -= payload_write_len;
+	}
+
+	return nbytes;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.h b/drivers/media/test-drivers/vidtv/vidtv_pes.h
new file mode 100644
index 0000000000000..f2cf3872db545
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Vidtv serves as a reference DVB driver and helps validate the existing APIs
+ * in the media subsystem. It can also aid developers working on userspace
+ * applications.
+ *
+ * This file contains the logic to translate the ES data for one access unit
+ * from an encoder into MPEG TS packets. It does so by first encapsulating it
+ * with a PES header and then splitting it into TS packets.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_PES_H
+#define VIDTV_PES_H
+
+#include <asm/byteorder.h>
+#include <linux/types.h>
+
+#include "vidtv_common.h"
+
+#define PES_MAX_LEN 65536 /* Set 'length' to 0 if greater */
+#define PES_START_CODE_PREFIX 0x001 /* 00 00 01 */
+
+struct vidtv_pes_optional_pts {
+	struct {
+	#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 marker3:1; /* always 0x1 */
+		u16 pts3:15;
+		u8 marker2:1; /* always 0x1 */
+		u16 pts2:15;
+		u8 marker1:1; /* always 0x1 */
+		u8 pts1:3;
+		u8 two:4; /* always 0010b */
+	#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 two:4; /* always 0010b */
+		u8 pts1:3;
+		u8 marker1:1; /* always 0x1 */
+		u16 pts2:15;
+		u8 marker2:1; /* always 0x1 */
+		u16 pts3:15;
+		u8 marker3:1; /* always 0x1 */
+	#else
+	#error  "Unknown bit ordering"
+	#endif
+	} __packed;
+} __packed;
+
+struct vidtv_pes_optional_pts_dts {
+	struct {
+	#if defined(__LITTLE_ENDIAN_BITFIELD)
+		u8 marker6:1; /* always 0x1 */
+		u16 dts3:15;
+		u8 marker5:1; /* always 0x1 */
+		u16 dts2:15;
+		u8 marker4:1; /* always 0x1 */
+		u8 dts1:3;
+		u8 one:4; /* always 0001b */
+		u8 marker3:1; /* always 0x1 */
+		u16 pts3:15;
+		u8 marker2:1; /* always 0x1 */
+		u16 pts2:15;
+		u8 marker1:1; /* always 0x1 */
+		u8 pts1:3;
+		u8 three:4; /* always 0011b */
+	#elif defined(__BIG_ENDIAN_BITFIELD)
+		u8 three:4; /* always 0011b */
+		u8 pts1:3;
+		u8 marker1:1; /* always 0x1 */
+		u16 pts2:15;
+		u8 marker2:1; /* always 0x1 */
+		u16 pts3:15;
+		u8 marker3:1; /* always 0x1 */
+		u8 one:4; /* always 0001b */
+		u8 dts1:3;
+		u8 marker4:1; /* always 0x1 */
+		u16 dts2:15;
+		u8 marker5:1; /* always 0x1 */
+		u16 dts3:15;
+		u8 marker6:1; /* always 0x1 */
+	#else
+	#error  "Unknown bit ordering"
+	#endif
+	} __packed;
+} __packed;
+
+struct vidtv_pes_optional {
+	union {
+		__be16 bitfield;
+		struct {
+			u16 two:2; /* always 0x2*/
+			u16 PES_scrambling_control:2;
+			u16 PES_priority:1;
+			u16 data_alignment_indicator:1; /* ununsed for us */
+			u16 copyright:1;
+			u16 original_or_copy:1;
+			u16 PTS_DTS:2;
+			/* These flags show which components are actually
+			 * present in the "optinal fields" in the optinal PES
+			 * header and which are not. Vidtv currently does
+			 * not need any of these.
+			 */
+			u16 ESCR:1;
+			u16 ES_rate:1;
+			u16 DSM_trick_mode:1;
+			u16 additional_copy_info:1;
+			u16 PES_CRC:1;
+			u16 PES_extension:1;
+		} __packed;
+	} __packed;
+	u8 length;
+} __packed;
+
+struct vidtv_mpeg_pes {
+	union {
+		__be32 bitfield;
+		struct {
+			/* These two together make the 32-bit start-code */
+			u32  packet_start_code_prefix:24;
+			u32  stream_id:8;
+		} __packed;
+	} __packed;
+	/* after this field until the end of the PES data payload */
+	u16 length;
+	struct vidtv_pes_optional optional[];
+} __packed;
+
+struct pes_header_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u32 dest_buf_sz;
+	bool is_s302m_pkt;
+
+	bool send_pts;
+	u64 pts;
+
+	bool send_dts;
+	u64 dts;
+
+	u16 stream_id;
+	/* might be used by an encoder if needed, gets discarded by decoder */
+	u32 n_pes_h_s_bytes;
+};
+
+struct pes_ts_header_write_args {
+	void *dest_buf;
+	u32 dest_offset;
+	u32 dest_buf_sz;
+	u16 pid;
+	u8 *continuity_counter;
+	bool wrote_pes_header;
+	u32 n_stuffing_bytes;
+};
+
+struct pes_write_args {
+	void *dest_buf; /* pointer to a program mux buffer */
+	void *from; /* pointer to the encoder buffer */
+
+	/* the size of one access unit (with any headers it might need) */
+	u32 access_unit_len;
+
+	u32 dest_offset; /* where to start writing in the program mux buffer */
+	u32 dest_buf_sz; /* how big is the program mux buffer */
+	u16 pid; /* TS packet ID */
+
+	/* use SMPTE 302M to packetize the data */
+	bool is_s302m_pkt;
+
+	u8 *continuity_counter; /* incremented for every TS packet */
+
+	/* Examples: Audio streams (0xc0-0xdf), Video streams (0xe0-0xef) */
+	u16 stream_id;
+
+	bool send_pts;
+	u64 pts;
+
+	bool send_dts;
+	u64 dts;
+
+	/* might be used by an encoder if needed, gets discarded by decoder */
+	u32 n_pes_h_s_bytes;
+};
+
+u32 vidtv_pes_write_into(struct pes_write_args args);
+
+#endif // VIDTV_PES_H
-- 
2.26.2

