Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FA43260E1
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhBZKF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhBZKEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:04:02 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01035C06121E
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:24 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id o63so5924121pgo.6
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bIALnHOxfqV79rmxtlQVLJ7XQLHlFw9MAesM3ioGoWo=;
        b=SkE9wICXCgToe1dlplqubNyP3Uu5GyOznpHgFFUphOPxG5wwvYBb0L5gJicXqSTLTV
         3Ac+tMUkSMIRQLMJ4lPq+6f0rjI56FUEhJU4ufbx9cBEjxf2BVXQC/r50iRbRiGR6grv
         jTlnI/hQAkqHwBQMFsyay8yLJ1cjyL6RoAdwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bIALnHOxfqV79rmxtlQVLJ7XQLHlFw9MAesM3ioGoWo=;
        b=MP6N7gzRJTYzn0XxWU4YE3FBJ0Sdq69eplJvKqoCWBfQJNuDLybAo1iYQwFapSU0Mr
         ulxZjPZTS+mxssKlwx+JmkSVLeZLs054RR3OvW6zW4ACPkla8IrdvSl6XG+A/T1/es7y
         mmV1hiLBb4R2sIoheUDS7PCmU1DOYpGgTinRd4MNwVhkso+W20/p7A7lAVJShvuK3S38
         0qi5L3QQRHB5CyRVlSo4Nw7wB/lHG5nHY/Ue6A+SB1X71eLRYYBdY+qbhoGQpJxpxNXU
         eRfJhVsg9TOAxByzYRjJB4zwVP6SwEFYvsgViJgLB7EfGth1XEHEzqGrAcBSqHB1y9lj
         3Lhg==
X-Gm-Message-State: AOAM532DPbwDCKb8UfOzRSsf/9PHfdtSTwHA9Dg9/am2y/nwWyWb/mJz
        f1LNm6BxdQ7xwA3BPrzH4vD4sg==
X-Google-Smtp-Source: ABdhPJzjj+uNB0y4UHgKTmkt+simNCrzoE6UqpjKQRM99q9y53EZRAREXkmj/1w04TJOFK+adS8shA==
X-Received: by 2002:a62:5344:0:b029:1df:c7d:3c3e with SMTP id h65-20020a6253440000b02901df0c7d3c3emr2531720pfb.11.1614333743609;
        Fri, 26 Feb 2021 02:02:23 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:23 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 08/15] dt-bindings: media: document mediatek,mt8183-vcodec-dec
Date:   Fri, 26 Feb 2021 19:01:41 +0900
Message-Id: <20210226100148.1663389-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8217424fd4bd..30c5888bf2d6 100644
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
2.30.1.766.gb4fecdf3b7-goog

