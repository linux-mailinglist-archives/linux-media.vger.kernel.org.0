Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867EF2740E8
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIVLeQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgIVLeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:34:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E54BC0613D1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 04:34:15 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D5EFB29B4C2;
        Tue, 22 Sep 2020 12:34:12 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v3 08/12] media: staging: rkisp1: isp: don't enable signal RKISP1_CIF_ISP_FRAME_IN
Date:   Tue, 22 Sep 2020 13:33:58 +0200
Message-Id: <20200922113402.12442-9-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The signal RKISP1_CIF_ISP_FRAME_IN is not used in the isr so
there is no need to enable it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-isp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 9020633c1b3f..cb6a94136612 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -348,7 +348,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 	rkisp1_write(rkisp1, sink_crop->height, RKISP1_CIF_ISP_OUT_V_SIZE);
 
 	irq_mask |= RKISP1_CIF_ISP_FRAME | RKISP1_CIF_ISP_V_START |
-		    RKISP1_CIF_ISP_PIC_SIZE_ERROR | RKISP1_CIF_ISP_FRAME_IN;
+		    RKISP1_CIF_ISP_PIC_SIZE_ERROR;
 	rkisp1_write(rkisp1, irq_mask, RKISP1_CIF_ISP_IMSC);
 
 	if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
-- 
2.17.1

