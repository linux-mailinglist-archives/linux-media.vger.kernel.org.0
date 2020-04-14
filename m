Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105D81A7183
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 05:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404445AbgDNDIc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 23:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404440AbgDNDI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 23:08:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C9AC0A3BE2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 20:08:26 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n10so5459474pff.3
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5zRLvY/lFyVA8CmcHxoztfhLeB6Hcp8Rb9myeLFGE2Y=;
        b=n2G/G4BdsXylPAXJFcQRTVHOuqsJKdpWbXtgpE0vRfTZ6zqn5UOIvHQK/E6B09RbBb
         LDa0XYcYzYD5v7gjcGLOmaVvkxWAgoIi8UKyC9Xpli+XMHphDtBdltPVBndKpUx5BNVR
         iPSvizo2wr2JHDiXX3MwqKvyQJlQ25Ua8hL7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5zRLvY/lFyVA8CmcHxoztfhLeB6Hcp8Rb9myeLFGE2Y=;
        b=jTUcigN+S0dGBrbOaX/E80Ksu14CjSMaqkWzAEvc7xBzPdLqQgUaMUYIJsVJLfPx3H
         xPaLb5/x/BF5vO4zaUtDiry9nvqxeUdHLr3BVujbA7b4G523aU2wYNiVlnAWp78zf/7N
         KiFJyEtm5qZjdfRq6yrQAHLg3f4sgcyK1Zg2oPYScIZpksT2NjRi/haWiv1iXZv94nCw
         ulperQ3pDtfnGkwYRTZaeejppn+PU24OA2N1NtYxv+wIWg37UwLhvP2sHTivXOVdTzWl
         +k/ADgUHfzVNn0Tv9o3BwfYQRVQjxV/uaHqQeIa7iGOmVCO/fjfNYNjBRaXBa0cYmlaX
         hmMw==
X-Gm-Message-State: AGi0PuYUrrLBihNUFSY4xcphJ7Zkn8P7xBBh7MBddnZZPPtSyzgsjlRy
        d6r3HhlVaQWDv4QFT4FpTYAsQA==
X-Google-Smtp-Source: APiQypLDqSi+uJwrfXUjYacymxQYaq/+/Ey0TiNm/1+jCiQfoIEMLFJm77pkr/oXOdsSGluRuYv5UA==
X-Received: by 2002:a62:1a4e:: with SMTP id a75mr8921678pfa.235.1586833706151;
        Mon, 13 Apr 2020 20:08:26 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id z23sm3610897pfr.136.2020.04.13.20.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 20:08:25 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] media: mtk-mdp: Use correct aliases name
Date:   Tue, 14 Apr 2020 11:08:15 +0800
Message-Id: <20200414030815.192104-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200414030815.192104-1-hsinyi@chromium.org>
References: <20200414030815.192104-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

aliases property name must include only lowercase and '-'. Fix in dts
and driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 14991685adb7..58abfbdfb82d 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -15,10 +15,10 @@
 
 
 static const char * const mtk_mdp_comp_stem[MTK_MDP_COMP_TYPE_MAX] = {
-	"mdp_rdma",
-	"mdp_rsz",
-	"mdp_wdma",
-	"mdp_wrot",
+	"mdp-rdma",
+	"mdp-rsz",
+	"mdp-wdma",
+	"mdp-wrot",
 };
 
 struct mtk_mdp_comp_match {
-- 
2.26.0.110.g2183baf09c-goog

