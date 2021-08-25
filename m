Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28B83F6C95
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 02:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236583AbhHYA0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 20:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbhHYAZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 20:25:58 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD1DC061764
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 17:25:13 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id m21so25226603qkm.13
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 17:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ANXgq7I+Kfs3G3EW5qqi7r/ttOA7bI0HweQUsRUv3dk=;
        b=ZjSwu0cl3qEfdJymDqUezMTnF3slC6OhdfEpaFdDPaDguthmZG/GNTLa5DzfHsgM0l
         3qfIxU9H0UZb8w03z5Lm/l/MGuuPeKx9oYgwY6+VyQ8PaZLholNcc84m7JRxfi0J8IUi
         vTkHjW9fog6LuFlCcfwUb6xcc8TmTiW9VOUzwPoXla0dtsfHwLYTeVtP1t6slUsNFuJc
         CL6mN3Bc4GlUJb6PWQezC7N1UKxL8dWh4Asg4V/ZHapcbCxuXfMhqW26mrHSgN3v/3+4
         vyTnDNNACmhn053E52srwfo0ooYwfBzFKZf2G4D4Rcf/AjmeecuoFaXjHDT/QMS5BZcH
         HPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ANXgq7I+Kfs3G3EW5qqi7r/ttOA7bI0HweQUsRUv3dk=;
        b=h8IdS8+CVhyQaY7oSFIgTNORKlKy//wnKgzrSlFCb40SNRTBB65ss6xJ3dQIOBDhtG
         kpYK1Gc5P9qulWYpA2rL4VxZhwdLuHAqEjzE1+qkripxZVoqT4J3huNgqCyVIvtr71df
         dg9TbGhLqNvlpgZ/Rq5qV633JkfHOTZ+gRl/Q0LyK7yUPSF/nAAaFfUBuvHoKSA6bsPp
         WifhHflgg4j5VKP6YqSK5mTtKpzNXYxgvfw1QrEa81Mk5Qx0hei0ZItlYPeUNfPO3xBE
         ynlUP0ToSoqtQm4bY60T5iIr0Sw8B5vUkdu/4yVcQJ5/w2c+QQx9FOxp10dauv4XWxri
         5dEw==
X-Gm-Message-State: AOAM5327X1Wosq8w1NEno/2DMAM1QoLwsc9fACAUrCbo7FHyS6NKbZb9
        mF5EKkWO/5T6UdeI8/A7NDbMmqZEt2Wp3Q==
X-Google-Smtp-Source: ABdhPJz7iGo0dcUaTNUt15qfQDGTaS+1yrc7YhOmadg2z9sjI0e29wWm8boa+jvcSddXCpm9ikHUmA==
X-Received: by 2002:a37:b7c1:: with SMTP id h184mr29883530qkf.65.1629851112111;
        Tue, 24 Aug 2021 17:25:12 -0700 (PDT)
Received: from localhost.localdomain ([190.2.102.85])
        by smtp.gmail.com with ESMTPSA id d7sm9443191qth.70.2021.08.24.17.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 17:25:11 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] media: Request API is no longer experimental
Date:   Tue, 24 Aug 2021 21:23:37 -0300
Message-Id: <20210825002337.6561-1-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Request API is currently used and specified as part of the
Memory-to-memory Stateless Video Decoder Interface [1].

This can now be considered as non-experimental and stable, given
the decoder API has been used by products since a couple years,
supported by several drivers and userspace frameworks,

[1] Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/mc/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
index 4815b9dde9af..375b09612981 100644
--- a/drivers/media/mc/Kconfig
+++ b/drivers/media/mc/Kconfig
@@ -16,13 +16,5 @@ config MEDIA_CONTROLLER_REQUEST_API
 	bool
 	depends on MEDIA_CONTROLLER
 	help
-	  DO NOT ENABLE THIS OPTION UNLESS YOU KNOW WHAT YOU'RE DOING.
-
 	  This option enables the Request API for the Media controller and V4L2
 	  interfaces. It is currently needed by a few stateless codec drivers.
-
-	  There is currently no intention to provide API or ABI stability for
-	  this new API as of yet.
-
-comment "Please notice that the enabled Media controller Request API is EXPERIMENTAL"
-	depends on MEDIA_CONTROLLER_REQUEST_API
-- 
2.31.1

