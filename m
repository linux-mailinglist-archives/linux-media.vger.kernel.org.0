Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBFD44FC56
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhKNWwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:52:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbhKNWvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:51:25 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD4AC061767;
        Sun, 14 Nov 2021 14:48:29 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b1so32505589lfs.13;
        Sun, 14 Nov 2021 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ukIDuU6IlT+86rCbL8zG0hZeRU+DOUqbYsBqeamrzG4=;
        b=gc7lEoxEblf+lqkcWvb1ovyp45r96q6ZXcGWz8TUEKk1dl3sAJ0cYQgCNnrv7Xfmfz
         F3dmQdq0XABP0kx07QUaVgdC152tDCGgVhxLfaDmKmDpr5EPafLtH14RyW0cc4QhVT+I
         kuf6UzBFkfcQ9GtLEBjEh4iKHwhI+e9qsFl3U1eQUgN8+DQSjbwMR7wWhz9aoIuBMFIO
         P489YXVM96jGobvUkB250f/4QF7T4xYEjdsX8uV+0s3vje7NV0XywfJsLEmBHRBiGJkX
         R/ytKrqTFhPbVHKS9URThGzwBbcsXyzsapK3uJxbzOnubcWPT0JcX9JrOMOG5QVdCRK8
         6SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukIDuU6IlT+86rCbL8zG0hZeRU+DOUqbYsBqeamrzG4=;
        b=hcBZ1pHpazfpBP5Qzp5zTNxWlGRv7DirrcJRgNPlp6kHzvVcFPvQzobJvUVyKUcGRJ
         hw5/Z13AUrllQOHaJ9p477J+34ZZ0HEDfpe0mLX3XobQ04FYY5zaNf0uXInhgPlFTawh
         T8zMi068fExSHfQccZlmEpe1dN67h759wYS1DZwSxvnUBAixdPOgX4sTrrBP5a7SMNEH
         hHSn1/7LvCUoWySH9IHA2ruU2fNWTy1lGs3qyoEALkxbrMy9pjlaRTWgmfQcsKRwtLGM
         IpmzJT39Anjs2dDC15uwWZE3hKAQvgxwjImeMsY7oyidMyMbD5aoqjf5OxM8j1/OXCta
         wSWA==
X-Gm-Message-State: AOAM530LSAlqg38SDYc4J+M+535hELXBIoPD3pfroA6OTLy8R89jiolT
        3loPIYYxd6GOSywn3YuVPrU=
X-Google-Smtp-Source: ABdhPJx1HJ/U08X2T1uvRiZzPj/CNGmMlyAz/lzuqpzE2X9ZsB8VQxSKym1zKmQPOuj4OWRC2/Cr3g==
X-Received: by 2002:a05:6512:1093:: with SMTP id j19mr31596154lfg.340.1636930107901;
        Sun, 14 Nov 2021 14:48:27 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id h1sm1228591lfu.277.2021.11.14.14.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:48:27 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: staging: tegra-vde: Properly mark invalid entries
Date:   Mon, 15 Nov 2021 01:47:31 +0300
Message-Id: <20211114224732.11550-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114224732.11550-1-digetx@gmail.com>
References: <20211114224732.11550-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Entries in the reference picture list are marked as invalid by setting
the frame ID to 0x3f.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 81f3e9e7e4d6..f4f65eb78d44 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -340,7 +340,7 @@ static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
 			value |= frame->frame_num;
 		} else {
 			aux_addr = 0x6ADEAD00;
-			value = 0;
+			value = 0x3f;
 		}
 
 		tegra_vde_setup_iram_entry(vde, 0, i, value, aux_addr);
-- 
2.33.1

