Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0B012CC07
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 04:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfL3DD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Dec 2019 22:03:58 -0500
Received: from mga14.intel.com ([192.55.52.115]:57389 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726894AbfL3DD6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Dec 2019 22:03:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Dec 2019 19:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,373,1571727600"; 
   d="scan'208,223";a="301154485"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga001.jf.intel.com with ESMTP; 29 Dec 2019 19:03:56 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, tfiga@chromium.org,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: staging/intel-ipu3: set the main output as mandatory
Date:   Mon, 30 Dec 2019 11:09:04 +0800
Message-Id: <1577675344-28187-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From firmware perspective, the main output for each pipe is mandatory
and must be enabled. This patch set the link between imgu subdev and
main output as IMMUTABLE by default.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu3/TODO        | 3 ---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/TODO b/drivers/staging/media/ipu3/TODO
index b44bb4a72ca7..9ef036f23a21 100644
--- a/drivers/staging/media/ipu3/TODO
+++ b/drivers/staging/media/ipu3/TODO
@@ -5,9 +5,6 @@ staging directory.
   as well as formats and the binary used to a request. Remove the
   opportunistic buffer management. (Sakari)
 
-- Using ENABLED and IMMUTABLE link flags for the links where those are
-  relevant. (Sakari)
-
 - IPU3 driver documentation (Laurent)
   Comments on configuring v4l2 subdevs for CIO2 and ImgU.
 
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3c7ad1eed434..569e27b824c8 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1260,6 +1260,11 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 		r = media_create_pad_link(&vdev->entity, 0, &sd->entity,
 					  node_num, flags);
 	} else {
+		if (node->id == IMGU_NODE_OUT) {
+			flags |= MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
+			node->enabled = true;
+		}
+
 		r = media_create_pad_link(&sd->entity, node_num, &vdev->entity,
 					  0, flags);
 	}
-- 
2.7.4

