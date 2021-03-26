Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F3834B108
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 22:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhCZVDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 17:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhCZVDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 17:03:00 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD358C0613AA;
        Fri, 26 Mar 2021 14:02:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id z2so6888454wrl.5;
        Fri, 26 Mar 2021 14:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XcEQ7HmoXFOItjwB6TmhFsv50ovXFM6vJThKOfVLFwo=;
        b=IFgkdjrniMvfhZ6wUY6M1dbZj9YRB/41IE0NUui+h+x0+Lh12911CL6ef6nMREUGQ6
         jmncz4Iro6a3EahZ1FbsOCV3rF2wa3ybzE1WBZU0j4j5sy5Rj8fBTxxakfMtoApZlzS7
         Mazq6fseSBCfqB/020dMTFNEHB8bgrmt4hrMkwp8HQE+f5CdNvu0lkyTjzPrEJ8cVeyu
         rKs4P6NF6SlwuD/mQ8LJXw8KU9YG7360U4iDioL9C6TU5QCHIiwEe0eGbHsM0YnVU4s6
         RSFB6h8LX248xX+ayqYIVDdyOM+ChK3Q3sqZy0DXlEal58V3NbveJpdoUOU0TB6Dc2bU
         t4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XcEQ7HmoXFOItjwB6TmhFsv50ovXFM6vJThKOfVLFwo=;
        b=JWBAPassgFwMnLehvftyjiMmzi1TAglS2a9OOBGngN/zdt8KSFFiXlNX7MnLTqHGPt
         li3d0OVsWzBjM1BKBCmDAzrhYIxS9gCqnWhpwZTEMlMp8GYE6ieDJ6kysNqGutWmI977
         Zagd4IQsvBpcv/Utpw30xH+pYAD2UjpnMbBkigFCduSks/ussVTrRkBc9pZ3tLcyB0Yf
         3l9vUEHBSbm+inSNK04w6vUK7EjgPYDLIPNzNaOQ1q2ISNzPbdzo+1Hft9R1VG3e8Dab
         XQamYBFTetLSFf431CEjVAtTcYrn1EVdXwDQaFhxiZrtg0zaPFonSRVvrQJlLRASw/iI
         wObw==
X-Gm-Message-State: AOAM5302GVn8tTcnkl1fyyB4cuPdjjVyrvkmz4uAA9zu9H67ygkO67gC
        edsRoNLan4rB836vApzur4WmjJTVhNITh573
X-Google-Smtp-Source: ABdhPJxCO+Kcc4kXorg0mdlPzqLMsY1Dr/xlKtLNx3AJFWzDxMF2k796hrxlJ2//LVwdk+BP9r47TQ==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr16324532wrq.193.1616792578234;
        Fri, 26 Mar 2021 14:02:58 -0700 (PDT)
Received: from alaa ([197.57.185.218])
        by smtp.gmail.com with ESMTPSA id c2sm13251052wmr.22.2021.03.26.14.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 14:02:57 -0700 (PDT)
From:   Alaa Emad <alaaemadhossney.ae@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller@googlegroups.com,
        Alaa Emad <alaaemadhossney.ae@gmail.com>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Subject: [PATCH v2] media: sq905.c: fix uninitialized variable
Date:   Fri, 26 Mar 2021 23:02:52 +0200
Message-Id: <20210326210252.129595-1-alaaemadhossney.ae@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>

---
Changes in v2:
  - Fix the error occured because of pervious fix.
---
 drivers/media/usb/gspca/sq905.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
index 97799cfb832e..57206dd2e1a0 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -157,8 +157,8 @@ static int sq905_ack_frame(struct gspca_dev *gspca_dev)
 static int
 sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
 {
-	int ret;
-	int act_len;
+	int ret;
+	int act_len;
 
 	gspca_dev->usb_buf[0] = '\0';
 	if (need_lock)
@@ -180,8 +180,8 @@ sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int need_lock)
 			   data, size, &act_len, SQ905_DATA_TIMEOUT);
 
 	/* successful, it returns 0, otherwise  negative */
-	if (ret < 0 || act_len != size) {
-		pr_err("bulk read fail (%d) len %d/%d\n", ret, act_len, size);
+	if (ret < 0 || act_len != size) {
+	       pr_err("bulk read fail (%d) len %d/%d\n", ret, ret < 0 ? -1 : act_len, size);
 		return -EIO;
 	}
 	return 0;
-- 
2.25.1

