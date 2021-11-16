Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCF24530C4
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235597AbhKPLd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:33:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:35392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234925AbhKPLcl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9D6363238;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=sbkcS2Nj5P00ypwpQDsboabWRRg1AHwqlkNzWNXAcig=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qHWZZLuJ2DbW//sutFv601ZIqI7Aj68AIn24L6s8AFfOneecsGOz6g0PQbgCeKFyZ
         pMHEx21I2CZHk7r6nc0K4871qyKmzxMaCy6qxBoxWNu3MeyMhh9gSx4GuPLA9nAKnX
         zhRVmcMmBF1EVBiJR0dkjmDHoqhy/Jvi/shuSSJar1/SC8z4CdY+JYS5YKvRcv3l6V
         OTXQ0a+zgl4P3ZdOAw5FoahGVRTUTCguf2bKKlVi63O0vJ2M5Iea5gX1CX/FdxMAgE
         Ar0XDpPsryxj0pSNKbpyitQ/cnGSCsB1aoskWb/KsgnQWXNNLTJ5HWrpEYRNixkoD4
         EHPodt7DEy0ZQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfj-Ij; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 13/23] media: atomisp: solve #ifdef HAS_NO_PACKED_RAW_PIXELS
Date:   Tue, 16 Nov 2021 11:28:54 +0000
Message-Id: <f9a81da55d6086627a6b5db01e8eab4857eb42bd.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This was never defined, so remove the #ifdefs, keeping the
code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c       | 2 --
 drivers/staging/media/atomisp/pci/sh_css.c                    | 2 --
 drivers/staging/media/atomisp/pci/sh_css_mipi.c               | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
index 3e3e5a4f8117..d09cc486e33e 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
@@ -571,11 +571,9 @@ void ia_css_pipe_get_primary_binarydesc(
 	in_info->res = pipe->config.input_effective_res;
 	in_info->padded_width = in_info->res.width;
 
-#if !defined(HAS_NO_PACKED_RAW_PIXELS)
 	if (pipe->stream->config.pack_raw_pixels)
 		in_info->format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
 	else
-#endif
 		in_info->format = IA_CSS_FRAME_FORMAT_RAW;
 
 	in_info->raw_bit_depth = ia_css_pipe_util_pipe_input_format_bpp(pipe);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 1f0b941de71f..d1074c3d56c6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2570,13 +2570,11 @@ alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 	ref_info.padded_width = CEIL_MUL(ref_info.res.width, 2 * ISP_VEC_NELEMS);
 #endif
 
-#if !defined(HAS_NO_PACKED_RAW_PIXELS)
 	if (pipe->stream->config.pack_raw_pixels) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW_PACKED\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
 	} else
-#endif
 	{
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW\n");
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index de56a1da754d..87f1df575d9f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -133,15 +133,11 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV420_10:		/* odd 4p, 5B, 40bits, even 4p, 10B, 80bits */
 	case ATOMISP_INPUT_FORMAT_RAW_10:		/* 4p, 5B, 40bits */
-#if !defined(HAS_NO_PACKED_RAW_PIXELS)
 		/* The changes will be reverted as soon as RAW
 		 * Buffers are deployed by the 2401 Input System
 		 * in the non-continuous use scenario.
 		 */
 		bits_per_pixel = 10;
-#else
-		bits_per_pixel = 16;
-#endif
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY:	/* 2p, 3B, 24bits */
 	case ATOMISP_INPUT_FORMAT_RAW_12:		/* 2p, 3B, 24bits */
-- 
2.33.1

