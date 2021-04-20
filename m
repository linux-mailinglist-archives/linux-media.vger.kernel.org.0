Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793A936538F
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 09:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhDTHwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 03:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhDTHwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 03:52:45 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21C0C06174A
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 00:52:12 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r9so56825356ejj.3
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 00:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUHYtqVAAFSxrHPv0XZjl0Nrq6XPonfIdz/I+Iq0zxQ=;
        b=Lco6PQ6VYBsMakn8d39C4ByoHvDf+toUxvxfQ3QrymkEcYlw5daW0gdiTl+XESxyf7
         +bxxQMlDrbG4Vly6ZB/Xxx9gG/MtYg16sg70H4MvvBelgSXM0fFWNTcnPvnGNF2ZBEdz
         b7HEpwLqKfQE9SUVXwteft9pXMrUvsOksXYKA9Qj2UHfoFWsZ5u6nNLQC57UXsJCoO1F
         Ge3QKYMOWoKIfoMTbUTkEqLwsrI1ZU3rOwml2GCUvCfPXY4wKC/HI9Rkn+BveBUI7X/a
         HbMP8SYqQlkmoqNXfhCSIRG1M4drFTZbwke26YeE+Fa+Ur403UMcoy9/753k5L/8NNTf
         0QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUHYtqVAAFSxrHPv0XZjl0Nrq6XPonfIdz/I+Iq0zxQ=;
        b=BPU5Lb5BHNMWQHTtqpHQVJ6KC9ZS7rYupaziM0igo7LvIV3hoRAiAgvN2gdiLk2UCv
         85mcQ8EEBBCW9e3aFgMXh96EBBz7j8V+0OfDI3mmiLeO4gvc7RfKTF56dvr9vElHLrui
         9IrHNljbDfpo2Er72eJDAlStDG2E5wB61ZncWId51/34Xue74d7WHBeOYiaqXhD82oTP
         eydjnmR/dnZT/PvYfeG6lI85D2K8fRIuJ7gqh7XprOfLLphN/zFbIccIh9L/OMk78M8T
         2ueWxnBJLvTtGwKilvvs4OX/5B4qp7Yo64KMEX8X5gKkVpwl+vrn6jbEbkOjnRrvIIBQ
         oeSw==
X-Gm-Message-State: AOAM530qNjnNx01joDCV6euB2FvNKPBtDwNkZmuTgO3R+luYI9kqNZAy
        e+KqaJQdhRginwZhmrdpxA8jyQ==
X-Google-Smtp-Source: ABdhPJwq9hDmR7yzvknWESFHRnQ2egamWft9ttfK7kATozjO8WBdsXxJhBTWTUjYhzv7NmpHtjKcSg==
X-Received: by 2002:a17:907:6e1:: with SMTP id yh1mr26334142ejb.486.1618905131511;
        Tue, 20 Apr 2021 00:52:11 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id w1sm15267481edt.89.2021.04.20.00.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 00:52:11 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH v2] configure.ac: Resolve GIT_* even if repository is a submodule
Date:   Tue, 20 Apr 2021 09:52:05 +0200
Message-Id: <20210420075205.1072315-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the v4l-utils repository is a git submodule the $(top_srcdir)/.git is
a file and not a directory. Update the shell checks to allow the test to
pass in both cases.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
* Changes since v1
- Add fix for GIT_COMMIT_CNT and GIT_COMMIT_DATE.
---
 configure.ac | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index f144a50d034fbda0..8710ab4531162d03 100644
--- a/configure.ac
+++ b/configure.ac
@@ -588,13 +588,13 @@ fi
 CPPFLAGS="-I\$(top_srcdir)/lib/include -Wall -Wpointer-arith -D_GNU_SOURCE $CPPFLAGS"
 
 # Obtain git SHA of HEAD
-AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
+AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -e \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
 
 # Obtain git commit count of HEAD
-AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])
+AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -e \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])
 
 # Obtain git commit date of HEAD
-AC_SUBST(GIT_COMMIT_DATE, ["-DGIT_COMMIT_DATE=\$(shell if test -d \$(top_srcdir)/.git ; then printf '\"'; TZ=UTC git -C \$(top_srcdir) show --quiet --date='format-local:%F %T\"' --format=\"%cd\"; fi)"])
+AC_SUBST(GIT_COMMIT_DATE, ["-DGIT_COMMIT_DATE=\$(shell if test -e \$(top_srcdir)/.git ; then printf '\"'; TZ=UTC git -C \$(top_srcdir) show --quiet --date='format-local:%F %T\"' --format=\"%cd\"; fi)"])
 
 AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
 AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
-- 
2.31.1

