Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954F23649CF
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 20:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240973AbhDSS3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 14:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240963AbhDSS3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 14:29:20 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4D8C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 11:28:50 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g17so41230215edm.6
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 11:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QH9AgWaRjdPrEO5slePTmYX8PyS//EZCHSA9zq4bEuQ=;
        b=XMyoycoEBM9xnSJxPW6TfTEnPL0otMOECVJx3jZmvVHZ6GdtZtYGDgwBh9g/sdbE+9
         PeNcaBm8CWQhtKCcGH01kg/dTqaOxbBwH5i65ozzQItFD/Vv3oTfbMBl5yRdOGqV2H0u
         2bUcMwPwiXc02wsOLP90tOyHS6uBbOzmnbuUkxmqn17RsJi377i/odYQ/EzwXBjWdTiu
         gZq41s1PPMbD3T/BTgIoq3jW5zyOVrTVP1AvuCyeXFpMJcgetE/mu917umxRP7dyJT9b
         4LPaBGUepHSOpXYdiFJ2/AF7q8pZXLLww5SogmmoMKfaobnKf8LTXKUjp3Gi8hrY8hA7
         0iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QH9AgWaRjdPrEO5slePTmYX8PyS//EZCHSA9zq4bEuQ=;
        b=NNRpn0FEbCx9+PpuEzMY8bq4D4dq0pmxeMeCwTfw77pWn1eQxnWOjXPGjMjgq9qGtj
         m/zi6OgdNvdKWJPqo4VGUj3436JikeANbxYTWzHM7RSgq0AFUjNWx3SRDPy+WNqPl3nr
         DIfFepAW1cusJedAebuP1JKZlRLxnIDCrHBI7ZWDMCfZIZDqKh/wTTMN0/DjYJVnMxZx
         9PEfS8uk44VbN4AnIOdz4EfgobkYr9Nqsb8vUaL6TKGuWnIB87UWoD9dh3J9Xls2kX8B
         nx0UpFBHo5JXUe4L6NNkDTZU8w3IRVTVj1Jlvm+mQDcYd1kiDylCnOpqDUnI0Y8KCbRO
         eiKQ==
X-Gm-Message-State: AOAM532UBDwd7WgU7q4JxF4Q7cDSIXvCI7iYOKKLT2eixxdHNKjUWBmW
        70OPIMp+9minTjZXP9ekZtYp+tAzmz1rp2Yj9LE=
X-Google-Smtp-Source: ABdhPJws6UPHIYzzzXwvdHiInugGCMRhykt1J6aJrmgaLDAq6KWBK1X4tAHc4+xaWaLTwwfptCfZoQ==
X-Received: by 2002:a05:6402:11c7:: with SMTP id j7mr9218039edw.119.1618856929488;
        Mon, 19 Apr 2021 11:28:49 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id s11sm13783060edt.27.2021.04.19.11.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 11:28:49 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH] configure.ac: Resolve GIT_SHA even if repository is a submodule
Date:   Mon, 19 Apr 2021 20:28:32 +0200
Message-Id: <20210419182832.577010-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the v4l-utils repository is a git submodule the $(top_srcdir)/.git is
a file and not a directory. Update the shell check to allow the test to
pass in both cases.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index f144a50d034fbda0..4ac4195cd6e4747e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -588,7 +588,7 @@ fi
 CPPFLAGS="-I\$(top_srcdir)/lib/include -Wall -Wpointer-arith -D_GNU_SOURCE $CPPFLAGS"
 
 # Obtain git SHA of HEAD
-AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
+AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -e \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
 
 # Obtain git commit count of HEAD
 AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])
-- 
2.31.1

