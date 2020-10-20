Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B104294006
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 17:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436978AbgJTP4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 11:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436958AbgJTP4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 11:56:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBABC061755
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 08:56:53 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf435b0028a32f4e277d2227.dip0.t-ipconnect.de [IPv6:2003:c7:cf43:5b00:28a3:2f4e:277d:2227])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6024F1F44F01;
        Tue, 20 Oct 2020 16:56:52 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2] v4l2-compliance: fail if format MEDIA_BUS_FMT_METADATA_FIXED has width/height not equal 0
Date:   Tue, 20 Oct 2020 17:56:42 +0200
Message-Id: <20201020155642.1604-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media bus format code MEDIA_BUS_FMT_METADATA_FIXED
is used for metadata formats that are not configurable
from userspace. This format should have width and height
set to 0.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
---
The patch should be applied together with the kernel patch
https://patchwork.kernel.org/project/linux-media/patch/20201020154522.654-1-dafna.hirschfeld@collabora.com/

changes from v1:
add a test that check if the mbus format is MEDIA_BUS_FMT_METADATA_FIXED
and the width or height are not 0

 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index ec3ef169..4dedc7a9 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -300,8 +300,12 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
 static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt)
 {
 	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
-	fail_on_test(fmt.width == 0 || fmt.width > 65536);
-	fail_on_test(fmt.height == 0 || fmt.height > 65536);
+	if (fmt.code != MEDIA_BUS_FMT_METADATA_FIXED) {
+		fail_on_test(fmt.width == 0 || fmt.width > 65536);
+		fail_on_test(fmt.height == 0 || fmt.height > 65536);
+	} else {
+		fail_on_test(fmt.width != 0 || fmt.height != 0);
+	}
 	fail_on_test(fmt.code == 0 || fmt.code == ~0U);
 	fail_on_test(fmt.field == ~0U);
 	if (!node->is_passthrough_subdev) {
-- 
2.17.1

