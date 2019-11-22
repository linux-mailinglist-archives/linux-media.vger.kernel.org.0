Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBB7105F69
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 06:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfKVFQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 00:16:20 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45142 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVFQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 00:16:20 -0500
Received: by mail-pf1-f196.google.com with SMTP id z4so2893683pfn.12
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 21:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pur8D56rYiQ0M1ceqnI28F7eCh0YYOJc2gZei1cSwYw=;
        b=QUuL2c+xQxdrPyysEXsec8QavmH64GVr/WK5Xy2ffOtjwjSkRDU8nM231KQZ55gTT+
         o95OPytdoXojkQe06wVttIqQ+d8ikveWepYkDjh3szE/vnrqQQwCVhIHbokE9ohTbJBr
         Qir9fZmE4Y8oLlw+ShfjvkYD9U9A5TCKfg4Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pur8D56rYiQ0M1ceqnI28F7eCh0YYOJc2gZei1cSwYw=;
        b=WtUADStOXzOdQ3DuiP2EO+HAgpKgnnu2p02CoVDrmXmpRxdYtrk8HKyWoC3FhKH1/N
         UkUjyIleb/79OQTvReCnz5iSy1uZP89HGKsZJ72bT2WscQABUh0u2D6Cr20HpT9TpZl5
         8pjPkrNEbutGl0QQXDhjyohFYl2M1wgnFIk4lQAe0tmk88t+zXcrQ+78dRVVzfHsrC/c
         oXXwR/6YGf8Y6RDvjt4p8s+XBhDqtf/IWRw9YaomJP0K4fmf1E+N9kFL73AYw5HbNXgB
         0G1RRsgzkE9lgHVGkEPU4uarYHjEVlYgi8nPWhKBuMPjHSF2ywuUbNQ4xePDHuwcagDO
         OgGQ==
X-Gm-Message-State: APjAAAUN6KquYDGDd4lxj8SlXTaU51+6ygYNErHhTQXwvA+zkCFk6eVh
        UbcEEfgFmrakRY+CUHTRWZzqhw==
X-Google-Smtp-Source: APXvYqwm6Bo6Fpvepq74mr6KZ7xSHs2WiOshfDeBDm7ixVWj28grrqSlnrpqRI/kf/OPwZ6eICDjRg==
X-Received: by 2002:a63:fa0d:: with SMTP id y13mr13431599pgh.18.1574399777846;
        Thu, 21 Nov 2019 21:16:17 -0800 (PST)
Received: from hiroh.tok.corp.google.com ([2401:fa00:8f:2:3bf4:6372:5b56:dd4c])
        by smtp.gmail.com with ESMTPSA id m7sm5756049pfb.153.2019.11.21.21.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 21:16:17 -0800 (PST)
From:   Hirokazu Honda <hiroh@chromium.org>
To:     ezequiel@collabora.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hirokazu Honda <hiroh@chromium.org>
Subject: [PATCH] media: hantro: Support H264 profile control
Date:   Fri, 22 Nov 2019 14:16:08 +0900
Message-Id: <20191122051608.128717-1-hiroh@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hantro G1 decoder supports H.264 profiles from Baseline to High, with
the exception of the Extended profile.

Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE control, so that the
applications can query the driver for the list of supported profiles.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
---
 drivers/staging/media/hantro/hantro_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 6d9d41170832..9387619235d8 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -355,6 +355,16 @@ static const struct hantro_ctrl controls[] = {
 			.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
 			.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
 		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			.menu_skip_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+		}
 	}, {
 	},
 };
-- 
2.24.0.432.g9d3f5f5b63-goog

