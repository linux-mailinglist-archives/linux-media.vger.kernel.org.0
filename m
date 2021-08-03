Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26153DF5EC
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 21:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240298AbhHCTq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 15:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240288AbhHCTq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 15:46:26 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF278C061799
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 12:46:14 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso291505pjo.1
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJ90DUqMvbv4wla/gnl3TcP0CoOTBbniBpXeAQ3Q+oY=;
        b=JP1QQA9eF9nGhWYlu1wCzlIVD7rcEeCW1LCkZGcKWweOZ+z6ldh5xlcm9G8Ym0woaf
         zfR98TGj4DCv32Vs1NQRUblCm/nsus7dh70f5Z7nJ4FCGzfO74S1S3UEHl6uEyBZTzFa
         c/6fESEVSobdWr+EW34Uds+RdcJo+uX2xm0IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJ90DUqMvbv4wla/gnl3TcP0CoOTBbniBpXeAQ3Q+oY=;
        b=tgCa2kBx4gh7PbBpAJBTtONjnnbmVNErxfuu4mH3cjYqT3kBV9einLXhoDVwxNAo7e
         fnsjtxjlXMVwfS/BkWkLbF3Z9dg73BUDdGEaZ/NF/7uY9Cq46AmGJaQ8FfzBWRWPNb+J
         Ds77P8So2/uNv+hqw2fGDQKTN4Czj2un+0oEAvaB/nb8WyVQQfrXT1qVQu7Xq+gZskvV
         o1Y9ctDuF7onMD98UgYDsEgRIaQdWtOqia/tTRQTbnt4INoDj2ZsAVkDjpGWsofI/3bN
         CVQNBD8B+N6Ps3JnPjH4a8ARDxfoGODVuwJNTh+hfVy1x/KjJ53TD7xK/Y/edQmX9Mur
         zxyw==
X-Gm-Message-State: AOAM530nOT0DXuuMjr/03x2lvEB3hJUHweYosq76cg0SskMSw4Bt/RFD
        hjxEt4bzuMs7rBJOpSNG6gbnzA==
X-Google-Smtp-Source: ABdhPJxyF+4OgHXelOOHSdp4vUz34rcph+Yrir0NAkIpf0Ugk6o/kaC4Wumt1elOVq36LLK0j+xGbQ==
X-Received: by 2002:a65:4244:: with SMTP id d4mr981837pgq.83.1628019974268;
        Tue, 03 Aug 2021 12:46:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id jz24sm11359353pjb.9.2021.08.03.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:46:13 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH 2/3] media: si470x: Avoid card name truncation
Date:   Tue,  3 Aug 2021 12:46:09 -0700
Message-Id: <20210803194610.326030-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803194610.326030-1-keescook@chromium.org>
References: <20210803194610.326030-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; h=from:subject; bh=pk5S9HyUZuKFzWnjx5RWPHnxnnea4OwXR05+OF0bTmo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhCZ0B3xXj+4dTzAtDK9PitipXlqRzSf3d5bls5vkI 5KZ65k6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQmdAQAKCRCJcvTf3G3AJjsbD/ 9xaSsEGzVMifCJSncpaC0EkQ43SYFaN0uvajKxkhZQRFy6xlEZ4DISJP+Q5+oBi0JIEWxBAlKpLATD lj+SCgsY6BBF9WvPPi2MlRJtDHYGuMq7VZsmvRxlbB6+JEjkoZstlORxbCigzIzpv8bVxkmHfvrx1r VgQ12cg4TiPiQ7DI72GOD0IWbCMGWtxEmAWbiDYFexL6Y7CQ8kcVrU6x9vfmfHfulyYP0/eB1+wm6U gf5+q9ExPo12lNNQHLPKUn3Ak65InydAbBNZRLQ73nklaOdAqXXPvsQHwLZ/6P9ZFIH35QwDaX8jhM vUAC9akCqbJDLrBea56Ggjc7bPNKjKHSv/eukA0jIV68sXD81P+kwC6I9TM5v1VXHbMGKvxfyRh9NL KpY/yJjFAPi4v/eaNyKaY6iIZEjlszIH7UdZebv4YKXlrk/u26pzxPr/pNpygWeg6NiZqRbvOrbqC6 W0L/f8L2QwSoGE3//ghjGSgwm6vcLh9AW0d5zjNxRA09CpYxqzDa/WJauSUCUxwmM2l20cQijuA4fr Viixe1QkB6WB6xMAs/eKWsqvA4ItQbruKuApFqiekGI7bkQcxiWPPuxZSREJbqq1SWBjGbdAVfJ8bK 6t+oxgqAc/JWGSEW8S+gvMNmksj839lbi9PRvN40rkNjNI8mlgutS0daCXOQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "card" string only holds 31 characters (and the terminating NUL).
In order to avoid truncation, use a shorter card description instead of
the current result, "Silicon Labs Si470x FM Radio Re".

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Fixes: 78656acdcf48 ("V4L/DVB (7038): USB radio driver for Silicon Labs Si470x FM Radio Receivers")
Fixes: cc35bbddfe10 ("V4L/DVB (12416): radio-si470x: add i2c driver for si470x")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 2 +-
 drivers/media/radio/si470x/radio-si470x-usb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index f491420d7b53..a972c0705ac7 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -11,7 +11,7 @@
 
 /* driver definitions */
 #define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>";
-#define DRIVER_CARD "Silicon Labs Si470x FM Radio Receiver"
+#define DRIVER_CARD "Silicon Labs Si470x FM Radio"
 #define DRIVER_DESC "I2C radio driver for Si470x FM Radio Receivers"
 #define DRIVER_VERSION "1.0.2"
 
diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index fedff68d8c49..3f8634a46573 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -16,7 +16,7 @@
 
 /* driver definitions */
 #define DRIVER_AUTHOR "Tobias Lorenz <tobias.lorenz@gmx.net>"
-#define DRIVER_CARD "Silicon Labs Si470x FM Radio Receiver"
+#define DRIVER_CARD "Silicon Labs Si470x FM Radio"
 #define DRIVER_DESC "USB radio driver for Si470x FM Radio Receivers"
 #define DRIVER_VERSION "1.0.10"
 
-- 
2.30.2

