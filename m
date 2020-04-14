Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22F51A8BDA
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 22:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505454AbgDNUC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 16:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505425AbgDNUCT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 16:02:19 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E180BC03C1A7
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:18 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t11so795518lfe.4
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MRB0ksvQ4dG29cTOUC/flJPc0kMN71llsVsfBnEBR7I=;
        b=A5fmNoTbHCX/JTsNQXS4inav3bJdDNDFSfh/2RdqtNlPCsrUh2mQPKLn8XxYoMgikf
         9IUzWVOry7lbRk9V4qAVh4wnBFwJGs+26zMD2FigmBGS/+u6Phrfn5w2+T5AgStl0PJx
         qYHFaPInYa3JEF16Nnehtm5qWCOKjO9BCNTJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MRB0ksvQ4dG29cTOUC/flJPc0kMN71llsVsfBnEBR7I=;
        b=dsyLbqH431zgMx9g+qIyW+khou8/oP67IkuTltRbbqkMX/owo8S3oh+6NOlOq/7c1k
         n2eqPS3kAt6S9btj1qYPrR5LzDRuabvPOQuhIDmjRXIlyZ11tanISUxPJSv2vTQ5xpfV
         UuxTH1ttdafUaVh9XxOGrWB2JOovmZFyknpyxKGKgNjVr0+QVKmvihD3aAvXhWF6q0PL
         hAJ295J9oMn3LcopFi2ylVzyq4/Nj1dJHL3RnLjbkA2+flKVOu8R1Ac+NaqiMA5C29fK
         1FyflSbfDzaGVT5Of994pYt63pd76j7fJINwQ+6UjY1aDuyateJ3J/O7FZb2G8EQPT0Y
         eNyw==
X-Gm-Message-State: AGi0PuZnqstDZh58Gns0D00sv+kJVnNWP+GFw4K5np9F0FKRWfZkCL7o
        L6wm/Rp+Qoh99TMUsDxTC4yQbg==
X-Google-Smtp-Source: APiQypJuHbpOy7oy8YGes+7tejCweE9iUD5goZkzU5ynPG1AQcmzXM2sskWakxg+yfgM6m3/9tvpmg==
X-Received: by 2002:a19:c14e:: with SMTP id r75mr878761lff.62.1586894537392;
        Tue, 14 Apr 2020 13:02:17 -0700 (PDT)
Received: from localhost.localdomain (62-243-86-95-cable.dk.customer.tdc.net. [62.243.86.95])
        by smtp.gmail.com with ESMTPSA id v4sm3525254ljj.104.2020.04.14.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:02:16 -0700 (PDT)
From:   Daniel Gomez <daniel@qtec.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Daniel Gomez <daniel@qtec.com>
Subject: [RFC PATCH 1/3] media: v4l2-subdev.h: Add min and max enum
Date:   Tue, 14 Apr 2020 22:01:49 +0200
Message-Id: <20200414200151.80089-2-daniel@qtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414200151.80089-1-daniel@qtec.com>
References: <20200414200151.80089-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add min and max structures to the v4l2-subdev callback in order to allow
the subdev to return a range of valid frame intervals.

This would operate similar to the struct v4l2_subdev_frame_size_enum and
its max and min values for the width and the height. In this case, the
possibility to return a frame interval range is added to the v4l2-subdev level
whenever the v4l2 device operates in step-wise or continuous mode.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 include/uapi/linux/v4l2-subdev.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 03970ce30741..ee15393c58cd 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -117,6 +117,8 @@ struct v4l2_subdev_frame_interval {
  * @code: format code (MEDIA_BUS_FMT_ definitions)
  * @width: frame width in pixels
  * @height: frame height in pixels
+ * @min_interval: min frame interval in seconds
+ * @max_interval: max frame interval in seconds
  * @interval: frame interval in seconds
  * @which: format type (from enum v4l2_subdev_format_whence)
  */
@@ -126,9 +128,11 @@ struct v4l2_subdev_frame_interval_enum {
 	__u32 code;
 	__u32 width;
 	__u32 height;
+	struct v4l2_fract min_interval;
+	struct v4l2_fract max_interval;
 	struct v4l2_fract interval;
 	__u32 which;
-	__u32 reserved[8];
+	__u32 reserved[4];
 };
 
 /**
-- 
2.25.1

