Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C502FBE15
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 18:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388687AbhASPGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 10:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392096AbhASO4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 09:56:22 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CDEC061796
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 06:54:07 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 71B551F45301
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, heiko@sntech.de
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH] media: rkisp1: uapi: change hist_bins array type from __u16 to __u32
Date:   Tue, 19 Jan 2021 15:53:41 +0100
Message-Id: <20210119145341.29686-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each entry in the array is a 20 bits value composed of 16
bits unsigned integer and 4 bits fractional part. So the
type should change to __u32.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
This patch is applied on top of v6 of the patchset
"Fix the rkisp1 userspace API for later IP versions"

 include/uapi/linux/rkisp1-config.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 57ca3eea985f..47f6b84d7c56 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -895,7 +895,8 @@ struct rkisp1_cif_isp_af_stat {
 /**
  * struct rkisp1_cif_isp_hist_stat - statistics histogram data
  *
- * @hist_bins: measured bin counters
+ * @hist_bins: measured bin counters. Each bin is a 20 bits value
+ *	       composed of a 16-bit unsigned integer and 4 bits fractional part.
  *
  * The histogram values divided into 16 bins for V10/V11 and 32 bins
  * for V12/V13. It is configured within the struct rkisp1_cif_isp_hst_config.
@@ -909,7 +910,7 @@ struct rkisp1_cif_isp_af_stat {
  * RKISP1_CIF_ISP_HIST_BIN_N_MAX is equal to the maximum of the two.
  */
 struct rkisp1_cif_isp_hist_stat {
-	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
+	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
 };
 
 /**
-- 
2.17.1

