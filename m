Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C682076D5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404453AbgFXPJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404444AbgFXPJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:09:02 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE10C0613ED;
        Wed, 24 Jun 2020 08:09:01 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g2so1480525lfb.0;
        Wed, 24 Jun 2020 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MbEwAEDY+UIz4Bw5+QFZkmbm4gisWV5nZMVAP0V+gWg=;
        b=ulp/uL9mvSJ7SU6iy5vKC57v2/nHWbwvSeoz2IatRstoQAKNz9khO51LYV0etv/+Pt
         nOjON8gH8HePftUtiH/m1lbv6Ge7KCktGswiYuoR6BzRE/4aPtpbZ+G8AtBcnzezenRv
         E19kA4MYhMukJaDqwCySvCQtSIREF728qLuajUixXbhb8xBkfGnACnug5MRDiEDpkLvu
         ruAE3QYb7Hcp6hPuFK+NFirykJcmSZF1auuJnTTpeLMPyTnoHiQ5KbzSKM9ITmJi4eak
         ErFjnAFcranSp2YH9+o44LTTuGjTuoI7MB4F0YV1MiN25IhJqTh7fcK9HT7i497ahTcZ
         7aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbEwAEDY+UIz4Bw5+QFZkmbm4gisWV5nZMVAP0V+gWg=;
        b=B6mhMdGyuvOK51zunSh4HqLbrTEJUnlX6LJgyN7YEFj7xRskEXvSoZ+xTiERHw1NZr
         x1nb0SNjmEoMIZH911zPIkV1f9TPtwhfFx9b2qRwEWA9DPWGT66zkT0wuHBeLOoIs/EF
         VkfSRbH8HM2SDqfNlvD7g/fu9a2ySRxlhTvtE8fOkXJ601RkR5Wnn0fRQA8R0KmlcTQc
         nzRiCOBG2yfu7VpwqIOUvEGScNpBrpBBhv/zlbn2b2Ne+ChrYnwDztY/NDIquXKzjYSV
         oWTTf3HQ8845dM76JsXETDrGMu+HgK8wCTvBBEEo6V39v0fO3bgG9+dz5tbzGYzlPFHi
         uiXA==
X-Gm-Message-State: AOAM532nF3bu9WmUdnb42DIwQcxGJtKY1Vs+dCfTZHds7gcuI5jjPzf/
        kYdGmQxHOmOU/3sbE/ydV2I=
X-Google-Smtp-Source: ABdhPJwBscUlFJUFnBG6HoRwUDBMUXuDryV4RkhTsFyJYaFEtrtjM23lOEY1nMU1CiXDl9wNs+qRrA==
X-Received: by 2002:ac2:5295:: with SMTP id q21mr15591045lfm.185.1593011340318;
        Wed, 24 Jun 2020 08:09:00 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id z1sm4182049lja.47.2020.06.24.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:08:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] media: staging: tegra-vde: Power-cycle hardware on probe
Date:   Wed, 24 Jun 2020 18:08:47 +0300
Message-Id: <20200624150847.22672-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200624150847.22672-1-digetx@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
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

