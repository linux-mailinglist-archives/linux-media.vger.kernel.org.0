Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75B4D6B8C9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 11:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfGQJDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 05:03:51 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:53663 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbfGQJDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 05:03:51 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id nfqjhuob40SBqnfqnhZQVd; Wed, 17 Jul 2019 11:03:49 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/4] via-camera: call viafb_pm_unregister in remove()
Date:   Wed, 17 Jul 2019 11:03:42 +0200
Message-Id: <20190717090345.26521-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
References: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKYHYsr0K2oSeFvQJX37sysaUM/sAdPejtCXJIgQooqWWkvHcfaDowwz23KkX1mbF1eoj04dCgvOUsUEfhQ8yTYROPoZLpHbElzAyfagUA/HZUDxsGid
 8ucihqE/6eX+ImOLHq/5mAK1jSJxctCBYTDLbwSB3UC8szwpvLHGjk16KhID2XRyAVcd+0f/NDRJVKxjFqsgYDtSEXtwoZaG/YYMPqRiwhuiSPDd1M1o/Igx
 pAuD1G+W5lr5tMA04tJj0A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The power management hooks were never unregistered, which caused a
crash when unloading the module.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/via-camera.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index 24d5759501a5..f9016c2ee70d 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -1464,6 +1464,9 @@ static int viacam_remove(struct platform_device *pdev)
 
 	video_unregister_device(&cam->vdev);
 	v4l2_device_unregister(&cam->v4l2_dev);
+#ifdef CONFIG_PM
+	viafb_pm_unregister(&viacam_pm_hooks);
+#endif
 	free_irq(viadev->pdev->irq, cam);
 	via_sensor_power_release(cam);
 	v4l2_ctrl_handler_free(&cam->ctrl_handler);
-- 
2.20.1

