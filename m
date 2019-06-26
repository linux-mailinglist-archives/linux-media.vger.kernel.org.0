Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FA25638A
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfFZHo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:27 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39193 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727001AbfFZHo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:27 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bRhhHnd; Wed, 26 Jun 2019 09:44:25 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 02/16] coda: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:07 +0200
Message-Id: <20190626074421.38739-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIj3dZgglss+tf4PXeuCKB+HXvyTYrUKj32m1X7tI6K/ziBELb3FaqsxZxhj9nnBA9jyIwHOfHA95IwCaWb+b4cHtz/EakH0fDudTLunc/74bVfrF/mB
 BTuJt9wQXQHQXTZNN23aWb00JECxh0szhOG996HlnrE/fYccKE4w10VtUgeFDCsOP5+6jnF3xJHUZDxBT/DXUva/xIqIeDXMSiw/2gz8MQYocN9DM2ulOX9C
 boJC1w9jW1mpT/VUImppVw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 01428de2596e..73222c0615c0 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -390,9 +390,6 @@ static int coda_querycap(struct file *file, void *priv,
 	strscpy(cap->card, coda_product_name(ctx->dev->devtype->product),
 		sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:" CODA_NAME, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -2699,6 +2696,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	vfd->lock	= &dev->dev_mutex;
 	vfd->v4l2_dev	= &dev->v4l2_dev;
 	vfd->vfl_dir	= VFL_DIR_M2M;
+	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
 	video_set_drvdata(vfd, dev);
 
 	/* Not applicable, use the selection API instead */
-- 
2.20.1

