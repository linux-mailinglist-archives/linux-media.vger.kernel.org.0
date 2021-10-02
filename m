Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED0141FEA1
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 01:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbhJBXUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Oct 2021 19:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbhJBXUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Oct 2021 19:20:09 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7986FC0613EC
        for <linux-media@vger.kernel.org>; Sat,  2 Oct 2021 16:18:22 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id a73so10001285pge.0
        for <linux-media@vger.kernel.org>; Sat, 02 Oct 2021 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amikom.ac.id; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wqFw2hPWBzL/6wM3Yf8mXadq/oh65HiCzw31MXRMl8=;
        b=OfAOnhIwRrNibniln0v2IJlgQDSmjKkJSNE9x8mt3I93ywrs5vpLKcof0GwnZN7NQ2
         MumgkJSj8/MPnuCF2xzGVpnhb8LEvyrZ1kUg97YKK9nGyblOamZy5JnnhXjJPHUzD7P1
         TXSASkuramWlAl4at48FmI5RyhARXm8qMlnifYqMGUFwxrQ06Iwuyl7WPfbtfqIruSSI
         nznkN1r3hm6siDl3Us4TX4aGhCOaEeWuL5Ea1vyj0DcrJQSZuy7NJdJ/OccaDawELS55
         yljQkHuhkYEn/2a5nbsOBvjdo5Asuq1TQUsquwoqTef6t1y4vrssbRdyKMrEyFOKN+yz
         cGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wqFw2hPWBzL/6wM3Yf8mXadq/oh65HiCzw31MXRMl8=;
        b=aM/Z1yvLwHeIJr6uMwY0ZY8EOe4sfo+RJYq/ASTmdDytvvxkunaZ60nw2K2s3VQn0t
         14pHylnH0v+/ND04wUdOML26ALQD4k6MrFfNGD7LEzjnvG5SHnS7c4s8R7iFRu+LwG+1
         vNHmw75VUnseVRhQFnKPUjjtw8r8wKo57AuXF7T18lEW32RsAVThnvMOKggGdeo+r1U/
         4u23cytDOdd78QjXPTu5O48BzGI8itQMoTpEZayCtVuNsLbAyugjGOGF8pCZwtrduz0n
         PutHlMkQZFEr/bQ8PM66oDhJn/xQ4NsXwfLgUtFHL18Mw2BXQNpDBfz+uJLvaSh/gvZl
         hBAQ==
X-Gm-Message-State: AOAM5311u6ir5clMKfTqpd1uewLaA/BheU7/syWIeUJekVX4EyMKXFat
        m/+CaKVl6KRn3ilxG2EY9vW24M8pJRBMS4JV
X-Google-Smtp-Source: ABdhPJyfQC43Mwjmccd3TpJmj5a3tTym10SC7M5P7R8+ogHeLCSWZ45GTq0SHoyTXDhRrO44jZKARA==
X-Received: by 2002:a05:6a00:98b:b0:44b:df34:c17b with SMTP id u11-20020a056a00098b00b0044bdf34c17bmr17470228pfg.34.1633216702038;
        Sat, 02 Oct 2021 16:18:22 -0700 (PDT)
Received: from integral.. ([182.2.37.211])
        by smtp.gmail.com with ESMTPSA id k17sm5928989pfk.16.2021.10.02.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 16:18:21 -0700 (PDT)
From:   Ammar Faizi <ammar.faizi@students.amikom.ac.id>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ammar Faizi <ammar.faizi@students.amikom.ac.id>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bedirhan KURT <windowz414@gnuweeb.org>
Subject: [PATCH] media: atomisp: fix `-Werror=return-type`
Date:   Sun,  3 Oct 2021 06:17:23 +0700
Message-Id: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bedirhan reported build error:
```
  drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
  drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
   1649 | }
        | ^
  cc1: some warnings being treated as errors
  make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1
  make[3]: *** [scripts/Makefile.build:540: drivers/staging/media/atomisp] Error 2
  make[2]: *** [scripts/Makefile.build:540: drivers/staging/media] Error 2
  make[1]: *** [scripts/Makefile.build:540: drivers/staging] Error 2
  make: *** [Makefile:1868: drivers] Error 2
```

Commit 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp:
remove useless returns") incorrectly removed a required return results
in the above build error. Reinstate it.

Cc: Pavel Skripkin <paskripkin@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Reported-by: Bedirhan KURT <windowz414@gnuweeb.org>
Fixes: 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp: remove useless returns")
Signed-off-by: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..1bd917e81743 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_channel_sensor(
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
 // Test flags and set structure.
-- 
2.30.2

