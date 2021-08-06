Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACD93E226B
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242793AbhHFEQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242769AbhHFEQ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:57 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31379C061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:41 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d69-20020a25e6480000b02904f4a117bd74so8313978ybh.17
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Q40VTyrZ8Jb3xiuLDWJt6+4MmyDxko7tqCpmYIXIET0=;
        b=KFfQ68eJZhEOu8WCeUjfFQd8FJzMNLuIbt1sBK+Zex7v8uDpxuX3qJAzY+rlDVkCzx
         ddgml7gc7yo115aJu0qJ7YFRhOH8EacWt4TFqPyugYmvZlkzGymGrEe78IRkuoTeAPIQ
         IGPEHz9/qYkpe4H4PMkNJ7jPaJ0WWG/RCMNa9z9wT7z0OXKaQksRDXFP+eeAGiunL1lE
         AxICXMcYN4tpXeX4HKJ2R6aQkGzjiINLeRiRMoQYibsJZEj1NKopEJ8EUIewwYLdidHt
         24zi8T8Ovqs2psTayROx8d7JgvDSh+lbY1iEqTfFky4qIMSW5XhfN+nOgJIjVAKfIK2Y
         YFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Q40VTyrZ8Jb3xiuLDWJt6+4MmyDxko7tqCpmYIXIET0=;
        b=I5J+bskxFXYKgijAXRHu//Lz7v8Tqm07Ioyp6C5UlumSpgh0aQgacXRfhXnEkkR57t
         GYfqRVaETXW0+XRFKpsvmy96St39ssGeE9/WMTGbMxQQrJuDCrmApEqLho6cN/Ic0ZdC
         H37Tl+RIiegqbwcfng0MEufqI1kosAj3Rhb43woqmtdv6WcvdhfjU/QO0FHQgyo3aA3f
         XoajEKyHneTZNfA5sJfaibGHs5SAMGowYkmhRrgoY33eFW2KdRMzDMQUpkfNW37E6fSh
         WiW1SiANK5boFrkbQiR8PdLKBBaDS6WR3w83r+qj9J5TLjrqa/NJxkeiNzZrxDvijqtn
         HdTg==
X-Gm-Message-State: AOAM533wT2pRBhiiU/FppswOXWnr0MQSPcK6j8qm2dtmVmbGYyEWccHy
        cY2UzyKT+RhlLQh/8zP68/R+vhNOvHIH
X-Google-Smtp-Source: ABdhPJy7KEPygmtbEYTAh7CaN/i2KocvupvFKwvGA77PqToujXIpHnTvPQ/IKCQ1AV7lU8YQE63ExtiPNS3T
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:bc02:: with SMTP id
 i2mr9968274ybh.98.1628223400442; Thu, 05 Aug 2021 21:16:40 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:29 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-14-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 13/14] dt-bindings: media: document mediatek,mt8183-vcodec-dec
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.32.0.605.g8dce9f2422-goog

