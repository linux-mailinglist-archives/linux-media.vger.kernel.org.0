Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938DC299263
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1776159AbgJZQ24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:28:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32984 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1773909AbgJZQ24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:28:56 -0400
Received: from guri.fritz.box (p200300c7cf0cab0029cf35aefe00641e.dip0.t-ipconnect.de [IPv6:2003:c7:cf0c:ab00:29cf:35ae:fe00:641e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3722E1F44E41;
        Mon, 26 Oct 2020 16:28:55 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: capture: set default quantization on 'set_fmt'
Date:   Mon, 26 Oct 2020 17:28:48 +0100
Message-Id: <20201026162848.18310-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 's/try_fmt' ioctl, set the quantization field to
V4L2_QUANTIZATION_DEFAULT. This fixes the compliance
errors:

fail: v4l2-test-formats.cpp(357): quantization >= 0xff
fail: v4l2-test-formats.cpp(473): testColorspace(!node->is_io_mc, pix_mp.pixelformat, pix_mp.colorspace, pix_mp.ycbcr_enc, pix_mp.quantization)
test VIDIOC_TRY_FMT: FAIL
fail: v4l2-test-formats.cpp(357): quantization >= 0xff
fail: v4l2-test-formats.cpp(473): testColorspace(!node->is_io_mc, pix_mp.pixelformat, pix_mp.colorspace, pix_mp.ycbcr_enc, pix_mp.quantization)
test VIDIOC_S_FMT: FAIL

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index b6f497ce3e95..9a0f88b2254b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1132,6 +1132,7 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 	pixm->field = V4L2_FIELD_NONE;
 	pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
 	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
 
 	info = rkisp1_fill_pixfmt(pixm, cap->id);
 
-- 
2.17.1

