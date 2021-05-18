Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039EF387909
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 14:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349305AbhERMmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 08:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349298AbhERMml (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 08:42:41 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D643C061573
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:22 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso1428848wmh.4
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFCCf9Zadqmdb5+PTGtOnmwq2MMa2WLH4wJ8jc9X6CI=;
        b=hz3iR9DZKzar9RisXj35P/cH4E/OklwqizSwOuKA+P9jci3qo9hMZ5gzlW/sly9SSh
         6zunLWBZkCgMuU35+SsWvaK0mxu/AeNbjZseOjdVrexcKt09np5AIsYVvl2B52U9gDwc
         qJ2lshVMVJmcmbcghh+x2hJnN4IC33aSAG8DLhpiTMgsIiUNokQWYIFs6iNcIrimpGrJ
         jw1xNvkl30OO/7EfYyK5inByFH26Ikzqjvi9a/AhcQoUj6X/hPtfBuUdob4hkWtdp53s
         CSEergk0MLXB8nTpbipmSk4Ptrw1EFC5/4PT4O5RdVfnsU7ucVu3+afhx7bbXAG4Ft0X
         grQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFCCf9Zadqmdb5+PTGtOnmwq2MMa2WLH4wJ8jc9X6CI=;
        b=fVB82nGleSkQ36Cji54vKz84I5/bM3gv4M8zdeNXDfp+83/QQ0GBTNGC0IgPllMtah
         cNfC38obpk44t1aEltv2oniIAOOF7O5wjDXd1hjlBq8A4IJNCz/+ob8zcBfRsUsZUOeK
         AEkycxKV+gLUcNMRMf2IKpKhqniuOoNlhZnglv7Wyy635ChyU7nNpzpTlzxgPvueWynK
         sF9dcNP5N9Gjd1yfW0nGMrNSQ5bO47MNEHzxMfC76fPaHUE8U01j2qwiTZaiHZ1N6ND+
         LWteOCXkzbJBcSo9cSTMYDpmfPCsEpqszguBZHFwRuVQObc708MBWgjBYRKRIU8K/q0M
         VGeA==
X-Gm-Message-State: AOAM532YO/bT92R6ec+8xg0XFBTTmJnl7YqP6wx7JUssYTOcnNtsSpFy
        4rwekrTWTaFTyAiv2Aue9dbYSQ==
X-Google-Smtp-Source: ABdhPJzSy40WfPhdwmshIXqLyiDyN0wXHif79hqRyhwDPulgerCWoG4o2VFd5eyuQ+IzM/rfmKmLtw==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr4887905wmf.134.1621341680913;
        Tue, 18 May 2021 05:41:20 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 05:41:20 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/5] staging: media: zoran: remove detect_guest_activity
Date:   Tue, 18 May 2021 12:41:09 +0000
Message-Id: <20210518124113.1823055-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The detect_guest_activity function is no longer used, so lets removed it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 46 ----------------------
 drivers/staging/media/zoran/zoran_device.h |  2 -
 2 files changed, 48 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index cf788d9cd1df..7d2718744d18 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -166,52 +166,6 @@ static void dump_guests(struct zoran *zr)
 	}
 }
 
-void detect_guest_activity(struct zoran *zr)
-{
-	int timeout, i, j, res, guest[8], guest0[8], change[8][3];
-	ktime_t t0, t1;
-
-	/* do not print random data */
-	guest[0] = 0;
-	guest0[0] = 0;
-
-	dump_guests(zr);
-	pci_info(zr->pci_dev, "Detecting guests activity, please wait...\n");
-	for (i = 1; i < 8; i++) /* Don't read jpeg codec here */
-		guest0[i] = guest[i] = post_office_read(zr, i, 0);
-
-	timeout = 0;
-	j = 0;
-	t0 = ktime_get();
-	while (timeout < 10000) {
-		udelay(10);
-		timeout++;
-		for (i = 1; (i < 8) && (j < 8); i++) {
-			res = post_office_read(zr, i, 0);
-			if (res != guest[i]) {
-				t1 = ktime_get();
-				change[j][0] = ktime_to_us(ktime_sub(t1, t0));
-				t0 = t1;
-				change[j][1] = i;
-				change[j][2] = res;
-				j++;
-				guest[i] = res;
-			}
-		}
-		if (j >= 8)
-			break;
-	}
-
-	pci_info(zr->pci_dev, "Guests: %*ph\n", 8, guest0);
-
-	if (j == 0) {
-		pci_info(zr->pci_dev, "No activity detected.\n");
-		return;
-	}
-	for (i = 0; i < j; i++)
-		pci_info(zr->pci_dev, "%6d: %d => 0x%02x\n", change[i][0], change[i][1], change[i][2]);
-}
-
 /*
  * JPEG Codec access
  */
diff --git a/drivers/staging/media/zoran/zoran_device.h b/drivers/staging/media/zoran/zoran_device.h
index 24be19a61b6d..6c5d70238228 100644
--- a/drivers/staging/media/zoran/zoran_device.h
+++ b/drivers/staging/media/zoran/zoran_device.h
@@ -20,8 +20,6 @@ extern int post_office_wait(struct zoran *zr);
 extern int post_office_write(struct zoran *zr, unsigned int guest, unsigned int reg, unsigned int value);
 extern int post_office_read(struct zoran *zr, unsigned int guest, unsigned int reg);
 
-extern void detect_guest_activity(struct zoran *zr);
-
 extern void jpeg_codec_sleep(struct zoran *zr, int sleep);
 extern int jpeg_codec_reset(struct zoran *zr);
 
-- 
2.26.3

