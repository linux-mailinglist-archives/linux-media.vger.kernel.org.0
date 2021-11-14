Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B760944FC32
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbhKNW1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbhKNW1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:27:17 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF77C061767;
        Sun, 14 Nov 2021 14:24:19 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bi37so33329609lfb.5;
        Sun, 14 Nov 2021 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KAUkz2SRPh78XWLAzuTkM/CtAlT6USvDgmC5PSJlsC4=;
        b=IkfTsXNX2YKbkn4lfSWNNpx04E2sE+JT0mqnydwTWOcL3viNEeFO8WQbWDiUIuMv9L
         9+Z4blaVKFFiq288OO/ZHDd10I55kjAuCcDSPJGXij4zWGSmbPjJOg0CZwXuEbWwsfqz
         JzeGPtv3t3UZmHiPX+xOfMU8ZdbGwP3df5dAkLPKAmx6I9mV44g5SGX0elwaEzdX6Q0n
         xKjoDDS21+WDJTGY//tmTUVJbQQ5L7/kP9NWpZiIVidetsmkWsfDv2sQDm3ez2opda6D
         7hrI/gJ8M6cUQ6H1cG7dyRFEfmdGi654RIlbERMeajRFKQ/5OsRKN7oMRddFimPzGKb2
         Njjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAUkz2SRPh78XWLAzuTkM/CtAlT6USvDgmC5PSJlsC4=;
        b=4tk0jVY6vbneYblVjTKuY1mmMSaht5lr1+UmQQZYQkN5yjZ3VBo/+kTU4rNCzv3OWv
         5uql1usnRre10E9P/WBbqLhZQl3nh5tAEBxJ8b+dYxFRW9YgwS9xwJCAr4MKPDQqViLj
         8eOCoO6DzoxuOC0wbEMwb7ptnzLWSV4RLzMkBk2nU0dWq+Rma7cn3hdKlU5kB0b3iCF2
         12sZq4zelZy+AulpTOFY4Yj3elqTY7LFFItoLU4aFbPv2AVUI18SKA3yXFjI03bGFajR
         r4mHeU10/dOBbXraFl4+p/XejoQ4CY1x9T1Y6VlKuQpNtUcFb4D1sHMdEZ1YrD+Qgv+K
         33Ng==
X-Gm-Message-State: AOAM531aIHQG5DNpB3a257cVlsx9FBqDeWMkYUDSTtQlJjImva6iBWCE
        nTLV3on8vrTnyeJxqsvBRsM=
X-Google-Smtp-Source: ABdhPJxYMrC3XGSSkzeRtsVyfysLitYoXFFyVKPySBwCCul3412jKa6/XnksEzH0Wh6Gv2vGsb6GoQ==
X-Received: by 2002:a05:6512:3b0a:: with SMTP id f10mr29917406lfv.410.1636928657801;
        Sun, 14 Nov 2021 14:24:17 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d6sm1223339lfi.52.2021.11.14.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:24:17 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] media: staging: tegra-vde: Properly mark invalid entries
Date:   Mon, 15 Nov 2021 01:23:52 +0300
Message-Id: <20211114222353.22435-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114222353.22435-1-digetx@gmail.com>
References: <20211114222353.22435-1-digetx@gmail.com>
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
index 42da57f191ef..ba7ef280423b 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -336,7 +336,7 @@ static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
 			value |= frame->frame_num;
 		} else {
 			aux_addr = 0x6ADEAD00;
-			value = 0;
+			value = 0x3f;
 		}
 
 		tegra_vde_setup_iram_entry(vde, 0, i, value, aux_addr);
-- 
2.33.1

