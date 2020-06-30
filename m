Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F81D20EE6D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 08:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730321AbgF3G2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 02:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730292AbgF3G2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 02:28:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11320C061755
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 67so4905710pfg.5
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WrH62sNOsIyA+bZUWvdaT8mtXVgNLKJ4Ma1LMcNUAKU=;
        b=lsjiIug4X6wJnLGMoqdnf2EtlRQdyHztqYifj+F9DWxMaUDWjC6VtcPJIP78h0kPu1
         KmgKxbrCDYhjm7+oQxOXI8pq0zvO3C6GktlJ4Th7zd1Zs3SF0kSjfa05rZ5kXqTVDJtP
         SfRHve4FD0yo4vE1OSWND44Ixw6FZ9l9ufmSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WrH62sNOsIyA+bZUWvdaT8mtXVgNLKJ4Ma1LMcNUAKU=;
        b=D3WY00PuivGU5wetpCpPd3nXa3q1Y7quGIUrqO8NueGQW9vHtOPiWeWgQZqRPuBH0p
         70rQtZCNpaIjRfffyzV7b4CxWnDXZJTnWpYOtmhYUH6RZkBIkqLdEqZ1EMggiZFCOAWL
         L0i8UMDDV5Ryp2/MTFOW6IA+SEPQxjLzrPYXK8MvrH3hkFjJETXQJeGcZ4zlygcABu4G
         E0zs8dJmsJ4Ub3dHgtNTd6WQwCbkfdpbGxe7GpGSdIe3rozc6Wsxuy9EBIvC6Ej+7hoZ
         Xuc4UTnxZTxJpgSbx7SCkXHJoLKxhMz9pmcLUTfjHZ8ESunA1hqOWa6FQWC5w6Xgw4Vt
         xbIQ==
X-Gm-Message-State: AOAM532eU5AyqGlMUFLw5SurzD0q2XCIboZ0FNSnFc+GG1ygSbcQQMq6
        OYBr3xCJyAfTlWOoCjBkeBv7aw==
X-Google-Smtp-Source: ABdhPJz3j1bYUqaPRUaPXgTjd0S72OVpblIcbiEiGszIAsdQ2p3a/yRuBNlTRr46ige0lND/m0u8rA==
X-Received: by 2002:a05:6a00:1511:: with SMTP id q17mr17923876pfu.16.1593498493649;
        Mon, 29 Jun 2020 23:28:13 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 23:28:12 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 9/9] dt-bindings: media: document mediatek,mt8183-vcodec-dec
Date:   Tue, 30 Jun 2020 15:27:11 +0900
Message-Id: <20200630062711.4169601-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8093335afecb..b844800e0153 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -7,6 +7,7 @@ Required properties:
 - compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.27.0.212.ge8ba1cc988-goog

