Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD29C1EE866
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 18:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgFDQP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 12:15:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:44565 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgFDQP6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 12:15:58 -0400
IronPort-SDR: pZtGMxHndiXR2N/4bido05Dcf0dw8OZtRl1pgvJpNl9TRO3F5fHc2fJu5SKTDhnFTDEbhmiOH5
 FoTJOAKy9pPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:47 -0700
IronPort-SDR: DgYF+f8/0Gee7nvDsWFoMeBoN5UP2OnhC87xH6LdCnmihRPfJOyP9034U60CkqCj8y6/Aqr+rC
 tyyQ1ncmfj4g==
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; 
   d="scan'208";a="269461778"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:45 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 187412148C;
        Thu,  4 Jun 2020 19:15:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jgsXV-0002Qd-BA; Thu, 04 Jun 2020 19:16:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 3/4] staging: atomisp: Fix compat IOCTL handling
Date:   Thu,  4 Jun 2020 19:16:20 +0300
Message-Id: <20200604161621.9282-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
References: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Atomisp compat IOCTL handling suffers from the same security issue than
the V4L2 did. Fix this for atomisp.

See more information in patch a1dfb4c48cc1 ("media: v4l2-compat-ioctl32.c:
refactor compat ioctl32 logic").

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../atomisp/pci/atomisp_compat_ioctl32.c      | 934 +++++++++---------
 1 file changed, 471 insertions(+), 463 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
index 1853d907260db..c8649923b6b9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
@@ -24,66 +24,61 @@
 #include "atomisp_ioctl.h"
 #include "atomisp_compat_ioctl32.h"
 
-static int get_atomisp_histogram32(struct atomisp_histogram *kp,
+/* Macro borrowed from v4l2-compat-ioctl32.c */
+/* Use the same argument order as copy_in_user */
+#define assign_in_user(to, from)				\
+({								\
+	typeof(*from) __assign_tmp;				\
+								\
+	get_user(__assign_tmp, from) || put_user(__assign_tmp, to);	\
+})
+
+
+static int get_atomisp_histogram32(struct atomisp_histogram __user *kp,
 				   struct atomisp_histogram32 __user *up)
 {
 	compat_uptr_t tmp;
 
 	if (!access_ok(up, sizeof(struct atomisp_histogram32)) ||
-	    get_user(kp->num_elements, &up->num_elements) ||
-	    get_user(tmp, &up->data))
+	    assign_in_user(&kp->num_elements, &up->num_elements) ||
+	    get_user(tmp, &up->data) ||
+	    put_user(compat_ptr(tmp), &kp->data))
 		return -EFAULT;
 
-	kp->data = compat_ptr(tmp);
 	return 0;
 }
 
-static int put_atomisp_histogram32(struct atomisp_histogram *kp,
+static int put_atomisp_histogram32(struct atomisp_histogram __user *kp,
 				   struct atomisp_histogram32 __user *up)
 {
-	compat_uptr_t tmp = (compat_uptr_t)((uintptr_t)kp->data);
+	void __user *tmp;
 
 	if (!access_ok(up, sizeof(struct atomisp_histogram32)) ||
-	    put_user(kp->num_elements, &up->num_elements) ||
-	    put_user(tmp, &up->data))
+	    assign_in_user(&up->num_elements, &kp->num_elements) ||
+	    get_user(tmp, &kp->data) ||
+	    put_user(ptr_to_compat(tmp), &up->data))
 		return -EFAULT;
 
 	return 0;
 }
 
-static inline int get_v4l2_pix_format(struct v4l2_pix_format *kp,
-				      struct v4l2_pix_format __user *up)
-{
-	if (copy_from_user(kp, up, sizeof(struct v4l2_pix_format)))
-		return -EFAULT;
-	return 0;
-}
-
-static inline int put_v4l2_pix_format(struct v4l2_pix_format *kp,
-				      struct v4l2_pix_format __user *up)
-{
-	if (copy_to_user(up, kp, sizeof(struct v4l2_pix_format)))
-		return -EFAULT;
-	return 0;
-}
-
-static int get_v4l2_framebuffer32(struct v4l2_framebuffer *kp,
-				  struct v4l2_framebuffer32 __user *up)
+static int get_v4l2_framebuffer32(struct v4l2_framebuffer __user *kp,
+					struct v4l2_framebuffer32 __user *up)
 {
 	compat_uptr_t tmp;
 
 	if (!access_ok(up, sizeof(struct v4l2_framebuffer32)) ||
 	    get_user(tmp, &up->base) ||
-	    get_user(kp->capability, &up->capability) ||
-	    get_user(kp->flags, &up->flags))
+	    put_user(compat_ptr(tmp), &kp->base) ||
+	    assign_in_user(&kp->capability, &up->capability) ||
+	    assign_in_user(&kp->flags, &up->flags) ||
+	    copy_in_user(&kp->fmt, &up->fmt, sizeof(kp->fmt)))
 		return -EFAULT;
 
-	kp->base = (void __force *)compat_ptr(tmp);
-	get_v4l2_pix_format((struct v4l2_pix_format *)&kp->fmt, &up->fmt);
 	return 0;
 }
 
-static int get_atomisp_dis_statistics32(struct atomisp_dis_statistics *kp,
+static int get_atomisp_dis_statistics32(struct atomisp_dis_statistics __user *kp,
 					struct atomisp_dis_statistics32 __user *up)
 {
 	compat_uptr_t hor_prod_odd_real;
@@ -96,67 +91,99 @@ static int get_atomisp_dis_statistics32(struct atomisp_dis_statistics *kp,
 	compat_uptr_t ver_prod_even_imag;
 
 	if (!access_ok(up, sizeof(struct atomisp_dis_statistics32)) ||
-	    copy_from_user(kp, up, sizeof(struct atomisp_dvs_grid_info)) ||
-	    get_user(hor_prod_odd_real, &up->dvs2_stat.hor_prod.odd_real) ||
-	    get_user(hor_prod_odd_imag, &up->dvs2_stat.hor_prod.odd_imag) ||
-	    get_user(hor_prod_even_real, &up->dvs2_stat.hor_prod.even_real) ||
-	    get_user(hor_prod_even_imag, &up->dvs2_stat.hor_prod.even_imag) ||
-	    get_user(ver_prod_odd_real, &up->dvs2_stat.ver_prod.odd_real) ||
-	    get_user(ver_prod_odd_imag, &up->dvs2_stat.ver_prod.odd_imag) ||
-	    get_user(ver_prod_even_real, &up->dvs2_stat.ver_prod.even_real) ||
-	    get_user(ver_prod_even_imag, &up->dvs2_stat.ver_prod.even_imag) ||
-	    get_user(kp->exp_id, &up->exp_id))
+	    copy_in_user(kp, up, sizeof(struct atomisp_dvs_grid_info)) ||
+	    get_user(hor_prod_odd_real,
+		     &up->dvs2_stat.hor_prod.odd_real) ||
+	    get_user(hor_prod_odd_imag,
+		     &up->dvs2_stat.hor_prod.odd_imag) ||
+	    get_user(hor_prod_even_real,
+		     &up->dvs2_stat.hor_prod.even_real) ||
+	    get_user(hor_prod_even_imag,
+		     &up->dvs2_stat.hor_prod.even_imag) ||
+	    get_user(ver_prod_odd_real,
+		     &up->dvs2_stat.ver_prod.odd_real) ||
+	    get_user(ver_prod_odd_imag,
+		     &up->dvs2_stat.ver_prod.odd_imag) ||
+	    get_user(ver_prod_even_real,
+		     &up->dvs2_stat.ver_prod.even_real) ||
+	    get_user(ver_prod_even_imag,
+		     &up->dvs2_stat.ver_prod.even_imag) ||
+	    assign_in_user(&kp->exp_id, &up->exp_id) ||
+	    put_user(compat_ptr(hor_prod_odd_real),
+		     &kp->dvs2_stat.hor_prod.odd_real) ||
+	    put_user(compat_ptr(hor_prod_odd_imag),
+		     &kp->dvs2_stat.hor_prod.odd_imag) ||
+	    put_user(compat_ptr(hor_prod_even_real),
+		     &kp->dvs2_stat.hor_prod.even_real) ||
+	    put_user(compat_ptr(hor_prod_even_imag),
+		     &kp->dvs2_stat.hor_prod.even_imag) ||
+	    put_user(compat_ptr(ver_prod_odd_real),
+		     &kp->dvs2_stat.ver_prod.odd_real) ||
+	    put_user(compat_ptr(ver_prod_odd_imag),
+		     &kp->dvs2_stat.ver_prod.odd_imag) ||
+	    put_user(compat_ptr(ver_prod_even_real),
+		     &kp->dvs2_stat.ver_prod.even_real) ||
+	    put_user(compat_ptr(ver_prod_even_imag),
+		     &kp->dvs2_stat.ver_prod.even_imag))
 		return -EFAULT;
 
-	kp->dvs2_stat.hor_prod.odd_real = compat_ptr(hor_prod_odd_real);
-	kp->dvs2_stat.hor_prod.odd_imag = compat_ptr(hor_prod_odd_imag);
-	kp->dvs2_stat.hor_prod.even_real = compat_ptr(hor_prod_even_real);
-	kp->dvs2_stat.hor_prod.even_imag = compat_ptr(hor_prod_even_imag);
-	kp->dvs2_stat.ver_prod.odd_real = compat_ptr(ver_prod_odd_real);
-	kp->dvs2_stat.ver_prod.odd_imag = compat_ptr(ver_prod_odd_imag);
-	kp->dvs2_stat.ver_prod.even_real = compat_ptr(ver_prod_even_real);
-	kp->dvs2_stat.ver_prod.even_imag = compat_ptr(ver_prod_even_imag);
 	return 0;
 }
 
-static int put_atomisp_dis_statistics32(struct atomisp_dis_statistics *kp,
+static int put_atomisp_dis_statistics32(struct atomisp_dis_statistics __user *kp,
 					struct atomisp_dis_statistics32 __user *up)
 {
-	compat_uptr_t hor_prod_odd_real =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.hor_prod.odd_real);
-	compat_uptr_t hor_prod_odd_imag =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.hor_prod.odd_imag);
-	compat_uptr_t hor_prod_even_real =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.hor_prod.even_real);
-	compat_uptr_t hor_prod_even_imag =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.hor_prod.even_imag);
-	compat_uptr_t ver_prod_odd_real =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.ver_prod.odd_real);
-	compat_uptr_t ver_prod_odd_imag =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.ver_prod.odd_imag);
-	compat_uptr_t ver_prod_even_real =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.ver_prod.even_real);
-	compat_uptr_t ver_prod_even_imag =
-	    (compat_uptr_t)((uintptr_t)kp->dvs2_stat.ver_prod.even_imag);
-
-	if (!access_ok(up, sizeof(struct atomisp_dis_statistics32)) ||
-	    copy_to_user(up, kp, sizeof(struct atomisp_dvs_grid_info)) ||
-	    put_user(hor_prod_odd_real, &up->dvs2_stat.hor_prod.odd_real) ||
-	    put_user(hor_prod_odd_imag, &up->dvs2_stat.hor_prod.odd_imag) ||
-	    put_user(hor_prod_even_real, &up->dvs2_stat.hor_prod.even_real) ||
-	    put_user(hor_prod_even_imag, &up->dvs2_stat.hor_prod.even_imag) ||
-	    put_user(ver_prod_odd_real, &up->dvs2_stat.ver_prod.odd_real) ||
-	    put_user(ver_prod_odd_imag, &up->dvs2_stat.ver_prod.odd_imag) ||
-	    put_user(ver_prod_even_real, &up->dvs2_stat.ver_prod.even_real) ||
-	    put_user(ver_prod_even_imag, &up->dvs2_stat.ver_prod.even_imag) ||
-	    put_user(kp->exp_id, &up->exp_id))
+	void __user *hor_prod_odd_real;
+	void __user *hor_prod_odd_imag;
+	void __user *hor_prod_even_real;
+	void __user *hor_prod_even_imag;
+	void __user *ver_prod_odd_real;
+	void __user *ver_prod_odd_imag;
+	void __user *ver_prod_even_real;
+	void __user *ver_prod_even_imag;
+
+	if (!!access_ok(up, sizeof(struct atomisp_dis_statistics32)) ||
+	    copy_in_user(up, kp, sizeof(struct atomisp_dvs_grid_info)) ||
+	    get_user(hor_prod_odd_real,
+		     &kp->dvs2_stat.hor_prod.odd_real) ||
+	    get_user(hor_prod_odd_imag,
+		     &kp->dvs2_stat.hor_prod.odd_imag) ||
+	    get_user(hor_prod_even_real,
+		     &kp->dvs2_stat.hor_prod.even_real) ||
+	    get_user(hor_prod_even_imag,
+		     &kp->dvs2_stat.hor_prod.even_imag) ||
+	    get_user(ver_prod_odd_real,
+		     &kp->dvs2_stat.ver_prod.odd_real) ||
+	    get_user(ver_prod_odd_imag,
+		     &kp->dvs2_stat.ver_prod.odd_imag) ||
+	    get_user(ver_prod_even_real,
+		     &kp->dvs2_stat.ver_prod.even_real) ||
+	    get_user(ver_prod_even_imag,
+		     &kp->dvs2_stat.ver_prod.even_imag) ||
+	    put_user(ptr_to_compat(hor_prod_odd_real),
+		     &up->dvs2_stat.hor_prod.odd_real) ||
+	    put_user(ptr_to_compat(hor_prod_odd_imag),
+		     &up->dvs2_stat.hor_prod.odd_imag) ||
+	    put_user(ptr_to_compat(hor_prod_even_real),
+		     &up->dvs2_stat.hor_prod.even_real) ||
+	    put_user(ptr_to_compat(hor_prod_even_imag),
+		     &up->dvs2_stat.hor_prod.even_imag) ||
+	    put_user(ptr_to_compat(ver_prod_odd_real),
+		     &up->dvs2_stat.ver_prod.odd_real) ||
+	    put_user(ptr_to_compat(ver_prod_odd_imag),
+		     &up->dvs2_stat.ver_prod.odd_imag) ||
+	    put_user(ptr_to_compat(ver_prod_even_real),
+		     &up->dvs2_stat.ver_prod.even_real) ||
+	    put_user(ptr_to_compat(ver_prod_even_imag),
+		     &up->dvs2_stat.ver_prod.even_imag) ||
+	    assign_in_user(&up->exp_id, &kp->exp_id))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_dis_coefficients32(struct atomisp_dis_coefficients *kp,
-	struct atomisp_dis_coefficients32 __user *up)
+static int get_atomisp_dis_coefficients32(struct atomisp_dis_coefficients __user *kp,
+					  struct atomisp_dis_coefficients32 __user *up)
 {
 	compat_uptr_t hor_coefs_odd_real;
 	compat_uptr_t hor_coefs_odd_imag;
@@ -168,7 +195,7 @@ static int get_atomisp_dis_coefficients32(struct atomisp_dis_coefficients *kp,
 	compat_uptr_t ver_coefs_even_imag;
 
 	if (!access_ok(up, sizeof(struct atomisp_dis_coefficients32)) ||
-	    copy_from_user(kp, up, sizeof(struct atomisp_dvs_grid_info)) ||
+	    copy_in_user(kp, up, sizeof(struct atomisp_dvs_grid_info)) ||
 	    get_user(hor_coefs_odd_real, &up->hor_coefs.odd_real) ||
 	    get_user(hor_coefs_odd_imag, &up->hor_coefs.odd_imag) ||
 	    get_user(hor_coefs_even_real, &up->hor_coefs.even_real) ||
@@ -176,22 +203,30 @@ static int get_atomisp_dis_coefficients32(struct atomisp_dis_coefficients *kp,
 	    get_user(ver_coefs_odd_real, &up->ver_coefs.odd_real) ||
 	    get_user(ver_coefs_odd_imag, &up->ver_coefs.odd_imag) ||
 	    get_user(ver_coefs_even_real, &up->ver_coefs.even_real) ||
-	    get_user(ver_coefs_even_imag, &up->ver_coefs.even_imag))
+	    get_user(ver_coefs_even_imag, &up->ver_coefs.even_imag) ||
+	    put_user(compat_ptr(hor_coefs_odd_real),
+		     &kp->hor_coefs.odd_real) ||
+	    put_user(compat_ptr(hor_coefs_odd_imag),
+		     &kp->hor_coefs.odd_imag) ||
+	    put_user(compat_ptr(hor_coefs_even_real),
+		     &kp->hor_coefs.even_real) ||
+	    put_user(compat_ptr(hor_coefs_even_imag),
+		     &kp->hor_coefs.even_imag) ||
+	    put_user(compat_ptr(ver_coefs_odd_real),
+		     &kp->ver_coefs.odd_real) ||
+	    put_user(compat_ptr(ver_coefs_odd_imag),
+		     &kp->ver_coefs.odd_imag) ||
+	    put_user(compat_ptr(ver_coefs_even_real),
+		     &kp->ver_coefs.even_real) ||
+	    put_user(compat_ptr(ver_coefs_even_imag),
+		     &kp->ver_coefs.even_imag))
 		return -EFAULT;
 
-	kp->hor_coefs.odd_real = compat_ptr(hor_coefs_odd_real);
-	kp->hor_coefs.odd_imag = compat_ptr(hor_coefs_odd_imag);
-	kp->hor_coefs.even_real = compat_ptr(hor_coefs_even_real);
-	kp->hor_coefs.even_imag = compat_ptr(hor_coefs_even_imag);
-	kp->ver_coefs.odd_real = compat_ptr(ver_coefs_odd_real);
-	kp->ver_coefs.odd_imag = compat_ptr(ver_coefs_odd_imag);
-	kp->ver_coefs.even_real = compat_ptr(ver_coefs_even_real);
-	kp->ver_coefs.even_imag = compat_ptr(ver_coefs_even_imag);
 	return 0;
 }
 
-static int get_atomisp_dvs_6axis_config32(struct atomisp_dvs_6axis_config *kp,
-	struct atomisp_dvs_6axis_config32 __user *up)
+static int get_atomisp_dvs_6axis_config32(struct atomisp_dvs_6axis_config __user *kp,
+					  struct atomisp_dvs_6axis_config32 __user *up)
 {
 	compat_uptr_t xcoords_y;
 	compat_uptr_t ycoords_y;
@@ -199,62 +234,63 @@ static int get_atomisp_dvs_6axis_config32(struct atomisp_dvs_6axis_config *kp,
 	compat_uptr_t ycoords_uv;
 
 	if (!access_ok(up, sizeof(struct atomisp_dvs_6axis_config32)) ||
-	    get_user(kp->exp_id, &up->exp_id) ||
-	    get_user(kp->width_y, &up->width_y) ||
-	    get_user(kp->height_y, &up->height_y) ||
-	    get_user(kp->width_uv, &up->width_uv) ||
-	    get_user(kp->height_uv, &up->height_uv) ||
+	    assign_in_user(&kp->exp_id, &up->exp_id) ||
+	    assign_in_user(&kp->width_y, &up->width_y) ||
+	    assign_in_user(&kp->height_y, &up->height_y) ||
+	    assign_in_user(&kp->width_uv, &up->width_uv) ||
+	    assign_in_user(&kp->height_uv, &up->height_uv) ||
 	    get_user(xcoords_y, &up->xcoords_y) ||
 	    get_user(ycoords_y, &up->ycoords_y) ||
 	    get_user(xcoords_uv, &up->xcoords_uv) ||
-	    get_user(ycoords_uv, &up->ycoords_uv))
+	    get_user(ycoords_uv, &up->ycoords_uv) ||
+	    put_user(compat_ptr(xcoords_y), &kp->xcoords_y) ||
+	    put_user(compat_ptr(ycoords_y), &kp->ycoords_y) ||
+	    put_user(compat_ptr(xcoords_uv), &kp->xcoords_uv) ||
+	    put_user(compat_ptr(ycoords_uv), &kp->ycoords_uv))
 		return -EFAULT;
 
-	kp->xcoords_y = (void __force *)compat_ptr(xcoords_y);
-	kp->ycoords_y = (void __force *)compat_ptr(ycoords_y);
-	kp->xcoords_uv = (void __force *)compat_ptr(xcoords_uv);
-	kp->ycoords_uv = (void __force *)compat_ptr(ycoords_uv);
 	return 0;
 }
 
-static int get_atomisp_3a_statistics32(struct atomisp_3a_statistics *kp,
+static int get_atomisp_3a_statistics32(struct atomisp_3a_statistics __user *kp,
 				       struct atomisp_3a_statistics32 __user *up)
 {
 	compat_uptr_t data;
 	compat_uptr_t rgby_data;
 
 	if (!access_ok(up, sizeof(struct atomisp_3a_statistics32)) ||
-	    copy_from_user(kp, up, sizeof(struct atomisp_grid_info)) ||
+	    copy_in_user(kp, up, sizeof(struct atomisp_grid_info)) ||
 	    get_user(rgby_data, &up->rgby_data) ||
+	    put_user(compat_ptr(rgby_data), &kp->rgby_data) ||
 	    get_user(data, &up->data) ||
-	    get_user(kp->exp_id, &up->exp_id) ||
-	    get_user(kp->isp_config_id, &up->isp_config_id))
+	    put_user(compat_ptr(data), &kp->data) ||
+	    assign_in_user(&kp->exp_id, &up->exp_id) ||
+	    assign_in_user(&kp->isp_config_id, &up->isp_config_id))
 		return -EFAULT;
 
-	kp->data = compat_ptr(data);
-	kp->rgby_data = compat_ptr(rgby_data);
-
 	return 0;
 }
 
-static int put_atomisp_3a_statistics32(struct atomisp_3a_statistics *kp,
+static int put_atomisp_3a_statistics32(struct atomisp_3a_statistics __user *kp,
 				       struct atomisp_3a_statistics32 __user *up)
 {
-	compat_uptr_t data = (compat_uptr_t)((uintptr_t)kp->data);
-	compat_uptr_t rgby_data = (compat_uptr_t)((uintptr_t)kp->rgby_data);
+	void __user *data;
+	void __user *rgby_data;
 
 	if (!access_ok(up, sizeof(struct atomisp_3a_statistics32)) ||
 	    copy_to_user(up, kp, sizeof(struct atomisp_grid_info)) ||
-	    put_user(rgby_data, &up->rgby_data) ||
-	    put_user(data, &up->data) ||
-	    put_user(kp->exp_id, &up->exp_id) ||
-	    put_user(kp->isp_config_id, &up->isp_config_id))
+	    get_user(rgby_data, &kp->rgby_data) ||
+	    put_user(ptr_to_compat(rgby_data), &up->rgby_data) ||
+	    get_user(data, &kp->data) ||
+	    put_user(ptr_to_compat(data), &up->data) ||
+	    assign_in_user(&up->exp_id, &kp->exp_id) ||
+	    assign_in_user(&up->isp_config_id, &kp->isp_config_id))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_metadata_stat32(struct atomisp_metadata *kp,
+static int get_atomisp_metadata_stat32(struct atomisp_metadata __user *kp,
 				       struct atomisp_metadata32 __user *up)
 {
 	compat_uptr_t data;
@@ -262,555 +298,524 @@ static int get_atomisp_metadata_stat32(struct atomisp_metadata *kp,
 
 	if (!access_ok(up, sizeof(struct atomisp_metadata32)) ||
 	    get_user(data, &up->data) ||
-	    get_user(kp->width, &up->width) ||
-	    get_user(kp->height, &up->height) ||
-	    get_user(kp->stride, &up->stride) ||
-	    get_user(kp->exp_id, &up->exp_id) ||
-	    get_user(effective_width, &up->effective_width))
+	    put_user(compat_ptr(data), &kp->data) ||
+	    assign_in_user(&kp->width, &up->width) ||
+	    assign_in_user(&kp->height, &up->height) ||
+	    assign_in_user(&kp->stride, &up->stride) ||
+	    assign_in_user(&kp->exp_id, &up->exp_id) ||
+	    get_user(effective_width, &up->effective_width) ||
+	    put_user(compat_ptr(effective_width), &kp->effective_width))
 		return -EFAULT;
 
-	kp->data = compat_ptr(data);
-	kp->effective_width = (void __force *)compat_ptr(effective_width);
 	return 0;
 }
 
-static int put_atomisp_metadata_stat32(struct atomisp_metadata *kp,
-				       struct atomisp_metadata32 __user *up)
+static int put_atomisp_metadata_stat32(struct atomisp_metadata __user *kp,
+				struct atomisp_metadata32 __user *up)
 {
-	compat_uptr_t data = (compat_uptr_t)((uintptr_t)kp->data);
-	compat_uptr_t effective_width =
-	    (compat_uptr_t)((uintptr_t)kp->effective_width);
+	void __user *data;
+	void __user *effective_width;
+
 	if (!access_ok(up, sizeof(struct atomisp_metadata32)) ||
-	    put_user(data, &up->data) ||
-	    put_user(kp->width, &up->width) ||
-	    put_user(kp->height, &up->height) ||
-	    put_user(kp->stride, &up->stride) ||
-	    put_user(kp->exp_id, &up->exp_id) ||
-	    put_user(effective_width, &up->effective_width))
+	    get_user(data, &kp->data) ||
+	    put_user(ptr_to_compat(data), &up->data) ||
+	    assign_in_user(&up->width, &kp->width) ||
+	    assign_in_user(&up->height, &kp->height) ||
+	    assign_in_user(&up->stride, &kp->stride) ||
+	    assign_in_user(&up->exp_id, &kp->exp_id) ||
+	    get_user(effective_width, &kp->effective_width) ||
+	    put_user(ptr_to_compat(effective_width), &up->effective_width))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int put_atomisp_metadata_by_type_stat32(
-    struct atomisp_metadata_with_type *kp,
-    struct atomisp_metadata_with_type32 __user *up)
+static int
+put_atomisp_metadata_by_type_stat32(struct atomisp_metadata_with_type __user *kp,
+				    struct atomisp_metadata_with_type32 __user *up)
 {
-	compat_uptr_t data = (compat_uptr_t)((uintptr_t)kp->data);
-	compat_uptr_t effective_width =
-	    (compat_uptr_t)((uintptr_t)kp->effective_width);
+	void __user *data;
+	void __user *effective_width;
+
 	if (!access_ok(up, sizeof(struct atomisp_metadata_with_type32)) ||
-	    put_user(data, &up->data) ||
-	    put_user(kp->width, &up->width) ||
-	    put_user(kp->height, &up->height) ||
-	    put_user(kp->stride, &up->stride) ||
-	    put_user(kp->exp_id, &up->exp_id) ||
-	    put_user(effective_width, &up->effective_width) ||
-	    put_user(kp->type, &up->type))
+	    get_user(data, &kp->data) ||
+	    put_user(ptr_to_compat(data), &up->data) ||
+	    assign_in_user(&up->width, &kp->width) ||
+	    assign_in_user(&up->height, &kp->height) ||
+	    assign_in_user(&up->stride, &kp->stride) ||
+	    assign_in_user(&up->exp_id, &kp->exp_id) ||
+	    get_user(effective_width, &kp->effective_width) ||
+	    put_user(ptr_to_compat(effective_width),
+		     &up->effective_width) ||
+	    assign_in_user(&up->type, &kp->type))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_metadata_by_type_stat32(
-    struct atomisp_metadata_with_type *kp,
-    struct atomisp_metadata_with_type32 __user *up)
+static int
+get_atomisp_metadata_by_type_stat32(struct atomisp_metadata_with_type __user *kp,
+				    struct atomisp_metadata_with_type32 __user *up)
 {
 	compat_uptr_t data;
 	compat_uptr_t effective_width;
 
 	if (!access_ok(up, sizeof(struct atomisp_metadata_with_type32)) ||
 	    get_user(data, &up->data) ||
-	    get_user(kp->width, &up->width) ||
-	    get_user(kp->height, &up->height) ||
-	    get_user(kp->stride, &up->stride) ||
-	    get_user(kp->exp_id, &up->exp_id) ||
+	    put_user(compat_ptr(data), &kp->data) ||
+	    assign_in_user(&kp->width, &up->width) ||
+	    assign_in_user(&kp->height, &up->height) ||
+	    assign_in_user(&kp->stride, &up->stride) ||
+	    assign_in_user(&kp->exp_id, &up->exp_id) ||
 	    get_user(effective_width, &up->effective_width) ||
-	    get_user(kp->type, &up->type))
+	    put_user(compat_ptr(effective_width), &kp->effective_width) ||
+	    assign_in_user(&kp->type, &up->type))
 		return -EFAULT;
 
-	kp->data = compat_ptr(data);
-	kp->effective_width = (void __force *)compat_ptr(effective_width);
 	return 0;
 }
 
-static int get_atomisp_morph_table32(struct atomisp_morph_table *kp,
-				     struct atomisp_morph_table32 __user *up)
+static int
+get_atomisp_morph_table32(struct atomisp_morph_table __user *kp,
+			  struct atomisp_morph_table32 __user *up)
 {
 	unsigned int n = ATOMISP_MORPH_TABLE_NUM_PLANES;
 
 	if (!access_ok(up, sizeof(struct atomisp_morph_table32)) ||
-	    get_user(kp->enabled, &up->enabled) ||
-	    get_user(kp->width, &up->width) ||
-	    get_user(kp->height, &up->height))
-		return -EFAULT;
+		assign_in_user(&kp->enabled, &up->enabled) ||
+		assign_in_user(&kp->width, &up->width) ||
+		assign_in_user(&kp->height, &up->height))
+			return -EFAULT;
 
 	while (n-- > 0) {
-		uintptr_t *coord_kp = (uintptr_t *)&kp->coordinates_x[n];
-
-		if (get_user((*coord_kp), &up->coordinates_x[n]))
-			return -EFAULT;
+		compat_uptr_t coord_kp;
 
-		coord_kp = (uintptr_t *)&kp->coordinates_y[n];
-		if (get_user((*coord_kp), &up->coordinates_y[n]))
+		if (get_user(coord_kp, &up->coordinates_x[n]) ||
+		    put_user(compat_ptr(coord_kp), &kp->coordinates_x[n]) ||
+		    get_user(coord_kp, &up->coordinates_y[n]) ||
+		    put_user(compat_ptr(coord_kp), &kp->coordinates_y[n]))
 			return -EFAULT;
 	}
 	return 0;
 }
 
-static int put_atomisp_morph_table32(struct atomisp_morph_table *kp,
+static int put_atomisp_morph_table32(struct atomisp_morph_table __user *kp,
 				     struct atomisp_morph_table32 __user *up)
 {
 	unsigned int n = ATOMISP_MORPH_TABLE_NUM_PLANES;
 
 	if (!access_ok(up, sizeof(struct atomisp_morph_table32)) ||
-	    put_user(kp->enabled, &up->enabled) ||
-	    put_user(kp->width, &up->width) ||
-	    put_user(kp->height, &up->height))
-		return -EFAULT;
+		assign_in_user(&up->enabled, &kp->enabled) ||
+		assign_in_user(&up->width, &kp->width) ||
+		assign_in_user(&up->height, &kp->height))
+			return -EFAULT;
 
 	while (n-- > 0) {
-		uintptr_t *coord_kp = (uintptr_t *)&kp->coordinates_x[n];
+		void __user *coord_kp;
 
-		if (put_user((*coord_kp), &up->coordinates_x[n]))
-			return -EFAULT;
-
-		coord_kp = (uintptr_t *)&kp->coordinates_y[n];
-		if (put_user((*coord_kp), &up->coordinates_y[n]))
+		if (get_user(coord_kp, &kp->coordinates_x[n]) ||
+		    put_user(ptr_to_compat(coord_kp), &up->coordinates_x[n]) ||
+		    get_user(coord_kp, &kp->coordinates_y[n]) ||
+		    put_user(ptr_to_compat(coord_kp), &up->coordinates_y[n]))
 			return -EFAULT;
 	}
 	return 0;
 }
 
-static int get_atomisp_overlay32(struct atomisp_overlay *kp,
+static int get_atomisp_overlay32(struct atomisp_overlay __user *kp,
 				 struct atomisp_overlay32 __user *up)
 {
 	compat_uptr_t frame;
 
 	if (!access_ok(up, sizeof(struct atomisp_overlay32)) ||
 	    get_user(frame, &up->frame) ||
-	    get_user(kp->bg_y, &up->bg_y) ||
-	    get_user(kp->bg_u, &up->bg_u) ||
-	    get_user(kp->bg_v, &up->bg_v) ||
-	    get_user(kp->blend_input_perc_y, &up->blend_input_perc_y) ||
-	    get_user(kp->blend_input_perc_u, &up->blend_input_perc_u) ||
-	    get_user(kp->blend_input_perc_v, &up->blend_input_perc_v) ||
-	    get_user(kp->blend_overlay_perc_y, &up->blend_overlay_perc_y) ||
-	    get_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
-	    get_user(kp->blend_overlay_perc_v, &up->blend_overlay_perc_v) ||
-	    get_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
-	    get_user(kp->overlay_start_x, &up->overlay_start_x) ||
-	    get_user(kp->overlay_start_y, &up->overlay_start_y))
+	    put_user(compat_ptr(frame), &kp->frame) ||
+	    assign_in_user(&kp->bg_y, &up->bg_y) ||
+	    assign_in_user(&kp->bg_u, &up->bg_u) ||
+	    assign_in_user(&kp->bg_v, &up->bg_v) ||
+	    assign_in_user(&kp->blend_input_perc_y,
+			   &up->blend_input_perc_y) ||
+	    assign_in_user(&kp->blend_input_perc_u,
+			   &up->blend_input_perc_u) ||
+	    assign_in_user(&kp->blend_input_perc_v,
+			   &up->blend_input_perc_v) ||
+	    assign_in_user(&kp->blend_overlay_perc_y,
+			   &up->blend_overlay_perc_y) ||
+	    assign_in_user(&kp->blend_overlay_perc_u,
+			   &up->blend_overlay_perc_u) ||
+	    assign_in_user(&kp->blend_overlay_perc_v,
+			   &up->blend_overlay_perc_v) ||
+	    assign_in_user(&kp->overlay_start_x, &up->overlay_start_x) ||
+	    assign_in_user(&kp->overlay_start_y, &up->overlay_start_y))
 		return -EFAULT;
 
-	kp->frame = (void __force *)compat_ptr(frame);
 	return 0;
 }
 
-static int put_atomisp_overlay32(struct atomisp_overlay *kp,
+static int put_atomisp_overlay32(struct atomisp_overlay __user *kp,
 				 struct atomisp_overlay32 __user *up)
 {
-	compat_uptr_t frame = (compat_uptr_t)((uintptr_t)kp->frame);
+	void __user *frame;
 
 	if (!access_ok(up, sizeof(struct atomisp_overlay32)) ||
-	    put_user(frame, &up->frame) ||
-	    put_user(kp->bg_y, &up->bg_y) ||
-	    put_user(kp->bg_u, &up->bg_u) ||
-	    put_user(kp->bg_v, &up->bg_v) ||
-	    put_user(kp->blend_input_perc_y, &up->blend_input_perc_y) ||
-	    put_user(kp->blend_input_perc_u, &up->blend_input_perc_u) ||
-	    put_user(kp->blend_input_perc_v, &up->blend_input_perc_v) ||
-	    put_user(kp->blend_overlay_perc_y, &up->blend_overlay_perc_y) ||
-	    put_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
-	    put_user(kp->blend_overlay_perc_v, &up->blend_overlay_perc_v) ||
-	    put_user(kp->blend_overlay_perc_u, &up->blend_overlay_perc_u) ||
-	    put_user(kp->overlay_start_x, &up->overlay_start_x)
-	    put_user(kp->overlay_start_y, &up->overlay_start_y))
+	    get_user(frame, &kp->frame) ||
+	    put_user(ptr_to_compat(frame), &up->frame) ||
+	    assign_in_user(&up->bg_y, &kp->bg_y) ||
+	    assign_in_user(&up->bg_u, &kp->bg_u) ||
+	    assign_in_user(&up->bg_v, &kp->bg_v) ||
+	    assign_in_user(&up->blend_input_perc_y,
+			   &kp->blend_input_perc_y) ||
+	    assign_in_user(&up->blend_input_perc_u,
+			   &kp->blend_input_perc_u) ||
+	    assign_in_user(&up->blend_input_perc_v,
+			   &kp->blend_input_perc_v) ||
+	    assign_in_user(&up->blend_overlay_perc_y,
+			   &kp->blend_overlay_perc_y) ||
+	    assign_in_user(&up->blend_overlay_perc_u,
+			   &kp->blend_overlay_perc_u) ||
+	    assign_in_user(&up->blend_overlay_perc_v,
+			   &kp->blend_overlay_perc_v) ||
+	    assign_in_user(&up->overlay_start_x, &kp->overlay_start_x) ||
+	    assign_in_user(&up->overlay_start_y, &kp->overlay_start_y))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_calibration_group32(
-    struct atomisp_calibration_group *kp,
-    struct atomisp_calibration_group32 __user *up)
+static int
+get_atomisp_calibration_group32(struct atomisp_calibration_group __user *kp,
+				struct atomisp_calibration_group32 __user *up)
 {
 	compat_uptr_t calb_grp_values;
 
 	if (!access_ok(up, sizeof(struct atomisp_calibration_group32)) ||
-	    get_user(kp->size, &up->size) ||
-	    get_user(kp->type, &up->type) ||
-	    get_user(calb_grp_values, &up->calb_grp_values))
+	    assign_in_user(&kp->size, &up->size) ||
+	    assign_in_user(&kp->type, &up->type) ||
+	    get_user(calb_grp_values, &up->calb_grp_values) ||
+	    put_user(compat_ptr(calb_grp_values), &kp->calb_grp_values))
 		return -EFAULT;
 
-	kp->calb_grp_values = (void __force *)compat_ptr(calb_grp_values);
 	return 0;
 }
 
-static int put_atomisp_calibration_group32(
-    struct atomisp_calibration_group *kp,
-    struct atomisp_calibration_group32 __user *up)
+static int
+put_atomisp_calibration_group32(struct atomisp_calibration_group __user *kp,
+				struct atomisp_calibration_group32 __user *up)
 {
-	compat_uptr_t calb_grp_values =
-	    (compat_uptr_t)((uintptr_t)kp->calb_grp_values);
+	void __user *calb_grp_values;
 
 	if (!access_ok(up, sizeof(struct atomisp_calibration_group32)) ||
-	    put_user(kp->size, &up->size) ||
-	    put_user(kp->type, &up->type) ||
-	    put_user(calb_grp_values, &up->calb_grp_values))
+	    assign_in_user(&up->size, &kp->size) ||
+	    assign_in_user(&up->type, &kp->type) ||
+	    get_user(calb_grp_values, &kp->calb_grp_values) ||
+	    put_user(ptr_to_compat(calb_grp_values), &up->calb_grp_values))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_acc_fw_load32(struct atomisp_acc_fw_load *kp,
+static int get_atomisp_acc_fw_load32(struct atomisp_acc_fw_load __user *kp,
 				     struct atomisp_acc_fw_load32 __user *up)
 {
 	compat_uptr_t data;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_fw_load32)) ||
-	    get_user(kp->size, &up->size) ||
-	    get_user(kp->fw_handle, &up->fw_handle) ||
-	    get_user(data, &up->data))
+	    assign_in_user(&kp->size, &up->size) ||
+	    assign_in_user(&kp->fw_handle, &up->fw_handle) ||
+	    get_user(data, &up->data) ||
+	    put_user(compat_ptr(data), &kp->data))
 		return -EFAULT;
 
-	kp->data = compat_ptr(data);
 	return 0;
 }
 
-static int put_atomisp_acc_fw_load32(struct atomisp_acc_fw_load *kp,
+static int put_atomisp_acc_fw_load32(struct atomisp_acc_fw_load __user *kp,
 				     struct atomisp_acc_fw_load32 __user *up)
 {
-	compat_uptr_t data = (compat_uptr_t)((uintptr_t)kp->data);
+	void __user *data;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_fw_load32)) ||
-	    put_user(kp->size, &up->size) ||
-	    put_user(kp->fw_handle, &up->fw_handle) ||
-	    put_user(data, &up->data))
+	    assign_in_user(&up->size, &kp->size) ||
+	    assign_in_user(&up->fw_handle, &kp->fw_handle) ||
+	    get_user(data, &kp->data) ||
+	    put_user(ptr_to_compat(data), &up->data))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_acc_fw_arg32(struct atomisp_acc_fw_arg *kp,
+static int get_atomisp_acc_fw_arg32(struct atomisp_acc_fw_arg __user *kp,
 				    struct atomisp_acc_fw_arg32 __user *up)
 {
 	compat_uptr_t value;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_fw_arg32)) ||
-	    get_user(kp->fw_handle, &up->fw_handle) ||
-	    get_user(kp->index, &up->index) ||
+	    assign_in_user(&kp->fw_handle, &up->fw_handle) ||
+	    assign_in_user(&kp->index, &up->index) ||
 	    get_user(value, &up->value) ||
-	    get_user(kp->size, &up->size))
+	    put_user(compat_ptr(value), &kp->value) ||
+	    assign_in_user(&kp->size, &up->size))
 		return -EFAULT;
 
-	kp->value = compat_ptr(value);
 	return 0;
 }
 
-static int put_atomisp_acc_fw_arg32(struct atomisp_acc_fw_arg *kp,
+static int put_atomisp_acc_fw_arg32(struct atomisp_acc_fw_arg __user *kp,
 				    struct atomisp_acc_fw_arg32 __user *up)
 {
-	compat_uptr_t value = (compat_uptr_t)((uintptr_t)kp->value);
+	void __user *value;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_fw_arg32)) ||
-	    put_user(kp->fw_handle, &up->fw_handle) ||
-	    put_user(kp->index, &up->index) ||
-	    put_user(value, &up->value) ||
-	    put_user(kp->size, &up->size))
+	    assign_in_user(&up->fw_handle, &kp->fw_handle) ||
+	    assign_in_user(&up->index, &kp->index) ||
+	    get_user(value, &kp->value) ||
+	    put_user(ptr_to_compat(value), &up->value) ||
+	    assign_in_user(&up->size, &kp->size))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_v4l2_private_int_data32(struct v4l2_private_int_data *kp,
+static int get_v4l2_private_int_data32(struct v4l2_private_int_data __user *kp,
 				       struct v4l2_private_int_data32 __user *up)
 {
 	compat_uptr_t data;
 
 	if (!access_ok(up, sizeof(struct v4l2_private_int_data32)) ||
-	    get_user(kp->size, &up->size) ||
+	    assign_in_user(&kp->size, &up->size) ||
 	    get_user(data, &up->data) ||
-	    get_user(kp->reserved[0], &up->reserved[0]) ||
-	    get_user(kp->reserved[1], &up->reserved[1]))
+	    put_user(compat_ptr(data), &kp->data) ||
+	    assign_in_user(&kp->reserved[0], &up->reserved[0]) ||
+	    assign_in_user(&kp->reserved[1], &up->reserved[1]))
 		return -EFAULT;
 
-	kp->data = compat_ptr(data);
 	return 0;
 }
 
-static int put_v4l2_private_int_data32(struct v4l2_private_int_data *kp,
+static int put_v4l2_private_int_data32(struct v4l2_private_int_data __user *kp,
 				       struct v4l2_private_int_data32 __user *up)
 {
-	compat_uptr_t data = (compat_uptr_t)((uintptr_t)kp->data);
+	void __user *data;
 
 	if (!access_ok(up, sizeof(struct v4l2_private_int_data32)) ||
-	    put_user(kp->size, &up->size) ||
-	    put_user(data, &up->data) ||
-	    put_user(kp->reserved[0], &up->reserved[0]) ||
-	    put_user(kp->reserved[1], &up->reserved[1]))
+	    assign_in_user(&up->size, &kp->size) ||
+	    get_user(data, &kp->data) ||
+	    put_user(ptr_to_compat(data), &up->data) ||
+	    assign_in_user(&up->reserved[0], &kp->reserved[0]) ||
+	    assign_in_user(&up->reserved[1], &kp->reserved[1]))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_shading_table32(struct atomisp_shading_table *kp,
+static int get_atomisp_shading_table32(struct atomisp_shading_table __user *kp,
 				       struct atomisp_shading_table32 __user *up)
 {
 	unsigned int n = ATOMISP_NUM_SC_COLORS;
 
 	if (!access_ok(up, sizeof(struct atomisp_shading_table32)) ||
-	    get_user(kp->enable, &up->enable) ||
-	    get_user(kp->sensor_width, &up->sensor_width) ||
-	    get_user(kp->sensor_height, &up->sensor_height) ||
-	    get_user(kp->width, &up->width) ||
-	    get_user(kp->height, &up->height) ||
-	    get_user(kp->fraction_bits, &up->fraction_bits))
+	    assign_in_user(&kp->enable, &up->enable) ||
+	    assign_in_user(&kp->sensor_width, &up->sensor_width) ||
+	    assign_in_user(&kp->sensor_height, &up->sensor_height) ||
+	    assign_in_user(&kp->width, &up->width) ||
+	    assign_in_user(&kp->height, &up->height) ||
+	    assign_in_user(&kp->fraction_bits, &up->fraction_bits))
 		return -EFAULT;
 
 	while (n-- > 0) {
-		uintptr_t *data_p = (uintptr_t *)&kp->data[n];
+		compat_uptr_t tmp;
 
-		if (get_user((*data_p), &up->data[n]))
+		if (get_user(tmp, &up->data[n]) ||
+		    put_user(compat_ptr(tmp), &kp->data[n]))
 			return -EFAULT;
 	}
 	return 0;
 }
 
-static int get_atomisp_acc_map32(struct atomisp_acc_map *kp,
+static int get_atomisp_acc_map32(struct atomisp_acc_map __user *kp,
 				 struct atomisp_acc_map32 __user *up)
 {
 	compat_uptr_t user_ptr;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_map32)) ||
-	    get_user(kp->flags, &up->flags) ||
-	    get_user(kp->length, &up->length) ||
+	    assign_in_user(&kp->flags, &up->flags) ||
+	    assign_in_user(&kp->length, &up->length) ||
 	    get_user(user_ptr, &up->user_ptr) ||
-	    get_user(kp->css_ptr, &up->css_ptr) ||
-	    get_user(kp->reserved[0], &up->reserved[0]) ||
-	    get_user(kp->reserved[1], &up->reserved[1]) ||
-	    get_user(kp->reserved[2], &up->reserved[2]) ||
-	    get_user(kp->reserved[3], &up->reserved[3]))
+	    put_user(compat_ptr(user_ptr), &kp->user_ptr) ||
+	    assign_in_user(&kp->css_ptr, &up->css_ptr) ||
+	    assign_in_user(&kp->reserved[0], &up->reserved[0]) ||
+	    assign_in_user(&kp->reserved[1], &up->reserved[1]) ||
+	    assign_in_user(&kp->reserved[2], &up->reserved[2]) ||
+	    assign_in_user(&kp->reserved[3], &up->reserved[3]))
 		return -EFAULT;
 
-	kp->user_ptr = compat_ptr(user_ptr);
 	return 0;
 }
 
-static int put_atomisp_acc_map32(struct atomisp_acc_map *kp,
+static int put_atomisp_acc_map32(struct atomisp_acc_map __user *kp,
 				 struct atomisp_acc_map32 __user *up)
 {
-	compat_uptr_t user_ptr = (compat_uptr_t)((uintptr_t)kp->user_ptr);
+	void __user *user_ptr;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_map32)) ||
-	    put_user(kp->flags, &up->flags) ||
-	    put_user(kp->length, &up->length) ||
-	    put_user(user_ptr, &up->user_ptr) ||
-	    put_user(kp->css_ptr, &up->css_ptr) ||
-	    put_user(kp->reserved[0], &up->reserved[0]) ||
-	    put_user(kp->reserved[1], &up->reserved[1]) ||
-	    put_user(kp->reserved[2], &up->reserved[2]) ||
-	    put_user(kp->reserved[3], &up->reserved[3]))
+	    assign_in_user(&up->flags, &kp->flags) ||
+	    assign_in_user(&up->length, &kp->length) ||
+	    get_user(user_ptr, &kp->user_ptr) ||
+	    put_user(ptr_to_compat(user_ptr), &up->user_ptr) ||
+	    assign_in_user(&up->css_ptr, &kp->css_ptr) ||
+	    assign_in_user(&up->reserved[0], &kp->reserved[0]) ||
+	    assign_in_user(&up->reserved[1], &kp->reserved[1]) ||
+	    assign_in_user(&up->reserved[2], &kp->reserved[2]) ||
+	    assign_in_user(&up->reserved[3], &kp->reserved[3]))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_acc_s_mapped_arg32(struct atomisp_acc_s_mapped_arg *kp,
-	struct atomisp_acc_s_mapped_arg32 __user *up)
+static int
+get_atomisp_acc_s_mapped_arg32(struct atomisp_acc_s_mapped_arg __user *kp,
+			       struct atomisp_acc_s_mapped_arg32 __user *up)
 {
 	if (!access_ok(up, sizeof(struct atomisp_acc_s_mapped_arg32)) ||
-	    get_user(kp->fw_handle, &up->fw_handle) ||
-	    get_user(kp->memory, &up->memory) ||
-	    get_user(kp->length, &up->length) ||
-	    get_user(kp->css_ptr, &up->css_ptr))
+	    assign_in_user(&kp->fw_handle, &up->fw_handle) ||
+	    assign_in_user(&kp->memory, &up->memory) ||
+	    assign_in_user(&kp->length, &up->length) ||
+	    assign_in_user(&kp->css_ptr, &up->css_ptr))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int put_atomisp_acc_s_mapped_arg32(struct atomisp_acc_s_mapped_arg *kp,
-	struct atomisp_acc_s_mapped_arg32 __user *up)
+static int
+put_atomisp_acc_s_mapped_arg32(struct atomisp_acc_s_mapped_arg __user *kp,
+			       struct atomisp_acc_s_mapped_arg32 __user *up)
 {
 	if (!access_ok(up, sizeof(struct atomisp_acc_s_mapped_arg32)) ||
-	    put_user(kp->fw_handle, &up->fw_handle) ||
-	    put_user(kp->memory, &up->memory) ||
-	    put_user(kp->length, &up->length) ||
-	    put_user(kp->css_ptr, &up->css_ptr))
+	    assign_in_user(&up->fw_handle, &kp->fw_handle) ||
+	    assign_in_user(&up->memory, &kp->memory) ||
+	    assign_in_user(&up->length, &kp->length) ||
+	    assign_in_user(&up->css_ptr, &kp->css_ptr))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_parameters32(struct atomisp_parameters *kp,
+static int get_atomisp_parameters32(struct atomisp_parameters __user *kp,
 				    struct atomisp_parameters32 __user *up)
 {
 	int n = offsetof(struct atomisp_parameters32, output_frame) /
 		sizeof(compat_uptr_t);
-	unsigned int size, offset = 0;
-	void  __user *user_ptr;
-	unsigned int stp, mtp, dcp, dscp = 0;
+	compat_uptr_t stp, mtp, dcp, dscp;
+	struct {
+		struct atomisp_shading_table shading_table;
+		struct atomisp_morph_table morph_table;
+		struct atomisp_dis_coefficients dvs2_coefs;
+		struct atomisp_dvs_6axis_config dvs_6axis_config;
+	} __user *karg = (void *)(kp + 1);
 
 	if (!access_ok(up, sizeof(struct atomisp_parameters32)))
 		return -EFAULT;
 
 	while (n >= 0) {
-		compat_uptr_t __user *src = ((compat_uptr_t __user *)up) + n;
-		uintptr_t *dst = ((uintptr_t *)kp) + n;
+		compat_uptr_t *src = (compat_uptr_t *)up + n;
+		void * __user *dst = (void * __user *)kp + n;
+		compat_uptr_t tmp;
 
-		if (get_user((*dst), src))
+		if (get_user(tmp, src) || put_user(compat_ptr(tmp), dst))
 			return -EFAULT;
 		n--;
 	}
-	if (get_user(kp->isp_config_id, &up->isp_config_id) ||
-	    get_user(kp->per_frame_setting, &up->per_frame_setting) ||
+
+	if (assign_in_user(&kp->isp_config_id, &up->isp_config_id) ||
+	    assign_in_user(&kp->per_frame_setting, &up->per_frame_setting) ||
 	    get_user(stp, &up->shading_table) ||
 	    get_user(mtp, &up->morph_table) ||
 	    get_user(dcp, &up->dvs2_coefs) ||
 	    get_user(dscp, &up->dvs_6axis_config))
 		return -EFAULT;
 
-	{
-		union {
-			struct atomisp_shading_table shading_table;
-			struct atomisp_morph_table   morph_table;
-			struct atomisp_dis_coefficients dvs2_coefs;
-			struct atomisp_dvs_6axis_config dvs_6axis_config;
-		} karg;
-
-		size = sizeof(struct atomisp_shading_table) +
-		       sizeof(struct atomisp_morph_table) +
-		       sizeof(struct atomisp_dis_coefficients) +
-		       sizeof(struct atomisp_dvs_6axis_config);
-		user_ptr = compat_alloc_user_space(size);
-
-		/* handle shading table */
-		if (stp != 0) {
-			if (get_atomisp_shading_table32(&karg.shading_table,
-							(struct atomisp_shading_table32 __user *)
-							(uintptr_t)stp))
-				return -EFAULT;
-
-			kp->shading_table = (void __force *)user_ptr + offset;
-			offset = sizeof(struct atomisp_shading_table);
-			if (!kp->shading_table)
-				return -EFAULT;
-
-			if (copy_to_user((void __user *)kp->shading_table,
-					 &karg.shading_table,
-					 sizeof(struct atomisp_shading_table)))
-				return -EFAULT;
-		}
-
-		/* handle morph table */
-		if (mtp != 0) {
-			if (get_atomisp_morph_table32(&karg.morph_table,
-						      (struct atomisp_morph_table32 __user *)
-						      (uintptr_t)mtp))
-				return -EFAULT;
-
-			kp->morph_table = (void __force *)user_ptr + offset;
-			offset += sizeof(struct atomisp_morph_table);
-			if (!kp->morph_table)
-				return -EFAULT;
-
-			if (copy_to_user((void __user *)kp->morph_table,
-					 &karg.morph_table,
-					 sizeof(struct atomisp_morph_table)))
-				return -EFAULT;
-		}
-
-		/* handle dvs2 coefficients */
-		if (dcp != 0) {
-			if (get_atomisp_dis_coefficients32(&karg.dvs2_coefs,
-							   (struct atomisp_dis_coefficients32 __user *)
-							   (uintptr_t)dcp))
-				return -EFAULT;
-
-			kp->dvs2_coefs = (void __force *)user_ptr + offset;
-			offset += sizeof(struct atomisp_dis_coefficients);
-			if (!kp->dvs2_coefs)
-				return -EFAULT;
-
-			if (copy_to_user((void __user *)kp->dvs2_coefs,
-					 &karg.dvs2_coefs,
-					 sizeof(struct atomisp_dis_coefficients)))
-				return -EFAULT;
-		}
-		/* handle dvs 6axis configuration */
-		if (dscp != 0) {
-			if (get_atomisp_dvs_6axis_config32(&karg.dvs_6axis_config,
-							   (struct atomisp_dvs_6axis_config32 __user *)
-							   (uintptr_t)dscp))
-				return -EFAULT;
-
-			kp->dvs_6axis_config = (void __force *)user_ptr + offset;
-			offset += sizeof(struct atomisp_dvs_6axis_config);
-			if (!kp->dvs_6axis_config)
-				return -EFAULT;
-
-			if (copy_to_user((void __user *)kp->dvs_6axis_config,
-					 &karg.dvs_6axis_config,
-					 sizeof(struct atomisp_dvs_6axis_config)))
-				return -EFAULT;
-		}
-	}
+	/* handle shading table */
+	if (stp && (get_atomisp_shading_table32(&karg->shading_table,
+						compat_ptr(stp)) ||
+		    put_user(&karg->shading_table, &kp->shading_table)))
+		return -EFAULT;
+
+	/* handle morph table */
+	if (mtp && (get_atomisp_morph_table32(&karg->morph_table,
+					      compat_ptr(mtp)) ||
+		    put_user(&karg->morph_table, &kp->morph_table)))
+		return -EFAULT;
+
+	/* handle dvs2 coefficients */
+	if (dcp && (get_atomisp_dis_coefficients32(&karg->dvs2_coefs,
+						   compat_ptr(dcp)) ||
+		    put_user(&karg->dvs2_coefs, &kp->dvs2_coefs)))
+		return -EFAULT;
+
+	/* handle dvs 6axis configuration */
+	if (dscp &&
+	    (get_atomisp_dvs_6axis_config32(&karg->dvs_6axis_config,
+					    compat_ptr(dscp)) ||
+	     put_user(&karg->dvs_6axis_config, &kp->dvs_6axis_config)))
+		return -EFAULT;
+
 	return 0;
 }
 
-static int get_atomisp_acc_fw_load_to_pipe32(
-    struct atomisp_acc_fw_load_to_pipe *kp,
-    struct atomisp_acc_fw_load_to_pipe32 __user *up)
+static int
+get_atomisp_acc_fw_load_to_pipe32(struct atomisp_acc_fw_load_to_pipe __user *kp,
+				  struct atomisp_acc_fw_load_to_pipe32 __user *up)
 {
 	compat_uptr_t data;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_fw_load_to_pipe32)) ||
-	    get_user(kp->flags, &up->flags) ||
-	    get_user(kp->fw_handle, &up->fw_handle) ||
-	    get_user(kp->size, &up->size) ||
-	    get_user(kp->type, &up->type) ||
-	    get_user(kp->reserved[0], &up->reserved[0]) ||
-	    get_user(kp->reserved[1], &up->reserved[1]) ||
-	    get_user(kp->reserved[2], &up->reserved[2]) ||
-	    get_user(data, &up->data))
+	    assign_in_user(&kp->flags, &up->flags) ||
+	    assign_in_user(&kp->fw_handle, &up->fw_handle) ||
+	    assign_in_user(&kp->size, &up->size) ||
+	    assign_in_user(&kp->type, &up->type) ||
+	    assign_in_user(&kp->reserved[0], &up->reserved[0]) ||
+	    assign_in_user(&kp->reserved[1], &up->reserved[1]) ||
+	    assign_in_user(&kp->reserved[2], &up->reserved[2]) ||
+	    get_user(data, &up->data) ||
+	    put_user(compat_ptr(data), &kp->data))
 		return -EFAULT;
 
-	kp->data = compat_ptr(data);
 	return 0;
 }
 
-static int put_atomisp_acc_fw_load_to_pipe32(
-    struct atomisp_acc_fw_load_to_pipe *kp,
-    struct atomisp_acc_fw_load_to_pipe32 __user *up)
+static int
+put_atomisp_acc_fw_load_to_pipe32(struct atomisp_acc_fw_load_to_pipe __user *kp,
+				  struct atomisp_acc_fw_load_to_pipe32 __user *up)
 {
-	compat_uptr_t data = (compat_uptr_t)((uintptr_t)kp->data);
+	void __user *data;
 
 	if (!access_ok(up, sizeof(struct atomisp_acc_fw_load_to_pipe32)) ||
-	    put_user(kp->flags, &up->flags) ||
-	    put_user(kp->fw_handle, &up->fw_handle) ||
-	    put_user(kp->size, &up->size) ||
-	    put_user(kp->type, &up->type) ||
-	    put_user(kp->reserved[0], &up->reserved[0]) ||
-	    put_user(kp->reserved[1], &up->reserved[1]) ||
-	    put_user(kp->reserved[2], &up->reserved[2]) ||
-	    put_user(data, &up->data))
+	    assign_in_user(&up->flags, &kp->flags) ||
+	    assign_in_user(&up->fw_handle, &kp->fw_handle) ||
+	    assign_in_user(&up->size, &kp->size) ||
+	    assign_in_user(&up->type, &kp->type) ||
+	    assign_in_user(&up->reserved[0], &kp->reserved[0]) ||
+	    assign_in_user(&up->reserved[1], &kp->reserved[1]) ||
+	    assign_in_user(&up->reserved[2], &kp->reserved[2]) ||
+	    get_user(data, &kp->data) ||
+	    put_user(ptr_to_compat(data), &up->data))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int get_atomisp_sensor_ae_bracketing_lut(
-    struct atomisp_sensor_ae_bracketing_lut *kp,
-    struct atomisp_sensor_ae_bracketing_lut32 __user *up)
+static int
+get_atomisp_sensor_ae_bracketing_lut(struct atomisp_sensor_ae_bracketing_lut __user *kp,
+				     struct atomisp_sensor_ae_bracketing_lut32 __user *up)
 {
 	compat_uptr_t lut;
 
 	if (!access_ok(up, sizeof(struct atomisp_sensor_ae_bracketing_lut32)) ||
-	    get_user(kp->lut_size, &up->lut_size) ||
-	    get_user(lut, &up->lut))
+	    assign_in_user(&kp->lut_size, &up->lut_size) ||
+	    get_user(lut, &up->lut) ||
+	    put_user(compat_ptr(lut), &kp->lut))
 		return -EFAULT;
 
-	kp->lut = (void __force *)compat_ptr(lut);
 	return 0;
 }
 
@@ -848,11 +853,17 @@ static long atomisp_do_compat_ioctl(struct file *file,
 		struct atomisp_metadata md;
 		struct atomisp_metadata_with_type md_with_type;
 		struct atomisp_sensor_ae_bracketing_lut lut;
-	} karg;
-	mm_segment_t old_fs;
+	} __user *karg;
 	void __user *up = compat_ptr(arg);
 	long err = -ENOIOCTLCMD;
 
+	karg = compat_alloc_user_space(
+		sizeof(*karg) + (cmd == ATOMISP_IOC_S_PARAMETERS32 ?
+				 sizeof(struct atomisp_shading_table) +
+				 sizeof(struct atomisp_morph_table) +
+				 sizeof(struct atomisp_dis_coefficients) +
+				 sizeof(struct atomisp_dvs_6axis_config) : 0));
+
 	/* First, convert the command. */
 	switch (cmd) {
 	case ATOMISP_IOC_G_HISTOGRAM32:
@@ -938,130 +949,127 @@ static long atomisp_do_compat_ioctl(struct file *file,
 	switch (cmd) {
 	case ATOMISP_IOC_G_HISTOGRAM:
 	case ATOMISP_IOC_S_HISTOGRAM:
-		err = get_atomisp_histogram32(&karg.his, up);
+		err = get_atomisp_histogram32(&karg->his, up);
 		break;
 	case ATOMISP_IOC_G_DIS_STAT:
-		err = get_atomisp_dis_statistics32(&karg.dis_s, up);
+		err = get_atomisp_dis_statistics32(&karg->dis_s, up);
 		break;
 	case ATOMISP_IOC_S_DIS_COEFS:
-		err = get_atomisp_dis_coefficients32(&karg.dis_c, up);
+		err = get_atomisp_dis_coefficients32(&karg->dis_c, up);
 		break;
 	case ATOMISP_IOC_S_DIS_VECTOR:
-		err = get_atomisp_dvs_6axis_config32(&karg.dvs_c, up);
+		err = get_atomisp_dvs_6axis_config32(&karg->dvs_c, up);
 		break;
 	case ATOMISP_IOC_G_3A_STAT:
-		err = get_atomisp_3a_statistics32(&karg.s3a_s, up);
+		err = get_atomisp_3a_statistics32(&karg->s3a_s, up);
 		break;
 	case ATOMISP_IOC_G_ISP_GDC_TAB:
 	case ATOMISP_IOC_S_ISP_GDC_TAB:
-		err = get_atomisp_morph_table32(&karg.mor_t, up);
+		err = get_atomisp_morph_table32(&karg->mor_t, up);
 		break;
 	case ATOMISP_IOC_S_ISP_FPN_TABLE:
-		err = get_v4l2_framebuffer32(&karg.v4l2_buf, up);
+		err = get_v4l2_framebuffer32(&karg->v4l2_buf, up);
 		break;
 	case ATOMISP_IOC_G_ISP_OVERLAY:
 	case ATOMISP_IOC_S_ISP_OVERLAY:
-		err = get_atomisp_overlay32(&karg.overlay, up);
+		err = get_atomisp_overlay32(&karg->overlay, up);
 		break;
 	case ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP:
-		err = get_atomisp_calibration_group32(&karg.cal_grp, up);
+		err = get_atomisp_calibration_group32(&karg->cal_grp, up);
 		break;
 	case ATOMISP_IOC_ACC_LOAD:
-		err = get_atomisp_acc_fw_load32(&karg.acc_fw_load, up);
+		err = get_atomisp_acc_fw_load32(&karg->acc_fw_load, up);
 		break;
 	case ATOMISP_IOC_ACC_S_ARG:
 	case ATOMISP_IOC_ACC_DESTAB:
-		err = get_atomisp_acc_fw_arg32(&karg.acc_fw_arg, up);
+		err = get_atomisp_acc_fw_arg32(&karg->acc_fw_arg, up);
 		break;
 	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
 	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
-		err = get_v4l2_private_int_data32(&karg.v4l2_pri_data, up);
+		err = get_v4l2_private_int_data32(&karg->v4l2_pri_data, up);
 		break;
 	case ATOMISP_IOC_S_ISP_SHD_TAB:
-		err = get_atomisp_shading_table32(&karg.shd_tbl, up);
+		err = get_atomisp_shading_table32(&karg->shd_tbl, up);
 		break;
 	case ATOMISP_IOC_ACC_MAP:
 	case ATOMISP_IOC_ACC_UNMAP:
-		err = get_atomisp_acc_map32(&karg.acc_map, up);
+		err = get_atomisp_acc_map32(&karg->acc_map, up);
 		break;
 	case ATOMISP_IOC_ACC_S_MAPPED_ARG:
-		err = get_atomisp_acc_s_mapped_arg32(&karg.acc_map_arg, up);
+		err = get_atomisp_acc_s_mapped_arg32(&karg->acc_map_arg, up);
 		break;
 	case ATOMISP_IOC_S_PARAMETERS:
-		err = get_atomisp_parameters32(&karg.param, up);
+		err = get_atomisp_parameters32(&karg->param, up);
 		break;
 	case ATOMISP_IOC_ACC_LOAD_TO_PIPE:
-		err = get_atomisp_acc_fw_load_to_pipe32(&karg.acc_fw_to_pipe,
+		err = get_atomisp_acc_fw_load_to_pipe32(&karg->acc_fw_to_pipe,
 							up);
 		break;
 	case ATOMISP_IOC_G_METADATA:
-		err = get_atomisp_metadata_stat32(&karg.md, up);
+		err = get_atomisp_metadata_stat32(&karg->md, up);
 		break;
 	case ATOMISP_IOC_G_METADATA_BY_TYPE:
-		err = get_atomisp_metadata_by_type_stat32(&karg.md_with_type,
-			up);
+		err = get_atomisp_metadata_by_type_stat32(&karg->md_with_type,
+							  up);
 		break;
 	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_LUT:
-		err = get_atomisp_sensor_ae_bracketing_lut(&karg.lut, up);
+		err = get_atomisp_sensor_ae_bracketing_lut(&karg->lut, up);
 		break;
 	}
 	if (err)
 		return err;
 
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	err = native_ioctl(file, cmd, (unsigned long)&karg);
-	set_fs(old_fs);
+	err = native_ioctl(file, cmd, (unsigned long)karg);
 	if (err)
 		return err;
 
 	switch (cmd) {
 	case ATOMISP_IOC_G_HISTOGRAM:
-		err = put_atomisp_histogram32(&karg.his, up);
+		err = put_atomisp_histogram32(&karg->his, up);
 		break;
 	case ATOMISP_IOC_G_DIS_STAT:
-		err = put_atomisp_dis_statistics32(&karg.dis_s, up);
+		err = put_atomisp_dis_statistics32(&karg->dis_s, up);
 		break;
 	case ATOMISP_IOC_G_3A_STAT:
-		err = put_atomisp_3a_statistics32(&karg.s3a_s, up);
+		err = put_atomisp_3a_statistics32(&karg->s3a_s, up);
 		break;
 	case ATOMISP_IOC_G_ISP_GDC_TAB:
-		err = put_atomisp_morph_table32(&karg.mor_t, up);
+		err = put_atomisp_morph_table32(&karg->mor_t, up);
 		break;
 	case ATOMISP_IOC_G_ISP_OVERLAY:
-		err = put_atomisp_overlay32(&karg.overlay, up);
+		err = put_atomisp_overlay32(&karg->overlay, up);
 		break;
 	case ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP:
-		err = put_atomisp_calibration_group32(&karg.cal_grp, up);
+		err = put_atomisp_calibration_group32(&karg->cal_grp, up);
 		break;
 	case ATOMISP_IOC_ACC_LOAD:
-		err = put_atomisp_acc_fw_load32(&karg.acc_fw_load, up);
+		err = put_atomisp_acc_fw_load32(&karg->acc_fw_load, up);
 		break;
 	case ATOMISP_IOC_ACC_S_ARG:
 	case ATOMISP_IOC_ACC_DESTAB:
-		err = put_atomisp_acc_fw_arg32(&karg.acc_fw_arg, up);
+		err = put_atomisp_acc_fw_arg32(&karg->acc_fw_arg, up);
 		break;
 	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
 	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
-		err = put_v4l2_private_int_data32(&karg.v4l2_pri_data, up);
+		err = put_v4l2_private_int_data32(&karg->v4l2_pri_data, up);
 		break;
 	case ATOMISP_IOC_ACC_MAP:
 	case ATOMISP_IOC_ACC_UNMAP:
-		err = put_atomisp_acc_map32(&karg.acc_map, up);
+		err = put_atomisp_acc_map32(&karg->acc_map, up);
 		break;
 	case ATOMISP_IOC_ACC_S_MAPPED_ARG:
-		err = put_atomisp_acc_s_mapped_arg32(&karg.acc_map_arg, up);
+		err = put_atomisp_acc_s_mapped_arg32(&karg->acc_map_arg, up);
 		break;
 	case ATOMISP_IOC_ACC_LOAD_TO_PIPE:
-		err = put_atomisp_acc_fw_load_to_pipe32(&karg.acc_fw_to_pipe,
+		err = put_atomisp_acc_fw_load_to_pipe32(&karg->acc_fw_to_pipe,
 							up);
 		break;
 	case ATOMISP_IOC_G_METADATA:
-		err = put_atomisp_metadata_stat32(&karg.md, up);
+		err = put_atomisp_metadata_stat32(&karg->md, up);
 		break;
 	case ATOMISP_IOC_G_METADATA_BY_TYPE:
-		err = put_atomisp_metadata_by_type_stat32(&karg.md_with_type,
-			up);
+		err = put_atomisp_metadata_by_type_stat32(&karg->md_with_type,
+							  up);
 		break;
 	}
 
-- 
2.20.1

