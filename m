Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE5B145F88
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 00:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgAVXzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 18:55:50 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51826 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVXzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 18:55:49 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iuPqe-0000oF-3M; Wed, 22 Jan 2020 23:55:48 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: fix spelling mistake "to" -> "too"
Date:   Wed, 22 Jan 2020 23:55:47 +0000
Message-Id: <20200122235547.2830605-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/rc/ir-xmp-decoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-xmp-decoder.c b/drivers/media/rc/ir-xmp-decoder.c
index 74a1d30fae6e..4c3d03876200 100644
--- a/drivers/media/rc/ir-xmp-decoder.c
+++ b/drivers/media/rc/ir-xmp-decoder.c
@@ -166,7 +166,7 @@ static int ir_xmp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		} else if (geq_margin(ev.duration, XMP_NIBBLE_PREFIX, XMP_UNIT)) {
 			/* store nibble raw data, decode after trailer */
 			if (data->count == 16) {
-				dev_dbg(&dev->dev, "to many pulses (%d) ignoring: %u\n",
+				dev_dbg(&dev->dev, "too many pulses (%d) ignoring: %u\n",
 					data->count, ev.duration);
 				data->state = STATE_INACTIVE;
 				return -EINVAL;
-- 
2.24.0

