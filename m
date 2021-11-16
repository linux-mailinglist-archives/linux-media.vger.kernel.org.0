Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1FD4530BF
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbhKPLdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:33:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:35184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234888AbhKPLcZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8785461BF4;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=AmrLTVF7atW2JxYtibxKiMRPGifoFVFCsOEGQDjBXBM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tdyl+cYdThNn54fQPhjg+piMuYRkObXCxXKbU5dOFA7EhoKkGbEAee3hWNlXeuFAw
         wqzOm2uOyW1VOKMIyTfsjjytRfLY5wBlWhb220xGP/ODIhgqRRZOpYMRiM5VFLeNXN
         TIiVoLKOMEoNm0M9TlilYpj2CgRcDMCTZCVd5Q+pQs64ggxLAdy62ifsiPiXwAiNY7
         83fk0EiqNi3PhOW1kZU8HBHQAxITctXkBoLB7ku6/Ifz1YQJ13blUXwDdOYblEzFxk
         A4m97mPFoKgpVhusALHo7Q0O+w7SxnHcSLYhAUST9OaYThiU7nVOv9X7p353h2uLXj
         o5S6UvguhLHkg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QgD-OF; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 23/23] media: atomisp: get rid of #ifdef ISP_VEC_NELEMS
Date:   Tue, 16 Nov 2021 11:29:04 +0000
Message-Id: <51fd47d183ce35081591d1e84ee66ffaae030658.1637061474.git.mchehab+huawei@kernel.org>
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

This is defined as 64 for the devices/firmware that were chosen.

So, evaluate the macros accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/isp/modes/interface/isp_const.h  | 10 ----------
 drivers/staging/media/atomisp/pci/sh_css_defs.h        | 10 ----------
 2 files changed, 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
index 11e439d838ae..e5c595e5020b 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
@@ -36,17 +36,7 @@ more details.
 #define BITS8_ELEMENTS_PER_XMEM_ADDR    CEIL_DIV(XMEM_WIDTH_BITS, 8)
 #define BITS16_ELEMENTS_PER_XMEM_ADDR    CEIL_DIV(XMEM_WIDTH_BITS, 16)
 
-#if ISP_VEC_NELEMS == 64
 #define ISP_NWAY_LOG2  6
-#elif ISP_VEC_NELEMS == 32
-#define ISP_NWAY_LOG2  5
-#elif ISP_VEC_NELEMS == 16
-#define ISP_NWAY_LOG2  4
-#elif ISP_VEC_NELEMS == 8
-#define ISP_NWAY_LOG2  3
-#else
-#error "isp_const.h ISP_VEC_NELEMS must be one of {8, 16, 32, 64}"
-#endif
 
 /* *****************************
  * ISP input/output buffer sizes
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 30a84a587b2a..239230ae4b4b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -117,13 +117,8 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 #define SH_CSS_NUM_INPUT_BUF_LINES        4
 
 /* Left cropping only applicable for sufficiently large nway */
-#if ISP_VEC_NELEMS == 16
-#define SH_CSS_MAX_LEFT_CROPPING          0
-#define SH_CSS_MAX_TOP_CROPPING           0
-#else
 #define SH_CSS_MAX_LEFT_CROPPING          12
 #define SH_CSS_MAX_TOP_CROPPING           12
-#endif
 
 #define	SH_CSS_SP_MAX_WIDTH               1280
 
@@ -137,13 +132,8 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
 #define SH_CSS_MIN_DVS_ENVELOPE           12U
 
 /* The FPGA system (vec_nelems == 16) only supports upto 5MP */
-#if ISP_VEC_NELEMS == 16
-#define SH_CSS_MAX_SENSOR_WIDTH           2560
-#define SH_CSS_MAX_SENSOR_HEIGHT          1920
-#else
 #define SH_CSS_MAX_SENSOR_WIDTH           4608
 #define SH_CSS_MAX_SENSOR_HEIGHT          3450
-#endif
 
 /* Limited to reduce vmem pressure */
 #if ISP_VMEM_DEPTH >= 3072
-- 
2.33.1

