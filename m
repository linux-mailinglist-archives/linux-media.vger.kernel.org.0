Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2899E1102A3
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 17:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfLCQkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 11:40:09 -0500
Received: from mga07.intel.com ([134.134.136.100]:56552 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfLCQkI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 11:40:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:40:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; 
   d="scan'208";a="208503613"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 08:40:04 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-media@vger.kernel.org, ivtv-devel@ivtvdriver.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 10/12] media: constify fb ops across all drivers
Date:   Tue,  3 Dec 2019 18:38:52 +0200
Message-Id: <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the fbops member of struct fb_info is const, we can start
making the ops const as well.

Remove the redundant fbops assignments while at it.

v2:
- actually add const in vivid
- fix typo (Christophe de Dinechin)

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Andy Walls <awalls@md.metrocast.net>
Cc: linux-media@vger.kernel.org
Cc: ivtv-devel@ivtvdriver.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/media/pci/ivtv/ivtvfb.c          | 3 +--
 drivers/media/platform/vivid/vivid-osd.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

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
index f2e789bdf4a6..fbaec8acc161 100644
--- a/drivers/media/platform/vivid/vivid-osd.c
+++ b/drivers/media/platform/vivid/vivid-osd.c
@@ -244,7 +244,7 @@ static int vivid_fb_blank(int blank_mode, struct fb_info *info)
 	return 0;
 }
 
-static struct fb_ops vivid_fb_ops = {
+static const struct fb_ops vivid_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_check_var   = vivid_fb_check_var,
 	.fb_set_par     = vivid_fb_set_par,
@@ -311,7 +311,6 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
 
 	dev->fb_info.node = -1;
 	dev->fb_info.flags = FBINFO_FLAG_DEFAULT;
-	dev->fb_info.fbops = &vivid_fb_ops;
 	dev->fb_info.par = dev;
 	dev->fb_info.var = dev->fb_defined;
 	dev->fb_info.fix = dev->fb_fix;
-- 
2.20.1

