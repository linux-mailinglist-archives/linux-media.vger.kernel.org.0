Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463AC65601C
	for <lists+linux-media@lfdr.de>; Mon, 26 Dec 2022 06:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbiLZF0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Dec 2022 00:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiLZF0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Dec 2022 00:26:14 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B9E55A4
        for <linux-media@vger.kernel.org>; Sun, 25 Dec 2022 21:26:10 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d7so9920487pll.9
        for <linux-media@vger.kernel.org>; Sun, 25 Dec 2022 21:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LF9Mm3NqqH1nEG/wEah3Sd4XDD5tbfZrQgSyrQTtptI=;
        b=ZwNZ39F5tgP/LmtcnHq6P1mt1fj6IDl0R4Ff2oPDtgYyy3gp3vWSgx5th50vG394dt
         hM5ENWhp6uzpqpEZlsbx3YmTo+2wniMh/K6FYX9wJ8BQHvNtk9MloVceTOyuu0d+3ltT
         vZ5rRjRPG95043TvJh6z7AT3/Mrans94SvF1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LF9Mm3NqqH1nEG/wEah3Sd4XDD5tbfZrQgSyrQTtptI=;
        b=oFRrQ+9EEcg2ZsgwGi+ZK/TjDh8ZHARb6VWqYCPjvuQIs6jUTRw10TV8saBbTXVCbQ
         NzDX+B1sqrOPc//JryJo/glsl+1ggfdsUAF1L4nrE0cAmWOzejW8eMnYUaNr8/uDK66j
         DEsIZmOmSOqh3sqH4EXElvb5kxeqIenZovTsRTBNojRUDkqXEyOKmv0W+zuze70riXiv
         1EOotiwA63pSoZ9Cg1Py6nBywHEiRAW1W3nH4n71r6G2LCehig2aQCUfoOWoiOtSkZH0
         w3cI0RNhvHkrHUSvl6/LzYY9VW5FxkXROfZxHPSunpAWPaKZDmv381ANssrDuPJibRhW
         ClvQ==
X-Gm-Message-State: AFqh2kqOeyA8UmXQ2Gj666vLGQrq9kDHbv1UA6pBB2oPpbRvdiIy9PKc
        qbxIVjbkEwZ/VGHVAYpmKRhlWQ==
X-Google-Smtp-Source: AMrXdXuUS+LEcZOWr2OsiwuQkSRBZt8oLI1kuQXopUgaEZ4Qu8l/Ipbgt8vQUGRyp0msSc4GtvINKw==
X-Received: by 2002:a17:902:f550:b0:192:7258:15b5 with SMTP id h16-20020a170902f55000b00192725815b5mr7105435plf.50.1672032370405;
        Sun, 25 Dec 2022 21:26:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:db30:c4d:3ee:e697])
        by smtp.gmail.com with ESMTPSA id je20-20020a170903265400b001926c38cd42sm2966161plb.192.2022.12.25.21.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:26:10 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: hantro: Use core-generated bus_info value
Date:   Mon, 26 Dec 2022 13:26:06 +0800
Message-Id: <20221226052606.144109-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hantro driver uses a hardcoded value for the bus_info field in the
media device and |struct v4l2_capability|. This worked well when there
was just one device. However with the iMX.8 series we are now seeing
two Hantro blocks on the same chip. The static bus_info is no longer
sufficient for differentiating devices.

Since commit f2d8b6917f3b ("media: v4l: ioctl: Set bus_info in
v4l_querycap()"), the V4L2 core provides a default value for the
bus_info field for platform and PCI devices. This value will match
the default value for media devices added by commit cef699749f37
("media: mc: Set bus_info in media_device_init()"). These defaults
are stable and device-specific.

Drop the static bus_info values from the hantro driver and use the
defaults.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped unrelated Makefile change

 drivers/media/platform/verisilicon/hantro_drv.c  | 2 --
 drivers/media/platform/verisilicon/hantro_v4l2.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8cb4a68c9119..b0aeedae7b65 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1050,8 +1050,6 @@ static int hantro_probe(struct platform_device *pdev)
 
 	vpu->mdev.dev = vpu->dev;
 	strscpy(vpu->mdev.model, DRIVER_NAME, sizeof(vpu->mdev.model));
-	strscpy(vpu->mdev.bus_info, "platform: " DRIVER_NAME,
-		sizeof(vpu->mdev.bus_info));
 	media_device_init(&vpu->mdev);
 	vpu->mdev.ops = &hantro_m2m_media_ops;
 	vpu->v4l2_dev.mdev = &vpu->mdev;
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2c7a805289e7..c1a116031013 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -142,8 +142,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, vpu->dev->driver->name, sizeof(cap->driver));
 	strscpy(cap->card, vdev->name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform: %s",
-		 vpu->dev->driver->name);
 	return 0;
 }
 
-- 
2.39.0.314.g84b9a713c41-goog

