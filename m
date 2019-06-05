Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44FDC36559
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfFEUWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:22:54 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35996 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFEUWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:22:54 -0400
Received: by mail-qt1-f195.google.com with SMTP id u12so86027qth.3
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=QJQbMka1MXUwYIt/ZO5sWq6DO1jrK8MhlctrAEsYl7o=;
        b=z/jx0n6rsGTbQSFzvt5ikx9wlxvOJwDIcrBdGcbuAJ/vYaJszYqgNGBH/ysXQVLZ9V
         8Oq41zXAr8lov85dQndkojs6gARfWDm/dnN46Kzi/+47f94ktklVlvO4lfn/4dmqBz6e
         415MTiIZ57QU/NAdAz5Ty0gXI4jQN05qF/kQ0Fe8rrLAbBZTkI1695u8eh4+qjhq41j2
         5UsawJrak9nMB1MHo45kAXNfidWNFXSeTpuUu36BkKQIi3JimeYc4To6UromjR6erZsJ
         s8pVmhGSRnZazsg41G6BxAv3om6f5TdgWuHTSmOP1j93bQX9FetCg9b3PNZq4cyxclpl
         ZrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QJQbMka1MXUwYIt/ZO5sWq6DO1jrK8MhlctrAEsYl7o=;
        b=S5suZxburkZtPL45qc3ss++mvyp4QJJOjpH1ZpgsfcnvhJr0V4vbgd1ffQUrcvAhsz
         dyZNdxDbLs3XXiXHmjt8tLRHsM9CrjHa4WQhmmZdO4ioQHjAmHmW5UWxXnvGAI3Xmi+4
         X1ZrE8potUbShKLoGtRXLMgp8Cm0SjGEXtOIB4ExZU3MIudDO2q467a4ckuGkR6Uj0HN
         7KQHYKZ+Tm8x5be6PErUeVKfxb/ZuBnBOZPf48Flo0KEzDUYk6PM+2MmViVOOcBcHSsY
         eL87R+g4lnym195PcYOneaisl/IcDmb7Sbc2S/TOPi8mUWk2RmlguYoNMQOGfXFYUoC6
         q58A==
X-Gm-Message-State: APjAAAXYehhf1VrJblSJjieHSBAePsfqcKO9jg3oTjhpImLPfZjDWvlU
        j7FYHWwLi/roTV1ELE4vLx2slg==
X-Google-Smtp-Source: APXvYqz/pc+6CZnS6Ffj6aSGLxLVCXIV4qPrJdrKC4gzOOijyHDtYguQjYVphUllVM9vfHQKIaUIMA==
X-Received: by 2002:aed:378a:: with SMTP id j10mr37083052qtb.6.1559766173362;
        Wed, 05 Jun 2019 13:22:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id d38sm7565318qtb.95.2019.06.05.13.22.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 13:22:52 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM VENUS VIDEO ACCELERATOR
        DRIVER),
        linux-arm-msm@vger.kernel.org (open list:QUALCOMM VENUS VIDEO
        ACCELERATOR DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Revert "media: hfi_parser: don't trick gcc with a wrong expected size"
Date:   Wed,  5 Jun 2019 16:19:40 -0400
Message-Id: <20190605201941.4150-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit ded716267196862809e5926072adc962a611a1e3.

This change doesn't make any sense and breaks the driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 34ea503a9842..15804ad7e65d 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -569,7 +569,7 @@ struct hfi_capability {
 
 struct hfi_capabilities {
 	u32 num_capabilities;
-	struct hfi_capability *data;
+	struct hfi_capability data[1];
 };
 
 #define HFI_DEBUG_MSG_LOW	0x01
@@ -726,7 +726,7 @@ struct hfi_profile_level {
 
 struct hfi_profile_level_supported {
 	u32 profile_count;
-	struct hfi_profile_level *profile_level;
+	struct hfi_profile_level profile_level[1];
 };
 
 struct hfi_quality_vs_speed {
-- 
2.17.1

