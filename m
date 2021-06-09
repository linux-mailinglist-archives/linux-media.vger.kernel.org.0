Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0B33A1389
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 13:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239605AbhFIL5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 07:57:14 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41705 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239557AbhFIL5N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 07:57:13 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6922520000B;
        Wed,  9 Jun 2021 11:55:15 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 1/2] media: v4l2-subdev: Fix documentation of the subdev_notifier member
Date:   Wed,  9 Jun 2021 13:54:56 +0200
Message-Id: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the name of the function that registers the subdev_notifier member
of the v4l2_subdev structure.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 include/media/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d0e9a5bdb08b..f3b657dfe304 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -854,7 +854,7 @@ struct v4l2_subdev_platform_data {
  * @asd: Pointer to respective &struct v4l2_async_subdev.
  * @notifier: Pointer to the managing notifier.
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
- *		     device using v4l2_device_register_sensor_subdev().
+ *		     device using v4l2_async_register_subdev_sensor_common().
  * @pdata: common part of subdevice platform data
  *
  * Each instance of a subdev driver should create this struct, either
-- 
2.31.1

