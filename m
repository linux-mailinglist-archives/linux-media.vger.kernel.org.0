Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A68291265
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438350AbgJQO3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 10:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438346AbgJQO3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 10:29:15 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F120BC061755;
        Sat, 17 Oct 2020 07:29:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a72so6164531wme.5;
        Sat, 17 Oct 2020 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YVQnjhnO3hPEHey+2a/NsTVt2kt0i3WZ2OmRQGb+eEU=;
        b=lPz4OrDNKkJKRGbxIKA86ZwUlRZGmluEv4tikHtZVh0Z/EQdien5qZyTMYb/73ZwEM
         la/V7M84Xe9V7Kc90euTFPV1Fs6TrEjr0y3OVmO60jU3/1yj57osqvVeIKP3UKZQTegn
         RtEMvOnw0UmHuH54peCQZymCg3LQXIIgLMbUAY0FjZ9g/Sg+BMAsOBatBmBpCFDZQp/z
         NAlSAe/mmm5ZXNoMxTRtcWU11TTt6VW0KyT5eooRv6PSKJ/0GsaUpLv9AN7v29Auhrd8
         BERIfdAzMKLweDxv4rEunjcledmnXGeC4bPAzGPNW/1P5yK0MB1nsP33iANR7j7fahzn
         VBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YVQnjhnO3hPEHey+2a/NsTVt2kt0i3WZ2OmRQGb+eEU=;
        b=eb3QmLyiz7IBk/wOC9yUwEFP7DYcEfNdGyDQFwG9wrAlNX36BBdBuG3zUfqTnuI3rV
         +4VaT8TNjsGXwa1cxXmj4Qo15HXduLOFHEPU0jzee5tTw/A+LayIPBKt0YLx0Le+rFVQ
         V4yDFJbDET+GvCP1aPTclfW2plAoK0K90EL1MSAS7TqLtlycTloZuYcUrN7NVxI/sVfC
         +QteJJNyj21ZMLnmqxYFxon6ycyXXjnMgge0D2SKT2p4Q31Jjf7DS7s8I5FZhUcwwJQI
         sgxQWpjUW46UCawgEHHe2eM8ihM8NKi4MboCCW/n+sLu5uYFO4lgOI7sjv3I/k4mTMAr
         DbPw==
X-Gm-Message-State: AOAM5313I28hg3sBekd96u9S+MYURWsAElDqljt7bMZht83h7ARJTm7d
        R51kmMlR/EuDSS2lRddyDYOMdos3wACmDQ==
X-Google-Smtp-Source: ABdhPJyecMC7VKYn9/3RgFi8oaYY+8gX1km0A2OJxjhdLdLiHBiocHr5Hr6rQWe0HVVYhH2XtNtVnA==
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr9123399wma.165.1602944953679;
        Sat, 17 Oct 2020 07:29:13 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id n5sm9020860wrm.2.2020.10.17.07.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:29:13 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: media: atomisp: Remove unused function
Date:   Sat, 17 Oct 2020 15:28:00 +0100
Message-Id: <20201017142810.26967-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function ia_css_mipi_frame_specify() is not called from anywhere and
the comment above its declaration states that it should be removed when
there are no more users. So remove it.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_mipi.h | 17 -----------------
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 11 -----------
 2 files changed, 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index 7b6d796d6ee0..9e50e1c619be 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -25,23 +25,6 @@
 #include "ia_css_stream_format.h"
 #include "ia_css_input_port.h"
 
-/* Backward compatible for CSS API 2.0 only
- * TO BE REMOVED when all drivers move to CSS API 2.1.
- */
-/* @brief Specify a CSS MIPI frame buffer.
- *
- * @param[in]	size_mem_words	The frame size in memory words (32B).
- * @param[in]	contiguous	Allocate memory physically contiguously or not.
- * @return		The error code.
- *
- * \deprecated{Use ia_css_mipi_buffer_config instead.}
- *
- * Specifies a CSS MIPI frame buffer: size in memory words (32B).
- */
-int
-ia_css_mipi_frame_specify(const unsigned int	size_mem_words,
-			  const bool contiguous);
-
 /* @brief Register size of a CSS MIPI frame for check during capturing.
  *
  * @param[in]	port	CSI-2 port this check is registered.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index d5ae7f0b5864..3f34cc81be87 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -33,17 +33,6 @@
 static u32
 ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
 
-int
-ia_css_mipi_frame_specify(const unsigned int size_mem_words,
-			  const bool contiguous) {
-	int err = 0;
-
-	my_css.size_mem_words = size_mem_words;
-	(void)contiguous;
-
-	return err;
-}
-
 /*
  * Check if a source port or TPG/PRBS ID is valid
  */
-- 
2.28.0

