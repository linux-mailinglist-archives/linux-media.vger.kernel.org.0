Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCF94B5CD3
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 22:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbiBNV3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 16:29:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiBNV33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 16:29:29 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E0D128648
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 13:29:15 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d2so1745411ljl.1
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 13:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bvEyQB/PyceZSKFICAgr4rX9IZccsdLqr5cSBDPK0TQ=;
        b=O5Fkn+9175Dg1Xv2y/9nuCaofeltao86wRESQBPZvQaxnAEumWfk1up4sKPnZzbbGF
         HmXYHjl/VDP5dbsl88sX60+gWWkzAIMuWCVi3rgsqGUzH2YchfSzptpswWG0JLGtXz8s
         QGKDiUkR4PsSXU1eym0MLb3J2z4de6GpHnzbWdzFvphcHyZ9vyR5vAAnelAIWdOI3Ct0
         PCMB97eI/Cp2ovH06CZxQuz5FE+TWA2MNMbZ/N8+kiuDZ+A7jKy4xS2WTJMP56WV4OMJ
         4ONgDuRxhz0ClqAzeqFBoefEVAaFWd2xN8vGMhNXqvlMH6ZFFtkK1EvknD+MQQG1rrkT
         nd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bvEyQB/PyceZSKFICAgr4rX9IZccsdLqr5cSBDPK0TQ=;
        b=46MD8D9nnddbDHF1oZUQSEGm2w7/RdOU8NOJ+3H8WvHX4rPS7HvAS9UhfdIK3NzZer
         hwiYiHMoBU5eF7BvlVh4D0UIFGX43PFnl2P9Cvs8QbsKKsGOopxpG+gMa9e/FhFhHKXQ
         xutQDyLGt0ReREUHUBhQuff+ZdQfL/47VOpla9vw2I9ntjgIgpbNq9Z02awtZgjGSpdo
         UDq20eEamK/TUard42XirprtxzD2pUcAeKktG/isY3b6JPtMqPtR3e65bPlVnljs8suu
         p7iZbTOzeDREElRO+uDgO1kjWC+052gG4Hpf99A8oPLWruWU33qpx0gltoX+ZioAFRlS
         WqeA==
X-Gm-Message-State: AOAM531+bYRXERqJc1Xh3Klga37PlNVWCj/Nl5o6CziehCtSTFFl9MM6
        aW4/hbiRj0aD00ynxwL7pBOcAg+LnDqsMw==
X-Google-Smtp-Source: ABdhPJzidgUExYWazrcpL9i5bTa8JzEUMlW9InrSyLoYH8ESjXXhHMSlks8Qiy/MSB62O/rwQxe/aA==
X-Received: by 2002:a05:651c:178e:: with SMTP id bn14mr473681ljb.12.1644874153832;
        Mon, 14 Feb 2022 13:29:13 -0800 (PST)
Received: from localhost (31-178-191-245.dynamic.chello.pl. [31.178.191.245])
        by smtp.gmail.com with ESMTPSA id s2sm868363lfr.126.2022.02.14.13.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 13:29:13 -0800 (PST)
From:   Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
To:     linux-media@vger.kernel.org, Linux-rockchip@lists.infradead.org
Cc:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v2 3/3] dt-bindings: media: rockchip-vpu: Add RK3568 compatible
Date:   Mon, 14 Feb 2022 22:29:55 +0100
Message-Id: <20220214212955.1178947-3-piotr.oniszczuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
References: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>

RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
video formats.

This patch adds RK3568 compatible in rockchip-vpu dt-bindings.

Tested on [1] with FFmpeg v4l2_request code taken from [2]
with MPEG2, H.642 and VP8 samples with results [3].

[1] https://github.com/warpme/minimyth2
[2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
[3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt

Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index bacb60a34989..6cc4d3e5a61d 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,rk3328-vpu
           - rockchip,rk3399-vpu
           - rockchip,px30-vpu
+          - rockchip,rk3568-vpu
       - items:
           - const: rockchip,rk3188-vpu
           - const: rockchip,rk3066-vpu
-- 
2.29.2

