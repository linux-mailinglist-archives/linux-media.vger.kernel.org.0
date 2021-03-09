Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E8E3325F3
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 14:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhCINAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 08:00:50 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41877 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230122AbhCINAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 08:00:49 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Jbyel7xdcqY4WJbyileOTI; Tue, 09 Mar 2021 14:00:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615294848; bh=3vPOYfUEevGyFjKFEUk3ntGLaYv2j78pQdsoovrd4KA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X/4Ld186HKguqOt60NQ6U5Dmav3O1wzaIfqhZotCtilyti53sni9AhD23PxCS0NMR
         96aTC1FD2jKpDxKHawzh+fyvt/xKlGMSU5a89E4R3jg/vgXlm97Erg9dMFxKEzLez8
         Ngy/2t8kB6L54Ziq41wXKCxBfl0mDMpH31GTerfeg1lo8vHmTDP19agXf5Nwm80HBS
         6BVZa9vWwQn3HJvFd5qXl+vutiQVg2zeaVEOgcLWrvhhnY5wSEgYRHKU0DZKl6KJoP
         syVXUPLzDi2UAPwdEGtG6kwDA8WotTQ7d678Oq6l8F7cFlP0nGQ6xK53j8WZwAVS5O
         MzrWDIyASP9Fg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] i2c/ccs: fix kernel-doc header issues
Message-ID: <8dde62e2-e6fd-7816-5642-1d51ca4d07e2@xs4all.nl>
Date:   Tue, 9 Mar 2021 14:00:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPHGF08um9PCrJJ+OE7N/7Q8Yjm2kx9pBh+Ldbk/eWMVbQWnoWLhA1qokPSp+Lk4/kpMEAlHEGJd1D4JbsKqd+y4H8jgZUwEt25qZ1ev1M53I7aKPBX+
 9C8NKcEkcpDhtWksXIQ7MezVmpvQ+FQ2jn3Mm0R9PGnQWH8dkPmshCWyprUpIv81xZi+jIOsix3g+FhaRvcvVU3j+2jaazGgzd0Xacp6Vs+dHrJJJ3wo4hdl
 NxyD1EwKRcMJBTNJUsvcLg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix these kernel-doc warnings:

drivers/media/i2c/ccs/ccs-data.h:144: warning: expecting prototype for struct ccs_pdaf_pix_loc_block_desc. Prototype was for struct
ccs_pdaf_pix_loc_pixel_desc instead
drivers/media/i2c/ccs/ccs-quirk.h:51: warning: Function parameter or member 'post_streamoff' not described in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:51: warning: Function parameter or member 'flags' not described in 'ccs_quirk'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/ccs/ccs-data.h b/drivers/media/i2c/ccs/ccs-data.h
index c75d480c8792..638df69804ec 100644
--- a/drivers/media/i2c/ccs/ccs-data.h
+++ b/drivers/media/i2c/ccs/ccs-data.h
@@ -132,7 +132,7 @@ struct ccs_pdaf_pix_loc_block_desc_group {
 };

 /**
- * struct ccs_pdaf_pix_loc_block_desc - PDAF pixel location block descriptor
+ * struct ccs_pdaf_pix_loc_pixel_desc - PDAF pixel location block descriptor
  * @pixel_type: Type of the pixel; CCS_DATA_PDAF_PIXEL_TYPE_*
  * @small_offset_x: offset X coordinate
  * @small_offset_y: offset Y coordinate
diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 6b4ec4beaba0..5838fcda92fd 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -21,7 +21,7 @@ struct ccs_sensor;
  *	    sensor registers. Called the first time the sensor is powered up.
  * @post_poweron: Called always after the sensor has been fully powered on.
  * @pre_streamon: Called just before streaming is enabled.
- * @post_streamon: Called right after stopping streaming.
+ * @post_streamoff: Called right after stopping streaming.
  * @pll_flags: Return flags for the PLL calculator.
  * @init: Quirk initialisation, called the last in probe(). This is
  *	  also appropriate for adding sensor specific controls, for instance.
@@ -33,6 +33,8 @@ struct ccs_sensor;
  *		@value: Register value, set by the caller on write, or
  *			by the quirk on read
  *
+ * @flags: Quirk flags
+ *
  *		@return: 0 on success, -ENOIOCTLCMD if no register
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
