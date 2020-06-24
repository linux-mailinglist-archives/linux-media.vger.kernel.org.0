Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FCE2076D0
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404434AbgFXPI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404357AbgFXPI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:08:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE19C0613ED;
        Wed, 24 Jun 2020 08:08:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i3so2970370ljg.3;
        Wed, 24 Jun 2020 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n81a7xgicqVqpnshMV1Fym2lKSMaAj06qWLiaAZUAA8=;
        b=DaVK2w2zzhMR7dhzxorRAMiXFpOAQqUV3BgyeJk5BvrGgH4/6DEBA3VxQxEHsMmopB
         16gMgtDiFKxBRWtXnqDuRsAAXODJ1rftcFpKFv8E57JigQk64LxlGC7mC45qrncZ1PVK
         rjEabLm92zu/UhkkKPeFaoy6TdduiuiqkC5ym/8X1VCH1VDIWbSiNX/JAJBlWdhiJbjd
         FoLN7w6NDq01hRz3ahZGsOpqmvechMFisnPwzDwMIMt6UVryrcxeBHiGhlgz3xfehLF5
         mEAyDUxib+8AA/apNlZnWL46u8EKrEfTZTnRRSTunBM5M2PuqBHO34Cj1pbrSL3M0m3J
         8WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n81a7xgicqVqpnshMV1Fym2lKSMaAj06qWLiaAZUAA8=;
        b=KRVVq5iJxdUT2RdF9YVMg5MAmzuJOE6+FvtJPfcYSdVX8ZPGuX0iYJYD5GV5ZjXPuS
         sGPnLt6ITvzlfgYMvX1/kycGZfdUKzpjPp35l16srLujCfKgcyJzJUksaJx+4csXsisp
         HQi0cTsm0+KkbzSlCyqde3FUaTu3O4Sree0ApCJt50pw7CrMpmkeoN0faEu/1l8BWZLv
         Ivk/wwlAl+KNdSfVeCPPPfjQbrS4RUeQWpiiHIvQtkuRqBMQqNd1p/EA4JPkAT06s7ML
         EnUYvLBLz5audyeGSsXYIEhPFBzfbR3y5QxZJupzHCzFY8Zp+OXpZA9wZaoXT7A/W0SU
         NYMg==
X-Gm-Message-State: AOAM533Dk33SN9W3WsnPqneCPU0kN0AUi/qrbMPqkgPGqtpFvY6VwhX3
        dhc1iLAyGyFyYF5NduRYf8A=
X-Google-Smtp-Source: ABdhPJwWvevn5bWodaDDTeO6gegWo/JJY45ganJgJ5FSOkH7CGVN4WdL93vQRhvTexMjGq2XSmWDgw==
X-Received: by 2002:a05:651c:338:: with SMTP id b24mr13475658ljp.87.1593011337024;
        Wed, 24 Jun 2020 08:08:57 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id z1sm4182049lja.47.2020.06.24.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:08:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] media: staging: tegra-vde: Balance runtime PM use-count on resume failure
Date:   Wed, 24 Jun 2020 18:08:44 +0300
Message-Id: <20200624150847.22672-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200624150847.22672-1-digetx@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RPM's use-count is getting incremented regardless of the
pm_runtime_get_sync() success or fail. It's up to a driver how to
handle the failed RPM. In the case of VDE driver, the RPM's use-count
should be restored if runtime-resume fails. Use pm_runtime_put_noidle(),
which is the most straight-forward variant to balance the RPM, confirmed
by Rafael J. Wysocki.

Link: https://lore.kernel.org/linux-i2c/CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com/
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index d3e63512a765..803e5dda4bb5 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -776,8 +776,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		goto release_dpb_frames;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
 		goto unlock;
+	}
 
 	/*
 	 * We rely on the VDE registers reset value, otherwise VDE
-- 
2.26.0

