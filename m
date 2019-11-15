Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F91FD2FF
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 03:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfKOCbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 21:31:52 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42405 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfKOCbw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 21:31:52 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so3599615plt.9;
        Thu, 14 Nov 2019 18:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6woE9Nax3taBQLO1Xq0hMJ7t3v77ZgaLEpNXtLBqYw=;
        b=cofN0QFdBQBBZWBqAPL412SkfosAs2T/j5MlC1NZhQzLYZAtGY9qZbMfv8MLf82obh
         LRJwCuHNn257xPQ5RQB9uUsATL4ZTdt8IrDYhMR+L/I/ITBarNbQ8zVSbX5/W5vslT9A
         i0xNn13K4Fbxtw3E56WGx8PpABojvQKBxziNhraKhL3P9HOMOPa1v6kaxmkDBm+ffsUv
         MFapumUuBTESODXze8NVdNohz1ejFxjNwAcCPl4YRwkOkfQEE5sxt452JRpVCkKTNPgD
         R67M+cUvo0GQU+IeXVRMsYQtKjwaCsXWtPACBRYRfnMde6kJ2WVmTMwxtuT6A4QUPpAC
         83Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6woE9Nax3taBQLO1Xq0hMJ7t3v77ZgaLEpNXtLBqYw=;
        b=XYHql//KS2ixqzKK9htN0maaw4PhWVlF+r+vA63vL3yKawkcs5EUfZl2djI7XA0xkY
         2gNp3t3nmRmpPZ2qjYdC/OPptOXZ3Aj66b8CLaNUMo5VmoZ62brosWlxO2GVLDt02APE
         Hkdrepk2em7gq+ujHzhLY66IqBg59MC6CFl5pmzIeDzSRIqv3xq3QXgYQncuYJbtjh3o
         H4TH/V5fKLDr1fDa+q23Ubrz3U5DQe7ewId5mFjDkkEj+psWtFZ90LJHUvU50vClfi+N
         Ei7hx32HDaYuP4auFzxmi9ifzm8yn6e6gW6bUkOrqCxeV/Q+sX/i2H00eLWJlHmmM8Fa
         6Bjw==
X-Gm-Message-State: APjAAAXH8V4MZRTc4spxXwUGo/s11zGvOdBnuTBkU9/BW7m7nS6tZ6Mb
        zaWbGO5HiRJ9qs/tC0+Snslme3B9m2w=
X-Google-Smtp-Source: APXvYqzAUhIBw+VcQnG1lY6CysbVw9ZlCNeOQjQh+LQA3QxviXODi/AYf0p2v6NWz+/SnyQKQTdaXg==
X-Received: by 2002:a17:902:b614:: with SMTP id b20mr12718401pls.305.1573785111544;
        Thu, 14 Nov 2019 18:31:51 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id u20sm9464351pgo.50.2019.11.14.18.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 18:31:50 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: pxa_camera: add missed tasklet_kill
Date:   Fri, 15 Nov 2019 10:31:43 +0800
Message-Id: <20191115023143.7128-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver forgets to kill tasklet when probe fails and remove.
Add the calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/pxa_camera.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 8d47ea0c33f8..43ae645d866b 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2530,6 +2530,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 exit_deactivate:
 	pxa_camera_deactivate(pcdev);
+	tasklet_kill(&pcdev->task_eof);
 exit_free_dma:
 	dma_release_channel(pcdev->dma_chans[2]);
 exit_free_dma_u:
@@ -2544,6 +2545,7 @@ static int pxa_camera_remove(struct platform_device *pdev)
 	struct pxa_camera_dev *pcdev = dev_get_drvdata(&pdev->dev);
 
 	pxa_camera_deactivate(pcdev);
+	tasklet_kill(&pcdev->task_eof);
 	dma_release_channel(pcdev->dma_chans[0]);
 	dma_release_channel(pcdev->dma_chans[1]);
 	dma_release_channel(pcdev->dma_chans[2]);
-- 
2.24.0

