Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A5E1EE869
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 18:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgFDQQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 12:16:01 -0400
Received: from mga03.intel.com ([134.134.136.65]:60613 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729703AbgFDQQA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 12:16:00 -0400
IronPort-SDR: sU46OLIQCrFRZqIfAXeJtET1Y6rvSVf0LquhYSwfcq0ut4ZPtvY5yxxBlq8rlcfF3XTHjG5jZA
 3pzUKjr2kiDQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:45 -0700
IronPort-SDR: db2R2AIDuUwUHHwbDigP6trjrd4QIF3C7/1KJQee6m5OKoihGPZ96oBJolv8dIrhrZ7svqjpfC
 aja9/ksrT3RA==
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; 
   d="scan'208";a="294382544"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:44 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0DB65208B5;
        Thu,  4 Jun 2020 19:15:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jgsXV-0002QZ-9j; Thu, 04 Jun 2020 19:16:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 2/4] staging: atomisp: Fix atomisp_overlay32 compat handling
Date:   Thu,  4 Jun 2020 19:16:19 +0300
Message-Id: <20200604161621.9282-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
References: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct atomisp_overlay contains overlay_start_x and overlay_start_y
fields. Instead of copying the value of the overlay_start_x field between
the two structs, the value of the overlay_start_y field of the compat
struct was copied to the overlay_start_x field of the 64-bit kernel struct
in get operation and back in put. The overlay_start_x field value was not
copied from or to the user space struct.

Fix this so that the value of overlay_start_x is copied to overlay_start_x
and the value of overlay_start_y is copied to overlay_start_y.

Also do copy blend_overlay_perc_u field only once.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
index 3079043f1fac0..1853d907260db 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
@@ -399,7 +399,8 @@ static int get_atomisp_overlay32(struct atomisp_overlay *kp,
 	    get_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
 	    get_user(kp->blend_overlay_perc_v, &up->blend_overlay_perc_v) ||
 	    get_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
-	    get_user(kp->overlay_start_x, &up->overlay_start_y))
+	    get_user(kp->overlay_start_x, &up->overlay_start_x) ||
+	    get_user(kp->overlay_start_y, &up->overlay_start_y))
 		return -EFAULT;
 
 	kp->frame = (void __force *)compat_ptr(frame);
@@ -423,7 +424,8 @@ static int put_atomisp_overlay32(struct atomisp_overlay *kp,
 	    put_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
 	    put_user(kp->blend_overlay_perc_v, &up->blend_overlay_perc_v) ||
 	    put_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
-	    put_user(kp->overlay_start_x, &up->overlay_start_y))
+	    put_user(kp->overlay_start_x, &up->overlay_start_x)
+	    put_user(kp->overlay_start_y, &up->overlay_start_y))
 		return -EFAULT;
 
 	return 0;
-- 
2.20.1

