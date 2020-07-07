Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56A7217605
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 20:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgGGSLE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 14:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgGGSLE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 14:11:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D36C061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 11:11:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id A16F62A0DFA
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: remove duplicate macro definition
Date:   Tue,  7 Jul 2020 20:10:53 +0200
Message-Id: <20200707181053.24134-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The macro RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN is defined twice.
Remove the second define.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-regs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-regs.h b/drivers/staging/media/rkisp1/rkisp1-regs.h
index 46018f435b6f..9b8e616ea24c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-regs.h
+++ b/drivers/staging/media/rkisp1/rkisp1-regs.h
@@ -398,7 +398,6 @@
 #define RKISP1_CIF_ISP_AWB_YMAX_READ(x)			(((x) >> 2) & 1)
 #define RKISP1_CIF_ISP_AWB_MODE_RGB_EN			((1 << 31) | (0x2 << 0))
 #define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
-#define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
 #define RKISP1_CIF_ISP_AWB_MODE_MASK_NONE		0xFFFFFFFC
 #define RKISP1_CIF_ISP_AWB_MODE_READ(x)			((x) & 3)
 /* ISP_AWB_GAIN_RB, ISP_AWB_GAIN_G  */
-- 
2.17.1

