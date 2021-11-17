Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0755C454DF3
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240522AbhKQThS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:45426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240499AbhKQThJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B837561BE6;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177650;
        bh=OOU7nHtuqaXPzlQ7rGTi/t2xWpp7EYM2H41Ydasbcw0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SmEayH636xR25T3xqg+hPUJSsAaQgQInvoMH+6HsPoVcVoVcN24YanKoCFtUfyhNS
         nCe+vkvCiwcgixbNHbXtifucXpJp054sMklZr/fiApHaN45mRwsuxSFQlD1O5XkPB7
         rEw91gYaczzLYl8ncGvB6oIccd/PasYSTSs0IC1u4IlTgPirbm1yVI/dhfo5bP/TzH
         B1ytl5e0X+Y6TBZXFOuCsuHoZZGUgezo1+mY6Ba/Dvobmf28i8QOB3pM/2uJ1oYlUQ
         5AmM360nAr+P/7HVfsNsrZvuYuMEB3sgXE5AwGpPWmCqTUlggGr29AmhOhp9pOdba1
         8eXQl494JuzRg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHr-4I; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Xu Wang <vulab@iscas.ac.cn>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 6/8] media: atomisp: frame.c: drop a now-unused function
Date:   Wed, 17 Nov 2021 19:34:04 +0000
Message-Id: <c32cebc9b8124798e24d85adf803369305e3dfb9.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ia_css_frame_find_crop_resolution() is not used anymore.

So, remove it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 .../runtime/frame/interface/ia_css_frame.h    | 19 -----
 .../atomisp/pci/runtime/frame/src/frame.c     | 70 -------------------
 2 files changed, 89 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
index 51ec7073d860..c756a134efc3 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame.h
@@ -141,23 +141,4 @@ bool ia_css_frame_is_same_type(
 int ia_css_dma_configure_from_info(struct dma_port_config *config,
 				   const struct ia_css_frame_info *info);
 
-/* ISP2401 */
-/* @brief Finds the cropping resolution
- * This function finds the maximum cropping resolution in an input image keeping
- * the aspect ratio for the given output resolution.Calculates the coordinates
- * for cropping from the center and returns the starting pixel location of the
- * region in the input image. Also returns the dimension of the cropping
- * resolution.
- *
- * @param
- * @param[in]	in_res		Resolution of input image
- * @param[in]	out_res		Resolution of output image
- * @param[out]	crop_res	Crop resolution of input image
- * @return	Returns 0 or -EINVAL on error
- */
-int
-ia_css_frame_find_crop_resolution(const struct ia_css_resolution *in_res,
-				  const struct ia_css_resolution *out_res,
-				  struct ia_css_resolution *crop_res);
-
 #endif /* __IA_CSS_FRAME_H__ */
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index e3242652f296..a3aae638b0bf 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -933,73 +933,3 @@ void ia_css_resolution_to_sp_resolution(
 	to->width  = (uint16_t)from->width;
 	to->height = (uint16_t)from->height;
 }
-
-/* ISP2401 */
-int
-ia_css_frame_find_crop_resolution(const struct ia_css_resolution *in_res,
-				  const struct ia_css_resolution *out_res,
-				  struct ia_css_resolution *crop_res) {
-	u32 wd_even_ceil, ht_even_ceil;
-	u32 in_ratio, out_ratio;
-
-	if ((!in_res) || (!out_res) || (!crop_res))
-		return -EINVAL;
-
-	IA_CSS_ENTER_PRIVATE("in(%ux%u) -> out(%ux%u)", in_res->width,
-			     in_res->height, out_res->width, out_res->height);
-
-	if ((in_res->width == 0)
-	    || (in_res->height == 0)
-	    || (out_res->width == 0)
-	    || (out_res->height == 0))
-		return -EINVAL;
-
-	if ((out_res->width > in_res->width) ||
-	    (out_res->height > in_res->height))
-		return -EINVAL;
-
-	/* If aspect ratio (width/height) of out_res is higher than the aspect
-	 * ratio of the in_res, then we crop vertically, otherwise we crop
-	 * horizontally.
-	 */
-	in_ratio = in_res->width * out_res->height;
-	out_ratio = out_res->width * in_res->height;
-
-	if (in_ratio == out_ratio)
-	{
-		crop_res->width = in_res->width;
-		crop_res->height = in_res->height;
-	} else if (out_ratio > in_ratio)
-	{
-		crop_res->width = in_res->width;
-		crop_res->height = ROUND_DIV(out_res->height * crop_res->width,
-					     out_res->width);
-	} else
-	{
-		crop_res->height = in_res->height;
-		crop_res->width = ROUND_DIV(out_res->width * crop_res->height,
-					    out_res->height);
-	}
-
-	/* Round new (cropped) width and height to an even number.
-	 * binarydesc_calculate_bds_factor is such that we should consider as
-	 * much of the input as possible. This is different only when we end up
-	 * with an odd number in the last step. So, we take the next even number
-	 * if it falls within the input, otherwise take the previous even no.
-	 */
-	wd_even_ceil = EVEN_CEIL(crop_res->width);
-	ht_even_ceil = EVEN_CEIL(crop_res->height);
-	if ((wd_even_ceil > in_res->width) || (ht_even_ceil > in_res->height))
-	{
-		crop_res->width = EVEN_FLOOR(crop_res->width);
-		crop_res->height = EVEN_FLOOR(crop_res->height);
-	} else
-	{
-		crop_res->width = wd_even_ceil;
-		crop_res->height = ht_even_ceil;
-	}
-
-	IA_CSS_LEAVE_PRIVATE("in(%ux%u) -> out(%ux%u)", crop_res->width,
-			     crop_res->height, out_res->width, out_res->height);
-	return 0;
-}
-- 
2.33.1

