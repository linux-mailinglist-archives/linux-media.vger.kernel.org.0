Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB06E2127D
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 05:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfEQD0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 23:26:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:43554 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725929AbfEQD0E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 23:26:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 May 2019 20:26:04 -0700
X-ExtLoop1: 1
Received: from ipu5-build.bj.intel.com ([10.238.232.187])
  by orsmga005.jf.intel.com with ESMTP; 16 May 2019 20:26:03 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, tfiga@chromium.org,
        andy.yeh@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH v3] media:staging/intel-ipu3: update minimal GDC envelope size to 4
Date:   Fri, 17 May 2019 11:33:34 +0800
Message-Id: <1558064014-4610-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

The ipu3 GDC function need some envelope to do filtering and the
minimal envelope size(GDC in - out) for ipu3 should be 4.
Current value 4 was defined for older version GDC, this patch
correct it.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>

---
 drivers/staging/media/ipu3/ipu3-css.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 23cf5b2cfe8b..fd1ed84c400c 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -24,9 +24,8 @@
 #define IPU3_CSS_MAX_H		3136
 #define IPU3_CSS_MAX_W		4224
 
-/* filter size from graph settings is fixed as 4 */
-#define FILTER_SIZE             4
-#define MIN_ENVELOPE            8
+/* minimal envelope size(GDC in - out) should be 4 */
+#define MIN_ENVELOPE            4
 
 /*
  * pre-allocated buffer size for CSS ABI, auxiliary frames
@@ -1827,9 +1826,9 @@ int imgu_css_fmt_try(struct imgu_css *css,
 	vf->width   = imgu_css_adjust(vf->width, VF_ALIGN_W);
 	vf->height  = imgu_css_adjust(vf->height, 1);
 
-	s = (bds->width - gdc->width) / 2 - FILTER_SIZE;
+	s = (bds->width - gdc->width) / 2;
 	env->width = s < MIN_ENVELOPE ? MIN_ENVELOPE : s;
-	s = (bds->height - gdc->height) / 2 - FILTER_SIZE;
+	s = (bds->height - gdc->height) / 2;
 	env->height = s < MIN_ENVELOPE ? MIN_ENVELOPE : s;
 
 	ret = imgu_css_find_binary(css, pipe, q, r);
@@ -2251,9 +2250,8 @@ int imgu_css_set_parameters(struct imgu_css *css, unsigned int pipe,
 				css_pipe->aux_frames[a].height,
 				css_pipe->rect[g].width,
 				css_pipe->rect[g].height,
-				css_pipe->rect[e].width + FILTER_SIZE,
-				css_pipe->rect[e].height +
-				FILTER_SIZE);
+				css_pipe->rect[e].width,
+				css_pipe->rect[e].height);
 		}
 	}
 
-- 
1.9.1

