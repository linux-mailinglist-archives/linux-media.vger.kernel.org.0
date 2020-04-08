Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 291551A229B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 15:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgDHNJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 09:09:51 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42019 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbgDHNJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 09:09:51 -0400
Received: by mail-qt1-f193.google.com with SMTP id b10so5456103qtt.9
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=c7mzdLHbqZgvWZBZONoOqB6NL/sYjJ5uesstHSAOUE4=;
        b=NkKbub3wMINLVN1xeR3CnJ/t2h8Rypwd7ux2WmeNqhRWBXHoSX7WGvR7UzOK0wMuYa
         zrl7y/2o0MoKae/HSgeDJcCVxZ56THtIeg4l4bQLIa/gLXA5Cab9XInNuQxvDMhORMvU
         LDtxoBrXmEZRV+Evu6t7v7T31IuxTI+05HHsnfhrnybqDZKLxPqoLxffXTv7yNciEy2L
         LXq/we4iLJHVrQMEXPA9okO7d2wk9h1E7oKqKx1PJOq1MShxoYf4lbHXFmHW9lsia7O4
         GT7XJVv8nw+0PG0Sr9rgHCL67rlXdszTOrfDhiYviO5FoI4BSZxOmoCusiasFu77e2iI
         4XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=c7mzdLHbqZgvWZBZONoOqB6NL/sYjJ5uesstHSAOUE4=;
        b=aSzoTp4Z3UUj7Fyqn9qGHKjpiTlm5uvPMQafb6YZTMd8TlLpmxL6gCzp2yzkp9RZ6G
         J9cwEHvDnTLCNk14ZKPB5SkWAvPr5heIRKFkm8A4bPxqYYi98qjh3L744liq3/6NKiG+
         IEJh/Ecysx5NYHlX8cwWGvRtEpY683SXpuN8pZdncyirH7jSqySq8GPSo5zM24PAJ5xP
         BqgtolGGLHUujasys8MQ6dr2Z1PcfIuelKvH16+/npaN/5oV8p+8jqtQdNXKamoW1VEc
         ICTCBwpGuijoILB1rVkssy68vvI9HK2Dw7zKdSnUNpSsDPmPK0B50Yqn6gbJbdMWd+VB
         aIMg==
X-Gm-Message-State: AGi0PubXl2hnf2qDl73imO4BmfAZCXpDrZSRRc6PMQe1Qv6pSKwQxOJX
        sAHPuZphr7drWUftHdG338g=
X-Google-Smtp-Source: APiQypJy+q2OxvPxRAeIMdaqUUT/KJFHv571AO2RC7wmbeKodTZg+jV9i7YZvKCXHposxqrW9dFC9g==
X-Received: by 2002:ac8:27a9:: with SMTP id w38mr7156937qtw.112.1586351389576;
        Wed, 08 Apr 2020 06:09:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id u7sm314011qkj.51.2020.04.08.06.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:09:48 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: imx-media-csc-scaler: Use a shorter name for driver
Date:   Wed,  8 Apr 2020 10:10:05 -0300
Message-Id: <20200408131005.26639-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently v4l2-compliance tool returns the following output:

Compliance test for imx-media-csc-s device /dev/video8:

Driver Info:
        Driver name      : imx-media-csc-s
        Card type        : imx-media-csc-scaler
        Bus info         : platform:imx-media-csc-scaler

The driver name string is limited to 16 characters, so provide
a shorter name in order to get a better output.
    
While at it, use the same shorter name for driver, card and platform.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 2cc77f6e84b6..876428acbd33 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -25,6 +25,8 @@
 
 #define fh_to_ctx(__fh)	container_of(__fh, struct ipu_csc_scaler_ctx, fh)
 
+#define IMX_CSC_SCALER_NAME "imx-csc-scaler"
+
 enum {
 	V4L2_M2M_SRC = 0,
 	V4L2_M2M_DST = 1,
@@ -150,10 +152,10 @@ static void device_run(void *_ctx)
 static int ipu_csc_scaler_querycap(struct file *file, void *priv,
 				   struct v4l2_capability *cap)
 {
-	strscpy(cap->driver, "imx-media-csc-scaler", sizeof(cap->driver));
-	strscpy(cap->card, "imx-media-csc-scaler", sizeof(cap->card));
-	strscpy(cap->bus_info, "platform:imx-media-csc-scaler",
-		sizeof(cap->bus_info));
+	strscpy(cap->driver, IMX_CSC_SCALER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, IMX_CSC_SCALER_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", IMX_CSC_SCALER_NAME);
 
 	return 0;
 }
-- 
2.17.1

