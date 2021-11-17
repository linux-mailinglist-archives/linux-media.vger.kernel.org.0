Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB82D454DF2
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240525AbhKQThQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:45430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240503AbhKQThJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4CDF61BD2;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177650;
        bh=S3WVcmtBPBU9kXUxx3OideMH8fikR1cVR6X+GVaMJeo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X2H9PvCABmdofKzZOtvAoSsK6ioPwRCafgriFXPyVIb3YA7Y+eroGPNyOWXsPavuj
         xdMWrQZRH3q/8p+02p17svKS9/dLLfbWmKAK2dZxAo+LfRO4Mc/CgF/cy7C/y33az3
         kV0Zbt5l8GKYeOyaW3d5nw4rpbk8POh4r2vGa70iagOiGdHXv2q+o/+X9EIC6b4Bfb
         MC2JtZnJBucEOW40MKJyGXBB6dXluYlVW+zk7JxX24/BYeBU/5R7UPsx/jYkIAANfL
         zOSiGPszzQro4PecOO6FKt/FvvSpJlwj405qLfmAxsonE0rMPb2cFrSzGKXL5RZZuh
         m7Q2Pinqrx5RQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHc-1G; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/8] media: atomisp: atomisp_cmd: make it more compatible with firmware
Date:   Wed, 17 Nov 2021 19:33:59 +0000
Message-Id: <e3a003eee02e7a49bd4b5f821f770ca811b55b17.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change some recovery logic at the driver, in order to make it
more compatible with ISP2401 Intel Aero firmware.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7181b901cde4..86dad9fe61bf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1046,13 +1046,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 			asd->pending_capture_request--;
 
-			if (IS_ISP2401)
-				asd->re_trigger_capture = false;
-
 			dev_dbg(isp->dev, "Trigger capture again for new buffer. err=%d\n",
 				err);
-		} else if (IS_ISP2401) {
-			asd->re_trigger_capture = true;
 		}
 		break;
 	case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
@@ -1474,7 +1469,7 @@ void atomisp_wdt_work(struct work_struct *work)
 				     wdt_work);
 	int i;
 	unsigned int pipe_wdt_cnt[MAX_STREAM_NUM][4] = { {0} };
-	bool css_recover = false;
+	bool css_recover = true;
 
 	rt_mutex_lock(&isp->mutex);
 	if (!atomisp_streaming_count(isp)) {
@@ -1487,12 +1482,7 @@ void atomisp_wdt_work(struct work_struct *work)
 		dev_err(isp->dev, "timeout %d of %d\n",
 			atomic_read(&isp->wdt_count) + 1,
 			ATOMISP_ISP_MAX_TIMEOUT_COUNT);
-
-		if (atomic_inc_return(&isp->wdt_count) < ATOMISP_ISP_MAX_TIMEOUT_COUNT)
-			css_recover = true;
 	} else {
-		css_recover = true;
-
 		for (i = 0; i < isp->num_of_streams; i++) {
 			struct atomisp_sub_device *asd = &isp->asd[i];
 
@@ -6003,7 +5993,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		 * which appears to be related by a hardware
 		 * performance limitation.  It's unclear why this
 		 * particular code triggers the issue. */
-		if (!IS_ISP2401 || crop_needs_override) {
+		if (crop_needs_override) {
 			if (isp_sink_crop.width * main_compose.height >
 			    isp_sink_crop.height * main_compose.width) {
 				sink_crop.height = isp_sink_crop.height;
-- 
2.33.1

