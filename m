Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4267C26E588
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 21:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgIQPMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 11:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbgIQPEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 11:04:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEB5C06178A
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 08:04:21 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec0015a4c2da98cf28d0.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:15a4:c2da:98cf:28d0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0926E29BFA0;
        Thu, 17 Sep 2020 16:04:18 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH] media: MAINTAINERS: add documentation files for rkisp1
Date:   Thu, 17 Sep 2020 17:04:08 +0200
Message-Id: <20200917150408.28333-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the files:
Documentation/admin-guide/media/rkisp1.rst
Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst

to the Rockchip ISP driver entry in the MAINTAINERS file.

---
Note, the files were added in a separate patchset:
https://patchwork.kernel.org/cover/11720477/

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3126fc2cca2..6eab39395682 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14886,6 +14886,8 @@ M:	Helen Koike <helen.koike@collabora.com>
 M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/admin-guide/media/rkisp1.rst
+F:	Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
 F:	drivers/staging/media/rkisp1/
 
 ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
-- 
2.17.1

