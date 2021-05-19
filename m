Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0187D3890F2
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354258AbhESOdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354149AbhESOcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:32:42 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43AAC061343
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:31:15 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t4so7136508plc.6
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q78A6AyR4otkcBAEkBIo9qmnIjV1Nb+H3oDCE4IqCeQ=;
        b=dk1ZdNXVfQKhoxoV566tbhH8A/Vm5G5muFFzInXVyLCirIpXak1AELLnVkrrMahI/a
         q6MxIrXu1qfZeZBrMwuppT1phAq5lkeDE6I6+c/1Y4nO47M8YOAf3456KRR3kVi2TCgj
         oJRGiqgCTwJNjaoVqdWeUopl53rJC2yORKK1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q78A6AyR4otkcBAEkBIo9qmnIjV1Nb+H3oDCE4IqCeQ=;
        b=pZZIPv9fUKYLcxIXGncxkHgH6wupJFtifa1+zCCWfE688f8UJWIc2Lvmv8qYt2wnPe
         awwsULERXScDsKlzKKu5xsFBL24Qh/XAPIZGymySbIUFOz9PGy1e6qOgWGk5FZWPwwHC
         C65BL7ANRgdEJEYa/SdyYtgpldnLv6j5FTL5ZJudx2dajYHF466qR0E9dWYBNHbcb1W4
         iD/KR/CLrhOOhprtCeHVBknmKQLQkOZ386RdEzYl/wI+tHrZGUXS5FHxYiZOzMWcZIOA
         C2am2XgUX8h5VpgI3GoCbuKShCabdoJcqpAkBz0yZxbhvv0Q4WfU2+7cPvwWF2g/oUw/
         Yn3w==
X-Gm-Message-State: AOAM53269B8Al2kJNQ7d2ZEsmVG0hL5XB64EyDVN4IvlaciA5LXnpUSC
        14Ey8egCU8nxza1wvUJ/cm3udw==
X-Google-Smtp-Source: ABdhPJwdDn/dz5IGtknH9kB+SXI4eNzO99AciIpqZ19tsCC7zIo+J+5hsaypxdt1S8opgVpNUKirRA==
X-Received: by 2002:a17:90a:2ec6:: with SMTP id h6mr11572585pjs.103.1621434675194;
        Wed, 19 May 2021 07:31:15 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:87ab:ff82:1544:697])
        by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:31:14 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 13/14] dt-bindings: media: document mediatek,mt8183-vcodec-dec
Date:   Wed, 19 May 2021 23:30:10 +0900
Message-Id: <20210519143011.1175546-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 06db6837cefd..a2a2a9e2ade3 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -9,6 +9,7 @@ Required properties:
   "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.31.1.751.gd2f1c929bd-goog

