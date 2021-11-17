Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4AC454393
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbhKQJ2k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:58782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231737AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E094163236;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141141;
        bh=JPtfiDskqRu45fZUTwHrZSkZPXeeu6UODoEyeI/gEPA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kZlEf/t/s1b6SPbTXNywQQ8W5Wv69/SwRTuAWcg5Zkt+EpcNXZEVVNB9xmKMEVjie
         F8CW5Hv+TLFTOitnD7KmTJsA2L9p4w4edlKO8pTDwxO1+/Uf6cUjBRwYu3JkoaTj8D
         QRohhS/WTOb3ZD/wMtwrqKEH8rjfk2I3+upEqD+/lPAmPWTrj5vErSPj3r004R6h8V
         V0CZAoDVtrZyLVNRocoE8RKXOoLsqwY48HE14CxGvtpwaE85qv2HPe9TEVRNWtmN66
         bV7lZ0KEJlMDPYJUrQVmF37UuG7GzFN5VH9eFtjCEfDsmm9VoYUyFngxPYM2olFE8D
         i3PrKnMZqaT1A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb67-BZ; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 11/13] media: atomisp: sh_css_param_shading: fix comments coding style
Date:   Wed, 17 Nov 2021 09:25:36 +0000
Message-Id: <e388d845e26d77b339e49f7d00105d031db7055e.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
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
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/sh_css_param_shading.c  | 52 +++++++++++++------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 02faf5069bb8..90b5f9014c5e 100644
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
@@ -271,14 +278,26 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 		      bds_denominator -
 		      binary->info->sp.pipeline.top_cropping;
 
+	/*
+	 * We take into account the binning done by the sensor. We do this
+	 * by cropping the non-binned part of the shading table and then
+	 * increasing the size of a grid cell with this same binning factor.
+	 */
 	input_width   *= sensor_binning;
 	input_height  *= sensor_binning;
+	/*
+	 * We also scale the padding by the same binning factor. This will
+	 * make it much easier later on to calculate the padding of the
+	 * shading table.
+	 */
 	left_padding  *= sensor_binning;
 	right_padding *= sensor_binning;
 	top_padding   *= sensor_binning;
 
-	/* during simulation, the used resolution can exceed the sensor
-	   resolution, so we clip it. */
+	/*
+	 * during simulation, the used resolution can exceed the sensor
+	 * resolution, so we clip it.
+	 */
 	input_width  = min(input_width,  in_table->sensor_width);
 	input_height = min(input_height, in_table->sensor_height);
 
@@ -296,8 +315,10 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
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
@@ -354,9 +375,10 @@ ia_css_shading_table_free(struct ia_css_shading_table *table)
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

