Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5A7468A3B
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 10:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhLEJFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 04:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbhLEJF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 04:05:28 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86B2C061751
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 01:02:01 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w1so30159722edc.6
        for <linux-media@vger.kernel.org>; Sun, 05 Dec 2021 01:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cSQGNDQhJlx1HiN+2TiPcHT749zApNvgHzuss25yZM8=;
        b=ExETgnmrSloSejW/qiJw9pTnBW8V2Dji+bycBwa9WtM0oZUrNJeRFnVmdxb8uEcmrF
         eCZ7i7Ct2W++3LJZbvvzrybcbqvPuOf9Y5A64FaPhA0Kb0SCH1C/ApqMyZT3Yv+aKgGO
         5cVx5sWf09n7/qwVUaJUQDO65BaO5AqNHxDYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cSQGNDQhJlx1HiN+2TiPcHT749zApNvgHzuss25yZM8=;
        b=DuUD8d3aSo+biFeW8wLxhN+ulTbSoq7CAGXxB6cwjwEs/j2DdOHuSJ0T+HE/TXCRV4
         XuIN44hIwJ38tn987mtaNlbpJIV2nH0fEx5omGlsUGpQWSGfNCtOxMQEL4gNVa3VNN/R
         gcouXJ11iDL2glBlT3VMMY6y4oJ8xgsjWdafpkmPCjV26Jy0HwefOlSgxrud2gteoV2o
         ockuMGyMqr2x3+8KfxGaOvJ04c2zarLLg15pEHIJ6DN0C9DrzeDTQESP+laVXbJZRLCm
         jq2VyMyZg7+GQB25eYVaA9sZP7sx6IBRAc5wnARlOZcPSg5Ctx0rWGwqy6kdP3bsZpnz
         hh6g==
X-Gm-Message-State: AOAM531g9Q4hpFjLkRc/e6Tnj0ZTozoNn2f0xqgUdC/mwxdCyKKH0CHF
        nqxmB4k7Lk6znrZ0ibIKV4mMku23TjhcVg==
X-Google-Smtp-Source: ABdhPJwy0WShN1gjzo/3/L1v5s8oSTKNpM3WU+GtdwWdH9wte+RWb90qrsKnHyY2wyw2UoZawSPVYQ==
X-Received: by 2002:a05:6402:3551:: with SMTP id f17mr42063312edd.129.1638694920129;
        Sun, 05 Dec 2021 01:02:00 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id dm6sm4921492ejc.89.2021.12.05.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 01:01:59 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH v1 4/5] adds drivers/staging/media/i2c/Kconfig entry
Date:   Sun,  5 Dec 2021 11:01:48 +0200
Message-Id: <20211205090149.5221-4-petko.manolov@konsulko.com>
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
 drivers/staging/media/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index b81cfa74edb7..5be3d503f037 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -24,6 +24,8 @@ source "drivers/staging/media/atomisp/Kconfig"
 
 source "drivers/staging/media/hantro/Kconfig"
 
+source "drivers/staging/media/i2c/Kconfig"
+
 source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/max96712/Kconfig"
-- 
2.30.2

