Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C839C1A717C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 05:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404431AbgDNDIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 23:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404428AbgDNDIY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 23:08:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2789C008748
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 20:08:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d17so5409508pgo.0
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 20:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sK5J9WWtksNX77+NYMwDl6iDZ21wbSLhPOx9BD2BM8M=;
        b=LSXUefafyRPCK1BKfVXiyl8L6XfmghKkzW97uJsOEM4gDKMgCfDopHvzMyxX9Myj88
         Gl5rTEhzpS1OYgiBDgymvERjRoXimxL5xwpDoZPX/ySaHiEso7gshkntX1zU3eV/rMje
         P7odV0SrY0XzqZfAZFoea4TeBlA+Wp45m+108=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sK5J9WWtksNX77+NYMwDl6iDZ21wbSLhPOx9BD2BM8M=;
        b=U3RUEUUEqMTyF+ilpLoVSsZrp2ohj8YrkqzejG8RbARmtA57cQoStRDYbOiK3LgTC0
         iegobmt6voIkz5ZRrBkIRxGcVrXiaGazdPTnGNMZcrIqrbWAu7jafE0JXvxXgKYGR2cQ
         Z1CoXAmn18YwkGKWkw6q1KTjYQSpaaPL3eUyYXSTX3zGpaoS5jm+nZcgD6JVw8KJgkJS
         3xzQWuXJlaUFeg7fy0R1kJorHYXqf9tM4ElBJEBnnHT94WF/avb8E98hKZR8FBvN14sq
         ClvuIM4sfesHAV4MCcY1Qi1IuU6aW8B00fMpUAao3blxhb9y5SEnu1vw7uwyJqzh86PG
         69qQ==
X-Gm-Message-State: AGi0PuYL4eN0j/36bEPHUpUOTs48e/XwiKUoWck2wO7Q2vJcddbyMLlT
        rjHgfEJSgNPUAbVixwJiC2vYHQ==
X-Google-Smtp-Source: APiQypJQpaS0PH8YnPtS/hZHhI9tNItaYB2TAmhKVyqtt1h2PIezqUr6JFZ0U4VOiU7IsrqBf+3Iqg==
X-Received: by 2002:a63:6287:: with SMTP id w129mr10337254pgb.410.1586833702123;
        Mon, 13 Apr 2020 20:08:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id z23sm3610897pfr.136.2020.04.13.20.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 20:08:21 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: mt8173: fix mdp aliases property name
Date:   Tue, 14 Apr 2020 11:08:14 +0800
Message-Id: <20200414030815.192104-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix warning:
Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index a212bf124e81..d1e9c41004b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -42,14 +42,14 @@ aliases {
 		dpi0 = &dpi0;
 		dsi0 = &dsi0;
 		dsi1 = &dsi1;
-		mdp_rdma0 = &mdp_rdma0;
-		mdp_rdma1 = &mdp_rdma1;
-		mdp_rsz0 = &mdp_rsz0;
-		mdp_rsz1 = &mdp_rsz1;
-		mdp_rsz2 = &mdp_rsz2;
-		mdp_wdma0 = &mdp_wdma0;
-		mdp_wrot0 = &mdp_wrot0;
-		mdp_wrot1 = &mdp_wrot1;
+		mdp-rdma0 = &mdp_rdma0;
+		mdp-rdma1 = &mdp_rdma1;
+		mdp-rsz0 = &mdp_rsz0;
+		mdp-rsz1 = &mdp_rsz1;
+		mdp-rsz2 = &mdp_rsz2;
+		mdp-wdma0 = &mdp_wdma0;
+		mdp-wrot0 = &mdp_wrot0;
+		mdp-wrot1 = &mdp_wrot1;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
-- 
2.26.0.110.g2183baf09c-goog

