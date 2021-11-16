Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687254530D1
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbhKPLfJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:35:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:35168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235133AbhKPLcl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA42C63220;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=NPm8N4ShvwZEb63+8x3Mv3yvsEQXpPLe5iTnhSZmgA4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SAZUpXgWzraGgfICJE+EUV4QP4Y6+xxNyzjrlJYxz7TQ+iZXygp3VOody0y/ROylY
         ClX8u3tOCSBDEqzQztLS6aqmlILni2bBn7I4oJ5s/+So9hpZ+O88NSazYU6ovKuk2V
         XKGZNVc+oGYo9cgN+4Z+28DFkSYw9aJHsxSVtgpj0sOiyOi8CmgvjEe5RhEeo7W2YV
         BYuiQkc8UlEphLEIUdO1AeqN6tACNbMX9csuWq80r4NWXt5ZLyFDSAw0uuHWKxMwxi
         R1wyIS4C1NAKzoFAGcaaWJ9ASkEykYg0eG6Crc7NWZEcd+Kyj0JpNLFGxvfV72TvjL
         TLGQFU7mux5gA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qg7-N8; Tue, 16 Nov 2021 11:29:05 +0000
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
Subject: [PATCH 21/23] media: atomisp: warn if mipi de-allocation failed
Date:   Tue, 16 Nov 2021 11:29:02 +0000
Message-Id: <ed5523284722c3d8a3b8fe5913ff51ee21d52af8.1637061474.git.mchehab+huawei@kernel.org>
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

There's a note at the uninit function that warns about issues
with mipi frames de-allocation. print a warning if the problem
ever happens.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c      |  6 +++++-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 11 +++++++++++
 drivers/staging/media/atomisp/pci/sh_css_mipi.h |  2 ++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 12dfecbb6145..8bcf610ccae3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -20,6 +20,8 @@
 
 #include "hmm.h"
 
+#include "atomisp_internal.h"
+
 #include "ia_css.h"
 #include "sh_css_hrt.h"		/* only for file 2 MIPI */
 #include "ia_css_buffer.h"
@@ -2286,7 +2288,9 @@ ia_css_uninit(void)
 	sh_css_params_free_default_gdc_lut();
 
 	/* TODO: JB: implement decent check and handling of freeing mipi frames */
-	//assert(ref_count_mipi_allocation == 0); //mipi frames are not freed
+	if (!mipi_is_free())
+		dev_warn(atomisp_dev, "mipi frames are not freed.\n");
+
 	/* cleanup generic data */
 	sh_css_params_uninit();
 	ia_css_refcount_uninit();
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 87f1df575d9f..cfaa4719177c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -261,6 +261,17 @@ mipi_init(void)
 		ref_count_mipi_allocation[i] = 0;
 }
 
+bool mipi_is_free(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < N_CSI_PORTS; i++)
+		if (ref_count_mipi_allocation[i])
+			return false;
+
+	return true;
+}
+
 int
 calculate_mipi_buff_size(
     struct ia_css_stream_config *stream_cfg,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.h b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
index 52f08a103883..dffec2205620 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
@@ -23,6 +23,8 @@
 void
 mipi_init(void);
 
+bool mipi_is_free(void);
+
 int
 allocate_mipi_frames(struct ia_css_pipe *pipe, struct ia_css_stream_info *info);
 
-- 
2.33.1

