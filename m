Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB57E3276
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 14:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439695AbfJXMff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 08:35:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41995 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439577AbfJXMfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 08:35:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id a21so2133467ljh.9;
        Thu, 24 Oct 2019 05:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqFcodUvMP2nbH6/QgA1fTSJxFcDzJHqpohowyN9g7s=;
        b=omij448W9U+5sXMQjog8d+7Go24csgnX/d/UNcN0VR4T0jXaeuCJJDzvaNr7vWAhlj
         In1UdUOiOkiROg87xxSAlNc07rW7eKUoF2TxRiVJfRbWTHtQ/eXXlfO6hPcV0obPh5f+
         q8TGojglScrfqiPgApjbHMTCIPvh6CugqpROmkwj4DoroDa2CUw2olCp3ncqPWNDRccj
         oNSV0IYqY/rcmWQMBOeUcwYME9LZHxZsr+OUr+O1QQgY8IlWm+RVzhbNz5KRFmm40zT0
         A0iJ5WCkE2L4+/94CfuJW+LhvtVb1H6an9FOAlG6s8uWO6eIAmEQ7v+paE/WX8LX6G3I
         M0Vg==
X-Gm-Message-State: APjAAAXq50KmHO2dOXiSn0D4KtfE91sNZh0aW9cVOoTzmarbmNtoi+oj
        vDMl/homJUDbqxFNs+znXOU=
X-Google-Smtp-Source: APXvYqzgKkj078leF9cTw39m/zagH611zNCYLuH3fEK/X5CwPhbpGrnQEA2r5AgjEnWwQ1lbQTbyoQ==
X-Received: by 2002:a05:651c:1023:: with SMTP id w3mr9720501ljm.79.1571920531380;
        Thu, 24 Oct 2019 05:35:31 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 30sm3063545lju.52.2019.10.24.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 05:35:30 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v2] v4l2-compliance: Allow all the selection targets for subdevs
Date:   Thu, 24 Oct 2019 14:35:26 +0200
Message-Id: <20191024123526.4778-2-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024123526.4778-1-ribalda@kernel.org>
References: <20191024123526.4778-1-ribalda@kernel.org>
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
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index 29987b31..c3979404 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -395,11 +395,11 @@ struct target_info {
 
 static target_info targets[] = {
 	{ V4L2_SEL_TGT_CROP, true },
-	{ V4L2_SEL_TGT_CROP_DEFAULT, false, true },
+	{ V4L2_SEL_TGT_CROP_DEFAULT, true, true },
 	{ V4L2_SEL_TGT_CROP_BOUNDS, true, true },
 	{ V4L2_SEL_TGT_NATIVE_SIZE, true },
 	{ V4L2_SEL_TGT_COMPOSE, true },
-	{ V4L2_SEL_TGT_COMPOSE_DEFAULT, false, true },
+	{ V4L2_SEL_TGT_COMPOSE_DEFAULT, true, true },
 	{ V4L2_SEL_TGT_COMPOSE_BOUNDS, true, true },
 	{ V4L2_SEL_TGT_COMPOSE_PADDED, false, true },
 	{ ~0U },
-- 
2.23.0

