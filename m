Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE93F2BE2
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 11:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387817AbfKGKK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 05:10:58 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36809 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387786AbfKGKK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 05:10:58 -0500
Received: by mail-pf1-f194.google.com with SMTP id v19so2360660pfm.3
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umQYThIuCS7c9882fJTWJaLRcdLby63dTiBGU/XLOo4=;
        b=FvfP3DHO59Af1GlUM7aPeBB7H7WxgIS5YP1WOSD3ZobUgr1QxUERE7HZKul/eJkFCq
         AYC4xme6fkjU8lCSc2cLPn+hHoLUzOtjllxy+9r5XOR2yG/h5cvTsBV2D2MvzZeyHvNY
         aaiCP4p0EnCdKS20kHjpzHftOYu/zT5JD+9Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umQYThIuCS7c9882fJTWJaLRcdLby63dTiBGU/XLOo4=;
        b=mbZlStFHpbyN+J4PWqr7kzk7HilHx9mgUIaUWyZnIBYnv98WjXN7YfISDY06d8JFgO
         7vLcRJmiBh4mN/XlOYmOd5EmIBgij+kkUjuwSE4Ahq0DRGjQgc5t/b/U6kS6K7z0bwPJ
         ILZd4NvL0O3t25eALW1QYeX67JG7vGLsMHcQbRyi49RrJ8p/A6KAlc+P3ER/61LJmt5Q
         SDwVdicqYz/ja0lNBgHT044kz/oN/gWe2dIpX7+13D+AAzBLrVmyAWLaiIznAQ5mCfUG
         nvV2iX6DmU6i5P1CqjVCkGBrpBnzynz0IYQdFdTgM4THbmaLsq7b2y6fmnUjFKjBEFeU
         5O5A==
X-Gm-Message-State: APjAAAXOWSQuHVO6IsyafkC7steqUSBhnaqDG8+2x5m0KJLsYeuuvJ1P
        u9ZnJu6DQl7VFXaN76RFOD9NVQ==
X-Google-Smtp-Source: APXvYqzB390EEhabtZNegLu+AcF5HDph81Kp+QvNUBavqnqvJD61yaAO317SbJiRCO/+mp9kk980OQ==
X-Received: by 2002:a65:5a06:: with SMTP id y6mr3518613pgs.9.1573121457287;
        Thu, 07 Nov 2019 02:10:57 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.googlemail.com with ESMTPSA id s11sm1465590pjp.26.2019.11.07.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 02:10:56 -0800 (PST)
From:   Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Pawel Osciak <posciak@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        sumitg <sumitg@nvidia.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: v4l2-ctrl: Lock main_hdl on operations of requests_queued.
Date:   Thu,  7 Nov 2019 18:10:14 +0800
Message-Id: <20191107101016.137186-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a race condition between the list_del_init in the
v4l2_ctrl_request_complete, and the list_add_tail in the
v4l2_ctrl_request_queue, since they can be called in different thread
and the requests_queued list is not protected by a lock. This can lead
to that the v4l2_ctrl_handler is still in the requests_queued list while
the request_is_queued is already set to false, which would cause
use-after-free if the v4l2_ctrl_handler is later released.

Fix this by locking the ->lock of main_hdl (which is the owner of the
requests_queued list) when doing list operations on the
->requests_queued list.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b4caf2d4d076..22e6c82d58b9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -3301,6 +3301,7 @@ static void v4l2_ctrl_request_queue(struct media_request_object *obj)
 	struct v4l2_ctrl_handler *prev_hdl = NULL;
 	struct v4l2_ctrl_ref *ref_ctrl, *ref_ctrl_prev = NULL;
 
+	mutex_lock(main_hdl->lock);
 	if (list_empty(&main_hdl->requests_queued))
 		goto queue;
 
@@ -3332,18 +3333,22 @@ static void v4l2_ctrl_request_queue(struct media_request_object *obj)
 queue:
 	list_add_tail(&hdl->requests_queued, &main_hdl->requests_queued);
 	hdl->request_is_queued = true;
+	mutex_unlock(main_hdl->lock);
 }
 
 static void v4l2_ctrl_request_unbind(struct media_request_object *obj)
 {
 	struct v4l2_ctrl_handler *hdl =
 		container_of(obj, struct v4l2_ctrl_handler, req_obj);
+	struct v4l2_ctrl_handler *main_hdl = obj->priv;
 
 	list_del_init(&hdl->requests);
+	mutex_lock(main_hdl->lock);
 	if (hdl->request_is_queued) {
 		list_del_init(&hdl->requests_queued);
 		hdl->request_is_queued = false;
 	}
+	mutex_unlock(main_hdl->lock);
 }
 
 static void v4l2_ctrl_request_release(struct media_request_object *obj)
@@ -4297,9 +4302,11 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 		v4l2_ctrl_unlock(ctrl);
 	}
 
+	mutex_lock(main_hdl->lock);
 	WARN_ON(!hdl->request_is_queued);
 	list_del_init(&hdl->requests_queued);
 	hdl->request_is_queued = false;
+	mutex_unlock(main_hdl->lock);
 	media_request_object_complete(obj);
 	media_request_object_put(obj);
 }

base-commit: dcd34bd234181ec74f081c7d0025204afe6b213e
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

