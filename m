Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4AA25B0F9
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgIBQNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728330AbgIBQK6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:58 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36680218AC;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=jSk32XhcmRVIOqD2bfZbAXJErvyzCfjDzpTi89YbsDU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ptarS6dJ5cE8SjpT6guawefwJ5FmDQBZDUHq66mqyqJ/WMcNo2MTMXbL0LYx712hS
         tRBTaFInrPPki2XCysArGRpvWKfBAc96K+aVgXNL8GdI2auBSYC9UzoxziXqmhnHc2
         jeQrAVAm+nwL8Ej+LGn4Ubqbb9GYxNiDn2xwjaVM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAs-BE; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 25/38] media: atomisp: get rid of some unused code
Date:   Wed,  2 Sep 2020 18:10:28 +0200
Message-Id: <4e128262fa297767984dc2a1504f78be12bbe96c.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the defines which are common for both ISP2400 and ISP2401
are at system_global.h, we can get rid of the code not used by
those versions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/ia_css_mipi.h   |   2 -
 .../staging/media/atomisp/pci/ia_css_stream.h |   4 +-
 .../kernels/ctc/ctc_1.0/ia_css_ctc_param.h    |   7 -
 .../ctc/ctc_1.0/ia_css_ctc_table.host.c       | 145 ------------------
 .../kernels/gc/gc_1.0/ia_css_gc_table.host.c  | 144 -----------------
 .../kernels/gc/gc_2/ia_css_gc2_table.host.c   |  53 -------
 .../kernels/xnr/xnr_1.0/ia_css_xnr_param.h    |   7 -
 .../xnr/xnr_1.0/ia_css_xnr_table.host.c       |  31 ----
 .../runtime/bufq/interface/ia_css_bufq_comm.h |   6 +-
 .../media/atomisp/pci/runtime/bufq/src/bufq.c |  23 ---
 .../pci/runtime/debug/src/ia_css_debug.c      |  22 +--
 .../pci/runtime/inputfifo/src/inputfifo.c     |  10 --
 .../atomisp/pci/runtime/isys/src/isys_init.c  |   2 -
 .../media/atomisp/pci/runtime/isys/src/rx.c   |  10 --
 .../pci/runtime/pipeline/src/pipeline.c       |   2 -
 drivers/staging/media/atomisp/pci/sh_css.c    |  93 ++---------
 .../staging/media/atomisp/pci/sh_css_hrt.c    |   4 -
 .../media/atomisp/pci/sh_css_internal.h       |   8 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   2 +-
 .../staging/media/atomisp/pci/sh_css_params.c |   5 -
 .../media/atomisp/pci/sh_css_properties.c     |  10 --
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  19 +--
 drivers/staging/media/atomisp/pci/sh_css_sp.h |   2 -
 23 files changed, 33 insertions(+), 578 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index 56a2fca8117f..7b6d796d6ee0 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -42,7 +42,6 @@ int
 ia_css_mipi_frame_specify(const unsigned int	size_mem_words,
 			  const bool contiguous);
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 /* @brief Register size of a CSS MIPI frame for check during capturing.
  *
  * @param[in]	port	CSI-2 port this check is registered.
@@ -58,7 +57,6 @@ ia_css_mipi_frame_specify(const unsigned int	size_mem_words,
 int
 ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
 				       const unsigned int	size_mem_words);
-#endif
 
 /* @brief Calculate the size of a mipi frame.
  *
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream.h b/drivers/staging/media/atomisp/pci/ia_css_stream.h
index e3e7a8a03b04..4dffc6d7c8d8 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream.h
@@ -18,7 +18,7 @@
 
 #include <type_support.h>
 #include <system_local.h>
-#if !defined(HAS_NO_INPUT_SYSTEM) && !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
 #include <input_system.h>
 #endif
 #include "ia_css_types.h"
@@ -30,7 +30,7 @@
 struct ia_css_stream {
 	struct ia_css_stream_config    config;
 	struct ia_css_stream_info      info;
-#if !defined(HAS_NO_INPUT_SYSTEM) && !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
 	rx_cfg_t                       csi_rx_config;
 #endif
 	bool                           reconfigure_css_rx;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h
index 7e2fa192a0fe..eaad708c611c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h
@@ -22,15 +22,8 @@
 #include "ia_css_ctc_types.h"
 
 #ifndef PIPE_GENERATION
-#if defined(HAS_VAMEM_VERSION_2)
 #define SH_CSS_ISP_CTC_TABLE_SIZE_LOG2       IA_CSS_VAMEM_2_CTC_TABLE_SIZE_LOG2
 #define SH_CSS_ISP_CTC_TABLE_SIZE            IA_CSS_VAMEM_2_CTC_TABLE_SIZE
-#elif defined(HAS_VAMEM_VERSION_1)
-#define SH_CSS_ISP_CTC_TABLE_SIZE_LOG2       IA_CSS_VAMEM_1_CTC_TABLE_SIZE_LOG2
-#define SH_CSS_ISP_CTC_TABLE_SIZE            IA_CSS_VAMEM_1_CTC_TABLE_SIZE
-#else
-#error "VAMEM should be {VERSION1, VERSION2}"
-#endif
 
 #else
 /* For pipe generation, the size is not relevant */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
index f13b79586963..6a7925c8493a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c
@@ -23,7 +23,6 @@
 
 struct ia_css_ctc_table       default_ctc_table;
 
-#if defined(HAS_VAMEM_VERSION_2)
 
 static const uint16_t
 default_ctc_table_data[IA_CSS_VAMEM_2_CTC_TABLE_SIZE] = {
@@ -62,155 +61,11 @@ default_ctc_table_data[IA_CSS_VAMEM_2_CTC_TABLE_SIZE] = {
 	0
 };
 
-#elif defined(HAS_VAMEM_VERSION_1)
-
-/* Default Parameters */
-static const uint16_t
-default_ctc_table_data[IA_CSS_VAMEM_1_CTC_TABLE_SIZE] = {
-	0, 0, 256, 384, 384, 497, 765, 806,
-	837, 851, 888, 901, 957, 981, 993, 1001,
-	1011, 1029, 1028, 1039, 1062, 1059, 1073, 1080,
-	1083, 1085, 1085, 1098, 1080, 1084, 1085, 1093,
-	1078, 1073, 1070, 1069, 1077, 1066, 1072, 1063,
-	1053, 1044, 1046, 1053, 1039, 1028, 1025, 1024,
-	1012, 1013, 1016, 996, 992, 990, 990, 980,
-	969, 968, 961, 955, 951, 949, 933, 930,
-	929, 925, 921, 916, 906, 901, 895, 893,
-	886, 877, 872, 869, 866, 861, 857, 849,
-	845, 838, 836, 832, 823, 821, 815, 813,
-	809, 805, 796, 793, 790, 785, 784, 778,
-	772, 768, 766, 763, 758, 752, 749, 745,
-	741, 740, 736, 730, 726, 724, 723, 718,
-	711, 709, 706, 704, 701, 698, 691, 689,
-	688, 683, 683, 678, 675, 673, 671, 669,
-	666, 663, 661, 660, 656, 656, 653, 650,
-	648, 647, 646, 643, 639, 638, 637, 635,
-	633, 632, 629, 627, 626, 625, 622, 621,
-	618, 618, 614, 614, 612, 609, 606, 606,
-	603, 600, 600, 597, 594, 591, 590, 586,
-	582, 581, 578, 575, 572, 569, 563, 560,
-	557, 554, 551, 548, 545, 539, 536, 533,
-	529, 527, 524, 519, 516, 513, 510, 507,
-	504, 501, 498, 493, 491, 488, 485, 484,
-	480, 476, 474, 471, 467, 466, 464, 460,
-	459, 455, 453, 449, 447, 446, 443, 441,
-	438, 435, 432, 432, 429, 427, 426, 422,
-	419, 418, 416, 414, 412, 410, 408, 406,
-	404, 402, 401, 398, 397, 395, 393, 390,
-	389, 388, 387, 384, 382, 380, 378, 377,
-	376, 375, 372, 370, 368, 368, 366, 364,
-	363, 361, 360, 358, 357, 355, 354, 352,
-	351, 350, 349, 346, 345, 344, 344, 342,
-	340, 339, 337, 337, 336, 335, 333, 331,
-	330, 329, 328, 326, 326, 324, 324, 322,
-	321, 320, 318, 318, 318, 317, 315, 313,
-	312, 311, 311, 310, 308, 307, 306, 306,
-	304, 304, 302, 301, 300, 300, 299, 297,
-	297, 296, 296, 294, 294, 292, 291, 291,
-	291, 290, 288, 287, 286, 286, 287, 285,
-	284, 283, 282, 282, 281, 281, 279, 278,
-	278, 278, 276, 276, 275, 274, 274, 273,
-	271, 270, 269, 268, 268, 267, 265, 262,
-	261, 260, 260, 259, 257, 254, 252, 252,
-	251, 251, 249, 246, 245, 244, 243, 242,
-	240, 239, 239, 237, 235, 235, 233, 231,
-	232, 230, 229, 226, 225, 224, 225, 224,
-	223, 220, 219, 219, 218, 217, 217, 214,
-	213, 213, 212, 211, 209, 209, 209, 208,
-	206, 205, 204, 203, 204, 203, 201, 200,
-	199, 197, 198, 198, 197, 195, 194, 194,
-	193, 192, 192, 191, 189, 190, 189, 188,
-	186, 187, 186, 185, 185, 184, 183, 181,
-	183, 182, 181, 180, 179, 178, 178, 178,
-	177, 176, 175, 176, 175, 174, 174, 173,
-	172, 173, 172, 171, 170, 170, 169, 169,
-	169, 168, 167, 166, 167, 167, 166, 165,
-	164, 164, 164, 163, 164, 163, 162, 163,
-	162, 161, 160, 161, 160, 160, 160, 159,
-	158, 157, 158, 158, 157, 157, 156, 156,
-	156, 156, 155, 155, 154, 154, 154, 154,
-	154, 153, 152, 153, 152, 152, 151, 152,
-	151, 152, 151, 150, 150, 149, 149, 150,
-	149, 149, 148, 148, 148, 149, 148, 147,
-	146, 146, 147, 146, 147, 146, 145, 146,
-	146, 145, 144, 145, 144, 145, 144, 144,
-	143, 143, 143, 144, 143, 142, 142, 142,
-	142, 142, 142, 141, 141, 141, 141, 140,
-	140, 141, 140, 140, 141, 140, 139, 139,
-	139, 140, 139, 139, 138, 138, 137, 139,
-	138, 138, 138, 137, 138, 137, 137, 137,
-	137, 136, 137, 136, 136, 136, 136, 135,
-	136, 135, 135, 135, 135, 136, 135, 135,
-	134, 134, 133, 135, 134, 134, 134, 133,
-	134, 133, 134, 133, 133, 132, 133, 133,
-	132, 133, 132, 132, 132, 132, 131, 131,
-	131, 132, 131, 131, 130, 131, 130, 132,
-	131, 130, 130, 129, 130, 129, 130, 129,
-	129, 129, 130, 129, 128, 128, 128, 128,
-	129, 128, 128, 127, 127, 128, 128, 127,
-	127, 126, 126, 127, 127, 126, 126, 126,
-	127, 126, 126, 126, 125, 125, 126, 125,
-	125, 124, 124, 124, 125, 125, 124, 124,
-	123, 124, 124, 123, 123, 122, 122, 122,
-	122, 122, 121, 120, 120, 119, 118, 118,
-	118, 117, 117, 116, 115, 115, 115, 114,
-	114, 113, 113, 112, 111, 111, 111, 110,
-	110, 109, 109, 108, 108, 108, 107, 107,
-	106, 106, 105, 105, 105, 104, 104, 103,
-	103, 102, 102, 102, 102, 101, 101, 100,
-	100, 99, 99, 99, 99, 99, 99, 98,
-	97, 98, 97, 97, 97, 96, 96, 95,
-	96, 95, 96, 95, 95, 94, 94, 95,
-	94, 94, 94, 93, 93, 92, 93, 93,
-	93, 93, 92, 92, 91, 92, 92, 92,
-	91, 91, 90, 90, 91, 91, 91, 90,
-	90, 90, 90, 91, 90, 90, 90, 89,
-	89, 89, 90, 89, 89, 89, 89, 89,
-	88, 89, 89, 88, 88, 88, 88, 87,
-	89, 88, 88, 88, 88, 88, 87, 88,
-	88, 88, 87, 87, 87, 87, 87, 88,
-	87, 87, 87, 87, 87, 87, 88, 87,
-	87, 87, 87, 86, 86, 87, 87, 87,
-	87, 86, 86, 86, 87, 87, 86, 87,
-	86, 86, 86, 87, 87, 86, 86, 86,
-	86, 86, 87, 87, 86, 85, 85, 85,
-	84, 85, 85, 84, 84, 83, 83, 82,
-	82, 82, 81, 81, 80, 79, 79, 79,
-	78, 77, 77, 76, 76, 76, 75, 74,
-	74, 74, 73, 73, 72, 71, 71, 71,
-	70, 70, 69, 69, 68, 68, 67, 67,
-	67, 66, 66, 65, 65, 64, 64, 63,
-	62, 62, 62, 61, 60, 60, 59, 59,
-	58, 58, 57, 57, 56, 56, 56, 55,
-	55, 54, 55, 55, 54, 53, 53, 52,
-	53, 53, 52, 51, 51, 50, 51, 50,
-	49, 49, 50, 49, 49, 48, 48, 47,
-	47, 48, 46, 45, 45, 45, 46, 45,
-	45, 44, 45, 45, 45, 43, 42, 42,
-	41, 43, 41, 40, 40, 39, 40, 41,
-	39, 39, 39, 39, 39, 38, 35, 35,
-	34, 37, 36, 34, 33, 33, 33, 35,
-	34, 32, 32, 31, 32, 30, 29, 26,
-	25, 25, 27, 26, 23, 23, 23, 25,
-	24, 24, 22, 21, 20, 19, 16, 14,
-	13, 13, 13, 10, 9, 7, 7, 7,
-	12, 12, 12, 7, 0, 0, 0, 0
-};
-
-#else
-#error "VAMEM version must be one of {VAMEM_VERSION_1, VAMEM_VERSION_2}"
-#endif
 
 void
 ia_css_config_ctc_table(void)
 {
-#if defined(HAS_VAMEM_VERSION_2)
 	memcpy(default_ctc_table.data.vamem_2, default_ctc_table_data,
 	       sizeof(default_ctc_table_data));
 	default_ctc_table.vamem_type     = IA_CSS_VAMEM_TYPE_2;
-#else
-	memcpy(default_ctc_table.data.vamem_1, default_ctc_table_data,
-	       sizeof(default_ctc_table_data));
-	default_ctc_table.vamem_type     = 1IA_CSS_VAMEM_TYPE_1;
-#endif
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
index f48f876777dc..7dbe2dc0591d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c
@@ -21,7 +21,6 @@
 #include "ia_css_types.h"
 #include "ia_css_gc_table.host.h"
 
-#if defined(HAS_VAMEM_VERSION_2)
 
 struct ia_css_gamma_table default_gamma_table;
 
@@ -62,154 +61,11 @@ default_gamma_table_data[IA_CSS_VAMEM_2_GAMMA_TABLE_SIZE] = {
 	255
 };
 
-#elif defined(HAS_VAMEM_VERSION_1)
-
-static const uint16_t
-default_gamma_table_data[IA_CSS_VAMEM_1_GAMMA_TABLE_SIZE] = {
-	0, 1, 2, 3, 4, 5, 6, 7,
-	8, 9, 10, 11, 12, 13, 14, 16,
-	17, 18, 19, 20, 21, 23, 24, 25,
-	27, 28, 29, 31, 32, 33, 35, 36,
-	38, 39, 41, 42, 44, 45, 47, 48,
-	49, 51, 52, 54, 55, 57, 58, 60,
-	61, 62, 64, 65, 66, 68, 69, 70,
-	71, 72, 74, 75, 76, 77, 78, 79,
-	80, 81, 82, 83, 84, 85, 86, 87,
-	88, 89, 90, 91, 92, 93, 93, 94,
-	95, 96, 97, 98, 98, 99, 100, 101,
-	102, 102, 103, 104, 105, 105, 106, 107,
-	108, 108, 109, 110, 110, 111, 112, 112,
-	113, 114, 114, 115, 116, 116, 117, 118,
-	118, 119, 120, 120, 121, 121, 122, 123,
-	123, 124, 125, 125, 126, 126, 127, 127,	/* 128 */
-	128, 129, 129, 130, 130, 131, 131, 132,
-	132, 133, 134, 134, 135, 135, 136, 136,
-	137, 137, 138, 138, 139, 139, 140, 140,
-	141, 141, 142, 142, 143, 143, 144, 144,
-	145, 145, 145, 146, 146, 147, 147, 148,
-	148, 149, 149, 150, 150, 150, 151, 151,
-	152, 152, 152, 153, 153, 154, 154, 155,
-	155, 155, 156, 156, 156, 157, 157, 158,
-	158, 158, 159, 159, 160, 160, 160, 161,
-	161, 161, 162, 162, 162, 163, 163, 163,
-	164, 164, 164, 165, 165, 165, 166, 166,
-	166, 167, 167, 167, 168, 168, 168, 169,
-	169, 169, 170, 170, 170, 170, 171, 171,
-	171, 172, 172, 172, 172, 173, 173, 173,
-	174, 174, 174, 174, 175, 175, 175, 176,
-	176, 176, 176, 177, 177, 177, 177, 178,	/* 256 */
-	178, 178, 178, 179, 179, 179, 179, 180,
-	180, 180, 180, 181, 181, 181, 181, 182,
-	182, 182, 182, 182, 183, 183, 183, 183,
-	184, 184, 184, 184, 184, 185, 185, 185,
-	185, 186, 186, 186, 186, 186, 187, 187,
-	187, 187, 187, 188, 188, 188, 188, 188,
-	189, 189, 189, 189, 189, 190, 190, 190,
-	190, 190, 191, 191, 191, 191, 191, 192,
-	192, 192, 192, 192, 192, 193, 193, 193,
-	193, 193, 194, 194, 194, 194, 194, 194,
-	195, 195, 195, 195, 195, 195, 196, 196,
-	196, 196, 196, 196, 197, 197, 197, 197,
-	197, 197, 198, 198, 198, 198, 198, 198,
-	198, 199, 199, 199, 199, 199, 199, 200,
-	200, 200, 200, 200, 200, 200, 201, 201,
-	201, 201, 201, 201, 201, 202, 202, 202,	/* 384 */
-	202, 202, 202, 202, 203, 203, 203, 203,
-	203, 203, 203, 204, 204, 204, 204, 204,
-	204, 204, 204, 205, 205, 205, 205, 205,
-	205, 205, 205, 206, 206, 206, 206, 206,
-	206, 206, 206, 207, 207, 207, 207, 207,
-	207, 207, 207, 208, 208, 208, 208, 208,
-	208, 208, 208, 209, 209, 209, 209, 209,
-	209, 209, 209, 209, 210, 210, 210, 210,
-	210, 210, 210, 210, 210, 211, 211, 211,
-	211, 211, 211, 211, 211, 211, 212, 212,
-	212, 212, 212, 212, 212, 212, 212, 213,
-	213, 213, 213, 213, 213, 213, 213, 213,
-	214, 214, 214, 214, 214, 214, 214, 214,
-	214, 214, 215, 215, 215, 215, 215, 215,
-	215, 215, 215, 216, 216, 216, 216, 216,
-	216, 216, 216, 216, 216, 217, 217, 217,	/* 512 */
-	217, 217, 217, 217, 217, 217, 217, 218,
-	218, 218, 218, 218, 218, 218, 218, 218,
-	218, 219, 219, 219, 219, 219, 219, 219,
-	219, 219, 219, 220, 220, 220, 220, 220,
-	220, 220, 220, 220, 220, 221, 221, 221,
-	221, 221, 221, 221, 221, 221, 221, 221,
-	222, 222, 222, 222, 222, 222, 222, 222,
-	222, 222, 223, 223, 223, 223, 223, 223,
-	223, 223, 223, 223, 223, 224, 224, 224,
-	224, 224, 224, 224, 224, 224, 224, 224,
-	225, 225, 225, 225, 225, 225, 225, 225,
-	225, 225, 225, 226, 226, 226, 226, 226,
-	226, 226, 226, 226, 226, 226, 226, 227,
-	227, 227, 227, 227, 227, 227, 227, 227,
-	227, 227, 228, 228, 228, 228, 228, 228,
-	228, 228, 228, 228, 228, 228, 229, 229,
-	229, 229, 229, 229, 229, 229, 229, 229,
-	229, 229, 230, 230, 230, 230, 230, 230,
-	230, 230, 230, 230, 230, 230, 231, 231,
-	231, 231, 231, 231, 231, 231, 231, 231,
-	231, 231, 231, 232, 232, 232, 232, 232,
-	232, 232, 232, 232, 232, 232, 232, 233,
-	233, 233, 233, 233, 233, 233, 233, 233,
-	233, 233, 233, 233, 234, 234, 234, 234,
-	234, 234, 234, 234, 234, 234, 234, 234,
-	234, 235, 235, 235, 235, 235, 235, 235,
-	235, 235, 235, 235, 235, 235, 236, 236,
-	236, 236, 236, 236, 236, 236, 236, 236,
-	236, 236, 236, 236, 237, 237, 237, 237,
-	237, 237, 237, 237, 237, 237, 237, 237,
-	237, 237, 238, 238, 238, 238, 238, 238,
-	238, 238, 238, 238, 238, 238, 238, 238,
-	239, 239, 239, 239, 239, 239, 239, 239,
-	239, 239, 239, 239, 239, 239, 240, 240,
-	240, 240, 240, 240, 240, 240, 240, 240,
-	240, 240, 240, 240, 241, 241, 241, 241,
-	241, 241, 241, 241, 241, 241, 241, 241,
-	241, 241, 241, 242, 242, 242, 242, 242,
-	242, 242, 242, 242, 242, 242, 242, 242,
-	242, 242, 243, 243, 243, 243, 243, 243,
-	243, 243, 243, 243, 243, 243, 243, 243,
-	243, 244, 244, 244, 244, 244, 244, 244,
-	244, 244, 244, 244, 244, 244, 244, 244,
-	245, 245, 245, 245, 245, 245, 245, 245,
-	245, 245, 245, 245, 245, 245, 245, 246,
-	246, 246, 246, 246, 246, 246, 246, 246,
-	246, 246, 246, 246, 246, 246, 246, 247,
-	247, 247, 247, 247, 247, 247, 247, 247,
-	247, 247, 247, 247, 247, 247, 247, 248,
-	248, 248, 248, 248, 248, 248, 248, 248,
-	248, 248, 248, 248, 248, 248, 248, 249,
-	249, 249, 249, 249, 249, 249, 249, 249,
-	249, 249, 249, 249, 249, 249, 249, 250,
-	250, 250, 250, 250, 250, 250, 250, 250,
-	250, 250, 250, 250, 250, 250, 250, 251,
-	251, 251, 251, 251, 251, 251, 251, 251,
-	251, 251, 251, 251, 251, 251, 251, 252,
-	252, 252, 252, 252, 252, 252, 252, 252,
-	252, 252, 252, 252, 252, 252, 252, 253,
-	253, 253, 253, 253, 253, 253, 253, 253,
-	253, 253, 253, 253, 253, 253, 253, 253,
-	254, 254, 254, 254, 254, 254, 254, 254,
-	254, 254, 254, 254, 254, 254, 254, 254,
-	255, 255, 255, 255, 255, 255, 255, 255
-};
-
-#else
-#error "VAMEM version must be one of {VAMEM_VERSION_1, VAMEM_VERSION_2}"
-#endif
 
 void
 ia_css_config_gamma_table(void)
 {
-#if defined(HAS_VAMEM_VERSION_2)
 	memcpy(default_gamma_table.data.vamem_2, default_gamma_table_data,
 	       sizeof(default_gamma_table_data));
 	default_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_2;
-#else
-	memcpy(default_gamma_table.data.vamem_1, default_gamma_table_data,
-	       sizeof(default_gamma_table_data));
-	default_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_1;
-#endif
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
index 7eadb31268eb..34795011907a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2_table.host.c
@@ -27,7 +27,6 @@ struct ia_css_rgb_gamma_table default_b_gamma_table;
 
 /* Identical default gamma table for R, G, and B. */
 
-#if defined(HAS_VAMEM_VERSION_2)
 
 static const uint16_t
 default_gamma_table_data[IA_CSS_VAMEM_2_RGB_GAMMA_TABLE_SIZE] = {
@@ -65,51 +64,10 @@ default_gamma_table_data[IA_CSS_VAMEM_2_RGB_GAMMA_TABLE_SIZE] = {
 	4032, 4040, 4048, 4056, 4064, 4072, 4080, 4088,
 	4095
 };
-#elif defined(HAS_VAMEM_VERSION_1)
-
-static const uint16_t
-default_gamma_table_data[IA_CSS_VAMEM_1_RGB_GAMMA_TABLE_SIZE] = {
-	0,   72,  144,  216,  288,  360,  426,  486,
-	541,  592,  641,  687,  730,  772,  812,  850,
-	887,  923,  958,  991, 1024, 1055, 1086, 1117,
-	1146, 1175, 1203, 1230, 1257, 1284, 1310, 1335,
-	1360, 1385, 1409, 1433, 1457, 1480, 1502, 1525,
-	1547, 1569, 1590, 1612, 1632, 1653, 1674, 1694,
-	1714, 1734, 1753, 1772, 1792, 1811, 1829, 1848,
-	1866, 1884, 1902, 1920, 1938, 1955, 1973, 1990,
-	2007, 2024, 2040, 2057, 2074, 2090, 2106, 2122,
-	2138, 2154, 2170, 2185, 2201, 2216, 2231, 2247,
-	2262, 2277, 2291, 2306, 2321, 2335, 2350, 2364,
-	2378, 2393, 2407, 2421, 2435, 2449, 2462, 2476,
-	2490, 2503, 2517, 2530, 2543, 2557, 2570, 2583,
-	2596, 2609, 2622, 2634, 2647, 2660, 2673, 2685,
-	2698, 2710, 2722, 2735, 2747, 2759, 2771, 2783,
-	2795, 2807, 2819, 2831, 2843, 2855, 2867, 2878,
-	2890, 2901, 2913, 2924, 2936, 2947, 2958, 2970,
-	2981, 2992, 3003, 3014, 3025, 3036, 3047, 3058,
-	3069, 3080, 3091, 3102, 3112, 3123, 3134, 3144,
-	3155, 3165, 3176, 3186, 3197, 3207, 3217, 3228,
-	3238, 3248, 3258, 3268, 3279, 3289, 3299, 3309,
-	3319, 3329, 3339, 3349, 3358, 3368, 3378, 3388,
-	3398, 3407, 3417, 3427, 3436, 3446, 3455, 3465,
-	3474, 3484, 3493, 3503, 3512, 3521, 3531, 3540,
-	3549, 3559, 3568, 3577, 3586, 3595, 3605, 3614,
-	3623, 3632, 3641, 3650, 3659, 3668, 3677, 3686,
-	3694, 3703, 3712, 3721, 3730, 3739, 3747, 3756,
-	3765, 3773, 3782, 3791, 3799, 3808, 3816, 3825,
-	3833, 3842, 3850, 3859, 3867, 3876, 3884, 3893,
-	3901, 3909, 3918, 3926, 3934, 3942, 3951, 3959,
-	3967, 3975, 3984, 3992, 4000, 4008, 4016, 4024,
-	4032, 4040, 4048, 4056, 4064, 4072, 4080, 4088
-};
-#else
-#error "VAMEM version must be one of {VAMEM_VERSION_1, VAMEM_VERSION_2}"
-#endif
 
 void
 ia_css_config_rgb_gamma_tables(void)
 {
-#if defined(HAS_VAMEM_VERSION_2)
 	default_r_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_2;
 	default_g_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_2;
 	default_b_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_2;
@@ -119,15 +77,4 @@ ia_css_config_rgb_gamma_tables(void)
 	       sizeof(default_gamma_table_data));
 	memcpy(default_b_gamma_table.data.vamem_2, default_gamma_table_data,
 	       sizeof(default_gamma_table_data));
-#else
-	memcpy(default_r_gamma_table.data.vamem_1, default_gamma_table_data,
-	       sizeof(default_gamma_table_data));
-	memcpy(default_g_gamma_table.data.vamem_1, default_gamma_table_data,
-	       sizeof(default_gamma_table_data));
-	memcpy(default_b_gamma_table.data.vamem_1, default_gamma_table_data,
-	       sizeof(default_gamma_table_data));
-	default_r_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_1;
-	default_g_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_1;
-	default_b_gamma_table.vamem_type   = IA_CSS_VAMEM_TYPE_1;
-#endif
 }
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h
index 7ebf139f3618..93754f7c797d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h
@@ -20,15 +20,8 @@
 #include <system_global.h>
 
 #ifndef PIPE_GENERATION
-#if defined(HAS_VAMEM_VERSION_2)
 #define SH_CSS_ISP_XNR_TABLE_SIZE_LOG2       IA_CSS_VAMEM_2_XNR_TABLE_SIZE_LOG2
 #define SH_CSS_ISP_XNR_TABLE_SIZE            IA_CSS_VAMEM_2_XNR_TABLE_SIZE
-#elif defined(HAS_VAMEM_VERSION_1)
-#define SH_CSS_ISP_XNR_TABLE_SIZE_LOG2       IA_CSS_VAMEM_1_XNR_TABLE_SIZE_LOG2
-#define SH_CSS_ISP_XNR_TABLE_SIZE            IA_CSS_VAMEM_1_XNR_TABLE_SIZE
-#else
-#error "Unknown vamem type"
-#endif
 
 #else
 /* For pipe generation, the size is not relevant */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
index 5566f3c16aac..e5c15308693d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c
@@ -23,7 +23,6 @@
 
 struct ia_css_xnr_table default_xnr_table;
 
-#if defined(HAS_VAMEM_VERSION_2)
 
 static const uint16_t
 default_xnr_table_data[IA_CSS_VAMEM_2_XNR_TABLE_SIZE] = {
@@ -43,41 +42,11 @@ default_xnr_table_data[IA_CSS_VAMEM_2_XNR_TABLE_SIZE] = {
 	     167 >> 1, 163 >> 1, 160 >> 1, 157 >> 1, 154 >> 1, 151 >> 1, 148 >> 1, 146 >> 1, 143 >> 1, 141 >> 1, 138 >> 1, 136 >> 1, 134 >> 1, 132 >> 1, 130 >> 1, 128 >> 1
 };
 
-#elif defined(HAS_VAMEM_VERSION_1)
-
-static const uint16_t
-default_xnr_table_data[IA_CSS_VAMEM_1_XNR_TABLE_SIZE] = {
-	/* 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 */
-	8191 >> 1, 4096 >> 1, 2730 >> 1, 2048 >> 1, 1638 >> 1, 1365 >> 1, 1170 >> 1, 1024 >> 1, 910 >> 1, 819 >> 1, 744 >> 1, 682 >> 1, 630 >> 1, 585 >> 1,
-	     546 >> 1, 512 >> 1,
-
-	     /* 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 */
-	     481 >> 1, 455 >> 1, 431 >> 1, 409 >> 1, 390 >> 1, 372 >> 1, 356 >> 1, 341 >> 1, 327 >> 1, 315 >> 1, 303 >> 1, 292 >> 1, 282 >> 1, 273 >> 1, 264 >> 1,
-	     256 >> 1,
-
-	     /* 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 */
-	     248 >> 1, 240 >> 1, 234 >> 1, 227 >> 1, 221 >> 1, 215 >> 1, 210 >> 1, 204 >> 1, 199 >> 1, 195 >> 1, 190 >> 1, 186 >> 1, 182 >> 1, 178 >> 1, 174 >> 1,
-	     170 >> 1,
-
-	     /* 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 */
-	     167 >> 1, 163 >> 1, 160 >> 1, 157 >> 1, 154 >> 1, 151 >> 1, 148 >> 1, 146 >> 1, 143 >> 1, 141 >> 1, 138 >> 1, 136 >> 1, 134 >> 1, 132 >> 1, 130 >> 1, 128 >> 1
-};
-
-#else
-#error "sh_css_params.c: VAMEM version must \
-be one of {VAMEM_VERSION_1, VAMEM_VERSION_2}"
-#endif
 
 void
 ia_css_config_xnr_table(void)
 {
-#if defined(HAS_VAMEM_VERSION_2)
 	memcpy(default_xnr_table.data.vamem_2, default_xnr_table_data,
 	       sizeof(default_xnr_table_data));
 	default_xnr_table.vamem_type     = IA_CSS_VAMEM_TYPE_2;
-#else
-	memcpy(default_xnr_table.data.vamem_1, default_xnr_table_data,
-	       sizeof(default_xnr_table_data));
-	default_xnr_table.vamem_type     = IA_CSS_VAMEM_TYPE_1;
-#endif
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
index cddf5882b76a..35f4528b724f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq_comm.h
@@ -27,15 +27,11 @@ enum sh_css_queue_id {
 	SH_CSS_QUEUE_E_ID,
 	SH_CSS_QUEUE_F_ID,
 	SH_CSS_QUEUE_G_ID,
-#if defined(HAS_NO_INPUT_SYSTEM)
-	/* input frame queue for skycam */
-	SH_CSS_QUEUE_H_ID,
-#endif
 #if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 	SH_CSS_QUEUE_H_ID, /* for metadata */
 #endif
 
-#if defined(HAS_NO_INPUT_SYSTEM) || defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 #define SH_CSS_MAX_NUM_QUEUES (SH_CSS_QUEUE_H_ID + 1)
 #else
 #define SH_CSS_MAX_NUM_QUEUES (SH_CSS_QUEUE_G_ID + 1)
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 38e85735293b..0901c932bf28 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -47,13 +47,11 @@ struct sh_css_queues {
 	/* SP2Host event queue */
 	ia_css_queue_t sp2host_psys_event_queue_handle;
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	/* Host2SP ISYS event queue */
 	ia_css_queue_t host2sp_isys_event_queue_handle;
 
 	/* SP2Host ISYS event queue */
 	ia_css_queue_t sp2host_isys_event_queue_handle;
-#endif
 	/* Tagger command queue */
 	ia_css_queue_t host2sp_tag_cmd_queue_handle;
 };
@@ -231,14 +229,12 @@ static ia_css_queue_t *bufq_get_qhandle(
 	case sh_css_sp2host_psys_event_queue:
 		q = &css_queues.sp2host_psys_event_queue_handle;
 		break;
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	case sh_css_host2sp_isys_event_queue:
 		q = &css_queues.host2sp_isys_event_queue_handle;
 		break;
 	case sh_css_sp2host_isys_event_queue:
 		q = &css_queues.sp2host_isys_event_queue_handle;
 		break;
-#endif
 	case sh_css_host2sp_tag_cmd_queue:
 		q = &css_queues.host2sp_tag_cmd_queue_handle;
 		break;
@@ -307,7 +303,6 @@ void ia_css_bufq_init(void)
 		  (uint32_t)offsetof(struct host_sp_queues, sp2host_psys_event_queue_elems),
 		  &css_queues.sp2host_psys_event_queue_handle);
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	/* Host2SP ISYS event queue */
 	init_bufq((uint32_t)offsetof(struct host_sp_queues,
 				     host2sp_isys_event_queue_desc),
@@ -324,7 +319,6 @@ void ia_css_bufq_init(void)
 	init_bufq((uint32_t)offsetof(struct host_sp_queues, host2sp_tag_cmd_queue_desc),
 		  (uint32_t)offsetof(struct host_sp_queues, host2sp_tag_cmd_queue_elems),
 		  &css_queues.host2sp_tag_cmd_queue_handle);
-#endif
 
 	IA_CSS_LEAVE_PRIVATE("");
 }
@@ -434,7 +428,6 @@ int ia_css_bufq_dequeue_psys_event(
 int ia_css_bufq_dequeue_isys_event(
     u8 item[BUFQ_EVENT_SIZE])
 {
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	int error = 0;
 	ia_css_queue_t *q;
 
@@ -451,15 +444,10 @@ int ia_css_bufq_dequeue_isys_event(
 	}
 	error = ia_css_eventq_recv(q, item);
 	return error;
-#else
-	(void)item;
-	return -EBUSY;
-#endif
 }
 
 int ia_css_bufq_enqueue_isys_event(uint8_t evt_id)
 {
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	int error = 0;
 	ia_css_queue_t *q;
 
@@ -474,16 +462,11 @@ int ia_css_bufq_enqueue_isys_event(uint8_t evt_id)
 
 	IA_CSS_LEAVE_ERR_PRIVATE(error);
 	return error;
-#else
-	(void)evt_id;
-	return -EBUSY;
-#endif
 }
 
 int ia_css_bufq_enqueue_tag_cmd(
     uint32_t item)
 {
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	int error;
 	ia_css_queue_t *q;
 
@@ -497,10 +480,6 @@ int ia_css_bufq_enqueue_tag_cmd(
 
 	IA_CSS_LEAVE_ERR_PRIVATE(error);
 	return error;
-#else
-	(void)item;
-	return -EBUSY;
-#endif
 }
 
 int ia_css_bufq_deinit(void)
@@ -545,12 +524,10 @@ void ia_css_bufq_dump_queue_info(void)
 	bufq_dump_queue_info("sp2host_psys_event",
 			     &css_queues.sp2host_psys_event_queue_handle);
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	bufq_dump_queue_info("host2sp_isys_event",
 			     &css_queues.host2sp_isys_event_queue_handle);
 	bufq_dump_queue_info("sp2host_isys_event",
 			     &css_queues.sp2host_isys_event_queue_handle);
 	bufq_dump_queue_info("host2sp_tag_cmd",
 			     &css_queues.host2sp_tag_cmd_queue_handle);
-#endif
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 2bca27a04b02..56d5d90634fa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -62,17 +62,13 @@
 #include "isp.h"
 #include "type_support.h"
 #include "math_support.h" /* CEIL_DIV */
-#if defined(HAS_INPUT_FORMATTER_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 #include "input_system.h"	/* input_formatter_reg_load */
-#endif
 #if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
 #include "ia_css_tagger_common.h"
 #endif
 
 #include "sh_css_internal.h"
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #include "ia_css_isys.h"
-#endif
 #include "sh_css_sp.h"		/* sh_css_sp_get_debug_state() */
 
 #include "css_trace.h"      /* tracer */
@@ -501,12 +497,10 @@ void ia_css_debug_dump_sp_state(void)
 	sp_get_state(SP0_ID, &state, &stall);
 	debug_print_sp_state(&state, "SP");
 	if (state.is_stalling) {
-#if !defined(HAS_NO_INPUT_SYSTEM)
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "isys_FIFO stalled",
 				    stall.fifo0);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "if_sec_FIFO stalled",
 				    stall.fifo1);
-#endif
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n",
 				    "str_to_mem_FIFO stalled", stall.fifo2);
 		ia_css_debug_dtrace(2, "\t%-32s: %d\n", "dma_FIFO stalled",
@@ -674,7 +668,6 @@ static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
 			    "Block when no request", st_block_fifo_when_no_req);
 
-#if defined(HAS_INPUT_FORMATTER_VERSION_2)
 	ia_css_debug_dtrace(2, "\t\t%-32s: %d\n",
 			    "IF_BLOCKED_FIFO_NO_REQ_ADDRESS",
 			    input_formatter_reg_load(INPUT_FORMATTER0_ID,
@@ -737,7 +730,6 @@ static void debug_print_if_state(input_formatter_state_t *state, const char *id)
 			    "_REG_GP_IFMT_slv_reg_srst",
 			    gp_device_reg_load(GP_DEVICE0_ID,
 					       _REG_GP_IFMT_slv_reg_srst));
-#endif
 
 	ia_css_debug_dtrace(2, "\tFSM Status:\n");
 
@@ -1704,7 +1696,7 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 }
 #endif
 
-#if defined(HAS_INPUT_FORMATTER_VERSION_2) && !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(HAS_NO_INPUT_FORMATTER)
 static void debug_print_rx_mipi_port_state(mipi_port_state_t *state)
 {
 	int i;
@@ -1901,10 +1893,10 @@ static void debug_print_rx_state(receiver_state_t *state)
 }
 #endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 void ia_css_debug_dump_rx_state(void)
 {
-#if defined(HAS_INPUT_FORMATTER_VERSION_2) && !defined(HAS_NO_INPUT_FORMATTER)
+#if !defined(HAS_NO_INPUT_FORMATTER)
 	receiver_state_t state;
 
 	receiver_get_state(RX0_ID, &state);
@@ -2174,7 +2166,7 @@ void ia_css_debug_dump_isys_state(void)
 	return;
 }
 #endif
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2401)
 void ia_css_debug_dump_isys_state(void)
 {
 	/* Android compilation fails if made a local variable
@@ -2195,7 +2187,7 @@ void ia_css_debug_dump_debug_info(const char *context)
 		context = "No Context provided";
 
 	ia_css_debug_dtrace(2, "CSS Debug Info dump [Context = %s]\n", context);
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 	ia_css_debug_dump_rx_state();
 #endif
 #if !defined(HAS_NO_INPUT_FORMATTER) && defined(USE_INPUT_SYSTEM_VERSION_2)
@@ -2243,7 +2235,7 @@ void ia_css_debug_dump_debug_info(const char *context)
 				    state.irq_level_not_pulse);
 	}
 #endif
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2401)
 	ia_css_debug_dump_isys_state();
 #endif
 #if defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401)
@@ -2449,7 +2441,7 @@ void ia_css_debug_dump_isp_binary(void)
 
 void ia_css_debug_dump_perf_counters(void)
 {
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 	const struct ia_css_fw_info *fw;
 	int i;
 	unsigned int HIVE_ADDR_ia_css_isys_sp_error_cnt;
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 38712530f566..2d06e124007e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -32,24 +32,18 @@
 #include "event_fifo.h"
 #define __INLINE_SP__
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #include "input_system.h"	/* MIPI_PREDICTOR_NONE,... */
-#endif
 
 #include "assert_support.h"
 
 /* System independent */
 #include "sh_css_internal.h"
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #include "ia_css_isys.h"
-#endif
 
 #define HBLANK_CYCLES (187)
 #define MARKER_CYCLES (6)
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #include <hive_isp_css_streaming_to_mipi_types_hrt.h>
-#endif
 
 /* The data type is used to send special cases:
  * yuv420: odd lines (1, 3 etc) are twice as wide as even
@@ -67,9 +61,7 @@ enum inputfifo_mipi_data_type {
 	inputfifo_mipi_data_type_rgb,
 };
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 static unsigned int inputfifo_curr_ch_id, inputfifo_curr_fmt_type;
-#endif
 struct inputfifo_instance {
 	unsigned int				ch_id;
 	enum atomisp_input_format	input_format;
@@ -81,7 +73,6 @@ struct inputfifo_instance {
 	enum inputfifo_mipi_data_type	type;
 };
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 /*
  * Maintain a basic streaming to Mipi administration with ch_id as index
  * ch_id maps on the "Mipi virtual channel ID" and can have value 0..3
@@ -536,4 +527,3 @@ void ia_css_inputfifo_end_frame(
 	s2mi->streaming = false;
 	return;
 }
-#endif /* #if !defined(HAS_NO_INPUT_SYSTEM) */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index de442f1fa6ba..13cb02ac2651 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -15,7 +15,6 @@
 
 #include "input_system.h"
 
-#ifdef HAS_INPUT_SYSTEM_VERSION_2
 #include "ia_css_isys.h"
 #include "platform_support.h"
 
@@ -121,4 +120,3 @@ void ia_css_isys_uninit(void)
 }
 #endif
 
-#endif
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 4f0dcdfa13be..fa87afaff6e5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -28,9 +28,7 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 					       _HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX);
 
 	bits |= (1U << _HRT_CSS_RECEIVER_IRQ_OVERRUN_BIT) |
-#if defined(HAS_RX_VERSION_2)
 		(1U << _HRT_CSS_RECEIVER_IRQ_INIT_TIMEOUT_BIT) |
-#endif
 		(1U << _HRT_CSS_RECEIVER_IRQ_SLEEP_MODE_ENTRY_BIT) |
 		(1U << _HRT_CSS_RECEIVER_IRQ_SLEEP_MODE_EXIT_BIT) |
 		(1U << _HRT_CSS_RECEIVER_IRQ_ERR_SOT_HS_BIT) |
@@ -117,10 +115,8 @@ unsigned int ia_css_isys_rx_translate_irq_infos(unsigned int bits)
 
 	if (bits & (1U << _HRT_CSS_RECEIVER_IRQ_OVERRUN_BIT))
 		infos |= IA_CSS_RX_IRQ_INFO_BUFFER_OVERRUN;
-#if defined(HAS_RX_VERSION_2)
 	if (bits & (1U << _HRT_CSS_RECEIVER_IRQ_INIT_TIMEOUT_BIT))
 		infos |= IA_CSS_RX_IRQ_INFO_INIT_TIMEOUT;
-#endif
 	if (bits & (1U << _HRT_CSS_RECEIVER_IRQ_SLEEP_MODE_ENTRY_BIT))
 		infos |= IA_CSS_RX_IRQ_INFO_ENTER_SLEEP_MODE;
 	if (bits & (1U << _HRT_CSS_RECEIVER_IRQ_SLEEP_MODE_EXIT_BIT))
@@ -176,10 +172,8 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 	/* MW: Why do we remap the receiver bitmap */
 	if (irq_infos & IA_CSS_RX_IRQ_INFO_BUFFER_OVERRUN)
 		bits |= 1U << _HRT_CSS_RECEIVER_IRQ_OVERRUN_BIT;
-#if defined(HAS_RX_VERSION_2)
 	if (irq_infos & IA_CSS_RX_IRQ_INFO_INIT_TIMEOUT)
 		bits |= 1U << _HRT_CSS_RECEIVER_IRQ_INIT_TIMEOUT_BIT;
-#endif
 	if (irq_infos & IA_CSS_RX_IRQ_INFO_ENTER_SLEEP_MODE)
 		bits |= 1U << _HRT_CSS_RECEIVER_IRQ_SLEEP_MODE_ENTRY_BIT;
 	if (irq_infos & IA_CSS_RX_IRQ_INFO_EXIT_SLEEP_MODE)
@@ -484,7 +478,6 @@ unsigned int ia_css_csi2_calculate_input_system_alignment(
 void ia_css_isys_rx_configure(const rx_cfg_t *config,
 			      const enum ia_css_input_mode input_mode)
 {
-#if defined(HAS_RX_VERSION_2)
 	bool port_enabled[N_MIPI_PORT_ID];
 	bool any_port_enabled = false;
 	enum mipi_port_id port;
@@ -580,9 +573,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 	 *                INPUT_SYSTEM_CSI_RECEIVER_SELECT_BACKENG, 1);
 	 */
 	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
-#else
-#error "rx.c: RX version must be one of {RX_VERSION_2}"
-#endif
 
 	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index 4b8e85bc2122..e34df58b124a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -140,9 +140,7 @@ void ia_css_pipeline_start(enum ia_css_pipe_id pipe_id,
 				false, false, false, true, SH_CSS_BDS_FACTOR_1_00,
 				SH_CSS_PIPE_CONFIG_OVRD_NO_OVRD,
 				IA_CSS_INPUT_MODE_MEMORY, NULL, NULL,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 				(enum mipi_port_id)0,
-#endif
 				NULL, NULL);
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 8473e1437074..4f7984b75abc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -27,9 +27,7 @@
 #include "sh_css_internal.h"
 #include "sh_css_mipi.h"
 #include "sh_css_sp.h"		/* sh_css_sp_group */
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #include "ia_css_isys.h"
-#endif
 #include "ia_css_frame.h"
 #include "sh_css_defs.h"
 #include "sh_css_firmware.h"
@@ -62,9 +60,7 @@
 #if !defined(HAS_NO_INPUT_FORMATTER)
 #include "ia_css_ifmtr.h"
 #endif
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #include "input_system.h"
-#endif
 #include "mmu_device.h"		/* mmu_set_page_table_base_index(), ... */
 #include "ia_css_mmu_private.h" /* sh_css_mmu_set_page_table_base_index() */
 #include "gdc_device.h"		/* HRT_GDC_N */
@@ -533,7 +529,7 @@ ia_css_stream_input_format_bits_per_pixel(struct ia_css_stream *stream)
 
 #define GP_ISEL_TPG_MODE 0x90058
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 static int
 sh_css_config_input_network(struct ia_css_stream *stream) {
 	unsigned int fmt_type;
@@ -594,7 +590,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 			    "sh_css_config_input_network() leave:\n");
 	return 0;
 }
-#elif !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2401)
+#elif defined(USE_INPUT_SYSTEM_VERSION_2401)
 static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
     enum atomisp_input_format	format,
     unsigned int			pixels_per_line)
@@ -1375,12 +1371,7 @@ start_binary(struct ia_css_pipe *pipe,
 
 	(void)binary;
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	stream = pipe->stream;
-#else
-	(void)pipe;
-	(void)stream;
-#endif
 
 	if (binary)
 		sh_css_metrics_start_binary(&binary->metrics);
@@ -1395,7 +1386,7 @@ start_binary(struct ia_css_pipe *pipe,
 		sh_binary_running = true;
 #endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
 	if (stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
@@ -1415,7 +1406,7 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 	if ((!pipe) || (!pipe->stream))
 		return -EINVAL;
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
 	if (pipe->stream->reconfigure_css_rx)
 		ia_css_isys_rx_disable();
 #endif
@@ -1424,7 +1415,7 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 		return -EINVAL;
 	sh_css_sp_start_binary_copy(ia_css_pipe_get_pipe_num(pipe), out_frame, pipe->stream->config.pixels_per_clock == 2);
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
 	if (pipe->stream->reconfigure_css_rx)
 	{
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
@@ -1461,9 +1452,6 @@ static void start_pipe(
 	const struct ia_css_coordinate *coord = NULL;
 	const struct ia_css_isp_parameters *params = NULL;
 
-#if defined(HAS_NO_INPUT_SYSTEM)
-	(void)input_mode;
-#endif
 
 	IA_CSS_ENTER_PRIVATE("me = %p, copy_ovrd = %d, input_mode = %d",
 			     me, copy_ovrd, input_mode);
@@ -1487,11 +1475,9 @@ static void start_pipe(
 				input_mode,
 				&me->stream->config.metadata_config,
 				&me->stream->info.metadata_info
-#if !defined(HAS_NO_INPUT_SYSTEM)
 				, (input_mode == IA_CSS_INPUT_MODE_MEMORY) ?
 				(enum mipi_port_id)0 :
 				me->stream->config.source.port.port,
-#endif
 				coord,
 				params);
 
@@ -1551,13 +1537,6 @@ enable_interrupts(enum ia_css_irq_type irq_type)
 	cnd_virq_enable_channel(
 	    (enum virq_id)(IRQ_SW_CHANNEL1_ID + IRQ_SW_CHANNEL_OFFSET),
 	    true);
-#if !defined(HAS_IRQ_MAP_VERSION_2)
-	/* IRQ_SW_CHANNEL2_ID does not exist on 240x systems */
-	cnd_virq_enable_channel(
-	    (enum virq_id)(IRQ_SW_CHANNEL2_ID + IRQ_SW_CHANNEL_OFFSET),
-	    true);
-	virq_clear_all();
-#endif
 
 #ifdef USE_INPUT_SYSTEM_VERSION_2
 	for (port = 0; port < N_MIPI_PORT_ID; port++)
@@ -1832,15 +1811,10 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	sh_css_init_buffer_queues();
 	*/
 
-#if defined(HAS_INPUT_SYSTEM_VERSION_2) && defined(HAS_INPUT_SYSTEM_VERSION_2401)
-#if	defined(USE_INPUT_SYSTEM_VERSION_2)
-	gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 0);
-#elif defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(HAS_INPUT_SYSTEM_VERSION_2401)
 	gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 1);
 #endif
-#endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 
 	if (!IS_ISP2401)
 		dma_set_max_burst_size(DMA0_ID, HIVE_DMA_BUS_DDR_CONN,
@@ -1851,7 +1825,6 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 
 	if (ia_css_isys_init() != INPUT_SYSTEM_ERR_NO_ERROR)
 		err = -EINVAL;
-#endif
 
 	sh_css_params_map_and_store_default_gdc_lut();
 
@@ -2542,14 +2515,11 @@ ia_css_uninit(void)
 
 	sh_css_sp_reset_global_vars();
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	ia_css_isys_uninit();
-#endif
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_uninit() leave: return_void\n");
 }
 
-#if defined(HAS_IRQ_MAP_VERSION_2)
 int ia_css_irq_translate(
     unsigned int *irq_infos)
 {
@@ -2581,7 +2551,6 @@ int ia_css_irq_translate(
 			break;
 		case virq_isp:
 			break;
-#if !defined(HAS_NO_INPUT_SYSTEM)
 		case virq_isys_sof:
 			infos |= IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF;
 			break;
@@ -2591,7 +2560,6 @@ int ia_css_irq_translate(
 		case virq_isys_csi:
 			infos |= IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR;
 			break;
-#endif
 #if !defined(HAS_NO_INPUT_FORMATTER)
 		case virq_ifmt0_id:
 			infos |= IA_CSS_IRQ_INFO_IF_ERROR;
@@ -2672,9 +2640,6 @@ int ia_css_irq_enable(
 	return 0;
 }
 
-#else
-#error "sh_css.c: IRQ MAP must be one of { IRQ_MAP_VERSION_2 }"
-#endif
 
 static unsigned int
 sh_css_get_sw_interrupt_value(unsigned int irq)
@@ -4050,9 +4015,7 @@ preview_start(struct ia_css_pipe *pipe) {
 					pipe->stream->config.mode,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 					pipe->stream->config.source.port.port,
-#endif
 					coord,
 					params);
 
@@ -4076,9 +4039,7 @@ preview_start(struct ia_css_pipe *pipe) {
 					IA_CSS_INPUT_MODE_MEMORY,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 					(enum mipi_port_id)0,
-#endif
 					coord,
 					params);
 	}
@@ -4097,9 +4058,7 @@ preview_start(struct ia_css_pipe *pipe) {
 					IA_CSS_INPUT_MODE_MEMORY,
 					NULL,
 					NULL,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 					(enum mipi_port_id)0,
-#endif
 					coord,
 					params);
 	}
@@ -5286,7 +5245,7 @@ sh_css_pipes_have_stopped(struct ia_css_stream *stream)
 	return rval;
 }
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port, const unsigned int idx)
 {
@@ -5413,13 +5372,7 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
 		info->isp_in_height = binary->internal_frame_info.res.height;
 	}
 
-#if defined(HAS_VAMEM_VERSION_2)
 	info->vamem_type = IA_CSS_VAMEM_TYPE_2;
-#elif defined(HAS_VAMEM_VERSION_1)
-	info->vamem_type = IA_CSS_VAMEM_TYPE_1;
-#else
-#error "Unknown VAMEM version"
-#endif
 
 ERR :
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -5867,9 +5820,7 @@ static int video_start(struct ia_css_pipe *pipe)
 					pipe->stream->config.mode,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 					pipe->stream->config.source.port.port,
-#endif
 					coord,
 					params);
 
@@ -5892,9 +5843,7 @@ static int video_start(struct ia_css_pipe *pipe)
 					IA_CSS_INPUT_MODE_MEMORY,
 					&pipe->stream->config.metadata_config,
 					&pipe->stream->info.metadata_info,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 					(enum mipi_port_id)0,
-#endif
 					coord,
 					params);
 	}
@@ -6754,7 +6703,7 @@ static int load_capture_binaries(
 	switch (pipe->config.default_capture_config.mode) {
 	case IA_CSS_CAPTURE_MODE_RAW:
 		err = load_copy_binaries(pipe);
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2401)
 		if (!err)
 			pipe->pipe_settings.capture.copy_binary.online = pipe->stream->config.online;
 #endif
@@ -7409,7 +7358,7 @@ static int yuvpp_start(struct ia_css_pipe *pipe)
 
 	/* multi stream video needs mipi buffers */
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && (defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401))
+#if (defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401))
 	err = send_mipi_frames(pipe);
 	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -7989,7 +7938,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	{
 		if (raw) {
 			ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2401)
 			if (!continuous) {
 				ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
 								    out_frames, in_frame, NULL);
@@ -8282,7 +8231,7 @@ static int capture_start(
 	}
 	start_pipe(pipe, copy_ovrd, pipe->stream->config.mode);
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && !defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if !defined(USE_INPUT_SYSTEM_VERSION_2401)
 	/*
 	    * old isys: for IA_CSS_PIPE_MODE_COPY pipe, isys rx has to be configured,
 	    * which is currently done in start_binary(); but COPY pipe contains no binary,
@@ -8332,7 +8281,6 @@ sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 	return 0;
 }
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 void
 ia_css_stream_send_input_frame(const struct ia_css_stream *stream,
 				const unsigned short *data,
@@ -8387,7 +8335,6 @@ ia_css_stream_end_input_frame(const struct ia_css_stream *stream) {
 
 	ia_css_inputfifo_end_frame(stream->config.channel_id);
 }
-#endif
 
 static void
 append_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {
@@ -8762,12 +8709,10 @@ sh_css_init_host_sp_control_vars(void) {
 #endif
 	store_sp_array_uint(host_sp_com, o, host2sp_cmd_ready);
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	for (i = 0; i < N_CSI_PORTS; i++) {
 		sh_css_update_host2sp_num_mipi_frames
 		(my_css.num_mipi_frames[i]);
 	}
-#endif
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "sh_css_init_host_sp_control_vars() leave: return_void\n");
@@ -9363,7 +9308,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	}
 #endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	ia_css_debug_pipe_graph_dump_stream_config(stream_config);
 
 	/* check if mipi size specified */
@@ -9408,7 +9352,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				return err;
 			}
 		}
-#endif
 
 	/* Currently we only supported metadata up to a certain size. */
 	err = metadata_info_init(&stream_config->metadata_config, &md_info);
@@ -9484,7 +9427,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 #endif
 		break;
 	case IA_CSS_INPUT_MODE_TPG:
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 		IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",
 			    curr_stream->config.source.tpg.x_mask,
 			    curr_stream->config.source.tpg.y_mask,
@@ -9501,7 +9444,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 #endif
 		break;
 	case IA_CSS_INPUT_MODE_PRBS:
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 		IA_CSS_LOG("mode prbs");
 		sh_css_sp_configure_prbs(curr_stream->config.source.prbs.seed);
 #endif
@@ -10003,15 +9946,13 @@ ia_css_stream_start(struct ia_css_stream *stream) {
 		return err;
 	}
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #if defined(USE_INPUT_SYSTEM_VERSION_2401)
 	if ((stream->config.mode == IA_CSS_INPUT_MODE_SENSOR) ||
 	    (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR))
 		stream_register_with_csi_rx(stream);
 #endif
-#endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 	/* Initialize mipi size checks */
 	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
 	{
@@ -10025,14 +9966,12 @@ ia_css_stream_start(struct ia_css_stream *stream) {
 	}
 #endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	if (stream->config.mode != IA_CSS_INPUT_MODE_MEMORY)
 	{
 		err = sh_css_config_input_network(stream);
 		if (err)
 			return err;
 	}
-#endif /* !HAS_NO_INPUT_SYSTEM */
 
 	err = sh_css_pipe_start(stream);
 	IA_CSS_LEAVE_ERR(err);
@@ -10049,7 +9988,7 @@ ia_css_stream_stop(struct ia_css_stream *stream) {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop: stopping %d\n",
 			    stream->last_pipe->mode);
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 	/* De-initialize mipi size checks */
 	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
 	{
@@ -10527,7 +10466,7 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 
-#if defined(HAS_NO_INPUT_SYSTEM) || defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2401)
 	need_input_queue = true;
 #else
 	need_input_queue = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_hrt.c b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
index 06b502151af9..879c85311038 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_hrt.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
@@ -64,11 +64,7 @@ bool sh_css_hrt_system_is_idle(void)
 
 int sh_css_hrt_sp_wait(void)
 {
-#if defined(HAS_IRQ_MAP_VERSION_2)
 	irq_sw_channel_id_t	irq_id = IRQ_SW_CHANNEL0_ID;
-#else
-	irq_sw_channel_id_t	irq_id = IRQ_SW_CHANNEL2_ID;
-#endif
 	/*
 	 * Wait till SP is idle or till there is a SW2 interrupt
 	 * The SW2 interrupt will be used when frameloop runs on SP
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 5c25a25dce92..54847abf667a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -400,7 +400,7 @@ struct sh_css_sp_config {
 			set[SH_CSS_MAX_IF_CONFIGS]; /* CSI-2 port is used as index. */
 	} input_formatter;
 #endif
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 	sync_generator_cfg_t	sync_gen;
 	tpg_cfg_t		tpg;
 	prbs_cfg_t		prbs;
@@ -423,7 +423,7 @@ enum sh_css_stage_type {
 #define SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS_MASK \
 	((SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << SH_CSS_MAX_SP_THREADS) - 1)
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2401)
 struct sh_css_sp_pipeline_terminal {
 	union {
 		/* Input System 2401 */
@@ -679,7 +679,7 @@ struct sh_css_sp_stage {
 struct sh_css_sp_group {
 	struct sh_css_sp_config		config;
 	struct sh_css_sp_pipeline	pipe[SH_CSS_MAX_SP_THREADS];
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2401)
+#if defined(USE_INPUT_SYSTEM_VERSION_2401)
 	struct sh_css_sp_pipeline_io	pipe_io[SH_CSS_MAX_SP_THREADS];
 	struct sh_css_sp_pipeline_io_status	pipe_io_status;
 #endif
@@ -987,7 +987,7 @@ sh_css_frame_info_set_width(struct ia_css_frame_info *info,
 			    unsigned int width,
 			    unsigned int aligned);
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 
 unsigned int
 sh_css_get_mipi_sizes_for_check(const unsigned int port,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 2ef5dbd62a6d..a0be171fba83 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -246,7 +246,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	return err;
 }
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 int
 ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
 				       const unsigned int	size_mem_words) {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index ba42be9b06eb..6d827ec67192 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -143,7 +143,6 @@ static int interleaved_lut_temp[4][HRT_GDC_N];
 /* Digital Zoom lookup table. See documentation for more details about the
  * contents of this table.
  */
-#if defined(HAS_GDC_VERSION_2)
 #if defined(CONFIG_CSI2_PLUS)
 /*
  * Coefficients from
@@ -1196,10 +1195,6 @@ static const int zoom_table[4][HRT_GDC_N] = {
 	}
 };
 #endif
-#else
-#error "sh_css_params.c: GDC version must be \
-one of {GDC_VERSION_2}"
-#endif
 
 static const struct ia_css_dz_config default_dz_config = {
 	HRT_GDC_N,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_properties.c b/drivers/staging/media/atomisp/pci/sh_css_properties.c
index de588f9bd540..8ecd93d65a68 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_properties.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_properties.c
@@ -22,23 +22,13 @@ void
 ia_css_get_properties(struct ia_css_properties *properties)
 {
 	assert(properties);
-#if defined(HAS_GDC_VERSION_2) || defined(HAS_GDC_VERSION_3)
 	/*
 	 * MW: We don't want to store the coordinates
 	 * full range in memory: Truncate
 	 */
 	properties->gdc_coord_one = gdc_get_unity(GDC0_ID) / HRT_GDC_COORD_SCALE;
-#else
-#error "Unknown GDC version"
-#endif
 
 	properties->l1_base_is_index = true;
 
-#if defined(HAS_VAMEM_VERSION_1)
-	properties->vamem_type = IA_CSS_VAMEM_TYPE_1;
-#elif defined(HAS_VAMEM_VERSION_2)
 	properties->vamem_type = IA_CSS_VAMEM_TYPE_2;
-#else
-#error "Unknown VAMEM version"
-#endif
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index a26680b1d0b0..9f681b2e9f99 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -38,9 +38,7 @@
 #include "sh_css_params.h"
 #include "sh_css_legacy.h"
 #include "ia_css_frame_comm.h"
-#if !defined(HAS_NO_INPUT_SYSTEM)
 #include "ia_css_isys.h"
-#endif
 
 #include "gdc_device.h"				/* HRT_GDC_N */
 
@@ -662,7 +660,7 @@ void sh_css_sp_set_if_configs(
 }
 #endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 void
 sh_css_sp_program_input_circuit(int fmt_type,
 				int ch_id,
@@ -681,7 +679,7 @@ sh_css_sp_program_input_circuit(int fmt_type,
 }
 #endif
 
-#if !defined(HAS_NO_INPUT_SYSTEM) && defined(USE_INPUT_SYSTEM_VERSION_2)
+#if defined(USE_INPUT_SYSTEM_VERSION_2)
 void
 sh_css_sp_configure_sync_gen(int width, int height,
 			     int hblank_cycles,
@@ -724,11 +722,7 @@ sh_css_sp_configure_enable_raw_pool_locking(bool lock_all)
 void
 sh_css_sp_enable_isys_event_queue(bool enable)
 {
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	sh_css_sp_group.config.enable_isys_event_queue = enable;
-#else
-	(void)enable;
-#endif
 }
 
 void
@@ -1206,9 +1200,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 			enum ia_css_input_mode input_mode,
 			const struct ia_css_metadata_config *md_config,
 			const struct ia_css_metadata_info *md_info,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 			const enum mipi_port_id port_id,
-#endif
 			const struct ia_css_coordinate
 			*internal_frame_origin_bqs_on_sctbl, /* Origin of internal frame
 							positioned on shading table at shading correction in ISP. */
@@ -1226,7 +1218,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 
 	assert(me);
 
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	assert(me->stages);
 
 	first_binary = me->stages->binary;
@@ -1245,10 +1236,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	{
 		if_config_index = 0x0;
 	}
-#else
-	(void)input_mode;
-	if_config_index = SH_CSS_IF_CONFIG_NOT_NEEDED;
-#endif
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 	memset(&sh_css_sp_group.pipe[thread_id], 0, sizeof(struct sh_css_sp_pipeline));
@@ -1285,11 +1272,9 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	sh_css_sp_group.pipe[thread_id].num_execs = me->num_execs;
 	sh_css_sp_group.pipe[thread_id].pipe_qos_config = me->pipe_qos_config;
 	sh_css_sp_group.pipe[thread_id].required_bds_factor = required_bds_factor;
-#if !defined(HAS_NO_INPUT_SYSTEM)
 	sh_css_sp_group.pipe[thread_id].input_system_mode
 	= (uint32_t)input_mode;
 	sh_css_sp_group.pipe[thread_id].port_id = port_id;
-#endif
 	sh_css_sp_group.pipe[thread_id].dvs_frame_delay = (uint32_t)me->dvs_frame_delay;
 
 	/* TODO: next indicates from which queues parameters need to be
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index 153b005becda..18a1fefda4b5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -66,9 +66,7 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 			enum ia_css_input_mode input_mode,
 			const struct ia_css_metadata_config *md_config,
 			const struct ia_css_metadata_info *md_info,
-#if !defined(HAS_NO_INPUT_SYSTEM)
 			const enum mipi_port_id port_id,
-#endif
 			const struct ia_css_coordinate
 			*internal_frame_origin_bqs_on_sctbl, /* Origin of internal frame
 							positioned on shading table at shading correction in ISP. */
-- 
2.26.2

