Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5771F8230
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2020 11:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgFMJO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 05:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgFMJOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 05:14:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9188EC03E96F
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 02:14:18 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C05252A4B43
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [RESEND PATCH v3 6/6] media: staging: rkisp1: common: add documentation for struct rkisp1_isp_mbus_info
Date:   Sat, 13 Jun 2020 11:13:53 +0200
Message-Id: <20200613091353.12689-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200613091353.12689-1-dafna.hirschfeld@collabora.com>
References: <20200613091353.12689-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the struct rkisp1_isp_mbus_info with
one line doc of each field

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 13c5eeff66f3..6104eddac0e5 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -268,6 +268,19 @@ struct rkisp1_device {
 	struct rkisp1_debug debug;
 };
 
+/*
+ * struct rkisp1_isp_mbus_info
+ *
+ * holds information about the supported isp media bus
+ * @mbus_code: the media bus code
+ * @pixel_enc: the pixel encoding
+ * @mipi_dt: the mipi data type
+ * @yuv_seq: the order of the yuv values for yuv formats
+ * @bus_width: the bus width
+ * @bayer_pat: the bayer pattern for bayer formats
+ * @isp_pads_mask: a bitmask of the pads that the format is supported on
+ */
+
 /*
  * struct rkisp1_isp_mbus_info - ISP pad format info
  *
-- 
2.17.1

