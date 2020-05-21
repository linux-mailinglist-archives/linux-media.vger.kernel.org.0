Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A421DD785
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 21:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbgEUToi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 15:44:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33794 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbgEUToi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 15:44:38 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jbr7I-00085v-KW; Thu, 21 May 2020 19:44:32 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: atomisp: fix a handful of spelling mistakes
Date:   Thu, 21 May 2020 20:44:32 +0100
Message-Id: <20200521194432.357572-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several spelling mistakes in various messages and literal
strings. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../staging/media/atomisp/pci/base/refcount/src/refcount.c  | 2 +-
 .../media/atomisp/pci/css_2401_system/host/csi_rx_private.h | 4 ++--
 .../atomisp/pci/css_2401_system/host/pixelgen_private.h     | 4 ++--
 drivers/staging/media/atomisp/pci/sh_css.c                  | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index e39cc2132953..8f0c94449ec9 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -46,7 +46,7 @@ static struct ia_css_refcount_entry *refcount_find_entry(hrt_vaddress ptr,
 		return NULL;
 	if (!myrefcount.items) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
-				    "refcount_find_entry(): Ref count not initiliazed!\n");
+				    "refcount_find_entry(): Ref count not initialized!\n");
 		return NULL;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
index 3fa3c3a487ab..97ad67e438f0 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
@@ -289,12 +289,12 @@ static inline void csi_rx_be_ctrl_dump_state(
 	 * lut.
 	 */
 	for (i = 0; i < N_SHORT_PACKET_LUT_ENTRIES[ID]; i++) {
-		ia_css_print("CSI RX BE STATE Controller ID %d Short packat entry %d shart packet lut id 0x%x\n",
+		ia_css_print("CSI RX BE STATE Controller ID %d Short packet entry %d short packet lut id 0x%x\n",
 			     ID, i,
 			     state->short_packet_lut_entry[i]);
 	}
 	for (i = 0; i < N_LONG_PACKET_LUT_ENTRIES[ID]; i++) {
-		ia_css_print("CSI RX BE STATE Controller ID %d Long packat entry %d Long packet lut id 0x%x\n",
+		ia_css_print("CSI RX BE STATE Controller ID %d Long packet entry %d long packet lut id 0x%x\n",
 			     ID, i,
 			     state->long_packet_lut_entry[i]);
 	}
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
index 65ea23604479..5d4ffe03d13b 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
@@ -97,9 +97,9 @@ STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_dump_state(
     pixelgen_ctrl_state_t *state)
 {
 	ia_css_print("Pixel Generator ID %d Enable  0x%x\n", ID, state->com_enable);
-	ia_css_print("Pixel Generator ID %d PRBS reset vlue 0 0x%x\n", ID,
+	ia_css_print("Pixel Generator ID %d PRBS reset value 0 0x%x\n", ID,
 		     state->prbs_rstval0);
-	ia_css_print("Pixel Generator ID %d PRBS reset vlue 1 0x%x\n", ID,
+	ia_css_print("Pixel Generator ID %d PRBS reset value 1 0x%x\n", ID,
 		     state->prbs_rstval1);
 	ia_css_print("Pixel Generator ID %d SYNC SID 0x%x\n", ID, state->syng_sid);
 	ia_css_print("Pixel Generator ID %d syng free run 0x%x\n", ID,
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index d77432254a2c..fee91b542c65 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1324,7 +1324,7 @@ static void print_pc_histogram(void)
 		sh_css_print(" pc_histogram for binary %d\n", metrics->id);
 		print_pc_histo("  ISP", &metrics->isp_histogram);
 		print_pc_histo("  SP",   &metrics->sp_histogram);
-		sh_css_print("print_pc_histogram() done for binay->id = %d, done.\n",
+		sh_css_print("print_pc_histogram() done for binary->id = %d, done.\n",
 			     metrics->id);
 	}
 
@@ -5335,7 +5335,7 @@ static enum ia_css_err sh_css_pipe_configure_output(
 {
 	enum ia_css_err err = IA_CSS_SUCCESS;
 
-	IA_CSS_ENTER_PRIVATE("pipe = %p, width = %d, height = %d, paddaed width = %d, format = %d, idx = %d",
+	IA_CSS_ENTER_PRIVATE("pipe = %p, width = %d, height = %d, padded width = %d, format = %d, idx = %d",
 			     pipe, width, height, padded_width, format, idx);
 	if (!pipe) {
 		IA_CSS_LEAVE_ERR_PRIVATE(IA_CSS_ERR_INVALID_ARGUMENTS);
@@ -10705,7 +10705,7 @@ ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id) {
 	if (exp_id > IA_CSS_ISYS_MAX_EXPOSURE_ID ||
 	    exp_id < IA_CSS_ISYS_MIN_EXPOSURE_ID)
 	{
-		IA_CSS_ERROR("invalid expsure ID: %d\n", exp_id);
+		IA_CSS_ERROR("invalid exposure ID: %d\n", exp_id);
 		return IA_CSS_ERR_INVALID_ARGUMENTS;
 	}
 
-- 
2.25.1

