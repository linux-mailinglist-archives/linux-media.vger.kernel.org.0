Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29CA411FA50
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 19:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfLOSJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 13:09:31 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42784 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfLOSJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 13:09:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id e28so4207303ljo.9;
        Sun, 15 Dec 2019 10:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hl/e7Xx4KZbxmi+G3Avli8jOk/vDtWO+9+LzOqRAwkA=;
        b=U8eKiJD7GI8YkXj0LqPLUKSt5Si2KlyhD1RnPwQIPw26jzGodMon42i/9cVB9Ae6oY
         8f7KQSB3I6wzl667PP32vTf6COJXl1q20fBUo/CZaypaKUzktB82cJlkIxRTTkk2BuOS
         G2ATID9TVIlrT3vshUwnJ3nD9JeJbxaeR+9JHM1UYcBw+y/hBlWjE/bjCjzFIA9m3HPa
         xp/h8YkocVgo0pRyYzjylHyATjru2FU/62RthGFKvWHeBoIV+bNV+pvesBFfNFD3qSHd
         vmVgGhfHpr4RLpOewcYabliKHdhoDs8NfmxsZ7Vich9W5g24mfNSs6hWFRvtUZiTFIni
         6c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hl/e7Xx4KZbxmi+G3Avli8jOk/vDtWO+9+LzOqRAwkA=;
        b=QcJTfLyXcDBXdqmlJa54K/Os3SYJDWC8lcWthaFtF7+nE1DhuKB6B0IGIDHbVGKWbD
         AsVpYkCAkPpAKuuKfT6Y2SnbnBco9zf2wX2ljQd6xU7bNMna1HHfYIisEF6b3AUrA8FF
         LxhOwidkxvRH4spmpvioKLgGXQy7Atx2iVmTp3jmMUimAPhv1rkCPHUv2TK9Vg/1Sfp4
         sIaVsu8H3u1B/HFHWQRXF9/ai80ybJLN0u7uzAeU0nrdKj3462F+VFP5YZa5joTUKxjN
         kdPmGOs834dF0XCRr/8G8cvc355A3IFdnUNoSPaK50oJES3NcxeGZMGqGX69FwTHwF12
         G0EQ==
X-Gm-Message-State: APjAAAUXQ9oDN10syGI57mdsoqV/dWrRz/sdN/ZmnJd/BdARf+JrwFJn
        1SXf0mLWD+z+IQk/xfnSIF0=
X-Google-Smtp-Source: APXvYqwCaChD81jN2RDNw/uKHzTKvFtTZTfMnsqbR67SuVkrf2vyYHzwu7cfXxnYeD4RFfiHxKWDCg==
X-Received: by 2002:a2e:824a:: with SMTP id j10mr17279552ljh.209.1576433368435;
        Sun, 15 Dec 2019 10:09:28 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id t27sm8871875ljd.26.2019.12.15.10.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:09:27 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] media: staging: tegra-vde: Select IOVA unconditionally in Kconfig
Date:   Sun, 15 Dec 2019 21:07:50 +0300
Message-Id: <20191215180752.5408-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215180752.5408-1-digetx@gmail.com>
References: <20191215180752.5408-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There were several reports of building failures due to IOVA being selected
inconsistently by different drivers. All drivers that are using IOVA API
should select it unconditionally in order to avoid the compilation
problems, tegra-vde is one of those drivers.

Link: https://patchwork.kernel.org/patch/11057831/
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index ba49ea50b8c0..0dc78afd09e0 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -3,7 +3,7 @@ config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	select DMA_SHARED_BUFFER
-	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
+	select IOMMU_IOVA
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
-- 
2.24.0

