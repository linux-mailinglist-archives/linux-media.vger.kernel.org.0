Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAF51899A4
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 11:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgCRKkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 06:40:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42536 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgCRKkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 06:40:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 3A1AE28C44A
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
In-Reply-To: <20191113150538.9807-1-p.zabel@pengutronix.de>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
Date:   Wed, 18 Mar 2020 12:41:38 +0200
Message-ID: <87sgi6gd25.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=-=-=
Content-Type: text/plain; format=flowed

Hi Philipp,

Further testing revealed the decoder rejects jpegs with optimized 
huffman tables, but the following decoder patch makes them work.

Feel free to include these changes in your next version.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
 filename=0001-media-coda-jpeg-support-optimized-huffman-tables.patch

From 684332544247775eb76fcbd4c4b6b25d78b6d8f3 Mon Sep 17 00:00:00 2001
From: Adrian Ratiu <adrian.ratiu@collabora.com>
Date: Wed, 18 Mar 2020 09:07:22 +0200
Subject: [PATCH] media: coda: jpeg: support optimized huffman tables

Each jpeg can have the huffman tables optimized for its specific content
meaning that the table lenghts and values don't match the standard table
of substitutions so there's no reason to hardcode and expect the sandard
lenghts, otherwise we just end up rejecting optimized jpegs altogether.

Tested on CODA960.
---
 drivers/media/platform/coda/coda-jpeg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 877bfea4a014..ef57c0d7a00a 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -327,7 +327,7 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 			v4l2_err(&dev->v4l2_dev, "missing Huffman table\n");
 			return -EINVAL;
 		}
-		if (huffman_tables[i].length != ((i & 2) ? 178 : 28)) {
+		if (huffman_tables[i].length < 17) {
 			v4l2_err(&dev->v4l2_dev,
 				 "invalid Huffman table %d length: %zu\n", i,
 				 huffman_tables[i].length);
@@ -342,13 +342,13 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 		ctx->params.jpeg_huff_tab = huff_tab;
 	}
 	memcpy(huff_tab->dc_bits[0], huffman_tables[0].start, 16);
-	memcpy(huff_tab->dc_values[0], huffman_tables[0].start + 16, 12);
+	memcpy(huff_tab->dc_values[0], huffman_tables[0].start + 16, huffman_tables[0].length - 16);
 	memcpy(huff_tab->dc_bits[1], huffman_tables[1].start, 16);
-	memcpy(huff_tab->dc_values[1], huffman_tables[1].start + 16, 12);
+	memcpy(huff_tab->dc_values[1], huffman_tables[1].start + 16, huffman_tables[1].length - 16);
 	memcpy(huff_tab->ac_bits[0], huffman_tables[2].start, 16);
-	memcpy(huff_tab->ac_values[0], huffman_tables[2].start + 16, 162);
+	memcpy(huff_tab->ac_values[0], huffman_tables[2].start + 16, huffman_tables[2].length - 16);
 	memcpy(huff_tab->ac_bits[1], huffman_tables[3].start, 16);
-	memcpy(huff_tab->ac_values[1], huffman_tables[3].start + 16, 162);
+	memcpy(huff_tab->ac_values[1], huffman_tables[3].start + 16, huffman_tables[3].length - 16);
 
 	/* check scan header */
 	for (i = 0; i < scan_header.num_components; i++) {
-- 
2.25.1


--=-=-=
Content-Type: text/plain; format=flowed


Adrian

On Wed, 13 Nov 2019, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Hi,
>
> as far as I can tell we currently have three JPEG header parsers in the
> media tree (in the rcar_jpu, s5p-jpeg, and mtk-jpeg drivers). I would
> like to add support for the CODA960 JPEG decoder to the coda-vpu driver
> without adding yet another.
>
> To this end, this patch series adds some common JPEG code to v4l2-core.
> For now this just contains header parsing helpers (I have tried to keep
> the terminology close to JPEG ITU-T.81) that should be usable for all of
> the current drivers. In the future we might want to move JPEG header
> generation for encoders and common quantization tables in there as well.
>
> I have tested this on hardware only with coda-vpu, the other drivers are
> just compile-tested.
>
> Feedback very welcome, especially whether this actually works for the
> other drivers, and if this could be structured any better. I'm a bit
> unhappy with the (current) need for separate frame/scan header and
> quantization/hfufman table parsing functions, but those are required
> by s5p-jpeg, which splits localization and parsing of the marker
> segments. Also, could this be used for i.MX8 JPEGDEC as is?
>
> regards
> Philipp
>
> Philipp Zabel (5):
>   media: add v4l2 JPEG helpers
>   media: coda: jpeg: add CODA960 JPEG decoder support
>   media: rcar_jpu: use V4L2 JPEG helpers
>   media: s5p-jpeg: use v4l2 JPEG helpers
>   media: mtk-jpeg: use V4L2 JPEG helpers
>
>  drivers/media/platform/Kconfig                |   4 +
>  drivers/media/platform/coda/coda-common.c     | 124 +++-
>  drivers/media/platform/coda/coda-jpeg.c       | 551 ++++++++++++++++
>  drivers/media/platform/coda/coda.h            |  11 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_parse.c  | 138 +---
>  drivers/media/platform/rcar_jpu.c             |  94 +--
>  drivers/media/platform/s5p-jpeg/jpeg-core.c   | 388 +++--------
>  drivers/media/platform/s5p-jpeg/jpeg-core.h   |  14 +-
>  drivers/media/v4l2-core/Kconfig               |   4 +
>  drivers/media/v4l2-core/Makefile              |   2 +
>  drivers/media/v4l2-core/v4l2-jpeg.c           | 614 ++++++++++++++++++
>  include/media/v4l2-jpeg.h                     | 135 ++++
>  12 files changed, 1580 insertions(+), 499 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
>  create mode 100644 include/media/v4l2-jpeg.h
>
> -- 
> 2.20.1

--=-=-=--
