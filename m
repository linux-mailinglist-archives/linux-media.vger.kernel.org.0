Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11AE5E7767
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 18:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731733AbfJ1RNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 13:13:13 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39218 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbfJ1RNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 13:13:12 -0400
Received: by mail-qk1-f196.google.com with SMTP id 15so9175249qkh.6
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kuoh5cLFtHU/IAq9ZTPgzJAaFeZXMyuR2zZhvSzgGKo=;
        b=UpbxKn88FlpTiZAFA5zrNtmxXHE/G0X+Z8ikcBwkRq2LR+YOvEMmRM+92cbXwBmrjO
         +rm72lx6NXoJX5CDP6T5a081nD5aLfOherIPl3dpImBP2giGhurikKrlhdfj721iKGcC
         LzuzP7MneIerypx99r+5o1AWhDz1lrz5iewUkD4RR8iLZpnBeheu3rqS4+MsW8YmxKB8
         WlizoKPas8QIiOseqpk2W3ag7rMN7RaM179wxvivr1LeE4Zl3TuT1eOByje3/fdKM7rG
         Se/9IhPh2mRXppiMirG9eZwJJUxiSBTmYl7wXEUwuGjY/Ea3YrT1QbefJlmA/HylE8Ek
         aatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kuoh5cLFtHU/IAq9ZTPgzJAaFeZXMyuR2zZhvSzgGKo=;
        b=pyIRQe8qjVP5fJ961IWmMsF6U0OR2kmK6WkITRY3WJ1cXkEwghFEUYKyKEnK6FYwVI
         0qQ4BMkgQdH8wehcF3ZEGuHJDV9YT7HB3BJvtJn5xixya/5ZCdFzv7YxK3A7mNFQ8gfH
         FfNMX5hGSWA+iCma2GgBweMEDdYX7xWDhp3r9/XToXXUQD3wCDISknJei944udAMrrYt
         PY9qMVUrXTR2ACqQkYDflvJdOp0VGitHxLb7E6lds5Z/uC2h0EuQEfOYtDmr4VGldAYI
         zu0JOPAeatj2V7/FbTTLcYUjRZhoe/ChmGdTWGjvLnWqdmgvP0TlYICpuK9z4ZKfc6CG
         0/GA==
X-Gm-Message-State: APjAAAVpOazOHo6kvgy3Cs0HWeuTk6y0BCogPZgASNgjy2Hr4SKYJ9pZ
        QejXevkR69bEn7JTTdo2+Sg=
X-Google-Smtp-Source: APXvYqy9MqQ2lWhsnmPHn4ZjnxY6j931HSEKxCGG1nQ1jnA9OItg7tjb78On3q/UWptFJ/Sc0aUwRw==
X-Received: by 2002:a37:7943:: with SMTP id u64mr13738960qkc.295.1572282791669;
        Mon, 28 Oct 2019 10:13:11 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 44sm7681421qtt.13.2019.10.28.10.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 10:13:10 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        slongerbeam@gmail.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: staging/imx: Use a shorter name for driver
Date:   Mon, 28 Oct 2019 14:13:13 -0300
Message-Id: <20191028171313.26081-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently v4l2-compliance tool returns the following output:

Compliance test for imx-media-captu device /dev/video0:

Driver Info:
        Driver name      : imx-media-captu
        Card type        : imx-media-capture
...

The driver name string is limited to 16 characters, so provide
a shorter name so that we can have a better output.

While at it, use the same shorter name for driver and card.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index c95d2c330a76..7712e7be8625 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -26,6 +26,8 @@
 #include <media/imx.h>
 #include "imx-media.h"
 
+#define IMX_CAPTURE_NAME "imx-capture"
+
 struct capture_priv {
 	struct imx_media_video_dev vdev;
 
@@ -69,8 +71,8 @@ static int vidioc_querycap(struct file *file, void *fh,
 {
 	struct capture_priv *priv = video_drvdata(file);
 
-	strscpy(cap->driver, "imx-media-capture", sizeof(cap->driver));
-	strscpy(cap->card, "imx-media-capture", sizeof(cap->card));
+	strscpy(cap->driver, IMX_CAPTURE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, IMX_CAPTURE_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "platform:%s", priv->src_sd->name);
 
-- 
2.17.1

