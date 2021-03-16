Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B76133CEF8
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 08:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhCPH45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 03:56:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37576 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbhCPH4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 03:56:32 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lM4Z5-0006SP-C8
        for linux-media@vger.kernel.org; Tue, 16 Mar 2021 07:56:31 +0000
Received: by mail-ed1-f72.google.com with SMTP id i19so17281448edy.18
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 00:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jeu86JaIUAOt2lkwOFI4m9LQf3S54ODIpa4kLZOARnM=;
        b=Qz77w3uJT/YjU/96Uu+InqHGJz5mdG2/8RQt1RNkzX/dX3AWAgHXTo9wJs51zpKS4e
         A9k6BtihxaIHJf/FPvgm1SCyHkYpirb5p8HBbXfLWiFhDxpPtOddpREeIzzJj9SHYhEO
         7jihNS7f3hfKhxPVRuEU9Oqf0PyydH1yQA2TjzB+fvLqq9osBfoPnewdDmw1Q00PTe+b
         Sd20dU5UW6rCmmhGRnrFJ1HKmaW6xHHm/T0xgrWnRvmXOw0vShF4tpuaWmUutQUJTTol
         CwjQuqkO0lSaAVHc3WeSIvZhVirK0OCqgHP+fWyupGhH7rV3Qhf80+Cx1ZBoDnqmcSeK
         DDEw==
X-Gm-Message-State: AOAM5324e91htadK3ncVaZgRZWEWzFi6NOeJVBDcD773r8opxj7PjN7f
        xeBcDuLwi84/Me5i53yNIPlncYJ4g4b+IfTs6VF2MTo/M5kCKtGtki/AFJEYK2yu9+82Gq0lsSJ
        dh+rLAdSnLkOAqqRKySE+/hSQEN4axAG2AnCPHNDN
X-Received: by 2002:a17:906:1b42:: with SMTP id p2mr28178014ejg.236.1615881391095;
        Tue, 16 Mar 2021 00:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSDWwhSMlE00SSQ6Q68j5cirvJIl8Apo64mYMNnE60g83O/scEiUPyZS5hkkQ+6/Z3THDjqA==
X-Received: by 2002:a17:906:1b42:: with SMTP id p2mr28178003ejg.236.1615881390996;
        Tue, 16 Mar 2021 00:56:30 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r5sm9725026eds.49.2021.03.16.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 00:56:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RESEND] media: atomisp: do not select COMMON_CLK to fix builds
Date:   Tue, 16 Mar 2021 08:56:25 +0100
Message-Id: <20210316075625.10382-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

COMMON_CLK is a user-selectable option with its own dependencies.  The
most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
should not select COMMON_CLK because they will create a dependency cycle
and build failures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/staging/media/atomisp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 37577bb72998..742edb261d85 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -2,9 +2,9 @@
 menuconfig INTEL_ATOMISP
 	bool "Enable support to Intel Atom ISP camera drivers"
 	depends on X86 && EFI && PCI && ACPI
+	depends on COMMON_CLK
 	select IOSF_MBI
 	select MEDIA_CONTROLLER
-	select COMMON_CLK
 	help
 	  Enable support for the Intel ISP2 camera interfaces and MIPI
 	  sensor drivers.
-- 
2.25.1

