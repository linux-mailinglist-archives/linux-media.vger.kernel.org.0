Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B28A24D2A8
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbgHUKhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbgHUKhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:37:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CF1C061386
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t6so648428pjr.0
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTg8ZbMrnEBX6XZbAtw/YXsu/7D2NGL6yCO27qDzwAM=;
        b=Bt6juGPbmaC1G1f3JZE/oHm9QQwPgDr5UQ3A7XNqPAM2EqDMqIbJMMvaI9zGbtYzSb
         FoDLRkep+6Ob8+bLttjezio5g1YDbu5a1XhpuBYQHRjlyT0md+Rpi9mrpHWs8KjxgFfc
         /NJMwiegqrTm2yh5Xue70gONScaWg/TFqN59o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTg8ZbMrnEBX6XZbAtw/YXsu/7D2NGL6yCO27qDzwAM=;
        b=itfdGX2zZDSGJZS9dAH1iWK1oy2o3T6wnUNU5EBeqI64cemsOIA7DT1SB3r0NbZ/ZY
         tK5J2EdJFTXM8Awmd3w8rg1GL99w3/chNNdGSeFrM7PuiRWTZ3R2lvJdzK6SDmTVJY+r
         Ww32hleBetZpguE82aADJ7WuhS+m1vKhPSvqTpqoJ9DFH6bhZ2azBP0MkQlD0x1tgyrU
         at8gpOp40mXSu+71uwI5Ud/hw4cgtVV0KmebU3QqFstpLgPCw4R9Gn0tr2Z8PQTba6Mb
         Vx9JBbL4xp/mF7lBc0S8XmPoQLEP/cLgdrBjG6b5qZS7vL9TRzm9UcT2YNYNG7TFjkcU
         tPgA==
X-Gm-Message-State: AOAM5337ORf+1EMFn5SL6etyJkVajEO+rz7dZVuUtkVD7/y8gxg22KR1
        udHHFCiN9uRuoLRoMuz+oUjjpw==
X-Google-Smtp-Source: ABdhPJzN6nDyZup0sLKds7ZZBQYp8QWOg0gvyO+9HOXmutY4wIibEnN9fBRxqOPj3PZtKkGjIYQvxw==
X-Received: by 2002:a17:902:ead2:: with SMTP id p18mr1917778pld.259.1598006219865;
        Fri, 21 Aug 2020 03:36:59 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:36:59 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 08/17] dt-bindings: media: document mediatek,mt8183-vcodec-enc
Date:   Fri, 21 Aug 2020 19:35:59 +0900
Message-Id: <20200821103608.2310097-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MT8183's encoder is similar to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 99214faede90..8217424fd4bd 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -4,8 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
 supports high resolution encoding and decoding functionalities.
 
 Required properties:
-- compatible : "mediatek,mt8173-vcodec-enc" for encoder
-  "mediatek,mt8173-vcodec-dec" for decoder.
+- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
+  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
+  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.28.0.297.g1956fa8f8d-goog

