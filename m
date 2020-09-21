Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654BA272066
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgIUKVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgIUKVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F47C061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so12118727wrp.8
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pJYZMlRu+8oQA/EIZAQFePFUOgqonaLTxBSJ9QI8wUU=;
        b=kkgqvr4wSg1oA/tAod4PBJeP+Sa5+sT0bCecTAqpNi2QvT5/ftglSujMJ/OijhuAVh
         NweHDQRZ+0eqxK5Xul9Xk23FBkH8wriuqXCWtud0RKmUsw6w9qjSNl7Cm1S78syECJcR
         nU9VenHt/Yr1Vm9D65mXdsJzZf4dVjIjFC26q7m6nv1pN3gpSLcnpnPhAdIYCq2lMdHt
         Ow0RVD2OUUhJaGD7Q4osvdVKkPZ+5SURUlnZmS/6tohRNWKcfJXC0Fh4nFtlE4tKlfiY
         k+JSJwXo8CoXWDwUGtg4XKHmukpgv+K4lAhiMQESnU5o1zxLEJNMPpIbZq5fhUAN1EhP
         twEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pJYZMlRu+8oQA/EIZAQFePFUOgqonaLTxBSJ9QI8wUU=;
        b=gIMr45pR7asPw7Uy8aQSBgOs+GtyQruDBAhbVZedBHg/RFPtiKt50j+oy+19HAqhwW
         A6Np0M3E1aeCMof865DWGhYBc4iZeZ3MUQlsONdVK5kyPWTAHeYk6bXd2OgXKsCrWzO+
         3mkz+3CRbdHkuOIxgASI4OIvt4odHCWFgxzY0+mh8xbcDN5s7bgxoj+O+upybb8nL8Am
         iFopJTfUvE0c/g9MI05imK10SLmKgzohk7zraQa3UGY/8VHyyQdK9kOSWE7xYrmocQ4p
         QMka4RmaE1YdmfewcQpmn95Mg1iS2lhZPHhEfO+CFYjABN6d5WYumrkL/Ue+e9T1JlPR
         0edA==
X-Gm-Message-State: AOAM532xM6vIODlIirxw6zmAA3sVrkYtfRU99PLO2reBHVnQVsvqDpYv
        ZnWooGF9UhSzG0FXJMitZXtHjg==
X-Google-Smtp-Source: ABdhPJz16X1uCIJdhDJDadI4Sw0QdewJNAkUb4ZoiDOllk9GkQZ8DXmQGWKncpp4djpXEc//OafjiQ==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr50725470wrw.261.1600683675812;
        Mon, 21 Sep 2020 03:21:15 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:15 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 46/49] staging: media: zoran: fix some compliance test
Date:   Mon, 21 Sep 2020 10:20:21 +0000
Message-Id: <1600683624-5863-47-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add TODO for "TRY_FMT cannot handle an invalid pixelformat"

We need to set pixelformat in some case.
We should also handle some minimum requirement.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 47f397ff190f..4299578c9bb5 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1206,9 +1206,12 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 		if (zoran_formats[i].fourcc == fmt->fmt.pix.pixelformat)
 			break;
 
-	if (i == NUM_FORMATS)
+	if (i == NUM_FORMATS) {
+		/* TODO do not return here to fix the TRY_FMT cannot handle an invalid pixelformat*/
 		return -EINVAL;
+	}
 
+	fmt->fmt.pix.pixelformat = zoran_formats[i].fourcc;
 	fmt->fmt.pix.colorspace = zoran_formats[i].colorspace;
 	if (BUZ_MAX_HEIGHT < (fmt->fmt.pix.height * 2))
 		fmt->fmt.pix.field = V4L2_FIELD_INTERLACED;
@@ -1318,6 +1321,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 	if (i == NUM_FORMATS) {
 		pci_err(zr->pci_dev, "VIDIOC_S_FMT - unknown/unsupported format 0x%x\n",
 			fmt->fmt.pix.pixelformat);
+		/* TODO do not return here to fix the TRY_FMT cannot handle an invalid pixelformat*/
 		return -EINVAL;
 	}
 
@@ -1327,10 +1331,16 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 		res = -EBUSY;
 		return res;
 	}
+
+	fmt->fmt.pix.pixelformat = zoran_formats[i].fourcc;
 	if (fmt->fmt.pix.height > BUZ_MAX_HEIGHT)
 		fmt->fmt.pix.height = BUZ_MAX_HEIGHT;
 	if (fmt->fmt.pix.width > BUZ_MAX_WIDTH)
 		fmt->fmt.pix.width = BUZ_MAX_WIDTH;
+	if (fmt->fmt.pix.height < BUZ_MIN_HEIGHT)
+		fmt->fmt.pix.height = BUZ_MIN_HEIGHT;
+	if (fmt->fmt.pix.width < BUZ_MIN_WIDTH)
+		fmt->fmt.pix.width = BUZ_MIN_WIDTH;
 
 	map_mode_raw(fh);
 
-- 
2.26.2

