Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD6C24D2D4
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgHUKjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728536AbgHUKgk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:36:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B50C061387
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x6so797226pgx.12
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BLvzm19F3zl+eOkSMMbBhpyNYB39d0d4Z4gVhRAGhhs=;
        b=Iy0MSgFux7Cev845jWcIk5W1d+GN1ssj/IaGgeXfk+ZI3C12DLDxSPaO9eKgh9hnP3
         kT63iPNAmRFK/qG+QwJ9fVto0ueIRlNan+MrfK2pKRbA6FOuGijR4Lz3+a51FJXgod/N
         xWkJM0z8MGUmSv3M/0mwWg/4UdGwNgUAPw6Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLvzm19F3zl+eOkSMMbBhpyNYB39d0d4Z4gVhRAGhhs=;
        b=i2zwKv8Rfk4JQheTGwuCuT4MLN9wKs4NVl+aEwc+52K0oE7/1qnfZ5Qe4GwETcpBnL
         uXi1A0iG3ynY8VsC5tVrw7lavGYCPAwGf5dxubfPelGGFNSZgKkiySte3pxmF8Sj8MRS
         Tbjz3bn8RL7vtFTJaQPwCeRGLg+jWCtPKEXx6tdXhZrc1LGLy6mNFd2U382TOUBw9P/I
         x8jqiVebKFkBl0uXCxtiqIdMmOYUjKgEIULKh8cSQYI44b4vTuKoLJFMoqwXPAeAd3BV
         xL2hQ96ZSH5g1SG6D/1VjGYmYEH439Y+M+ctvgJDegLLzxQLP/FVnWDZZPmRlgTSTINz
         kgNQ==
X-Gm-Message-State: AOAM533aP4rXlT/V2T1J/BZ6tBopTIiJaXdL0SmoCUrhfuNgaCtoE94u
        0HbREw/0XlVE1apoqerr4CjV8Q==
X-Google-Smtp-Source: ABdhPJxmj3MQvemdJuy54bQsLgg/tFf4axVuPDthLbNbX2Xeb4x6zKwMnT75o31enJ+GCmphNZcZNg==
X-Received: by 2002:aa7:96db:: with SMTP id h27mr2009391pfq.26.1598006199528;
        Fri, 21 Aug 2020 03:36:39 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:36:38 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 02/17] dt-bindings: media: mtk-vcodec: document SCP node
Date:   Fri, 21 Aug 2020 19:35:53 +0900
Message-Id: <20200821103608.2310097-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mediatek codecs can use either the VPU or the SCP as their interface
to firmware. Reflect this in the DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index b6b5dde6abd8..99214faede90 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -19,7 +19,9 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
-- mediatek,vpu : the node of video processor unit
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
 
 
 Example:
-- 
2.28.0.297.g1956fa8f8d-goog

