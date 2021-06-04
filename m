Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3E739B124
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 05:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhFDD4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 23:56:05 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:33498 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhFDD4F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 23:56:05 -0400
Received: by mail-pl1-f177.google.com with SMTP id c13so3998801plz.0;
        Thu, 03 Jun 2021 20:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9+tmTJNGcF6M3mRljGVDt2TMOsVdljImLS1LclZiyw=;
        b=ANR8PHWq0N+nc0guvinvEI8ptKu9z+tJp2xC9jV5srhvU3pe5TRYF9BmCMiLRdLDin
         vryG9BcLerQp/vlkhM48rQgl2xKmCoL/Su2thihNSIoKh9rd7FUWr9Cn2IMVxW+TXjW5
         jto0knyoBsfa1G0s14pjirUv2crSVDhvMpuqDohqj/t6Jyu2pDTdB6Hc3/5GTCNRixGN
         QR7D60eAWhfUDYtxwhDZmpgw++HxH4IaXWfLXzT+NZIIRZImKZTOOUkFEqHheKkETAlG
         vpleR+F9DevjBfqP24Ir/f4KveCuy/nT5HOkqtnw7PWt3f6vowPP8TdBJ2KXTToyDpNs
         63mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9+tmTJNGcF6M3mRljGVDt2TMOsVdljImLS1LclZiyw=;
        b=ZnXHmrTt1fknM2NDlgiqmYS9X/3ZH3kdKxBF7TYzjd/2DZzRNT7s9Dctzd+lhuYDYv
         ylhLKj90SaNld2B2XeH2haseV5KqUwizS5C2uT5Z4yrtLipuzwHSVDME0JGBnn+mo+CR
         297LnqoWmcJ6zpJi2Y5pwfxiSP3WhkYpz8CIaPr0sXhE+Kexolv2WjZmPuyHcGQwkX0w
         n6soc/cqjqx0W6zOMdUQK3UA71vcnECRpDzCpBYCt9eDbm6iMT6t+12M0tWfr6V4kXQl
         0qYZDOjHvsDK3SLq1hE2wwtV1Ee/GBue5qlig/3HtCDYyYOpOMj62z4ILGUOdODWpuW2
         WSWg==
X-Gm-Message-State: AOAM530MrpVfPFKN/9mRpalpA6bUMSsSENwvFiMTk8ap0QoSb+ovW/Ku
        aHgV2uzyKgdSWXjWte+An0BObVm908VhOg==
X-Google-Smtp-Source: ABdhPJwXjA7hR2ZrZqsOStmJ7blveJarZ0g0Zrxd8d96F7jdMZgXTTN4XUz1et9o7Qu17i8mNUaupg==
X-Received: by 2002:a17:90a:a794:: with SMTP id f20mr14625618pjq.195.1622778787102;
        Thu, 03 Jun 2021 20:53:07 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id n129sm442859pfn.167.2021.06.03.20.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 20:53:06 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mchehab@kernel.org
Cc:     anton@corp.bluecherry.net, andrey.utkin@corp.bluecherry.net,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        maintainers@bluecherrydvr.com, Herman <yanshuaijun@yulong.com>
Subject: [PATCH] Signed-off-by: Herman <yanshuaijun@yulong.com>
Date:   Fri,  4 Jun 2021 11:52:46 +0800
Message-Id: <20210604035246.1260-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/media/pci/tw5864/Tw5864-reg.h: fix typo issues

change 'syncrous ' into 'synchrous '

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/pci/tw5864/tw5864-reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw5864/tw5864-reg.h b/drivers/media/pci/tw5864/tw5864-reg.h
index a74f30f2f78e..2dd4413359df 100644
--- a/drivers/media/pci/tw5864/tw5864-reg.h
+++ b/drivers/media/pci/tw5864/tw5864-reg.h
@@ -663,7 +663,7 @@
 #define TW5864_SYNC 0x8008
 /* Define controls in register TW5864_SYNC */
 /*
- * 0 vlc stream to syncrous port
+ * 0 vlc stream to synchrous port
  * 1 vlc stream to ddr buffers
  */
 #define TW5864_SYNC_CFG BIT(7)
-- 
2.25.1

