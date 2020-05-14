Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA5B1D3FA8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 23:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgENVJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 17:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727777AbgENVJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 17:09:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3ADC061A0F;
        Thu, 14 May 2020 14:09:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l19so5087253lje.10;
        Thu, 14 May 2020 14:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MbEwAEDY+UIz4Bw5+QFZkmbm4gisWV5nZMVAP0V+gWg=;
        b=dfyS/sP46qW3uvPVJQkdARtLyOipAh/Fz8Npnv+Bs1bbVNFTnOZFrWXV9okA/ZiMbg
         CB0NH+AvHjZgfAHA+DTHZ0BwQkTg6A+t0+5r3K/drjuIC63WOkMo25JRUDiROIk+/tCQ
         D8Qh0g4fdkthrjZ420wJ2/dYoWexp+lVhcjSMLe0LSXzmoqf579SDJ+L/jdCGfwULGE0
         oH6EljARn+2wA3ooEGqHJt0oHllyQT7wfHRTYoCBMy+UmQ1+nkuSdRjkcsUsZZdoTsqX
         S8fLeSizceMcqArQRoQ+8xXHTgE6vIxqnxCkGgZqYxL/dBfDMrTZ7P8P1mlZ92E4UthP
         nqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbEwAEDY+UIz4Bw5+QFZkmbm4gisWV5nZMVAP0V+gWg=;
        b=uZwtf8MQVeOWeeEBb+igUYzOMjmGCYIXjokaqFbm5ADk2/JpxjMRWqmQChjDh1nkng
         lzcgCfoNW4o043atU7YubOmZIuFIbTgrNTJKzmR4BOECo5oiTv+EJ8ZrYwRjk1r9+++9
         PfkjPz8Ec2r31aoc25qikSBJ1JV0zQ0oAFE0hq+ky3wk/BwDltvpQ60erY4SJq08mIzQ
         K/sTZLYbp6EI6d8T7yixKbfEAbqyQAVDRuHwvwgh2cgROCrdJkfyj6HP/gsNZCJdwPwQ
         kksbeY9J/NWSxyAi5SqFYeHqGT4/PCR9WWwmCNW2tvbAYDpDwESFFbHigFuDObdwauTa
         OGaA==
X-Gm-Message-State: AOAM531LF+cKg/W1LrgJFq+tQu0xTPk8aOFS3IaXJwKrkq9DMcFlyb9a
        Vrrj/igyWQTaDmneiPDtX1A=
X-Google-Smtp-Source: ABdhPJxPYojjqv+Q6EeNKYsxCP1N3bnO5bJhCCmwZemIP2H/4hZRmku6zi509u41Zy3B51R9aFzG2Q==
X-Received: by 2002:a2e:361a:: with SMTP id d26mr103704lja.171.1589490581256;
        Thu, 14 May 2020 14:09:41 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id g3sm45215ljk.27.2020.05.14.14.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:09:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] media: staging: tegra-vde: Power-cycle hardware on probe
Date:   Fri, 15 May 2020 00:08:47 +0300
Message-Id: <20200514210847.9269-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200514210847.9269-1-digetx@gmail.com>
References: <20200514210847.9269-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VDE partition is left turned ON after bootloader on most devices, hence
let's ensure that it's turned OFF in order to lower power leakage while
hardware is idling by turning it ON and OFF during of the driver's probe.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index b64e35b86fb4..3be96c36bf43 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1068,6 +1068,14 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 300);
 
+	/*
+	 * VDE partition may be left ON after bootloader, hence let's
+	 * power-cycle it in order to put hardware into a predictable lower
+	 * power state.
+	 */
+	pm_runtime_get_sync(dev);
+	pm_runtime_put(dev);
+
 	return 0;
 
 err_deinit_iommu:
-- 
2.26.0

