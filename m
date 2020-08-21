Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C9424D4A5
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgHUMGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:06:05 -0400
Received: from mail2.skidata.com ([91.230.2.91]:13667 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728380AbgHUMF7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:05:59 -0400
X-Greylist: delayed 431 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Aug 2020 08:05:58 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598011558; x=1629547558;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=CtNUV+9wjaZRe+QdvUN4CbCxHU/f+RRPuYnHIY6MUFw=;
  b=cNF6ZGPWkvwHOwIsdY07gg2koGRCVvgdEiZk/MMsQoko0+9WVHItkSPc
   O3oZGjVd+hIb25729BIpp9HpLRkziEpxKWTLoSdZk00lKpJnhQdo9O+K1
   kr6dmRBd9+EdMUXJ2OhKQLozZdouMpzt1pfiMZnGvFJCiuI4UJEicbTj9
   xH6fSCpf47Klzehm9T51t6J8kXOk1xwQ0o+qJT1okrpNJhgn7S29cG3zL
   YoLLVean4nPos5toDw3u8EGUaaCo9FjEIn2XQMTPEHrN5Na/nj11lYAzz
   iY3XNiEPvqWd90bj7QtYxp2Om/7bpK6QdE4Msr1xIv/zgB4C3yuSX1Ujr
   A==;
IronPort-SDR: RTzd4QQ6lzhjElaXYZWeeSW9IEiOKMxizCT/a/C3X6v8STbNckRUANGR5KBJpCMLKIKmxp7zs4
 1hxc5jL8gBZA0BptT1KuFPnN9veFvBNi/Uvraff4BoIdA4rTCsDvhoStFgjFBZqu4S2cxeCmiG
 dqIG/z0+pAyJjAAQeYhT17/Yres3n/24sPrp7JVGU1TZnwFNnKSchU7ne9YXxg7S31Kj7PFIqk
 /nFQargADrxNUmWIOcpLO38HXKSQ9BVTm/scvatWZyThovRJgJuHkjMY00A1itsKg9ze20jy3H
 Z+s=
X-IronPort-AV: E=Sophos;i="5.76,335,1592863200"; 
   d="scan'208";a="2647786"
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Richard Leitner - SKIDATA" <Richard.Leitner@skidata.com>
Subject: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Topic: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Index: AdZ3sFkqxzglukE+Rf6iMENtrYblXQ==
Date:   Fri, 21 Aug 2020 11:58:45 +0000
Message-ID: <3b140eaf883b4666985c0be0db8d53e8@skidata.com>
Accept-Language: en-US, de-AT
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The prefetcher requires two 256 byte periods beyond the current one.
However, currently it is only checked if there are at least 512 bytes
beyond the current meta available.
This only works under the assumption that every buffer has a size of
at least 256 bytes.

To ensure that the requirement is fulfilled with buffers < 256 bytes,
the queue head and the queue tail must not be below this threshold.
Otherwise, additional buffers are enqueued to ensure a full window.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/media/platform/coda/coda-bit.c | 8 ++++++--
 drivers/media/platform/coda/coda.h     | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platfor=
m/coda/coda-bit.c
index b021604eceaa..8158f3b34b36 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -323,7 +323,7 @@ static bool coda_bitstream_try_queue(struct coda_ctx *c=
tx,
 void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_li=
st)
 {
 	struct vb2_v4l2_buffer *src_buf;
-	struct coda_buffer_meta *meta;
+	struct coda_buffer_meta *meta, *last_meta;
 	u32 start;
=20
 	if (ctx->bit_stream_param & CODA_BIT_STREAM_END_FLAG)
@@ -343,6 +343,8 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct l=
ist_head *buffer_list)
 		    ctx->num_metas >=3D ctx->num_internal_frames) {
 			meta =3D list_first_entry(&ctx->buffer_meta_list,
 						struct coda_buffer_meta, list);
+			last_meta =3D list_last_entry(&ctx->buffer_meta_list,
+						struct coda_buffer_meta, list);
=20
 			/*
 			 * If we managed to fill in at least a full reorder
@@ -352,7 +354,8 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct l=
ist_head *buffer_list)
 			 * the first buffer to fetch, we can safely stop queuing
 			 * in order to limit the decoder drain latency.
 			 */
-			if (coda_bitstream_can_fetch_past(ctx, meta->end))
+			if (!meta->below_threshold && !last_meta->below_threshold &&
+				coda_bitstream_can_fetch_past(ctx, meta->end))
 				break;
 		}
=20
@@ -403,6 +406,7 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct l=
ist_head *buffer_list)
 				meta->start =3D start;
 				meta->end =3D ctx->bitstream_fifo.kfifo.in;
 				meta->last =3D src_buf->flags & V4L2_BUF_FLAG_LAST;
+				meta->below_threshold =3D (meta->end - meta->start) < 256;
 				if (meta->last)
 					coda_dbg(1, ctx, "marking last meta");
 				spin_lock(&ctx->buffer_meta_lock);
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/co=
da/coda.h
index b81f3aca9209..6f77553e81b8 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -160,6 +160,7 @@ struct coda_buffer_meta {
 	unsigned int		start;
 	unsigned int		end;
 	bool			last;
+	bool			below_threshold;
 };
=20
 /* Per-queue, driver-specific private data */
--=20
2.25.1

