Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF6845445E
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235741AbhKQKAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:00:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:35302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235772AbhKQJ7z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5130C63236;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=aczrk+XllTztbH6L0TApOwbUxptx0aie2TIp55Hc+44=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qyWL9JkcLC8udy+GThZWclGjyoCAALcR4z8uyhA1cOR6t5xn47UgH9LPFY8FlAfCR
         gPfmV+L4uVxL2atXah573dmhqiY1Oy3xUOKbYy8MFWPkV4b0ZK5IGnzRz2JOq7oyhu
         pZrzh+BvS3eVXmEoDmsACi/wwk9wbhUBJON38w4KuyPhyOjcoW8wBjQ83iYLWjQXm3
         u+szVGUh+TFGChXIwtCSsp1UH2qRzXdRs1dpgFyUh7qqMTKFtZayi7OlQQP+qA2ksE
         /Y6J9Jfb5MJS7lwgmWwZWhtOTNQ0OJZO2DBHRn3TAG84bChXyXWkaTf0KYl4JTAhLc
         sW3CJL2ZaFmmQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUw-9Z; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 11/12] media: atomisp: sh_css_param_shading: fix comments coding style
Date:   Wed, 17 Nov 2021 09:56:53 +0000
Message-Id: <3b941c5a19680ea9d42527152b56685acd681b09.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The comments are not following Kernel coding style.

Also, there are two missing comments that are found at the Intel Aero
device driver code. Add them.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/sh_css_param_shading.c  | 58 ++++++++++++-------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 0abd5bf36b7f..41a4c9162319 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -118,8 +118,10 @@ crop_and_interpolate(unsigned int cropped_width,
 		int ty, src_y0, src_y1;
 		unsigned int sy0, sy1, dy0, dy1, divy;
 
-		/* calculate target point and make sure it falls within
-		   the table */
+		/*
+		 * calculate target point and make sure it falls within
+		 * the table
+		 */
 		ty = out_start_row + i * out_cell_size;
 
 		/* calculate closest source points in shading table and
@@ -166,19 +168,24 @@ crop_and_interpolate(unsigned int cropped_width,
 			src_x1 = clamp(src_x1, 0, (int)table_width - 1);
 			tx = min(clamp(tx, 0, (int)sensor_width - 1),
 				 (int)table_cell_w);
-			/* calculate closest source points for distance
-			   computation */
+			/*
+			 * calculate closest source points for distance
+			 * computation
+			 */
 			sx0 = min(src_x0 * in_cell_size, sensor_width - 1);
 			sx1 = min(src_x1 * in_cell_size, sensor_width - 1);
-			/* calculate distances between source and target
-			   pixels */
+			/*
+			 * calculate distances between source and target
+			 * pixels
+			 */
 			dx0 = tx - sx0;
 			dx1 = sx1 - tx;
 			divx = sx1 - sx0;
 			/* if we're at the edge, we just use the closest
-			   point still in the grid. We make up for the divider
-			   in this case by setting the distance to
-			   out_cell_size, since it's actually 0. */
+			 * point still in the grid. We make up for the divider
+			 * in this case by setting the distance to
+			 * out_cell_size, since it's actually 0.
+			 */
 			if (divx == 0) {
 				dx0 = 1;
 				divx = 1;
@@ -271,20 +278,26 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 		      bds_denominator -
 		      binary->info->sp.pipeline.top_cropping;
 
-	/* We take into account the binning done by the sensor. We do this
-	   by cropping the non-binned part of the shading table and then
-	   increasing the size of a grid cell with this same binning factor. */
+	/*
+	 * We take into account the binning done by the sensor. We do this
+	 * by cropping the non-binned part of the shading table and then
+	 * increasing the size of a grid cell with this same binning factor.
+	 */
 	input_width  <<= sensor_binning;
 	input_height <<= sensor_binning;
-	/* We also scale the padding by the same binning factor. This will
-	   make it much easier later on to calculate the padding of the
-	   shading table. */
+	/*
+	 * We also scale the padding by the same binning factor. This will
+	 * make it much easier later on to calculate the padding of the
+	 * shading table.
+	 */
 	left_padding  <<= sensor_binning;
 	right_padding <<= sensor_binning;
 	top_padding   <<= sensor_binning;
 
-	/* during simulation, the used resolution can exceed the sensor
-	   resolution, so we clip it. */
+	/*
+	 * during simulation, the used resolution can exceed the sensor
+	 * resolution, so we clip it.
+	 */
 	input_width  = min(input_width,  in_table->sensor_width);
 	input_height = min(input_height, in_table->sensor_height);
 
@@ -302,8 +315,10 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 	result->sensor_height = in_table->sensor_height;
 	result->fraction_bits = in_table->fraction_bits;
 
-	/* now we crop the original shading table and then interpolate to the
-	   requested resolution and decimation factor. */
+	/*
+	 * now we crop the original shading table and then interpolate to the
+	 * requested resolution and decimation factor.
+	 */
 	for (i = 0; i < IA_CSS_SC_NUM_COLORS; i++) {
 		crop_and_interpolate(input_width, input_height,
 				     left_padding, right_padding, top_padding,
@@ -360,9 +375,10 @@ ia_css_shading_table_free(struct ia_css_shading_table *table)
 	if (!table)
 		return;
 
-	/* We only output logging when the table is not NULL, otherwise
+	/*
+	 * We only output logging when the table is not NULL, otherwise
 	 * logs will give the impression that a table was freed.
-	 * */
+	 */
 	IA_CSS_ENTER("");
 
 	for (i = 0; i < IA_CSS_SC_NUM_COLORS; i++) {
-- 
2.33.1

