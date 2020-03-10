Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F3A17FF10
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgCJNoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:44:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727212AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E5A524698;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=4+B04di+ImH/vlBfTaF8o7ROuooQlaTXMKeOjYPvbZ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PwxnEus2d9/cMGC/4JgEr/oWPLzoLtervaJbceu9L7sYfaOSbfa+x9OgTfblGt8eZ
         eou0oiv6FFgYrrDlb0F35iJAZrIJxrfOvwf4p8U6Xe1r8K4bR/hdcWOgOE1as1YBlN
         jVc9t306Er9RoSxfGoy2NrBIr2oNo+eh4ybXTcxE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005wG-DF; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 14/22] media: docs: split uAPI info from omap3isp.rst
Date:   Tue, 10 Mar 2020 14:43:05 +0100
Message-Id: <86b6cdeb47344b5833d5e4515ce4ec1b2e82d9c5.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file contains both driver develompent documentation and
userspace API.

Split on two, as they're usually read by different audiences.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/v4l-drivers/index.rst     |   1 +
 .../media/v4l-drivers/omap3isp-uapi.rst       | 208 ++++++++++++++++++
 Documentation/media/v4l-drivers/omap3isp.rst  | 196 +----------------
 3 files changed, 211 insertions(+), 194 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/omap3isp-uapi.rst

diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 6fdfd9a41913..364c65ea86fb 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -76,3 +76,4 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	cx2341x-uapi
 	meye-uapi
+	omap3isp-uapi
diff --git a/Documentation/media/v4l-drivers/omap3isp-uapi.rst b/Documentation/media/v4l-drivers/omap3isp-uapi.rst
new file mode 100644
index 000000000000..5f966a874a3c
--- /dev/null
+++ b/Documentation/media/v4l-drivers/omap3isp-uapi.rst
@@ -0,0 +1,208 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+OMAP 3 Image Signal Processor (ISP) driver
+==========================================
+
+Copyright |copy| 2010 Nokia Corporation
+
+Copyright |copy| 2009 Texas Instruments, Inc.
+
+Contacts: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
+Sakari Ailus <sakari.ailus@iki.fi>, David Cohen <dacohen@gmail.com>
+
+
+Events
+------
+
+The OMAP 3 ISP driver does support the V4L2 event interface on CCDC and
+statistics (AEWB, AF and histogram) subdevs.
+
+The CCDC subdev produces V4L2_EVENT_FRAME_SYNC type event on HS_VS
+interrupt which is used to signal frame start. Earlier version of this
+driver used V4L2_EVENT_OMAP3ISP_HS_VS for this purpose. The event is
+triggered exactly when the reception of the first line of the frame starts
+in the CCDC module. The event can be subscribed on the CCDC subdev.
+
+(When using parallel interface one must pay account to correct configuration
+of the VS signal polarity. This is automatically correct when using the serial
+receivers.)
+
+Each of the statistics subdevs is able to produce events. An event is
+generated whenever a statistics buffer can be dequeued by a user space
+application using the VIDIOC_OMAP3ISP_STAT_REQ IOCTL. The events available
+are:
+
+- V4L2_EVENT_OMAP3ISP_AEWB
+- V4L2_EVENT_OMAP3ISP_AF
+- V4L2_EVENT_OMAP3ISP_HIST
+
+The type of the event data is struct omap3isp_stat_event_status for these
+ioctls. If there is an error calculating the statistics, there will be an
+event as usual, but no related statistics buffer. In this case
+omap3isp_stat_event_status.buf_err is set to non-zero.
+
+
+Private IOCTLs
+--------------
+
+The OMAP 3 ISP driver supports standard V4L2 IOCTLs and controls where
+possible and practical. Much of the functions provided by the ISP, however,
+does not fall under the standard IOCTLs --- gamma tables and configuration of
+statistics collection are examples of such.
+
+In general, there is a private ioctl for configuring each of the blocks
+containing hardware-dependent functions.
+
+The following private IOCTLs are supported:
+
+- VIDIOC_OMAP3ISP_CCDC_CFG
+- VIDIOC_OMAP3ISP_PRV_CFG
+- VIDIOC_OMAP3ISP_AEWB_CFG
+- VIDIOC_OMAP3ISP_HIST_CFG
+- VIDIOC_OMAP3ISP_AF_CFG
+- VIDIOC_OMAP3ISP_STAT_REQ
+- VIDIOC_OMAP3ISP_STAT_EN
+
+The parameter structures used by these ioctls are described in
+include/linux/omap3isp.h. The detailed functions of the ISP itself related to
+a given ISP block is described in the Technical Reference Manuals (TRMs) ---
+see the end of the document for those.
+
+While it is possible to use the ISP driver without any use of these private
+IOCTLs it is not possible to obtain optimal image quality this way. The AEWB,
+AF and histogram modules cannot be used without configuring them using the
+appropriate private IOCTLs.
+
+
+CCDC and preview block IOCTLs
+-----------------------------
+
+The VIDIOC_OMAP3ISP_CCDC_CFG and VIDIOC_OMAP3ISP_PRV_CFG IOCTLs are used to
+configure, enable and disable functions in the CCDC and preview blocks,
+respectively. Both IOCTLs control several functions in the blocks they
+control. VIDIOC_OMAP3ISP_CCDC_CFG IOCTL accepts a pointer to struct
+omap3isp_ccdc_update_config as its argument. Similarly VIDIOC_OMAP3ISP_PRV_CFG
+accepts a pointer to struct omap3isp_prev_update_config. The definition of
+both structures is available in [#]_.
+
+The update field in the structures tells whether to update the configuration
+for the specific function and the flag tells whether to enable or disable the
+function.
+
+The update and flag bit masks accept the following values. Each separate
+functions in the CCDC and preview blocks is associated with a flag (either
+disable or enable; part of the flag field in the structure) and a pointer to
+configuration data for the function.
+
+Valid values for the update and flag fields are listed here for
+VIDIOC_OMAP3ISP_CCDC_CFG. Values may be or'ed to configure more than one
+function in the same IOCTL call.
+
+- OMAP3ISP_CCDC_ALAW
+- OMAP3ISP_CCDC_LPF
+- OMAP3ISP_CCDC_BLCLAMP
+- OMAP3ISP_CCDC_BCOMP
+- OMAP3ISP_CCDC_FPC
+- OMAP3ISP_CCDC_CULL
+- OMAP3ISP_CCDC_CONFIG_LSC
+- OMAP3ISP_CCDC_TBL_LSC
+
+The corresponding values for the VIDIOC_OMAP3ISP_PRV_CFG are here:
+
+- OMAP3ISP_PREV_LUMAENH
+- OMAP3ISP_PREV_INVALAW
+- OMAP3ISP_PREV_HRZ_MED
+- OMAP3ISP_PREV_CFA
+- OMAP3ISP_PREV_CHROMA_SUPP
+- OMAP3ISP_PREV_WB
+- OMAP3ISP_PREV_BLKADJ
+- OMAP3ISP_PREV_RGB2RGB
+- OMAP3ISP_PREV_COLOR_CONV
+- OMAP3ISP_PREV_YC_LIMIT
+- OMAP3ISP_PREV_DEFECT_COR
+- OMAP3ISP_PREV_GAMMABYPASS
+- OMAP3ISP_PREV_DRK_FRM_CAPTURE
+- OMAP3ISP_PREV_DRK_FRM_SUBTRACT
+- OMAP3ISP_PREV_LENS_SHADING
+- OMAP3ISP_PREV_NF
+- OMAP3ISP_PREV_GAMMA
+
+The associated configuration pointer for the function may not be NULL when
+enabling the function. When disabling a function the configuration pointer is
+ignored.
+
+
+Statistic blocks IOCTLs
+-----------------------
+
+The statistics subdevs do offer more dynamic configuration options than the
+other subdevs. They can be enabled, disable and reconfigured when the pipeline
+is in streaming state.
+
+The statistics blocks always get the input image data from the CCDC (as the
+histogram memory read isn't implemented). The statistics are dequeueable by
+the user from the statistics subdev nodes using private IOCTLs.
+
+The private IOCTLs offered by the AEWB, AF and histogram subdevs are heavily
+reflected by the register level interface offered by the ISP hardware. There
+are aspects that are purely related to the driver implementation and these are
+discussed next.
+
+VIDIOC_OMAP3ISP_STAT_EN
+-----------------------
+
+This private IOCTL enables/disables a statistic module. If this request is
+done before streaming, it will take effect as soon as the pipeline starts to
+stream.  If the pipeline is already streaming, it will take effect as soon as
+the CCDC becomes idle.
+
+VIDIOC_OMAP3ISP_AEWB_CFG, VIDIOC_OMAP3ISP_HIST_CFG and VIDIOC_OMAP3ISP_AF_CFG
+-----------------------------------------------------------------------------
+
+Those IOCTLs are used to configure the modules. They require user applications
+to have an in-depth knowledge of the hardware. Most of the fields explanation
+can be found on OMAP's TRMs. The two following fields common to all the above
+configure private IOCTLs require explanation for better understanding as they
+are not part of the TRM.
+
+omap3isp_[h3a_af/h3a_aewb/hist]\_config.buf_size:
+
+The modules handle their buffers internally. The necessary buffer size for the
+module's data output depends on the requested configuration. Although the
+driver supports reconfiguration while streaming, it does not support a
+reconfiguration which requires bigger buffer size than what is already
+internally allocated if the module is enabled. It will return -EBUSY on this
+case. In order to avoid such condition, either disable/reconfigure/enable the
+module or request the necessary buffer size during the first configuration
+while the module is disabled.
+
+The internal buffer size allocation considers the requested configuration's
+minimum buffer size and the value set on buf_size field. If buf_size field is
+out of [minimum, maximum] buffer size range, it's clamped to fit in there.
+The driver then selects the biggest value. The corrected buf_size value is
+written back to user application.
+
+omap3isp_[h3a_af/h3a_aewb/hist]\_config.config_counter:
+
+As the configuration doesn't take effect synchronously to the request, the
+driver must provide a way to track this information to provide more accurate
+data. After a configuration is requested, the config_counter returned to user
+space application will be an unique value associated to that request. When
+user application receives an event for buffer availability or when a new
+buffer is requested, this config_counter is used to match a buffer data and a
+configuration.
+
+VIDIOC_OMAP3ISP_STAT_REQ
+------------------------
+
+Send to user space the oldest data available in the internal buffer queue and
+discards such buffer afterwards. The field omap3isp_stat_data.frame_number
+matches with the video buffer's field_count.
+
+
+References
+----------
+
+.. [#] include/linux/omap3isp.h
diff --git a/Documentation/media/v4l-drivers/omap3isp.rst b/Documentation/media/v4l-drivers/omap3isp.rst
index 8974c444e3a1..bc447bbec7ce 100644
--- a/Documentation/media/v4l-drivers/omap3isp.rst
+++ b/Documentation/media/v4l-drivers/omap3isp.rst
@@ -49,7 +49,7 @@ interface to userspace.
 - OMAP3 ISP histogram
 
 Each possible link in the ISP is modelled by a link in the Media controller
-interface. For an example program see [#f2]_.
+interface. For an example program see [#]_.
 
 
 Controlling the OMAP 3 ISP
@@ -68,196 +68,6 @@ Autoidle does have issues with some ISP blocks on the 3430, at least.
 Autoidle is only enabled on 3630 when the omap3isp module parameter autoidle
 is non-zero.
 
-
-Events
-------
-
-The OMAP 3 ISP driver does support the V4L2 event interface on CCDC and
-statistics (AEWB, AF and histogram) subdevs.
-
-The CCDC subdev produces V4L2_EVENT_FRAME_SYNC type event on HS_VS
-interrupt which is used to signal frame start. Earlier version of this
-driver used V4L2_EVENT_OMAP3ISP_HS_VS for this purpose. The event is
-triggered exactly when the reception of the first line of the frame starts
-in the CCDC module. The event can be subscribed on the CCDC subdev.
-
-(When using parallel interface one must pay account to correct configuration
-of the VS signal polarity. This is automatically correct when using the serial
-receivers.)
-
-Each of the statistics subdevs is able to produce events. An event is
-generated whenever a statistics buffer can be dequeued by a user space
-application using the VIDIOC_OMAP3ISP_STAT_REQ IOCTL. The events available
-are:
-
-- V4L2_EVENT_OMAP3ISP_AEWB
-- V4L2_EVENT_OMAP3ISP_AF
-- V4L2_EVENT_OMAP3ISP_HIST
-
-The type of the event data is struct omap3isp_stat_event_status for these
-ioctls. If there is an error calculating the statistics, there will be an
-event as usual, but no related statistics buffer. In this case
-omap3isp_stat_event_status.buf_err is set to non-zero.
-
-
-Private IOCTLs
---------------
-
-The OMAP 3 ISP driver supports standard V4L2 IOCTLs and controls where
-possible and practical. Much of the functions provided by the ISP, however,
-does not fall under the standard IOCTLs --- gamma tables and configuration of
-statistics collection are examples of such.
-
-In general, there is a private ioctl for configuring each of the blocks
-containing hardware-dependent functions.
-
-The following private IOCTLs are supported:
-
-- VIDIOC_OMAP3ISP_CCDC_CFG
-- VIDIOC_OMAP3ISP_PRV_CFG
-- VIDIOC_OMAP3ISP_AEWB_CFG
-- VIDIOC_OMAP3ISP_HIST_CFG
-- VIDIOC_OMAP3ISP_AF_CFG
-- VIDIOC_OMAP3ISP_STAT_REQ
-- VIDIOC_OMAP3ISP_STAT_EN
-
-The parameter structures used by these ioctls are described in
-include/linux/omap3isp.h. The detailed functions of the ISP itself related to
-a given ISP block is described in the Technical Reference Manuals (TRMs) ---
-see the end of the document for those.
-
-While it is possible to use the ISP driver without any use of these private
-IOCTLs it is not possible to obtain optimal image quality this way. The AEWB,
-AF and histogram modules cannot be used without configuring them using the
-appropriate private IOCTLs.
-
-
-CCDC and preview block IOCTLs
------------------------------
-
-The VIDIOC_OMAP3ISP_CCDC_CFG and VIDIOC_OMAP3ISP_PRV_CFG IOCTLs are used to
-configure, enable and disable functions in the CCDC and preview blocks,
-respectively. Both IOCTLs control several functions in the blocks they
-control. VIDIOC_OMAP3ISP_CCDC_CFG IOCTL accepts a pointer to struct
-omap3isp_ccdc_update_config as its argument. Similarly VIDIOC_OMAP3ISP_PRV_CFG
-accepts a pointer to struct omap3isp_prev_update_config. The definition of
-both structures is available in [#f1]_.
-
-The update field in the structures tells whether to update the configuration
-for the specific function and the flag tells whether to enable or disable the
-function.
-
-The update and flag bit masks accept the following values. Each separate
-functions in the CCDC and preview blocks is associated with a flag (either
-disable or enable; part of the flag field in the structure) and a pointer to
-configuration data for the function.
-
-Valid values for the update and flag fields are listed here for
-VIDIOC_OMAP3ISP_CCDC_CFG. Values may be or'ed to configure more than one
-function in the same IOCTL call.
-
-- OMAP3ISP_CCDC_ALAW
-- OMAP3ISP_CCDC_LPF
-- OMAP3ISP_CCDC_BLCLAMP
-- OMAP3ISP_CCDC_BCOMP
-- OMAP3ISP_CCDC_FPC
-- OMAP3ISP_CCDC_CULL
-- OMAP3ISP_CCDC_CONFIG_LSC
-- OMAP3ISP_CCDC_TBL_LSC
-
-The corresponding values for the VIDIOC_OMAP3ISP_PRV_CFG are here:
-
-- OMAP3ISP_PREV_LUMAENH
-- OMAP3ISP_PREV_INVALAW
-- OMAP3ISP_PREV_HRZ_MED
-- OMAP3ISP_PREV_CFA
-- OMAP3ISP_PREV_CHROMA_SUPP
-- OMAP3ISP_PREV_WB
-- OMAP3ISP_PREV_BLKADJ
-- OMAP3ISP_PREV_RGB2RGB
-- OMAP3ISP_PREV_COLOR_CONV
-- OMAP3ISP_PREV_YC_LIMIT
-- OMAP3ISP_PREV_DEFECT_COR
-- OMAP3ISP_PREV_GAMMABYPASS
-- OMAP3ISP_PREV_DRK_FRM_CAPTURE
-- OMAP3ISP_PREV_DRK_FRM_SUBTRACT
-- OMAP3ISP_PREV_LENS_SHADING
-- OMAP3ISP_PREV_NF
-- OMAP3ISP_PREV_GAMMA
-
-The associated configuration pointer for the function may not be NULL when
-enabling the function. When disabling a function the configuration pointer is
-ignored.
-
-
-Statistic blocks IOCTLs
------------------------
-
-The statistics subdevs do offer more dynamic configuration options than the
-other subdevs. They can be enabled, disable and reconfigured when the pipeline
-is in streaming state.
-
-The statistics blocks always get the input image data from the CCDC (as the
-histogram memory read isn't implemented). The statistics are dequeueable by
-the user from the statistics subdev nodes using private IOCTLs.
-
-The private IOCTLs offered by the AEWB, AF and histogram subdevs are heavily
-reflected by the register level interface offered by the ISP hardware. There
-are aspects that are purely related to the driver implementation and these are
-discussed next.
-
-VIDIOC_OMAP3ISP_STAT_EN
------------------------
-
-This private IOCTL enables/disables a statistic module. If this request is
-done before streaming, it will take effect as soon as the pipeline starts to
-stream.  If the pipeline is already streaming, it will take effect as soon as
-the CCDC becomes idle.
-
-VIDIOC_OMAP3ISP_AEWB_CFG, VIDIOC_OMAP3ISP_HIST_CFG and VIDIOC_OMAP3ISP_AF_CFG
------------------------------------------------------------------------------
-
-Those IOCTLs are used to configure the modules. They require user applications
-to have an in-depth knowledge of the hardware. Most of the fields explanation
-can be found on OMAP's TRMs. The two following fields common to all the above
-configure private IOCTLs require explanation for better understanding as they
-are not part of the TRM.
-
-omap3isp_[h3a_af/h3a_aewb/hist]\_config.buf_size:
-
-The modules handle their buffers internally. The necessary buffer size for the
-module's data output depends on the requested configuration. Although the
-driver supports reconfiguration while streaming, it does not support a
-reconfiguration which requires bigger buffer size than what is already
-internally allocated if the module is enabled. It will return -EBUSY on this
-case. In order to avoid such condition, either disable/reconfigure/enable the
-module or request the necessary buffer size during the first configuration
-while the module is disabled.
-
-The internal buffer size allocation considers the requested configuration's
-minimum buffer size and the value set on buf_size field. If buf_size field is
-out of [minimum, maximum] buffer size range, it's clamped to fit in there.
-The driver then selects the biggest value. The corrected buf_size value is
-written back to user application.
-
-omap3isp_[h3a_af/h3a_aewb/hist]\_config.config_counter:
-
-As the configuration doesn't take effect synchronously to the request, the
-driver must provide a way to track this information to provide more accurate
-data. After a configuration is requested, the config_counter returned to user
-space application will be an unique value associated to that request. When
-user application receives an event for buffer availability or when a new
-buffer is requested, this config_counter is used to match a buffer data and a
-configuration.
-
-VIDIOC_OMAP3ISP_STAT_REQ
-------------------------
-
-Send to user space the oldest data available in the internal buffer queue and
-discards such buffer afterwards. The field omap3isp_stat_data.frame_number
-matches with the video buffer's field_count.
-
-
 Technical reference manuals (TRMs) and other documentation
 ----------------------------------------------------------
 
@@ -279,6 +89,4 @@ DM 3730 TRM:
 References
 ----------
 
-.. [#f1] include/linux/omap3isp.h
-
-.. [#f2] http://git.ideasonboard.org/?p=media-ctl.git;a=summary
+.. [#] http://git.ideasonboard.org/?p=media-ctl.git;a=summary
-- 
2.24.1

