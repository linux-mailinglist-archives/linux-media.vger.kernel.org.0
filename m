Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92911468A37
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 10:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbhLEJF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 04:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhLEJF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 04:05:27 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A111C061751
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 01:02:00 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id g14so29756383edb.8
        for <linux-media@vger.kernel.org>; Sun, 05 Dec 2021 01:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zklKn/bDTlrcVJ9rP836gkaxg/cLp9SeOEeQUV1jW1I=;
        b=Tdx4JX9Zubig/TWcppGpECo0yEha6RJrYLVFZEy4DMFh6vIdvIyeGXE3DxGD5tSpNh
         gd2+Fq6LgZrYPisT3kVMSINuf+kJ8RJiYJEdLOmTOo3WlOpShU8kmYT0u3gOnd6XIvHF
         LjL1i+59fR1vGkwgbaF/L7hZB4QVqSLHZSXt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zklKn/bDTlrcVJ9rP836gkaxg/cLp9SeOEeQUV1jW1I=;
        b=HGFUyyDQw1ZswUZwKmGW408coHcdKAPR+SFoa2sUfP/2jtcK5P8e8DN/1iRBCjlqrn
         ZBs9LZXiaJ5x+o9AZnFpolGUqhBgSnXYeOlUdRIXyTYDkItO5p7oC5JXOdLeVeLDlFiZ
         idtDBsuneQuBkyv1D+4zj7GANYoeXStAY8sl4jHh5vIg9aKkkTSumsU14jeo1CxP776k
         21Kfx+P2vTmiWbH7Do2s/J4/fqdcsqlFq46e8pZpmw0Bga6qinPx0YGS8GPfrhtSodQF
         Ff6tCg1Yi+8WqGE9eXIMeUt7kbmUg8mCre/1F2CpRXmfunfH3Xzkv4803w0a2bEnrnXw
         AOUA==
X-Gm-Message-State: AOAM531FsDcz71FszxoFanLWyF0SsHshhEpgxTP+piYBWSkc84XCqGaQ
        M7yKpvJovBRW03vpCkwxB8dqmSZVgkJyKA==
X-Google-Smtp-Source: ABdhPJx/6cp8Ikc0p+x1AbIX8jQtoRKkLLUid9Bj/FqF9Y2JQak7SbX3KJrMeNGmSOoaA72dyZ2pRg==
X-Received: by 2002:a17:906:b2c7:: with SMTP id cf7mr37802646ejb.303.1638694918443;
        Sun, 05 Dec 2021 01:01:58 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id dm6sm4921492ejc.89.2021.12.05.01.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 01:01:58 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH v1 2/5] adds ovm6211 entry to Kconfig
Date:   Sun,  5 Dec 2021 11:01:46 +0200
Message-Id: <20211205090149.5221-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211205090149.5221-1-petko.manolov@konsulko.com>
References: <20211205090149.5221-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/i2c/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 drivers/staging/media/i2c/Kconfig

diff --git a/drivers/staging/media/i2c/Kconfig b/drivers/staging/media/i2c/Kconfig
new file mode 100644
index 000000000000..2744f654121a
--- /dev/null
+++ b/drivers/staging/media/i2c/Kconfig
@@ -0,0 +1,9 @@
+config VIDEO_OVM6211
+	tristate "OmniVision OVM6211 sensor support"
+	depends on I2C && VIDEO_V4L2
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OVM6211 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ovm6211.
-- 
2.30.2

