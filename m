Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0390E2C65
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 10:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438305AbfJXInN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 04:43:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38728 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfJXInN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 04:43:13 -0400
Received: by mail-wr1-f65.google.com with SMTP id v9so13789447wrq.5;
        Thu, 24 Oct 2019 01:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IH4V0jJe1FMsAO3aGYITS5W4yDqJLQFn9PzEFfOM1og=;
        b=Cd1U0arUl/qWeAcZxmlfL3Ns2a2e5l+JL1rw6p0vW0ZEYYmk1o3r33qKLugqDUztlC
         ZGefXT/03vVVTJsfDeOdkJHnSKpKdzsJsGQynubZukMUOUS4Ft497u2zsl9px+R9GAQJ
         U6B/tY6E0Up0y80Eod6M/YesxvWgpbMWze5SfZH514ZIlbGC3iqKdE58WdTFenPLSTCG
         RPHsuoGFYEDD6qpRXM7uyieCThpfwq+FrfjCEAdjj070VJm/rjFkJY0ErSyD/Lqqdytk
         jSPYowl+l77hPicEhzmUjoNa2OfBqiNwUDa3FoCDspnnwdT63m47IxC8kxJrNBg4Ui9U
         geIA==
X-Gm-Message-State: APjAAAWrg6ZiYT7vaevykG27MJZBm+rnMu0XKX2mPnY2SyHjGQKAeYCx
        ehCsNTW3f06Rm1Alz1OJP8w=
X-Google-Smtp-Source: APXvYqwT5k6MKsutcGoqiL/UrA2n5vlSsuf8aZWhMLXGaxoAWvLl/dcUBMIpTsn6C6mvjlXkAta80w==
X-Received: by 2002:adf:ef0f:: with SMTP id e15mr2829613wro.312.1571906591051;
        Thu, 24 Oct 2019 01:43:11 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id c8sm1472903wml.44.2019.10.24.01.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 01:43:10 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH] v4l2-compliance: Allow all the selection targets for subdevs
Date:   Thu, 24 Oct 2019 10:43:08 +0200
Message-Id: <20191024084308.22749-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Subdev can also have non-active pixels, and using the _DEFAULT targets
we can capture only the active pixels.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 29987b31..e4923180 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -388,20 +388,19 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
 
 struct target_info {
 	__u32 target;
-	bool allowed;
 	bool readonly;
 	bool found;
 };
 
 static target_info targets[] = {
-	{ V4L2_SEL_TGT_CROP, true },
-	{ V4L2_SEL_TGT_CROP_DEFAULT, false, true },
-	{ V4L2_SEL_TGT_CROP_BOUNDS, true, true },
-	{ V4L2_SEL_TGT_NATIVE_SIZE, true },
-	{ V4L2_SEL_TGT_COMPOSE, true },
-	{ V4L2_SEL_TGT_COMPOSE_DEFAULT, false, true },
-	{ V4L2_SEL_TGT_COMPOSE_BOUNDS, true, true },
-	{ V4L2_SEL_TGT_COMPOSE_PADDED, false, true },
+	{ V4L2_SEL_TGT_CROP },
+	{ V4L2_SEL_TGT_CROP_DEFAULT, true },
+	{ V4L2_SEL_TGT_CROP_BOUNDS, true },
+	{ V4L2_SEL_TGT_NATIVE_SIZE },
+	{ V4L2_SEL_TGT_COMPOSE },
+	{ V4L2_SEL_TGT_COMPOSE_DEFAULT, true },
+	{ V4L2_SEL_TGT_COMPOSE_BOUNDS, true },
+	{ V4L2_SEL_TGT_COMPOSE_PADDED, true },
 	{ ~0U },
 };
 
@@ -447,7 +446,6 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
 		if (ret)
 			continue;
 		have_sel = true;
-		fail_on_test(!targets[tgt].allowed);
 		fail_on_test(check_0(sel.reserved, sizeof(sel.reserved)));
 		fail_on_test(sel.which != which);
 		fail_on_test(sel.pad != pad);
-- 
2.23.0

