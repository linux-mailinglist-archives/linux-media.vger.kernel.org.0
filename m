Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C359C3BB6E7
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 07:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhGEFgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 01:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhGEFgf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 01:36:35 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A3BC061574
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 22:33:58 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id x16so15704768pfa.13
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 22:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXyqnOeoyJ4NZkEKPJHOl4w1hXSWWEzhqLTMS9dPfWg=;
        b=Jh1hPoDFYkVXHrWRwuJ4Scju5gaiBoK7/WyLA8g3EzRjNl9LEdaK04bb2ug55bnKea
         Pi9pbq/1u5IRfMKIl5xqpWvytO1MPAGHaA2H3pzWiwJXXj19Me1P0oTsVn2TUakHXHjo
         1NxcGOQrBYmY01tKHLlVEnWcBvvxqXJrzTSz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXyqnOeoyJ4NZkEKPJHOl4w1hXSWWEzhqLTMS9dPfWg=;
        b=E7tjZQJm2IiS37oDQf4J/+evtU5ci6Ylw8pzq7KSXTp9KYsLJ/31UDgea9LZKfA2kL
         atIzyIcRhl9x3dV4x6pG1nhJP5ZZxH10BstdGymZ9hXcI/wvHVLMj4Y6nA9N09GPP6hJ
         9PqtibnZsHbnx4BNU0/JXabv4+nR9PSwC4bQCfYwnADLpDmMTcCBCUvK52sGnLZMBZi0
         HW3oWQf6LmU51/UAhlYQPyeFkjwDV682HokB9bIxWq/qN6TGZVDGzOXKj+HaHIxe2Vek
         Lb6VPcv7gXexPiFc1BMbSkPYqtwJRZry63uEnNkpVrwHNpyhJP3k/yThz+5EiXW212N1
         fCdA==
X-Gm-Message-State: AOAM5322UiNt+egwA7RcTN8ieLeyNyISXUVVOe5vWH7whADYlNFa2pmB
        9X9amjkzp4ZKj+pHjHg03bPQ4A==
X-Google-Smtp-Source: ABdhPJzcOf6htkQbr6g+Z9QUaRVopdGl4FPYu/027dmu4bdfATz1XeYdyiDTTv2CEipoO7bU+Z03MA==
X-Received: by 2002:a63:445b:: with SMTP id t27mr13940726pgk.413.1625463238016;
        Sun, 04 Jul 2021 22:33:58 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:3fed:7130:60f:265a])
        by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 22:33:57 -0700 (PDT)
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
Subject: [PATCH v6 13/14] dt-bindings: media: document mediatek,mt8183-vcodec-dec
Date:   Mon,  5 Jul 2021 14:32:57 +0900
Message-Id: <20210705053258.1614177-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
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
index ad1321e5a22d..c44a6e6943af 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -10,6 +10,7 @@ Required properties:
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
   "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.32.0.93.g670b81a890-goog

