Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280A9358E8F
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 22:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhDHUiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 16:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhDHUiz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 16:38:55 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0F4C061760;
        Thu,  8 Apr 2021 13:38:43 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id n38so2731743pfv.2;
        Thu, 08 Apr 2021 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cXGFaEh6PCrLA6C4q9RtpEQVCq3uC/hVZI//O0eMp4g=;
        b=f/LlkGDqmvtigaRHyNZ4I7tRGUf+Iw+okC/qvDjTGAoDJNOMZ1b1czJ/FPYgmAeM7b
         iBcNNjQwepUk/36qBXAwS9Jz6FipKOh05oUYmHpV/wi5cWC7H2I0QgMTo14YbBb5WNbl
         IiciUhySQIOpGvhgCJr1kgY9wMC7CMIUH7MnCUdn0XJ4k7xB5Wn7CrhHcZQLr2shK3ya
         k8vEIjKaaA7ykKGrIznSYynY5XVKiY4Vf5ujhPmGzSSMu4nWhAEz7Xiu58kTVoIrcN9L
         g0cAV7xzmVezFd3MXtnIul78/qbk3infSQP8/fPDHFAfBBXEjFEcFBwU5VOFZlySTE6q
         CYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cXGFaEh6PCrLA6C4q9RtpEQVCq3uC/hVZI//O0eMp4g=;
        b=GjwhcJCfzAqnc0lU+kkyqQtuATjAfXhPbeycyL4hUZCxq8T7uiBmsnROkaJS/1w7Du
         hZ5m/LqNHQNmZZi697in8JXOcoYuAWPN8y6hTO7hVfgQ18GwQKBykxOKNQRLPGWXGPfH
         03J5s2gWFJ00giPEjWV+UyJriERG5vYH16GyyaCYACZiRyeBEFGJlsfVVbfxphsmk6vR
         klo0tn3TgBS+02NIZS1oG/YCpESSOqtzapiK/Mq0OyFfz6Ewl1+W+XOude6+/L5s3TAm
         ICnBOF00eQkmUSYC8CIygw4w7MY3zeiSShSvG0KpFdRWQTIr3Zo3BfaF5Ap2HNLjQE6C
         vdzg==
X-Gm-Message-State: AOAM532pFe9rGOxvk6nIlfw3EcwEgXnrU6TROUFHApgXUPXMP1ZBDSPf
        m4l3F2nvIjAk00mINbQH1Y4=
X-Google-Smtp-Source: ABdhPJx3a8gSyQdgA6Zh4GvOvO+mkRCzmOGvUik8GwGc2Wy9UXkzaDW3AFUjjSM91mnutPA7Uceujg==
X-Received: by 2002:aa7:943b:0:b029:23f:8fa1:5f11 with SMTP id y27-20020aa7943b0000b029023f8fa15f11mr9091978pfo.67.1617914323385;
        Thu, 08 Apr 2021 13:38:43 -0700 (PDT)
Received: from kali ([152.57.11.236])
        by smtp.gmail.com with ESMTPSA id t10sm258894pjy.16.2021.04.08.13.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:38:43 -0700 (PDT)
Date:   Fri, 9 Apr 2021 02:08:35 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 1/2] media: zoran: add spaces around '<<'
Message-ID: <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617912177.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added spaces around '<<' operator to improve readability and meet linux
kernel coding style.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index 71b651add35a..a2a75fd9f535 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -30,13 +30,13 @@
 #define ZR36057_VFESPFR_HOR_DCM          14
 #define ZR36057_VFESPFR_VER_DCM          8
 #define ZR36057_VFESPFR_DISP_MODE        6
-#define ZR36057_VFESPFR_YUV422          (0<<3)
-#define ZR36057_VFESPFR_RGB888          (1<<3)
-#define ZR36057_VFESPFR_RGB565          (2<<3)
-#define ZR36057_VFESPFR_RGB555          (3<<3)
-#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
-#define ZR36057_VFESPFR_PACK24          (1<<1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
+#define ZR36057_VFESPFR_YUV422          (0 << 3)
+#define ZR36057_VFESPFR_RGB888          (1 << 3)
+#define ZR36057_VFESPFR_RGB565          (2 << 3)
+#define ZR36057_VFESPFR_RGB555          (3 << 3)
+#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
+#define ZR36057_VFESPFR_PACK24          (1 << 1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
-- 
2.30.2

