Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE2C32527
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 23:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfFBVom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 17:44:42 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37543 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfFBVol (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jun 2019 17:44:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id m15so11975020lfh.4;
        Sun, 02 Jun 2019 14:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RAvWzRmI3ATy0YIjicB8IsfAo/qyadtg5+mzRUz93eI=;
        b=EagNt2hBDCd5AycfRYX3JxLV75oOBD0xhzNHS+0joAwPYhfHQfZlz1JeqVKtseGLQX
         v6MXzeiQgozkp0oPnfkyOsK0CwZlSuAV0z9UEmMDiH2QvTnfd8aqgD9PygNvxN10tSot
         ybJiyobwkhwR4aAug2uyfnMQcj2a0+gCUaJLmYPxqJFyzD4JiX3GxiG5CKpVvHWDbPC8
         XbJZdQOr08yy8dsglkctybiJEQcJtVAJoIZt8WqM2h1euvTbOX0annWjLQaL3cqaBxnB
         QdeO3mxDcz0cq9mVSTgbzDaNqjxhMwnqC3hXzdLwWWWiV+xKBjdIj4D4Apf3sHObNxRd
         +X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RAvWzRmI3ATy0YIjicB8IsfAo/qyadtg5+mzRUz93eI=;
        b=NDTtCeeAdBnWma37Uq02oWr5uVQyAOk5ZEE4VpJyZ2ivXXuuI/6KdhucGlOUuhEoL9
         gxsM5kBLTnJUMrQn4aRB0FMBPtJJ/vZ7YmDpBOIpNZxFSTQ/Zh3t3YgjmR6U0ia3AnLm
         V/7irdQwCLtTjJphWzQpuqVsZfbkKoC/+OHVc47pTWHly2Lf5gsx36mMMAnY7IAKvPVY
         IaHrsmffd1XYiUFRE38ZOrjC2SV3aR2NRWb5A7TXfXf3FsXvipz3U35nFNm6u0utZN5E
         fDDVivN9R4NoCgsBAjnyMRS5dNZviuAiUo67SOU/Axw8MaBkwIvcpPU6HhI4GbMS7Vi3
         Uq1w==
X-Gm-Message-State: APjAAAWZ+PomDYS7UWYgRlvLyLMxfAUeSZX1DooJqm//WBcRgD/V66eo
        u0QzAc51YAuTj1+9WGtzCHI=
X-Google-Smtp-Source: APXvYqwVURBfRmTEbtFUio49iwWSumnN/lwOcLQ3vllsTSPty3UieZP3qePS3npckEpNH7djaR4w7g==
X-Received: by 2002:ac2:5ec6:: with SMTP id d6mr12817520lfq.131.1559511879215;
        Sun, 02 Jun 2019 14:44:39 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
        by smtp.gmail.com with ESMTPSA id g22sm2803653lje.43.2019.06.02.14.44.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 14:44:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: tegra: Enable Tegra VDE driver in tegra_defconfig
Date:   Mon,  3 Jun 2019 00:37:07 +0300
Message-Id: <20190602213712.26857-3-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190602213712.26857-1-digetx@gmail.com>
References: <20190602213712.26857-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The video decoder driver was tested by time and works absolutely fine.
The reason why it is in staging is because it doesn't provide common V4L
interface yet, this shouldn't stop driver enabling in the defconfig since
our userspace (libvdpau-tegra) provides combined acceleration of decoding
and displaying without use of V4L.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 8f5c6a5b444c..a27592d3b1fa 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -250,6 +250,8 @@ CONFIG_KEYBOARD_NVEC=y
 CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
+CONFIG_STAGING_MEDIA=y
+CONFIG_TEGRA_VDE=y
 CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
-- 
2.21.0

