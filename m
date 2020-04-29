Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99B41BD36A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 06:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgD2EGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 00:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725497AbgD2EGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 00:06:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6520C03C1AC
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:34 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t40so241222pjb.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9l/dtozA+v2LD09E92jyBVx1Et6tVYACc6uQt2Rjwbs=;
        b=ckwPvzZpypG3M6GNwn3wnH7BHBZex3S3BbGcyt3rmBZhVnGNU9oHsLaB85h1SpgKBA
         P+mdvn5ZvQh914F9SqfQiEFvOnTSp0BACw34N9dc0gX+Xlm1pHuoS3FRirhTXcw30RHc
         Yfwb+fcLpRcIIt/VOWmJ7wjnd6LW6U57RUa1dqTYt/oyW2zWwww+DDeKDlTsFOZI5TeG
         NLL2KllYYoIM5JI8s5cMtwdHr3J/8tGN+l1KwzBiJJDgVBYZClz3z/Z1Q2TFuBw6JdFm
         QkzA6rBUk2K7MRbeqgFY9Nhe7tS78L54nf7CYqxxGcKFrJ89aHfbK4lmZ4nRVYlE6pdP
         dExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9l/dtozA+v2LD09E92jyBVx1Et6tVYACc6uQt2Rjwbs=;
        b=ntJFvDi4Fvbfl9CcD0Cge/XBLeKGJgwrDddSetggkvz1xeakdC6mtXW3fId8WHtt/x
         kPLZOebQ00VvbUkjvYXh/DZ3Wq43w7Q33Qp1XDJsGxdV1ICpXrYBdWKyKZAyYe5PTwv/
         qsl0FmMGIg290cmiz0c3mIGzNEaEW6Gati0oSIeZeRe0cN75k7UvGWw5G4pbHz3ET5TH
         SaZdP5DSmTD2MW83K2xiNuQKzXXQog/rFlTt3a9wKne4Aqaq7Iz2/hVR7LHw16dikfn/
         DtACV4+euA8IW/uNDyvSrw21QwxZhRVVSI7uFwPeTRPYvDANsqvf8Z91hvx6UELagaYY
         eAQg==
X-Gm-Message-State: AGi0PubO7QKRrK0jl++k1Y2Oz+O+kwFdaQ18MnYZkjtX4I37AO1vOd9K
        0mJMwUp3fPGLOP7Xruf5NCKRt1SIEzk=
X-Google-Smtp-Source: APiQypIGQpR+cJOPyYv7tCRwjN25fATqTq3M3QsxWKHfEXPLufohdc5IOKhBe7GS9SKDtCQF8ghSLw==
X-Received: by 2002:a17:90a:246e:: with SMTP id h101mr863586pje.83.1588133193973;
        Tue, 28 Apr 2020 21:06:33 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id i25sm16103370pfo.196.2020.04.28.21.06.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 21:06:33 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 5/7] v4l-utils: fix compilation with libcxx
Date:   Tue, 28 Apr 2020 21:06:25 -0700
Message-Id: <20200429040627.27859-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200429040627.27859-1-rosenp@gmail.com>
References: <20200429040627.27859-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fallthrough define doesn't work properly there. Use the included
macro.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/compiler.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/compiler.h b/include/compiler.h
index 22fa660b..53d9b7ec 100644
--- a/include/compiler.h
+++ b/include/compiler.h
@@ -1,5 +1,9 @@
 #ifdef __cplusplus
 
+#ifdef _LIBCPP_VERSION
+#define fallthrough _LIBCPP_FALLTHROUGH()
+#else
+
 #ifdef __clang__
 #define fallthrough [[clang::fallthrough]]
 #else
@@ -7,3 +11,4 @@
 #endif
 
 #endif
+#endif
-- 
2.25.3

