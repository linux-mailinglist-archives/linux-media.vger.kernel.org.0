Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F47468A39
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 10:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbhLEJF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 04:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbhLEJF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 04:05:28 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298C6C061751
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 01:02:01 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id w1so30159657edc.6
        for <linux-media@vger.kernel.org>; Sun, 05 Dec 2021 01:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BkllAYoHT1d4g58oaIBTjo78DyD65U3ROTueHEEQZhQ=;
        b=esJB/GisnBOrlPLsHmdDrefWKkoOuIQ+HLqal1ubxFldmm7pS1N0l4MI6tw8m4BSKo
         AJh6/jdIpW7qxe3BB/1xAdq5Dv+2rZK+HOZWi3SR9maDTLwl2rre5xNnOKnJcM50jUhO
         TPtknNSwXFj9kRH9X9+syFBSE578aKdXA7//E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BkllAYoHT1d4g58oaIBTjo78DyD65U3ROTueHEEQZhQ=;
        b=zxqzyZbtT2mNtrvUY4HU+T7qXnK6+Sz0BBgf25RQX67pt/a+XjW3WnRo+cpXAQxgpe
         H6Xtf8m0k97cCmuNrHUB0tXlrUjtBMeEKVfXFrHgGQJJ6ACeNBc6sMY07IG+tY3QF2aa
         RXk1OpPg/9BmetuLGFweCWWnlUINi4j4qmyU0ao7K99mSIS25llNbpcTIgbeyxU7fW2o
         kSi8ILhDFEkUfrhiHRFAWvs3YF2vVFLvin5T0MUfG+VcUR9SqkFWQ/FEs266FwpsUC1F
         9nFX/7d1QnDSsDCP8egDMBiy4aY3vbspnpYvzcVXuTV2B1GvewdSJWdfNUv000zT8UpP
         SEUQ==
X-Gm-Message-State: AOAM530hD+/m/vh/3o9YaW++mr8wztKS3GDSVmbN21uvBX1D/EjPVP48
        xbbyO9Yv2oLQbPcU/ToycZifWPE3Hrg7CA==
X-Google-Smtp-Source: ABdhPJy4y6UPjg0PbmUxI4vpfMuhwEIyPLSr195Yqz6Ggtas9mgxKUyIR/tpk5jCtGOVqCvo1KQfgw==
X-Received: by 2002:a17:907:90c3:: with SMTP id gk3mr36633456ejb.282.1638694919366;
        Sun, 05 Dec 2021 01:01:59 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id dm6sm4921492ejc.89.2021.12.05.01.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 01:01:59 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH v1 3/5] adds ovm6211 entry to Makefile
Date:   Sun,  5 Dec 2021 11:01:47 +0200
Message-Id: <20211205090149.5221-3-petko.manolov@konsulko.com>
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
 drivers/staging/media/i2c/Makefile | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 drivers/staging/media/i2c/Makefile

diff --git a/drivers/staging/media/i2c/Makefile b/drivers/staging/media/i2c/Makefile
new file mode 100644
index 000000000000..4d6f2956b3f1
--- /dev/null
+++ b/drivers/staging/media/i2c/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VIDEO_OVM6211) += ovm6211.o
-- 
2.30.2

