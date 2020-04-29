Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B6F1BD36B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 06:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgD2EGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 00:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726682AbgD2EGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 00:06:36 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A35AC03C1AD
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:36 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a32so245760pje.5
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i9F+VILKuKQzBhdWosNT7FkUiuGdeB/n59N+2U3pLeY=;
        b=pTLvEqusqe5jtGTFdCAxaNnNgO5M32WuOM0qD48zw6HjVVJAIKC8YnoA+DET838MRI
         It+WZ9zLIhXVC5vN8Dc2Q52XqXAQUj0CnerT8CYaavm8q+jQgLbgR1Ruv67p5Z3ES8ux
         HKjTbQvPf0DBzMpZ8//QtjHIQfUS2cR3VNfUgzo5pAHFR15udGXDbOsjA6CIgCBBjwlZ
         AM7SmnnejG2wedsCfLvgXmR4ng43aI86MrTr1BNDcuKYy0pSF6+UqXIrBn3YZ9UvjO8Q
         NeQusOtH96Xp9kLV43FBNS7yPVC2OXogoeP4hWMyytAsrBQSqKEpRtA3HuKjjkpJ0FD8
         qrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i9F+VILKuKQzBhdWosNT7FkUiuGdeB/n59N+2U3pLeY=;
        b=V2D7/IvrbGy/IUexg57a9WUir4aGV6K9c28acnvULEzmVNh17oJ373MA/dvzasTzlD
         2wyhjSkco202QtLlQICps+oBcHlKKOTqkaRxx32bVGxm/lAv5+/CO3ysdI8btEg3OL01
         m0MdgWJ6dnvNrqy3hSFv8slsUgyOaP6Yosk5PkZ6nbpyHIyouHtyLhu7GbjidqceAdkQ
         Z+5rcWiBGCkb35JlLr3T01BxtwiGu4/2DHKBmpYhsU8iK1BTOa6qBwFDsr+RXlviw0pJ
         wiLkHvINjFgzvCsQJPPR+OgLT4VL0zxxoLQ+YxFXk86rYJmi6GNwsE2fDV+3hPs83aG1
         no/A==
X-Gm-Message-State: AGi0PuZF4866t7EcSPBpx4pi3qRC1Df4/iDsplFezD9AgBhpvqtagAgF
        EoUBJ3lJmRFthnkRzoTZhVOy+lHzfyo=
X-Google-Smtp-Source: APiQypLcaUb5jYCicYsLd8hzZXVZJrMsw1fN4Dcgv5maI9A7EeHexUbgzaS8tp0XDhnGFRB6lytjhg==
X-Received: by 2002:a17:90a:4e81:: with SMTP id o1mr787028pjh.161.1588133195017;
        Tue, 28 Apr 2020 21:06:35 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id i25sm16103370pfo.196.2020.04.28.21.06.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 21:06:34 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 6/7] compiler: fix compilation with clang + std=c++98 + glibcxx
Date:   Tue, 28 Apr 2020 21:06:26 -0700
Message-Id: <20200429040627.27859-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200429040627.27859-1-rosenp@gmail.com>
References: <20200429040627.27859-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It seems clang does not like these attributes in c++98 mode.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/compiler.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/compiler.h b/include/compiler.h
index 53d9b7ec..5ad54f41 100644
--- a/include/compiler.h
+++ b/include/compiler.h
@@ -1,14 +1,17 @@
-#ifdef __cplusplus
-
 #ifdef _LIBCPP_VERSION
 #define fallthrough _LIBCPP_FALLTHROUGH()
 #else
 
+#if __cplusplus >= 201103L
+
 #ifdef __clang__
 #define fallthrough [[clang::fallthrough]]
 #else
 #define fallthrough [[gnu::fallthrough]]
-#endif
+#endif // __clang__
+
+#else
+#define fallthrough ((void)0)
 
-#endif
-#endif
+#endif // __cplusplus
+#endif // _LIBCPP_VERSION
-- 
2.25.3

