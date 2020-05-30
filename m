Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24B51E8E90
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgE3G53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728878AbgE3G4I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89057221FC;
        Sat, 30 May 2020 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=OkGr1wyY4tvroJ3UDFTTFl/XE5q2AgcowgjQvdCNFUY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AqSlyh0EOqG1PlR+aG3Z1ccxe4NhvgiW+WBYm9TA4GM0oaps5HPinp8XQBTT1wbXG
         4pTKDYjdMyrk00LqpRnf6HwuLYlDnc9g1klj4Wkj/eTtMt53zaDRCUY1pQgb6IYwzt
         NJZWme+GpGB7XlgMKOSCVGz6rK2NCdaGXBglSEe4=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPW-001hrF-Eg; Sat, 30 May 2020 08:56:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 40/41] media: atomisp: get rid of set_fs() dirty hacks
Date:   Sat, 30 May 2020 08:55:57 +0200
Message-Id: <20234729bd1227640b0ba1976fec9e1121d3437c.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file was based on an older version of the V4L2 compat32
code, which had this ugly hack.

Change the code to remove the hack. Yet, the entire compat32
code is currently commented out. So, let's add a FIXME note
at the code, as we may need to check if some of the atomisp
specific ioctls would require it.

It is not worth to do such checks now, as we may get rid
of several of them while cleaning up other things while
at staging.

Reported-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/TODO            |  3 +
 .../atomisp/pci/atomisp_compat_ioctl32.c      | 89 ++++++++++---------
 2 files changed, 52 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index e58643a9de43..9e46015ebcd5 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -161,6 +161,9 @@ TODO
     for this driver until the other work is done, as there will be a lot
     of code churn until this driver becomes functional again.
 
+16. Fix the compat32 code and remove the comment preventing it to be
+    called.
+
 Limitations
 ===========
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
index 3079043f1fac..e2e3a242b95d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
@@ -847,9 +847,17 @@ static long atomisp_do_compat_ioctl(struct file *file,
 		struct atomisp_metadata_with_type md_with_type;
 		struct atomisp_sensor_ae_bracketing_lut lut;
 	} karg;
-	mm_segment_t old_fs;
-	void __user *up = compat_ptr(arg);
+	void __user *p32 = compat_ptr(arg);
+	void __user *new_p64 = NULL;
 	long err = -ENOIOCTLCMD;
+	int compatible_arg = 1;
+
+	/*
+	 * FIXME: should verify if any of the functions below will be
+	 * setting a pointer. If so, compatible_arg should be zeroed.
+	 *
+	 * Please see v4l2-compat-ioctl32.c for more details
+	 */
 
 	/* First, convert the command. */
 	switch (cmd) {
@@ -936,130 +944,131 @@ static long atomisp_do_compat_ioctl(struct file *file,
 	switch (cmd) {
 	case ATOMISP_IOC_G_HISTOGRAM:
 	case ATOMISP_IOC_S_HISTOGRAM:
-		err = get_atomisp_histogram32(&karg.his, up);
+		err = get_atomisp_histogram32(&karg.his, p32);
 		break;
 	case ATOMISP_IOC_G_DIS_STAT:
-		err = get_atomisp_dis_statistics32(&karg.dis_s, up);
+		err = get_atomisp_dis_statistics32(&karg.dis_s, p32);
 		break;
 	case ATOMISP_IOC_S_DIS_COEFS:
-		err = get_atomisp_dis_coefficients32(&karg.dis_c, up);
+		err = get_atomisp_dis_coefficients32(&karg.dis_c, p32);
 		break;
 	case ATOMISP_IOC_S_DIS_VECTOR:
-		err = get_atomisp_dvs_6axis_config32(&karg.dvs_c, up);
+		err = get_atomisp_dvs_6axis_config32(&karg.dvs_c, p32);
 		break;
 	case ATOMISP_IOC_G_3A_STAT:
-		err = get_atomisp_3a_statistics32(&karg.s3a_s, up);
+		err = get_atomisp_3a_statistics32(&karg.s3a_s, p32);
 		break;
 	case ATOMISP_IOC_G_ISP_GDC_TAB:
 	case ATOMISP_IOC_S_ISP_GDC_TAB:
-		err = get_atomisp_morph_table32(&karg.mor_t, up);
+		err = get_atomisp_morph_table32(&karg.mor_t, p32);
 		break;
 	case ATOMISP_IOC_S_ISP_FPN_TABLE:
-		err = get_v4l2_framebuffer32(&karg.v4l2_buf, up);
+		err = get_v4l2_framebuffer32(&karg.v4l2_buf, p32);
 		break;
 	case ATOMISP_IOC_G_ISP_OVERLAY:
 	case ATOMISP_IOC_S_ISP_OVERLAY:
-		err = get_atomisp_overlay32(&karg.overlay, up);
+		err = get_atomisp_overlay32(&karg.overlay, p32);
 		break;
 	case ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP:
-		err = get_atomisp_calibration_group32(&karg.cal_grp, up);
+		err = get_atomisp_calibration_group32(&karg.cal_grp, p32);
 		break;
 	case ATOMISP_IOC_ACC_LOAD:
-		err = get_atomisp_acc_fw_load32(&karg.acc_fw_load, up);
+		err = get_atomisp_acc_fw_load32(&karg.acc_fw_load, p32);
 		break;
 	case ATOMISP_IOC_ACC_S_ARG:
 	case ATOMISP_IOC_ACC_DESTAB:
-		err = get_atomisp_acc_fw_arg32(&karg.acc_fw_arg, up);
+		err = get_atomisp_acc_fw_arg32(&karg.acc_fw_arg, p32);
 		break;
 	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
 	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
-		err = get_v4l2_private_int_data32(&karg.v4l2_pri_data, up);
+		err = get_v4l2_private_int_data32(&karg.v4l2_pri_data, p32);
 		break;
 	case ATOMISP_IOC_S_ISP_SHD_TAB:
-		err = get_atomisp_shading_table32(&karg.shd_tbl, up);
+		err = get_atomisp_shading_table32(&karg.shd_tbl, p32);
 		break;
 	case ATOMISP_IOC_ACC_MAP:
 	case ATOMISP_IOC_ACC_UNMAP:
-		err = get_atomisp_acc_map32(&karg.acc_map, up);
+		err = get_atomisp_acc_map32(&karg.acc_map, p32);
 		break;
 	case ATOMISP_IOC_ACC_S_MAPPED_ARG:
-		err = get_atomisp_acc_s_mapped_arg32(&karg.acc_map_arg, up);
+		err = get_atomisp_acc_s_mapped_arg32(&karg.acc_map_arg, p32);
 		break;
 	case ATOMISP_IOC_S_PARAMETERS:
-		err = get_atomisp_parameters32(&karg.param, up);
+		err = get_atomisp_parameters32(&karg.param, p32);
 		break;
 	case ATOMISP_IOC_ACC_LOAD_TO_PIPE:
 		err = get_atomisp_acc_fw_load_to_pipe32(&karg.acc_fw_to_pipe,
-							up);
+							p32);
 		break;
 	case ATOMISP_IOC_G_METADATA:
-		err = get_atomisp_metadata_stat32(&karg.md, up);
+		err = get_atomisp_metadata_stat32(&karg.md, p32);
 		break;
 	case ATOMISP_IOC_G_METADATA_BY_TYPE:
 		err = get_atomisp_metadata_by_type_stat32(&karg.md_with_type,
-			up);
+			p32);
 		break;
 	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_LUT:
-		err = get_atomisp_sensor_ae_bracketing_lut(&karg.lut, up);
+		err = get_atomisp_sensor_ae_bracketing_lut(&karg.lut, p32);
 		break;
 	}
 	if (err)
 		return err;
 
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	err = native_ioctl(file, cmd, (unsigned long)&karg);
-	set_fs(old_fs);
+	if (compatible_arg)
+		err = native_ioctl(file, cmd, (unsigned long)p32);
+	else
+		err = native_ioctl(file, cmd, (unsigned long)new_p64);
+
 	if (err)
 		return err;
 
 	switch (cmd) {
 	case ATOMISP_IOC_G_HISTOGRAM:
-		err = put_atomisp_histogram32(&karg.his, up);
+		err = put_atomisp_histogram32(&karg.his, p32);
 		break;
 	case ATOMISP_IOC_G_DIS_STAT:
-		err = put_atomisp_dis_statistics32(&karg.dis_s, up);
+		err = put_atomisp_dis_statistics32(&karg.dis_s, p32);
 		break;
 	case ATOMISP_IOC_G_3A_STAT:
-		err = put_atomisp_3a_statistics32(&karg.s3a_s, up);
+		err = put_atomisp_3a_statistics32(&karg.s3a_s, p32);
 		break;
 	case ATOMISP_IOC_G_ISP_GDC_TAB:
-		err = put_atomisp_morph_table32(&karg.mor_t, up);
+		err = put_atomisp_morph_table32(&karg.mor_t, p32);
 		break;
 	case ATOMISP_IOC_G_ISP_OVERLAY:
-		err = put_atomisp_overlay32(&karg.overlay, up);
+		err = put_atomisp_overlay32(&karg.overlay, p32);
 		break;
 	case ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP:
-		err = put_atomisp_calibration_group32(&karg.cal_grp, up);
+		err = put_atomisp_calibration_group32(&karg.cal_grp, p32);
 		break;
 	case ATOMISP_IOC_ACC_LOAD:
-		err = put_atomisp_acc_fw_load32(&karg.acc_fw_load, up);
+		err = put_atomisp_acc_fw_load32(&karg.acc_fw_load, p32);
 		break;
 	case ATOMISP_IOC_ACC_S_ARG:
 	case ATOMISP_IOC_ACC_DESTAB:
-		err = put_atomisp_acc_fw_arg32(&karg.acc_fw_arg, up);
+		err = put_atomisp_acc_fw_arg32(&karg.acc_fw_arg, p32);
 		break;
 	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
 	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
-		err = put_v4l2_private_int_data32(&karg.v4l2_pri_data, up);
+		err = put_v4l2_private_int_data32(&karg.v4l2_pri_data, p32);
 		break;
 	case ATOMISP_IOC_ACC_MAP:
 	case ATOMISP_IOC_ACC_UNMAP:
-		err = put_atomisp_acc_map32(&karg.acc_map, up);
+		err = put_atomisp_acc_map32(&karg.acc_map, p32);
 		break;
 	case ATOMISP_IOC_ACC_S_MAPPED_ARG:
-		err = put_atomisp_acc_s_mapped_arg32(&karg.acc_map_arg, up);
+		err = put_atomisp_acc_s_mapped_arg32(&karg.acc_map_arg, p32);
 		break;
 	case ATOMISP_IOC_ACC_LOAD_TO_PIPE:
 		err = put_atomisp_acc_fw_load_to_pipe32(&karg.acc_fw_to_pipe,
-							up);
+							p32);
 		break;
 	case ATOMISP_IOC_G_METADATA:
-		err = put_atomisp_metadata_stat32(&karg.md, up);
+		err = put_atomisp_metadata_stat32(&karg.md, p32);
 		break;
 	case ATOMISP_IOC_G_METADATA_BY_TYPE:
 		err = put_atomisp_metadata_by_type_stat32(&karg.md_with_type,
-			up);
+			p32);
 		break;
 	}
 
-- 
2.26.2

