Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4371DAD5C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 10:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgETI2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 04:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgETI2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 04:28:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A960C061A0F
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:28:12 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t7so1035093plr.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ll8NxVtMtfVOyEZFFQDfClPq5aIFoMbY7TDtR4kV3zQ=;
        b=kI33MLAoCd0TxRti1KqGfffMmFCe7Qu+9zJ9GzgvLmIhvWroMh2PK76BMUA9xvXNN3
         BeTyj3uDBE9zEEC9mrGi7btmBWv1HKDYmi4AFLoegQbxFbzAiNC0xk//stOr6yOaHvmJ
         RFZ60+RwMPuvjP3Y2vhaAM16aSKaOTZXVNebc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ll8NxVtMtfVOyEZFFQDfClPq5aIFoMbY7TDtR4kV3zQ=;
        b=C/mvW1OUVH6BXSoyYBtBYhEjVDNIqRB7Q8EwZzuXzxEuhRf43zFQGWYkQnNlhcC9Oz
         JsR/IhNqhleSBeBy4pV7Oa8/WypoAI/Z1dkBFCO4K9AqGlGzzt4Qv0mDoTQ72xbyfdvM
         hecvqoJOve3Rd9CY5B8RwjfWI93LdNBIa8WQpFmhrzo3hbNxQU9fMMtvhf3LcwePdEJ3
         jfGUMoQex9/UWx0ZOMQ1SwWE9Vho93POJGld5lLHmwJqO/4/X2WSZIhgplvoYFPyuPv/
         FQaha6AINJ0NmLH1gSzKEftZMDb1WwcZgkIu7twfyjGppPm0esBIESYDmN5XZ89sLmR7
         0/Bg==
X-Gm-Message-State: AOAM533W3ohKBuvanZZKO3lSuG3dRmGnQaRftwN7kOX/MCdjsQxpNdTU
        HgelJPR+qUTVfeoecL25dPndYA==
X-Google-Smtp-Source: ABdhPJyLQteFuXuVc69SpcsEFfMjArlHWm8lgkG4Ws0al46mciJZZn5XJ5qdF3eWNGJdzMi89qu6gw==
X-Received: by 2002:a17:902:bf43:: with SMTP id u3mr3434302pls.240.1589963292039;
        Wed, 20 May 2020 01:28:12 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:28:11 -0700 (PDT)
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
Subject: [PATCH 09/10] media: dt-bindings: mtk-vcodec: specify SCP node
Date:   Wed, 20 May 2020 17:27:22 +0900
Message-Id: <20200520082723.96136-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mediatek codecs can use either the VPU or the SCP as their interface
to firmware. Reflect this in the DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index b6b5dde6abd8..7aef0a4fe207 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -19,7 +19,9 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
-- mediatek,vpu : the node of video processor unit
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the noode of the SCP unit, if using SCP.
 
 
 Example:
-- 
2.26.2.761.g0e0b3e54be-goog

