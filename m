Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C111E8E7C
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgE3G4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:56:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:44972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728831AbgE3G4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F235216FD;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=jGa0K4jAfjvu7CM/n6ae+n+jjVMsWoaupSnckrLq8m8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cskN+cgyTE2pBgLkIrFfoBzRknUbbFnF1IdcmmfC+tz00sIL63URk7imagwpe4qKg
         x9ZKa8kL9Jw85wIPMiS6+oJnMLSoNR+nQEjz3T9+OjAt53gwZfOgHj35xDrTJ2tJ/M
         SHnoV8aeJ9YwiB8NloB3iTpE0FbQvu5s2R5HT/6k=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hpf-CL; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/41] media: atomisp: avoid OOPS due to non-existing ref_frames
Date:   Sat, 30 May 2020 08:55:37 +0200
Message-Id: <9b16e673413e2793018f815cb5a77444445048e5.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

stage->args->delay_frames array could point to NULL frames.

What's weird is that we didn't notice this behavior with the
Intel Aero Yocto code.

Handle it, while adding a notice at the code, as this could
be due to some broken pipeline setup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c   | 13 +++++++++----
 drivers/staging/media/atomisp/pci/sh_css_sp.c       | 11 +++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
index 38594741321c..cbe3836419a2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c
@@ -29,10 +29,15 @@ ia_css_ref_config(
 {
 	unsigned int elems_a = ISP_VEC_NELEMS, i;
 
-	(void)size;
-	ia_css_dma_configure_from_info(&to->port_b, &from->ref_frames[0]->info);
-	to->width_a_over_b = elems_a / to->port_b.elems;
-	to->dvs_frame_delay = from->dvs_frame_delay;
+	if (from->ref_frames[0]) {
+		ia_css_dma_configure_from_info(&to->port_b, &from->ref_frames[0]->info);
+		to->width_a_over_b = elems_a / to->port_b.elems;
+		to->dvs_frame_delay = from->dvs_frame_delay;
+	} else {
+		to->width_a_over_b = 1;
+		to->dvs_frame_delay = 0;
+		to->port_b.elems = elems_a;
+	}
 	for (i = 0; i < MAX_NUM_VIDEO_DELAY_FRAMES; i++) {
 		if (from->ref_frames[i]) {
 			to->ref_frame_addr_y[i] = from->ref_frames[i]->data +
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 1ed060d6d855..db543c3fec51 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -839,6 +839,17 @@ configure_isp_from_args(
 	ia_css_dvs_configure(binary, &args->out_frame[0]->info);
 	ia_css_output_configure(binary, &args->out_frame[0]->info);
 	ia_css_raw_configure(pipeline, binary, &args->in_frame->info, &binary->in_frame_info, two_ppc, deinterleaved);
+
+	/*
+	 * FIXME: args->delay_frames can be NULL here
+	 *
+	 * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
+	 * suffer from the same issue.
+	 *
+	 * Anyway, the function below should now handle a NULL delay_frames
+	 * without crashing, but the pipeline should likely be built without
+	 * adding it at the first place (or there are a hidden bug somewhere)
+	 */
 	ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
 	ia_css_tnr_configure(binary, args->tnr_frames);
 	ia_css_bayer_io_config(binary, args);
-- 
2.26.2

