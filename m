Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FFA2F80F5
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 17:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbhAOQjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 11:39:16 -0500
Received: from gloria.sntech.de ([185.11.138.130]:58664 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726137AbhAOQjQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 11:39:16 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.sntech)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l0S7N-0006YA-RM; Fri, 15 Jan 2021 17:38:33 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, heiko@sntech.de,
        tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v4 1/3] media: rockchip: rkisp1: fix comment about number of histogram sub-windows
Date:   Fri, 15 Jan 2021 17:38:27 +0100
Message-Id: <20210115163829.217131-2-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115163829.217131-1-heiko@sntech.de>
References: <20210115163829.217131-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The histogram data is divided into 16 sub-windows, not 25.
See RKISP1_CIF_ISP_HIST_BIN_N_MAX being defined as 16 for reference
and this also matches the datasheet.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 include/uapi/linux/rkisp1-config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 6e449e784260..ba443771cc0b 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -846,7 +846,7 @@ struct rkisp1_cif_isp_af_stat {
  *
  * @hist_bins: measured bin counters
  *
- * Measurement window divided into 25 sub-windows, set
+ * Measurement window divided into 16 sub-windows, set
  * with ISP_HIST_XXX
  */
 struct rkisp1_cif_isp_hist_stat {
-- 
2.29.2

