Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAEC510B375
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2019 17:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfK0QeE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Nov 2019 11:34:04 -0500
Received: from mga09.intel.com ([134.134.136.24]:7194 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0QeE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 11:34:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:34:04 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="234152321"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:40 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-media@vger.kernel.org, ivtv-devel@ivtvdriver.org
Subject: [PATCH 12/13] media: constify fb ops across all drivers
Date:   Wed, 27 Nov 2019 18:32:08 +0200
Message-Id: <2f8755b70308bf917c0ad8f5b6040fa2a4862b94.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the fbops member of struct fb_info is const, we can star making
the ops const as well.

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Andy Walls <awalls@md.metrocast.net>
Cc: linux-media@vger.kernel.org
Cc: ivtv-devel@ivtvdriver.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/media/pci/ivtv/ivtvfb.c          | 3 +--
 drivers/media/platform/vivid/vivid-osd.c | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index 95a56cce9b65..f2922b554b09 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -925,7 +925,7 @@ static int ivtvfb_blank(int blank_mode, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops ivtvfb_ops = {
+static const struct fb_ops ivtvfb_ops = {
 	.owner = THIS_MODULE,
 	.fb_write       = ivtvfb_write,
 	.fb_check_var   = ivtvfb_check_var,
@@ -1049,7 +1049,6 @@ static int ivtvfb_init_vidmode(struct ivtv *itv)
 
 	oi->ivtvfb_info.node = -1;
 	oi->ivtvfb_info.flags = FBINFO_FLAG_DEFAULT;
-	oi->ivtvfb_info.fbops = &ivtvfb_ops;
 	oi->ivtvfb_info.par = itv;
 	oi->ivtvfb_info.var = oi->ivtvfb_defined;
 	oi->ivtvfb_info.fix = oi->ivtvfb_fix;
diff --git a/drivers/media/platform/vivid/vivid-osd.c b/drivers/media/platform/vivid/vivid-osd.c
index f2e789bdf4a6..2160a4d3c2f2 100644
--- a/drivers/media/platform/vivid/vivid-osd.c
+++ b/drivers/media/platform/vivid/vivid-osd.c
@@ -311,7 +311,6 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
 
 	dev->fb_info.node = -1;
 	dev->fb_info.flags = FBINFO_FLAG_DEFAULT;
-	dev->fb_info.fbops = &vivid_fb_ops;
 	dev->fb_info.par = dev;
 	dev->fb_info.var = dev->fb_defined;
 	dev->fb_info.fix = dev->fb_fix;
-- 
2.20.1

