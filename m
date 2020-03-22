Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90DB818ECBA
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2020 22:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCVVk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 17:40:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56642 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgCVVk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 17:40:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 27AD62938BF
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH v2 0/6] v4l2 JPEG helpers and CODA960 JPEG decoder
In-Reply-To: <20200318183536.15779-1-p.zabel@pengutronix.de>
References: <20200318183536.15779-1-p.zabel@pengutronix.de>
Date:   Sun, 22 Mar 2020 23:41:22 +0200
Message-ID: <87eetkgj99.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=-=-=
Content-Type: text/plain; format=flowed

Hi Philipp,

Tested-by: Adrian Ratiu <adrian.ratiu@collabora.com>

Awesome work! I'm testing this series with the following two
patches applied on top to extend functionality a bit. Please
feel free to include these changes in your next version if
you plan one.

During testing a weird bug was discovered in both v1 and v2
causing color degradation in raw YUV decoded images. Will
send test files and exact reproduction steps in another mail.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
 filename=0001-media-coda-jpeg-support-optimized-huffman-tables.patch

From 13e8894cad8a41391bb417f1c5f6b6a16edd6695 Mon Sep 17 00:00:00 2001
From: Adrian Ratiu <adrian.ratiu@collabora.com>
Date: Wed, 18 Mar 2020 09:07:22 +0200
Subject: [PATCH 1/2] media: coda: jpeg: support optimized huffman tables

Each jpeg can have the huffman tables optimized for its specific content
meaning that the table lenghts and values don't match the standard table
of substitutions so there's no reason to hardcode and expect the sandard
lenghts, otherwise we just end up rejecting optimized jpegs altogether.

Tested on CODA960.

Change-Id: I8763801dfac944bf08c4ae6fbcd94ce8de2bd432
---
 drivers/media/platform/coda/coda-jpeg.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 6a11b64efb6b..162ba28a6b95 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -343,7 +343,8 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 			v4l2_err(&dev->v4l2_dev, "missing Huffman table\n");
 			return -EINVAL;
 		}
-		if (huffman_tables[i].length != ((i & 2) ? 178 : 28)) {
+		if (huffman_tables[i].length < 17 ||
+		    huffman_tables[i].length > 178) {
 			v4l2_err(&dev->v4l2_dev,
 				 "invalid Huffman table %d length: %zu\n",
 				 i, huffman_tables[i].length);
@@ -357,10 +358,12 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 			return -ENOMEM;
 		ctx->params.jpeg_huff_tab = huff_tab;
 	}
-	memcpy(huff_tab->luma_dc, huffman_tables[0].start, 16 + 12);
-	memcpy(huff_tab->chroma_dc, huffman_tables[1].start, 16 + 12);
-	memcpy(huff_tab->luma_ac, huffman_tables[2].start, 16 + 162);
-	memcpy(huff_tab->chroma_ac, huffman_tables[3].start, 16 + 162);
+
+	memset(huff_tab, 0, sizeof(*huff_tab));
+	memcpy(huff_tab->luma_dc, huffman_tables[0].start, huffman_tables[0].length);
+	memcpy(huff_tab->chroma_dc, huffman_tables[1].start, huffman_tables[1].length);
+	memcpy(huff_tab->luma_ac, huffman_tables[2].start, huffman_tables[2].length);
+	memcpy(huff_tab->chroma_ac, huffman_tables[3].start, huffman_tables[3].length);
 
 	/* check scan header */
 	for (i = 0; i < scan_header.num_components; i++) {
-- 
2.25.2


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
 filename=0002-media-coda-be-more-flexible-wrt-jpeg-dimensions.patch

From bf6e82057c7423dfa96ac76d75547ce6dc5f1caf Mon Sep 17 00:00:00 2001
From: Adrian Ratiu <adrian.ratiu@collabora.com>
Date: Sun, 22 Mar 2020 22:33:13 +0200
Subject: [PATCH 2/2] media: coda: be more flexible wrt jpeg dimensions

Don't require jpeg dimensions to exactly match the format dimensions,
so we are able to decode and display a wider range jpegs instead of
outright rejecting ones like the following:

coda 2040000.vpu: dimensions don't match format: 700x523
coda 2040000.vpu: failed to decode JPEG header: -22

Change-Id: I385082e43c896c81ea4aa09c49d87e9347ec4058
---
 drivers/media/platform/coda/coda-jpeg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 162ba28a6b95..8427d7a37bed 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -302,10 +302,10 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 	}
 
 	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
-	if (header.frame.height != q_data_src->height ||
-	    header.frame.width != q_data_src->width) {
+	if (header.frame.height > q_data_src->height ||
+	    header.frame.width > q_data_src->width) {
 		v4l2_err(&dev->v4l2_dev,
-			 "dimensions don't match format: %dx%d\n",
+			 "dimensions don't fit: %dx%d\n",
 			 header.frame.width, header.frame.height);
 		return -EINVAL;
 	}
-- 
2.25.2


--=-=-=
Content-Type: text/plain; format=flowed


Thanks,
Adrian

On Wed, 18 Mar 2020, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Hi,
>
> the JPEG header parser is updated to accept up to four components,
> baseline and extended-sequential DCT encoded images, 8-bit and 12-bit
> precision, as well as 8-bit and 16-bit quantization tables. As a
> consequence, all drivers will have to check the number of components,
> precision, and quantization table lengths.
>
> I have not yet added support parsing the Adobe APP14 headers to
> determine the color encoding, as it is unclear to me how it could be
> used to signal RGBA components - for 4-component images it is defined
> to disambiguate between CMYK and YCCK encodings. This is implemented
> in libjpeg.
> Patching the header data in place to normalize the component identifiers
> is not part of the parser and will be added in a separate patch.
>
> For now the rcar_jpu, s5p-jpeg and mtk-jpeg conversions are dropped.
> Instead, a few CODA fixes were added that should avoid alignment issues
> with odd-sized JPEG images and that stop tricking GStreamer into
> negotiating NV12 and then switching to YUV420 instead in S_FMT.
>
> regards
> Philipp
>
> Philipp Zabel (6):
>   media: coda: round up decoded buffer size for all codecs
>   media: add v4l2 JPEG helpers
>   media: coda: jpeg: add CODA960 JPEG decoder support
>   media: coda: split marking last meta into helper function
>   media: coda: mark last capture buffer
>   media: coda: lock capture queue wakeup against decoder stop command
>
>  drivers/media/platform/Kconfig            |   1 +
>  drivers/media/platform/coda/coda-common.c | 188 ++++++-
>  drivers/media/platform/coda/coda-jpeg.c   | 572 ++++++++++++++++++++
>  drivers/media/platform/coda/coda.h        |  10 +-
>  drivers/media/v4l2-core/Kconfig           |   4 +
>  drivers/media/v4l2-core/Makefile          |   2 +
>  drivers/media/v4l2-core/v4l2-jpeg.c       | 632 ++++++++++++++++++++++
>  include/media/v4l2-jpeg.h                 | 135 +++++
>  8 files changed, 1519 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
>  create mode 100644 include/media/v4l2-jpeg.h
>
> -- 
> 2.20.1

--=-=-=--
