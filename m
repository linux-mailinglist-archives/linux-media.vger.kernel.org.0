Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194945263AB
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348766AbiEMOQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344968AbiEMOQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:04 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3581BDF24
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451363; x=1683987363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Hyaq+VTuEjWeYt9y5dL2297IzwoaY/auT8vLz7qZ7s=;
  b=SMOxilfWivj9XnX93dlWXmV2NjjXicmKNxgByCkm4gEh3baVoPyoOcCq
   j4o4GpATvzIv4hM3vsxNT6dMQVbzBIsX56e/izlnz9yRt+ePNJY+sv/qm
   YmEqWVXhd7dkw1oawDdCmaHbxKN8TnLUW2f7kfgbcmAKiX6HGSFP9F8h8
   7YG8slTv25QpXucZNeyTtEpoMtQxKR8TMJt5wxdd0zTRsu46nZWPCqpi1
   3RYCZjQf4lHpBZwKKEHW9aj3AX3HqoKLZgkLf7SNtDc57Y7SEkEGZ6nEs
   s4GEFYflcLKujtvvkFd0dFKJMkDLzv+ZqEzwzHMd9x5bI658ue28/bcDi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="333348136"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="333348136"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="624879303"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 8F8F521534;
        Fri, 13 May 2022 17:15:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW57-0001gH-Ow; Fri, 13 May 2022 17:15:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 12/28] media: ov5640: Re-sort per-mode register tables
Date:   Fri, 13 May 2022 17:15:32 +0300
Message-Id: <20220513141548.6344-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

The per-mode register tables are not sorted by size. Fix it.

Cosmetic change only.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 936ee62eb2ab7..a7421274c3303 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -484,7 +484,7 @@ static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
 	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
 };
 
-static const struct reg_value ov5640_setting_VGA_640_480[] = {
+static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x31, 0, 0},
@@ -495,11 +495,10 @@ static const struct reg_value ov5640_setting_VGA_640_480[] = {
 	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
 	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
 	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
+	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
-static const struct reg_value ov5640_setting_XGA_1024_768[] = {
+static const struct reg_value ov5640_setting_QCIF_176_144[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x31, 0, 0},
@@ -529,7 +528,7 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
 	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
-static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
+static const struct reg_value ov5640_setting_VGA_640_480[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x31, 0, 0},
@@ -540,10 +539,11 @@ static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
 	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
 	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
 	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
+	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
+	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
-static const struct reg_value ov5640_setting_QCIF_176_144[] = {
+static const struct reg_value ov5640_setting_NTSC_720_480[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x31, 0, 0},
@@ -558,7 +558,7 @@ static const struct reg_value ov5640_setting_QCIF_176_144[] = {
 	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
-static const struct reg_value ov5640_setting_NTSC_720_480[] = {
+static const struct reg_value ov5640_setting_PAL_720_576[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x31, 0, 0},
@@ -573,7 +573,7 @@ static const struct reg_value ov5640_setting_NTSC_720_480[] = {
 	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
-static const struct reg_value ov5640_setting_PAL_720_576[] = {
+static const struct reg_value ov5640_setting_XGA_1024_768[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x31, 0, 0},
-- 
2.30.2

