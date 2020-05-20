Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26881DAD5F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 10:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgETI2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 04:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgETI2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 04:28:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6E7C061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:28:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n18so1214753pfa.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AFsCpw0e2sBJ3SKzImAxY1nX0ns77l6D7lZ5pyXVq7c=;
        b=NxYuD+W0eHByIVffmtX4cSE7Q15AfQjBOiJE0aaMyKH5qn8hRwM5tVCX+EYAbDZH54
         qFIOrLUElAH7aRgCsYUmbLYaOkS4LIg2VhrzWH6UchyRtXem6pBKNr0u9yy8yT20OjJW
         LY20zeuWDmsjsQyjkW43bgAIlBvCd1kVB0GpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AFsCpw0e2sBJ3SKzImAxY1nX0ns77l6D7lZ5pyXVq7c=;
        b=DTV/skgUsRn7aSyUXHkE/Su0J47tRz2YHCCZuUjmmIhyymxwnFtEjJSejmIAbuyQj6
         Tjyz/fyLGtP7Wv6EEMIZusk+XuM4tMiuMMiRc/fpclKea4YWHyk1m3jUTsJWSGsaVaDt
         6nJX6vEiLi3peytrMouS6hiOWXz73MPcHeO2Ei1xF31TC0saIT8HwX7qKxCkc+qZyNTK
         fi3ORnDw6CDvTNZze6jHwliDugVhhYwfgAm9xxtnNH2URwunskNCOnViX9FoAfDKEPly
         pYhPssMjcRF2X9EZwnVaFJroUGf6E0YURTg5mDKptvjpjuBFmZERpQV7AjEd0m0wMOE1
         J6fw==
X-Gm-Message-State: AOAM531kH6JVoTXVZKjKF38pIC2NrEI47OSOJ8ZUtmhFiYW6ZyhtyfYd
        FRvrwDUUBFGvZmSY7XZdjZ88Zw==
X-Google-Smtp-Source: ABdhPJwolvvdLtZTp/E/v1cgUwBNoOO4dJkGghCUnaIE6/nVSj9qiTNvax2QtVKvxMZxYBPTADizHQ==
X-Received: by 2002:a62:14d6:: with SMTP id 205mr3261015pfu.75.1589963295152;
        Wed, 20 May 2020 01:28:15 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:28:14 -0700 (PDT)
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
Subject: [PATCH 10/10] media: dt-bindings: mtk-vcodec: document mediatek,mt8183-vcodec-enc
Date:   Wed, 20 May 2020 17:27:23 +0900
Message-Id: <20200520082723.96136-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support for the MT8183 encoder has been added, document the
corresponding DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 7aef0a4fe207..8093335afecb 100644
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
2.26.2.761.g0e0b3e54be-goog

