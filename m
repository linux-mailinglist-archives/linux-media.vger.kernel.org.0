Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED94BA33DE
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbfH3J0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:26:31 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41709 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728243AbfH3J0a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:26:30 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3dAmiY5dCDqPe3dAqiRKhF; Fri, 30 Aug 2019 11:26:28 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] cedrus: fill in bus_info for media device
Date:   Fri, 30 Aug 2019 11:26:22 +0200
Message-Id: <20190830092624.18228-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190830092624.18228-1-hverkuil-cisco@xs4all.nl>
References: <20190830092624.18228-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK4OYPJHY1sqD+Z5IOqh8Hgm5+CKyndrROiHCcdYchq5IV/z5BDqSnkF0daf4bAryKGWA9WmfYlsySO2954QZx6MQB0eTcrM2kpakwTHsQ3znV8sUPZP
 f6gr3yyOaUvtFwSFa7apNsFwAR26MLFkbppI90pORwenznfkJhEkaDGO7VGExh91GSpSUfBEBWo1HzJ7ijyrpwQ6hnqViZbQ3iZhzUl83hT5mXj2QYjnWpvw
 tM///bPlHtAcl2arJiburo+RkmKNdNqTdkUOW3Wh0R6L1yzON9R7P4j8UJyA5ECfhb6+nMPQTZeI3REsTTDlt8Dfmk398w41BqvSEpRXOtI5bHZPk1we9/Q3
 XlPZ0aRN
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this compliance warning:

$ v4l2-compliance -m0
v4l2-compliance SHA: b514d615166bdc0901a4c71261b87db31e89f464, 32 bits

Compliance test for cedrus device /dev/media0:

Media Driver Info:
        Driver name      : cedrus
        Model            : cedrus
        Serial           :
        Bus info         :
        Media version    : 5.3.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 5.3.0

Required ioctls:
                warn: v4l2-test-media.cpp(51): empty bus_info
        test MEDIA_IOC_DEVICE_INFO: OK

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 2d3ea8b74dfd..3439f6ad6338 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -357,6 +357,8 @@ static int cedrus_probe(struct platform_device *pdev)
 
 	dev->mdev.dev = &pdev->dev;
 	strscpy(dev->mdev.model, CEDRUS_NAME, sizeof(dev->mdev.model));
+	strscpy(dev->mdev.bus_info, "platform:" CEDRUS_NAME,
+		sizeof(dev->mdev.bus_info));
 
 	media_device_init(&dev->mdev);
 	dev->mdev.ops = &cedrus_m2m_media_ops;
-- 
2.23.0.rc1

