Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F351D217635
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgGGSQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgGGSQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:16:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EAEC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 11:16:40 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id CE1342A1867
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: fix typos in file rkisp1-config.h
Date:   Tue,  7 Jul 2020 20:16:30 +0200
Message-Id: <20200707181630.24514-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix two spelling typos in file rkisp1-config.h.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index 7983498bda24..e68175c7c154 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -86,7 +86,7 @@
 #define RKISP1_CIF_ISP_BLS_FIX_MASK                0x00001fff
 
 /*
- * Automatic white balance measurments
+ * Automatic white balance measurements
  */
 #define RKISP1_CIF_ISP_AWB_MAX_GRID                1
 #define RKISP1_CIF_ISP_AWB_MAX_FRAMES              7
@@ -485,7 +485,7 @@ struct rkisp1_cif_isp_flt_config {
 /**
  * struct rkisp1_cif_isp_bdm_config - Configuration used by Bayer DeMosaic
  *
- * @demosaic_th: threshod for bayer demosaicing texture detection
+ * @demosaic_th: threshold for bayer demosaicing texture detection
  */
 struct rkisp1_cif_isp_bdm_config {
 	__u8 demosaic_th;
-- 
2.17.1

