Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDA925B101
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgIBQNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:53874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728307AbgIBQK5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:57 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DFD221707;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=1rYSiFR3IJ0WRBD3O988H5WFm4sGhmAqjZGJZ9WwYjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1TRjuZhLRoasadr80vwGc4GRSVQ1QvS0v6W4Dgk1RZzI7z5txpN/jowIENK2J2Ooj
         MrXzTtWGl/p2cpJWNZm2LX9GSWPtPb9LKfcnscdcKFrIVjZ6pdTSorwhLR84fh5zBk
         YaoIbaaltd97p4knZRLUBmVOKhjZJIPZ7BQGjlv0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAk-9i; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 24/38] media: atomisp: fix casts at atomisp_compat_ioctl32.c
Date:   Wed,  2 Sep 2020 18:10:27 +0200
Message-Id: <56c880b7f36d594104649135644355efeee45f48.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several warnings reported by sparse with regards to wrong
typecasts:

    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:73:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:73:13:     expected void *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:73:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:247:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:247:13:     expected unsigned int [usertype] *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:247:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:248:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:248:13:     expected unsigned int [usertype] *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:248:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:249:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:249:13:     expected unsigned int [usertype] *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:249:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:250:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:250:13:     expected unsigned int [usertype] *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:250:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:282:30:  warning: incorrect type in argument 2 (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:282:30:     expected void const *from
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:282:30:     got struct atomisp_3a_statistics [noderef] __user *kp
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:308:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:308:13:     expected unsigned int [usertype] *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:308:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:327:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:327:13:     expected void [noderef] __user *effective_width
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:327:13:     got unsigned int [usertype] *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:348:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:348:13:     expected void [noderef] __user *effective_width
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:348:13:     got unsigned int [usertype] *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:372:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:372:13:     expected unsigned int [usertype] *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:372:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:433:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:433:13:     expected struct v4l2_framebuffer *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:433:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:462:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:462:13:     expected void [noderef] __user *frame
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:462:13:     got struct v4l2_framebuffer *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:496:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:496:13:     expected unsigned short *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:496:13:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:511:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:511:13:     expected void [noderef] __user *calb_grp_values
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:511:13:     got unsigned short *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:630:21:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:630:21:     expected unsigned short [usertype] *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:630:21:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:715:27:  warning: cast removes address space '__user' of expression
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:715:27:  warning: incorrect type in initializer (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:715:27:     expected struct <noident> [noderef] __user *karg
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:715:27:     got void *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:721:39:  warning: cast removes address space '__user' of expression
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:725:21:  warning: incorrect type in argument 1 (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:725:21:     expected void const volatile [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:725:21:     got unsigned int [usertype] *src
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:725:43:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:725:43:     expected void *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:725:43:     got void [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:741:21:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:741:21:     expected struct atomisp_shading_table *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:741:21:     got struct atomisp_shading_table [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:747:21:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:747:21:     expected struct atomisp_morph_table *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:747:21:     got struct atomisp_morph_table [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:753:21:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:753:21:     expected struct atomisp_dis_coefficients *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:753:21:     got struct atomisp_dis_coefficients [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:760:14:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:760:14:     expected struct atomisp_dvs_6axis_config *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:760:14:     got struct atomisp_dvs_6axis_config [noderef] __user *
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:817:13:  warning: incorrect type in assignment (different address spaces)
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:817:13:     expected struct atomisp_sensor_ae_bracketing_lut_entry *__pu_val
    drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c:817:13:     got void [noderef] __user *

Use the same strategies used at v4l2-compat32.c, in order to
solve them and avoid warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../atomisp/pci/atomisp_compat_ioctl32.c      | 84 +++++++++++--------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
index fa5918270614..e5553df5bad4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
@@ -25,16 +25,26 @@
 #include "atomisp_ioctl.h"
 #include "atomisp_compat_ioctl32.h"
 
-/* Macro borrowed from v4l2-compat-ioctl32.c */
+/* Macros borrowed from v4l2-compat-ioctl32.c */
+
+#define get_user_cast(__x, __ptr)					\
+({									\
+	get_user(__x, (typeof(*__ptr) __user *)(__ptr));		\
+})
+
+#define put_user_force(__x, __ptr)					\
+({									\
+	put_user((typeof(*__x) __force *)(__x), __ptr);			\
+})
+
 /* Use the same argument order as copy_in_user */
-#define assign_in_user(to, from)				\
-({								\
-	typeof(*from) __assign_tmp;				\
-								\
-	get_user(__assign_tmp, from) || put_user(__assign_tmp, to);	\
+#define assign_in_user(to, from)					\
+({									\
+	typeof(*from) __assign_tmp;					\
+									\
+	get_user_cast(__assign_tmp, from) || put_user(__assign_tmp, to);\
 })
 
-
 static int get_atomisp_histogram32(struct atomisp_histogram __user *kp,
 				   struct atomisp_histogram32 __user *up)
 {
@@ -64,13 +74,13 @@ static int put_atomisp_histogram32(struct atomisp_histogram __user *kp,
 }
 
 static int get_v4l2_framebuffer32(struct v4l2_framebuffer __user *kp,
-					struct v4l2_framebuffer32 __user *up)
+				  struct v4l2_framebuffer32 __user *up)
 {
 	compat_uptr_t tmp;
 
 	if (!access_ok(up, sizeof(struct v4l2_framebuffer32)) ||
 	    get_user(tmp, &up->base) ||
-	    put_user(compat_ptr(tmp), &kp->base) ||
+	    put_user_force(compat_ptr(tmp), &kp->base) ||
 	    assign_in_user(&kp->capability, &up->capability) ||
 	    assign_in_user(&kp->flags, &up->flags) ||
 	    copy_in_user(&kp->fmt, &up->fmt, sizeof(kp->fmt)))
@@ -244,10 +254,10 @@ static int get_atomisp_dvs_6axis_config32(struct atomisp_dvs_6axis_config __user
 	    get_user(ycoords_y, &up->ycoords_y) ||
 	    get_user(xcoords_uv, &up->xcoords_uv) ||
 	    get_user(ycoords_uv, &up->ycoords_uv) ||
-	    put_user(compat_ptr(xcoords_y), &kp->xcoords_y) ||
-	    put_user(compat_ptr(ycoords_y), &kp->ycoords_y) ||
-	    put_user(compat_ptr(xcoords_uv), &kp->xcoords_uv) ||
-	    put_user(compat_ptr(ycoords_uv), &kp->ycoords_uv))
+	    put_user_force(compat_ptr(xcoords_y), &kp->xcoords_y) ||
+	    put_user_force(compat_ptr(ycoords_y), &kp->ycoords_y) ||
+	    put_user_force(compat_ptr(xcoords_uv), &kp->xcoords_uv) ||
+	    put_user_force(compat_ptr(ycoords_uv), &kp->ycoords_uv))
 		return -EFAULT;
 
 	return 0;
@@ -279,7 +289,7 @@ static int put_atomisp_3a_statistics32(struct atomisp_3a_statistics __user *kp,
 	void __user *rgby_data;
 
 	if (!access_ok(up, sizeof(struct atomisp_3a_statistics32)) ||
-	    copy_to_user(up, kp, sizeof(struct atomisp_grid_info)) ||
+	    copy_in_user(up, kp, sizeof(struct atomisp_grid_info)) ||
 	    get_user(rgby_data, &kp->rgby_data) ||
 	    put_user(ptr_to_compat(rgby_data), &up->rgby_data) ||
 	    get_user(data, &kp->data) ||
@@ -305,7 +315,7 @@ static int get_atomisp_metadata_stat32(struct atomisp_metadata __user *kp,
 	    assign_in_user(&kp->stride, &up->stride) ||
 	    assign_in_user(&kp->exp_id, &up->exp_id) ||
 	    get_user(effective_width, &up->effective_width) ||
-	    put_user(compat_ptr(effective_width), &kp->effective_width))
+	    put_user_force(compat_ptr(effective_width), &kp->effective_width))
 		return -EFAULT;
 
 	return 0;
@@ -315,7 +325,7 @@ static int put_atomisp_metadata_stat32(struct atomisp_metadata __user *kp,
 				struct atomisp_metadata32 __user *up)
 {
 	void __user *data;
-	void __user *effective_width;
+	void *effective_width;
 
 	if (!access_ok(up, sizeof(struct atomisp_metadata32)) ||
 	    get_user(data, &kp->data) ||
@@ -325,7 +335,8 @@ static int put_atomisp_metadata_stat32(struct atomisp_metadata __user *kp,
 	    assign_in_user(&up->stride, &kp->stride) ||
 	    assign_in_user(&up->exp_id, &kp->exp_id) ||
 	    get_user(effective_width, &kp->effective_width) ||
-	    put_user(ptr_to_compat(effective_width), &up->effective_width))
+	    put_user(ptr_to_compat((void __user *)effective_width),
+				   &up->effective_width))
 		return -EFAULT;
 
 	return 0;
@@ -336,7 +347,7 @@ put_atomisp_metadata_by_type_stat32(struct atomisp_metadata_with_type __user *kp
 				    struct atomisp_metadata_with_type32 __user *up)
 {
 	void __user *data;
-	void __user *effective_width;
+	u32 *effective_width;
 
 	if (!access_ok(up, sizeof(struct atomisp_metadata_with_type32)) ||
 	    get_user(data, &kp->data) ||
@@ -346,7 +357,7 @@ put_atomisp_metadata_by_type_stat32(struct atomisp_metadata_with_type __user *kp
 	    assign_in_user(&up->stride, &kp->stride) ||
 	    assign_in_user(&up->exp_id, &kp->exp_id) ||
 	    get_user(effective_width, &kp->effective_width) ||
-	    put_user(ptr_to_compat(effective_width),
+	    put_user(ptr_to_compat((void __user *)effective_width),
 		     &up->effective_width) ||
 	    assign_in_user(&up->type, &kp->type))
 		return -EFAULT;
@@ -369,7 +380,7 @@ get_atomisp_metadata_by_type_stat32(struct atomisp_metadata_with_type __user *kp
 	    assign_in_user(&kp->stride, &up->stride) ||
 	    assign_in_user(&kp->exp_id, &up->exp_id) ||
 	    get_user(effective_width, &up->effective_width) ||
-	    put_user(compat_ptr(effective_width), &kp->effective_width) ||
+	    put_user_force(compat_ptr(effective_width), &kp->effective_width) ||
 	    assign_in_user(&kp->type, &up->type))
 		return -EFAULT;
 
@@ -430,7 +441,7 @@ static int get_atomisp_overlay32(struct atomisp_overlay __user *kp,
 
 	if (!access_ok(up, sizeof(struct atomisp_overlay32)) ||
 	    get_user(frame, &up->frame) ||
-	    put_user(compat_ptr(frame), &kp->frame) ||
+	    put_user_force(compat_ptr(frame), &kp->frame) ||
 	    assign_in_user(&kp->bg_y, &up->bg_y) ||
 	    assign_in_user(&kp->bg_u, &up->bg_u) ||
 	    assign_in_user(&kp->bg_v, &up->bg_v) ||
@@ -456,11 +467,11 @@ static int get_atomisp_overlay32(struct atomisp_overlay __user *kp,
 static int put_atomisp_overlay32(struct atomisp_overlay __user *kp,
 				 struct atomisp_overlay32 __user *up)
 {
-	void __user *frame;
+	void *frame;
 
 	if (!access_ok(up, sizeof(struct atomisp_overlay32)) ||
 	    get_user(frame, &kp->frame) ||
-	    put_user(ptr_to_compat(frame), &up->frame) ||
+	    put_user(ptr_to_compat((void __user *)frame), &up->frame) ||
 	    assign_in_user(&up->bg_y, &kp->bg_y) ||
 	    assign_in_user(&up->bg_u, &kp->bg_u) ||
 	    assign_in_user(&up->bg_v, &kp->bg_v) ||
@@ -493,7 +504,7 @@ get_atomisp_calibration_group32(struct atomisp_calibration_group __user *kp,
 	    assign_in_user(&kp->size, &up->size) ||
 	    assign_in_user(&kp->type, &up->type) ||
 	    get_user(calb_grp_values, &up->calb_grp_values) ||
-	    put_user(compat_ptr(calb_grp_values), &kp->calb_grp_values))
+	    put_user_force(compat_ptr(calb_grp_values), &kp->calb_grp_values))
 		return -EFAULT;
 
 	return 0;
@@ -503,13 +514,14 @@ static int
 put_atomisp_calibration_group32(struct atomisp_calibration_group __user *kp,
 				struct atomisp_calibration_group32 __user *up)
 {
-	void __user *calb_grp_values;
+	void *calb_grp_values;
 
 	if (!access_ok(up, sizeof(struct atomisp_calibration_group32)) ||
 	    assign_in_user(&up->size, &kp->size) ||
 	    assign_in_user(&up->type, &kp->type) ||
 	    get_user(calb_grp_values, &kp->calb_grp_values) ||
-	    put_user(ptr_to_compat(calb_grp_values), &up->calb_grp_values))
+	    put_user(ptr_to_compat((void __user *)calb_grp_values),
+		     &up->calb_grp_values))
 		return -EFAULT;
 
 	return 0;
@@ -523,7 +535,7 @@ static int get_atomisp_acc_fw_load32(struct atomisp_acc_fw_load __user *kp,
 	if (!access_ok(up, sizeof(struct atomisp_acc_fw_load32)) ||
 	    assign_in_user(&kp->size, &up->size) ||
 	    assign_in_user(&kp->fw_handle, &up->fw_handle) ||
-	    get_user(data, &up->data) ||
+	    get_user_cast(data, &up->data) ||
 	    put_user(compat_ptr(data), &kp->data))
 		return -EFAULT;
 
@@ -627,7 +639,7 @@ static int get_atomisp_shading_table32(struct atomisp_shading_table __user *kp,
 		compat_uptr_t tmp;
 
 		if (get_user(tmp, &up->data[n]) ||
-		    put_user(compat_ptr(tmp), &kp->data[n]))
+		    put_user_force(compat_ptr(tmp), &kp->data[n]))
 			return -EFAULT;
 	}
 	return 0;
@@ -712,17 +724,17 @@ static int get_atomisp_parameters32(struct atomisp_parameters __user *kp,
 		struct atomisp_morph_table morph_table;
 		struct atomisp_dis_coefficients dvs2_coefs;
 		struct atomisp_dvs_6axis_config dvs_6axis_config;
-	} __user *karg = (void *)(kp + 1);
+	} __user *karg = (void __user *)(kp + 1);
 
 	if (!access_ok(up, sizeof(struct atomisp_parameters32)))
 		return -EFAULT;
 
 	while (n >= 0) {
-		compat_uptr_t *src = (compat_uptr_t *)up + n;
+		compat_uptr_t __user *src = (compat_uptr_t __user *)up + n;
 		void * __user *dst = (void * __user *)kp + n;
 		compat_uptr_t tmp;
 
-		if (get_user(tmp, src) || put_user(compat_ptr(tmp), dst))
+		if (get_user_cast(tmp, src) || put_user_force(compat_ptr(tmp), dst))
 			return -EFAULT;
 		n--;
 	}
@@ -738,26 +750,26 @@ static int get_atomisp_parameters32(struct atomisp_parameters __user *kp,
 	/* handle shading table */
 	if (stp && (get_atomisp_shading_table32(&karg->shading_table,
 						compat_ptr(stp)) ||
-		    put_user(&karg->shading_table, &kp->shading_table)))
+		    put_user_force(&karg->shading_table, &kp->shading_table)))
 		return -EFAULT;
 
 	/* handle morph table */
 	if (mtp && (get_atomisp_morph_table32(&karg->morph_table,
 					      compat_ptr(mtp)) ||
-		    put_user(&karg->morph_table, &kp->morph_table)))
+		    put_user_force(&karg->morph_table, &kp->morph_table)))
 		return -EFAULT;
 
 	/* handle dvs2 coefficients */
 	if (dcp && (get_atomisp_dis_coefficients32(&karg->dvs2_coefs,
 						   compat_ptr(dcp)) ||
-		    put_user(&karg->dvs2_coefs, &kp->dvs2_coefs)))
+		    put_user_force(&karg->dvs2_coefs, &kp->dvs2_coefs)))
 		return -EFAULT;
 
 	/* handle dvs 6axis configuration */
 	if (dscp &&
 	    (get_atomisp_dvs_6axis_config32(&karg->dvs_6axis_config,
 					    compat_ptr(dscp)) ||
-	     put_user(&karg->dvs_6axis_config, &kp->dvs_6axis_config)))
+	     put_user_force(&karg->dvs_6axis_config, &kp->dvs_6axis_config)))
 		return -EFAULT;
 
 	return 0;
@@ -814,7 +826,7 @@ get_atomisp_sensor_ae_bracketing_lut(struct atomisp_sensor_ae_bracketing_lut __u
 	if (!access_ok(up, sizeof(struct atomisp_sensor_ae_bracketing_lut32)) ||
 	    assign_in_user(&kp->lut_size, &up->lut_size) ||
 	    get_user(lut, &up->lut) ||
-	    put_user(compat_ptr(lut), &kp->lut))
+	    put_user_force(compat_ptr(lut), &kp->lut))
 		return -EFAULT;
 
 	return 0;
-- 
2.26.2

