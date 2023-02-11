Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB842693195
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 15:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjBKOmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 09:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjBKOmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 09:42:02 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C1155A5
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:42:00 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id co8so4183554wrb.1
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYihlRBSgUX0V4izOF22/pryLG+o0TZa15GZ5+G7yjY=;
        b=I104glg/qrsF6mrPbvNkPeYcv2gdzhv1THfazCHjDEYwAQAyClZLUeASwVb6MbqAW6
         fq3OIYbjUTUIeca+lbBYTxHWzKkqAWmKTvB/Mi+ppUlubYf0ILAi114yIlmFTZnuDIV+
         w4iRgqTxDZhSWNI78xjx+evx10IxztbPNiKC9yhKhP9znFEphFZCYWQHzRjhXy8LjnE2
         OBqo+4hWz2IvSB1et2owXA6sR2lraEx6blVOJDUW/LpRnEY4ULXydrnHS5dJ131FaHN3
         4asLxfJfpWKDatj2OwwXkLnbPaE2W3Qwzu20a8a6nxL9OXekHd9GRfewzKmLXnZH2UGU
         ykGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYihlRBSgUX0V4izOF22/pryLG+o0TZa15GZ5+G7yjY=;
        b=P+guf/ZSl/ztd4OttXejZvhXQNF7EZ2sZmYACP6qfZHSRBgiAOXp0oMl52muUMEIn3
         hHXcfII086m3qbzqPBtT5TnRICS3hzIxSw2+DB6kkCE0lBsTN6DuAQSxd6MkOEdv5kpC
         nM+3z0tr7eVUw+FlBf5QvEvRmPmrMS2AKn+RV3VB+ZMX6qXewgzhPAxw6oAQyP/CR60j
         AKEN+dCvyHR0jCVBAdu1x0oFb12lHytoHAZCuEpZ7XJfYn1afyQv1ZhKGlr+z+q1YJ1a
         IbNZyNp2tWP224FkajQOAJGjRED0pUqWxfZw1EdhMdwK4g0oKbasGUVg6JB4G8ACjdzz
         Zd1A==
X-Gm-Message-State: AO0yUKXuW0Ofwk1PaeQvDvjh9X1PkQyQC1yIs8461BLS1+0jCrt0Oh4Z
        F2fiHvO2UqNC89oAaoQgn7fuew==
X-Google-Smtp-Source: AK7set+hO89Qa3igpInUnE9Gxm2vfbYaY0WhtNNvyGgC5p7fN7zMMfZybj406guDDU7gMd//2XQwGw==
X-Received: by 2002:a5d:4e10:0:b0:2bf:e5cc:91c1 with SMTP id p16-20020a5d4e10000000b002bfe5cc91c1mr15985399wrt.52.1676126518986;
        Sat, 11 Feb 2023 06:41:58 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4202510wrq.25.2023.02.11.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:41:58 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] media: dt-bindings: media: renesas,csi2: Add binding for V4H
Date:   Sat, 11 Feb 2023 15:41:46 +0100
Message-Id: <20230211144147.3812388-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document support for the CSI-2 module in the Renesas V4H (r8a779g0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index b520d6c5c102..977ab188d654 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -31,6 +31,7 @@ properties:
           - renesas,r8a77980-csi2 # R-Car V3H
           - renesas,r8a77990-csi2 # R-Car E3
           - renesas,r8a779a0-csi2 # R-Car V3U
+          - renesas,r8a779g0-csi2 # R-Car V4H
 
   reg:
     maxItems: 1
-- 
2.39.1

