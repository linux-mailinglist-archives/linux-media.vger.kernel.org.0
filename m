Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3003649A6
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 20:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240736AbhDSSMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 14:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240661AbhDSSMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 14:12:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61B6C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 11:11:44 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id v6so53063149ejo.6
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 11:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTaeu8T5/93R/wZbECMlHzMu3e7CcUa8/RLbinoCvVs=;
        b=jZ5sSym/snSpxhPaAScyhUfcoOmWsXnuRKKM8xSit8v0R17JYCBTdOhjCfq2++IzKO
         oEat0VbR27MuwuMsQ4JtSgTQuhhIY58N0Wl2mzrCgumvKAz8PmsqE+xtRDJ6pHTfTBsP
         LhYHAXfBmdzi7QYXXEuydQ6BRAgh9Pb7wKBOgdXe3/mRY2qGy/J5Y+D8TzPNuOb0z2yY
         J2O5+vuiHvs1RBosEhrHnW70zGsDivv/IbuGIK+Xs4kMcJEzk7f8EID/GpsAINlwL873
         lQJHJCSCiXtKerXUrMS9MDlI6BFvQz3emP6Qk2/YnWHTAIbWNTeKygZBjmJTSVX+L+0G
         i5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTaeu8T5/93R/wZbECMlHzMu3e7CcUa8/RLbinoCvVs=;
        b=db+nl1gusecHQBaBYF4HUNgik/OKMtEZi8wxninLUYEszLgoLOU7XcZpablx1Wi+HV
         pabaB18CjwFTkdtJK5Rf+mfssLQY+NuqRo5gSQIZjqn+i6TitjI54h7V9B/oN7UTv33A
         9Z5nS1O8tsl9vR3YcxUqeJl0z72MvPVNC51MJyTh0c6CA9Ar3l9KWZqnt8izWeg3u0lr
         Ikh0jwAHhQCH2RCBigr44zyLlLLlpp4h+PBe/f8bqAcFezFkZBs56wf0A06vs/Zeh3xO
         TA18Xkk8SuxXPxm9o4qUDe3eh9D8wiA60Q/FzYdK9OvHHXz0/lQTIC3pCjm+6J7EYDMd
         +PiQ==
X-Gm-Message-State: AOAM530NUySfg86ll2Tdqe6MSxLtr+yQM++8Yj3om1i6rTdD+7OlNfw2
        Id7Me3nVeKwe7rm7n8faZFXhbw==
X-Google-Smtp-Source: ABdhPJxQleLF5lv6WUtsubFSg4zEoovtcn6G3H2AKMNATKDV3rgsVFaJpoWWqXTgHRjo/HbU8ReZAg==
X-Received: by 2002:a17:906:b1d9:: with SMTP id bv25mr22642338ejb.230.1618855903569;
        Mon, 19 Apr 2021 11:11:43 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id c19sm13363087edu.20.2021.04.19.11.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 11:11:42 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH] configure.ac: Fix building without libudev
Date:   Mon, 19 Apr 2021 20:11:07 +0200
Message-Id: <20210419181107.566469-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the addition of the --without-libudev option automatic detection
of missing libudev have been broken and fails with,

    configure: error: Package requirements (libudev) were not met:

    Package 'libudev', required by 'virtual:world', not found

This is because autotools macro PKG_CHECK_MODULES action-if-not-found
behaves differently from most other macros,

    As most of the original autoconf macros, there are boolean values
    provided, for the cases when the check succeeded or failed. In
    contrast with almost all of the original macros, though, the default
    action-if-not-found will end the execution with an error for not
    having found the dependency.

As the AS_IF check following the PKG_CHECK_MODULES prints a warning if
libudev is not found the intention can't have been to fail configure if
libudev not found. Fix this by setting have_libudev=no instead of
failing due to the default action.

Fixes: 49316dc21f806d0c ("configure.ac: Add --without-libudev option to avoid automagic dep")
Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 8470116df4b13311..f144a50d034fbda0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -299,7 +299,7 @@ AC_ARG_WITH([libudev],
 have_libudev=no
 
 AS_IF([test "x$with_libudev" != xno -o "x$enable_libdvbv5" != xno],
-      [PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, [])
+      [PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, have_libudev=no)
        AS_IF([test "x$have_libudev" = xyes],
              [AC_DEFINE([HAVE_LIBUDEV], [], [Use libudev])
               LIBUDEV_CFLAGS="$libudev_CFLAGS"
-- 
2.31.1

