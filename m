Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F97C272058
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgIUKVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgIUKVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:00 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C85CC061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z4so12125556wrr.4
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9ZBjuGtlIQ8oulJMUmpkUNjlWYvzKi6Grt0GpSmmusw=;
        b=rxZwjV6HY9LG0dpHkUso3xgcTJu7kAviAeubkz4/JVYFg/pNiT7Mv0ja6GhsRuMgYB
         j5RydFDHDpcj6AtcVzbq+tBHf9E7bBVCehrc22Be6rCJ31ARmygdsxWk0KKPLR0isLzF
         GZtcCPBa0cphp7RHnHGfOaYKgli39BOriDPuBFnO2HQO36mlrtoowEm7ZGzf7Y+pZyV1
         c5x80CK8sJiPuomKofPU/1tkVzdpjtpuCmWUpkFJ53ZMwsWwuevTyvmwGe3ezPDykPjg
         PKVRYplwuhfbBoF6bsfRI+4BbOEA/7K7BRVlQa8NOLvjAY42SPCmJa6qmBHkkI9BW5rR
         lONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9ZBjuGtlIQ8oulJMUmpkUNjlWYvzKi6Grt0GpSmmusw=;
        b=C6XFPoNP5ErsyXiZic3bRUJlGtwRF5KfpJ14LmZMMSslj1UXeJbRPrCzq0ubVi0HwS
         yFMxQHXnqlJNY+QPPkpGJydB78yE3ojUSxRtn4R72nCxDfpunYEqQbH5tq7pgIU5F1Vb
         iO72jdj+Zs3BkJwU+rLinHmyydjJqnIh2iZ/iVZHVcUo2LXLJDTA6LUzgL026loIsYBy
         3Yx59kpQFPcoAFJV7tdv0RY/Ew8TQ3i/+IP8WbA/H8gNf7Xg/GpZeKEr7m85dxLrcVhK
         ucMsTotjAKaq5i3hOUp0LXzB4GXHv8TvZ1Fzsb2sCESckEJnl4HpJtDqIBMKiuLN5Rld
         j/aQ==
X-Gm-Message-State: AOAM530M1WlTaIFrXAM6mQMRI+WnIZNR2KAc5NhvsTCCWFk8Q4x4w6kn
        Ez4UZzsPyN+HtN7I1rUeAqM/fA==
X-Google-Smtp-Source: ABdhPJyzfzbEKklN94+4S73Qh+VMGuoEabkAmSVR1mVdTjh3TG+GaY08+ACfViEVCb5X17IIx6vMRg==
X-Received: by 2002:adf:9405:: with SMTP id 5mr28243151wrq.51.1600683659111;
        Mon, 21 Sep 2020 03:20:59 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:58 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 28/49] staging: media: zoran: convert zoran alloc to devm
Date:   Mon, 21 Sep 2020 10:20:03 +0000
Message-Id: <1600683624-5863-29-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allocate the zoran structure with devm_ functions permit to simplify
code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index fe4d34e388b4..62e63804ae14 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1017,7 +1017,6 @@ static void zoran_remove(struct pci_dev *pdev)
 exit_free:
 	v4l2_ctrl_handler_free(&zr->hdl);
 	v4l2_device_unregister(&zr->v4l2_dev);
-	kfree(zr);
 }
 
 void zoran_vdev_release(struct video_device *vdev)
@@ -1101,7 +1100,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENOENT;
 	}
 
-	zr = kzalloc(sizeof(*zr), GFP_KERNEL);
+	zr = devm_kzalloc(&pdev->dev, sizeof(*zr), GFP_KERNEL);
 	if (!zr)
 		return -ENOMEM;
 
@@ -1287,7 +1286,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	v4l2_ctrl_handler_free(&zr->hdl);
 	v4l2_device_unregister(&zr->v4l2_dev);
 zr_free_mem:
-	kfree(zr);
 
 	return -ENODEV;
 }
-- 
2.26.2

