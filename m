Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D62F32DDC0
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 15:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfE2NJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 09:09:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33725 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfE2NJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 09:09:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id z28so1620467pfk.0;
        Wed, 29 May 2019 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=aGFU8dFMfcB3DwQNIKfjc5/Xy1Xwp0lFwoOF2AErJSc=;
        b=sKIs11XB8c/C6qoFJNojhUQw+hyCuNdTTvO07PAX2kPQFJkx/d0TXtapL/2maxdMSo
         Jbq81BDYzSWW2xI8f9OM/OnpL6GyPgVJW9BHhEYGj/rY/rOp2iAknd2YSplEOzLm5pjF
         PmG7/fRfXcfzfdI3o1Agr/pw65uYt/ELwJwJe+1bkoaJAuljgTumaV5QGnW//k4LlpQN
         Mquj2YP+nJU17HiYO3ytJ0EPnmyd6k3rtiB5owzESpS0pb1aDPfXIyvbW92sU/ycDQP8
         oVVLMWxAbwIDB+6TRUSrieFDJbC0gmIMt7derFe3K5Hz7k6sveeqgDZTsLz9CV4Lyoad
         e46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aGFU8dFMfcB3DwQNIKfjc5/Xy1Xwp0lFwoOF2AErJSc=;
        b=sEZgHPctGzIMYd0uD7tVH+Dg7UKXtz5TcqkdNsblGGt0aoG4WtJn7CKWEuZGYSfGYx
         o8WNGkiSYCUukrPoWPwNIolMh4/reKbRqMfzgMEPpzczW/IdW4wpoR94WjK+Y/YIxAVa
         UowRCREw9x/DlTErgdZKn2li5BGZKR/7FqVlHRIfOT3gp/KmdtzykB+mONjzyhMUGJ8C
         dWggIFA9/FXuCGoypSMlviApL7OQumbVuKpEx+kZvPziAU61u2rgaFgkPwOQPfblR67x
         DSKF+QShelbYhglA7cIc1aQIVDKXB1eY/Ae/U8me9celP7VlNB8/6x/pPxmQNcANVnz/
         MOVg==
X-Gm-Message-State: APjAAAVOYNkZbm4d9Db2SQl4NED+06MMhbH0+ipIi3Y1gFcGJIT0oLCG
        m5H4mOxOs6XMdsmyGOAiBEU=
X-Google-Smtp-Source: APXvYqynG2BOmMG9lRLHoLq9aoHvztBMjsBGyG1PwYgghnMUvTj9EtyxiMqXhNv9gKEldLR3g83AgQ==
X-Received: by 2002:a63:144e:: with SMTP id 14mr120856311pgu.304.1559135339595;
        Wed, 29 May 2019 06:08:59 -0700 (PDT)
Received: from xy-data.openstacklocal (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
        by smtp.gmail.com with ESMTPSA id k19sm1753273pfa.94.2019.05.29.06.08.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 May 2019 06:08:59 -0700 (PDT)
From:   Young Xiao <92siuyang@gmail.com>
To:     prabhakar.csengg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
Date:   Wed, 29 May 2019 21:09:59 +0800
Message-Id: <1559135399-28998-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If vpif_probe() fails on vpif_probe_complete(), then memory
allocated at initialize_vpif() for global vpif_obj.dev[i]
become unreleased.

The patch adds deallocation of vpif_obj.dev[i] on the error path.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 drivers/media/platform/davinci/vpif_capture.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index b5aacb0..63e6ec4 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1621,6 +1621,14 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 	return NULL;
 }
 
+static void free_vpif_objs(void)
+{
+	int i;
+
+	for (i = 0; i < VPIF_DISPLAY_MAX_DEVICES; i++)
+		kfree(vpif_obj.dev[i]);
+}
+
 /**
  * vpif_probe : This function probes the vpif capture driver
  * @pdev: platform device pointer
@@ -1701,7 +1709,10 @@ static __init int vpif_probe(struct platform_device *pdev)
 				  "registered sub device %s\n",
 				   subdevdata->name);
 		}
-		vpif_probe_complete();
+		err = vpif_probe_complete();
+		if (err) {
+			goto probe_subdev_out;
+		}
 	} else {
 		vpif_obj.notifier.ops = &vpif_async_ops;
 		err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
@@ -1722,6 +1733,7 @@ static __init int vpif_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&vpif_obj.v4l2_dev);
 cleanup:
 	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
+	free_vpif_objs();
 
 	return err;
 }
@@ -1748,8 +1760,8 @@ static int vpif_remove(struct platform_device *device)
 		ch = vpif_obj.dev[i];
 		/* Unregister video device */
 		video_unregister_device(&ch->video_dev);
-		kfree(vpif_obj.dev[i]);
 	}
+	free_vpif_objs()
 	return 0;
 }
 
-- 
2.7.4

