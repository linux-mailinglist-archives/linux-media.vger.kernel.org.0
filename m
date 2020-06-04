Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284771EEABE
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 21:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgFDTAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 15:00:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55556 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729076AbgFDTAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 15:00:30 -0400
Received: from localhost.localdomain (p200300cb871f5b00dc30b2a26950c31b.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:dc30:b2a2:6950:c31b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CDE4F2A42FD;
        Thu,  4 Jun 2020 20:00:28 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org
Subject: [PATCH 1/2] media: staging: rkisp1: rsz: supported formats are the isp's src formats, not sink formats
Date:   Thu,  4 Jun 2020 21:00:14 +0200
Message-Id: <20200604190015.12069-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rkisp1_resizer's enum callback 'rkisp1_rsz_enum_mbus_code'
calls the enum callback of the 'rkisp1_isp' on it's video sink pad.
This is a bug, the resizer should support the same formats
supported by the 'rkisp1_isp' on the source pad (not the sink pad).

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index d049374413dc..d64c064bdb1d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -437,8 +437,8 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 	u32 pad = code->pad;
 	int ret;
 
-	/* supported mbus codes are the same in isp sink pad */
-	code->pad = RKISP1_ISP_PAD_SINK_VIDEO;
+	/* supported mbus codes are the same in isp video src pad */
+	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
 	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
 			       &dummy_cfg, code);
 
-- 
2.17.1

