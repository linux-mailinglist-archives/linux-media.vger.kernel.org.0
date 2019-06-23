Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5BA54FD24
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2019 19:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbfFWRIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jun 2019 13:08:14 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38983 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfFWRIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jun 2019 13:08:13 -0400
Received: by mail-qk1-f194.google.com with SMTP id i125so8077029qkd.6;
        Sun, 23 Jun 2019 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DEscWWmNyD0k1ManLTEItc70FqDRXwSTSIeyQ9TNq+o=;
        b=BsnTwcpCQh7Iv9eYzP+KWWfGWAEEG7cXV0RcKtGsbx5b21QtGsU8S6ghggb4jEhb6b
         JaBTSyH44+9aWTZ2x3sOE4szIjzx9bBfRf+N0eaq7LBVV9LpNqgkW/fAJ1wdyjBx1M+r
         glVepG/0/ithAZO2i7Ild5eOisiHn3MEW0Y4aeP0z0lqThK2LTrEKbgcwuyj3w/J6qYj
         ASNQ9B2S4mk4pyQpcppI/jA0iTwfRyrYQjeYT7muZ2nSrbjgmHvJOhUJi+uKZj6bi2vW
         d7Q2l90IhlqI3S7uj0CaVMuJ1ZmDEJVZw+UmO4A9/uHUuMiBDHubGSiEHNUHHAqSoW/F
         fc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DEscWWmNyD0k1ManLTEItc70FqDRXwSTSIeyQ9TNq+o=;
        b=C1R0Lh4H3ttkWUPOQzlsY25sRERb7cweuEV4SPUpQNgG34DI1yOCFUe4iH4TgW2ZQB
         VtPtQCzpLOIr0f+1xMLcItUzw+FpaM3UYunMPiFnM0Ku2dxsisMoQXbKs1ZjGSFPfUfH
         wt+bIDZi5N+qHkcnlBdVfv3OD2TZpJnPZZGNpYv+dRi7uA5UTWgRcgb+97V7UW0enaxL
         Gd1NbEj3JQN/pr9BssrNnsg3nvrPxVaVQjSjQf1FelOJtP9FaSrbtcNywCzRbc/LDF4M
         VFkfQBHw86R4nI9nYZST2TdfSQzD4WJJLHZnchNFJGDL15ioriu5JWiRESwfNBhjLTQW
         4VYA==
X-Gm-Message-State: APjAAAXWQceGP4MKhkyxlUN4Z3P28SKsKi061x3nVu/PSKKhD3JK7//O
        4X2BTCwZFvgibqj8uqt3u3k=
X-Google-Smtp-Source: APXvYqw6QcRfaqInl2aO/o81L9UytRsutBhH/KmYer/h86GtgLAINiUX1NwGFSyM867m0VXsUXoQNQ==
X-Received: by 2002:a37:404f:: with SMTP id n76mr5315342qka.27.1561309693019;
        Sun, 23 Jun 2019 10:08:13 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id o54sm5790756qtb.63.2019.06.23.10.08.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 10:08:12 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] staging: media: tegra-vde: Remove BIT() macro from UAPI header
Date:   Sun, 23 Jun 2019 20:07:27 +0300
Message-Id: <20190623170730.5095-5-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190623170730.5095-1-digetx@gmail.com>
References: <20190623170730.5095-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BIT macro isn't available in userspace. Checkpatch complains about
shifts being used instead of the macro and people are starting to send
patches without realizing that it's a UAPI header file. Hence let's
replace the BIT macro with a hex values to make everyone happy.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/uapi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/uapi.h b/drivers/staging/media/tegra-vde/uapi.h
index a0dad1ed94ef..dd3e4a8c9f7e 100644
--- a/drivers/staging/media/tegra-vde/uapi.h
+++ b/drivers/staging/media/tegra-vde/uapi.h
@@ -6,8 +6,8 @@
 #include <linux/types.h>
 #include <asm/ioctl.h>
 
-#define FLAG_B_FRAME		BIT(0)
-#define FLAG_REFERENCE		BIT(1)
+#define FLAG_B_FRAME		0x1
+#define FLAG_REFERENCE		0x2
 
 struct tegra_vde_h264_frame {
 	__s32 y_fd;
-- 
2.22.0

