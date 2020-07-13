Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D368B21CF3A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 08:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgGMGJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 02:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbgGMGJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 02:09:16 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C7DC061794
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:16 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 72so5066656ple.0
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9AFTK5sy5b65UBrUgiCWog3nZlxaQr2qNRRBWOcbPY=;
        b=GYGiuENfFP6o43mQKJmCtCaiBzvFIFl8M3X6pt8Y/jF3H6QjVXoheulq75HmYFiVwR
         IUdmXt37vxJj1oj2OcUA4oVLgnvoZijJ2pS/ZanKlz3IvmIM/k7mXzIuzZh3h0oeu8Yz
         ApuZ3CsG8HnsQPFM41Vppah/130o7vKdymElo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9AFTK5sy5b65UBrUgiCWog3nZlxaQr2qNRRBWOcbPY=;
        b=BBHXJ6ZPgwqLyXts5FDajJ6Zb20mpSKgWGNuBdj9YPZ6ySRPpTy2k3sFCzyN8jtIem
         QGM+l6nTJxtaZhsP0IE0MHRoSenFBZV7i3opNrbdtIGm58WV7jNpTfDrMoJ+6ajXFKmS
         RCFE8ycEjUPTnYEWqi9huDkzH2kkA6g11YP4H4DySqpxeRbf97nVKs3ND5uq1u83LT65
         hsdHBKhE56XWguGWFy/odcTZtcT6RMlmz2UmkDJMuZQlTGHWiUfH2LikO0wPf5cMRbf8
         jdnThr77vw9+0TjjYVpxNeD1l8+ErXGSUJbYq2y0WTHc8OPoUBB/AdefRMuJTe9EPNq6
         s+Zg==
X-Gm-Message-State: AOAM532/ZwuPGrBw6IHBBKyGLmEFFyuTNRyeIBQeeMjbRxsb6zRgwVNz
        AHt4zORJpqj4nRbOwEkijfrQGA==
X-Google-Smtp-Source: ABdhPJx3SJkNWmCQs1+GoJ970CROhfFsXeZ9zlBtFpfasuDN/rfouoO4+8wFRudIjRawmBQHkbY/Vg==
X-Received: by 2002:a17:90a:f00d:: with SMTP id bt13mr19057042pjb.109.1594620556067;
        Sun, 12 Jul 2020 23:09:16 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:15 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
Date:   Mon, 13 Jul 2020 15:08:28 +0900
Message-Id: <20200713060842.471356-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
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
2.27.0.383.g050319c2ae-goog

