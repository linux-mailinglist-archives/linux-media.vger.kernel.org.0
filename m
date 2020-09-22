Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2362274756
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 19:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVRTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 13:19:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58372 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIVRTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 13:19:42 -0400
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E9D582613EE;
        Tue, 22 Sep 2020 18:19:40 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH] v4l2-compliance: skip dimentions tests for media bus format MEDIA_BUS_FMT_METADATA_FIXED
Date:   Tue, 22 Sep 2020 19:19:33 +0200
Message-Id: <20200922171933.3830-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media bus format code MEDIA_BUS_FMT_METADATA_FIXED
is used for metadata formats that are not configurable
from userspace and therefore may have any value for
width and height. So skip width and height tests for
this format.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
note, this patch should be applied after updating the header
include/linux/media-bus-format.h to include that new format.
---
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index ec3ef169..f60853e3 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -300,8 +300,10 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
 static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt)
 {
 	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
-	fail_on_test(fmt.width == 0 || fmt.width > 65536);
-	fail_on_test(fmt.height == 0 || fmt.height > 65536);
+	if (fmt.code != MEDIA_BUS_FMT_METADATA_FIXED) {
+		fail_on_test(fmt.width == 0 || fmt.width > 65536);
+		fail_on_test(fmt.height == 0 || fmt.height > 65536);
+	}
 	fail_on_test(fmt.code == 0 || fmt.code == ~0U);
 	fail_on_test(fmt.field == ~0U);
 	if (!node->is_passthrough_subdev) {
-- 
2.17.1

