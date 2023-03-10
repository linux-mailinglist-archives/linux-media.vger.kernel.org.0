Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B026B511A
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 20:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjCJTmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 14:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjCJTmQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 14:42:16 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46E21386BA
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:13 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o5-20020a05600c510500b003ec0e4ec6deso803674wms.3
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112; t=1678477332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZV/+MSa08gEH/cYpQPhStCYW3fLnzQFXutnb+Do1JQ=;
        b=B5k5r6C3KNQj2vsoEFuF6sg5cnwCv6Zmbw3pQ7AYSM78uvdOJWJI/SGK3c6c4vp0o6
         I0bzZWFrSvBLsxknnNT+uLNdM043lW2q4vMDvnXiU9Yk+exErLnFIcVvoVQECvoNBscT
         WHlz781MJNuqu3+3+Aw/l05kWoIFK0nWFQ7kLi/WV0I5L1lqYAtBgCXVtOZ6Yb5CFH4F
         60YJrM++fCJvi0qBbxYbenn6oQygXkhZqFop0oNc15RUtzUt4Lv6H8NLDzBENiezMN1z
         4zifjgbJvbZvtSoMZjoSRuGv0j47l/GvxHEnnVwgLDjkZJU1nkE5GapHXChtbY9aaypC
         9abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678477332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZV/+MSa08gEH/cYpQPhStCYW3fLnzQFXutnb+Do1JQ=;
        b=6ngubTUAN9iFFMcuj6Hq3i0hXtoAO5620XZIq+Tr+UtDRhMP47G4lDx+ozN2DyOUSQ
         tyffTD1yjPJN6mH8ospVsVIGLJbZMTvzPN/wnZYq49wMmTCURV1+D6MbBR9m3oGhCfMR
         sCO6h5g/Kr1XRmIuXqEbdIzRazIIoUm5ejYnvFa2VH5N0V4uL+Yxm6u1Dn/6+fS+jR+H
         y67SGf3m/v02JnLLF2sHozZIzMKUGBPDsptOvtdageiQyddcVxCKwkAqk35yRSbbFi9L
         PTdI0onh6CvvvRJKsoy/lmVZdWpFgwMNn6p95ivfLc24y2pT4NTnt5rwJvPu3IvGG7Uw
         2sdA==
X-Gm-Message-State: AO0yUKUZLDLD9z+NLA1R3//i034LrL++i5MrKIjFbuGtu65ks65yFNtO
        W0FFRCZvGbodlfq37TQaxJyflQxrztn+XO4Ilws=
X-Google-Smtp-Source: AK7set+extGx34I5+2Ba9FwrX1sXmfMUKbNbBiUc7hLgOm1A62+7sT6Xwoae1dvcVQLECSKG4ksY+g==
X-Received: by 2002:a05:600c:4f89:b0:3dc:5b88:e6dd with SMTP id n9-20020a05600c4f8900b003dc5b88e6ddmr4087179wmq.10.1678477331909;
        Fri, 10 Mar 2023 11:42:11 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id n4-20020adffe04000000b002c54c92e125sm585400wrr.46.2023.03.10.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:42:11 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        hverkuil-cisco@xs4all.nl
Cc:     John Cox <jc@kynesim.co.uk>
Subject: [PATCH v2 5/5] media: v4l: Add Broadcom sand format infos to v4l2-common.c
Date:   Fri, 10 Mar 2023 19:41:21 +0000
Message-Id: <20230310194121.61928-6-jc@kynesim.co.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310194121.61928-1-jc@kynesim.co.uk>
References: <20230310194121.61928-1-jc@kynesim.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the format information for Broadcom 8 and 10-bit packed 128 byte
column formats into the format_info array in v4l2-common.c

Signed-off-by: John Cox <jc@kynesim.co.uk>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 9cb0895dea1c..51f7d76ce658 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -267,6 +267,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_NV12_C128, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_P030_C128, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 4, 8, 0, 0 }, .bpp_div = { 3, 3, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 
 		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 4, .vdiv = 4 },
 		{ .format = V4L2_PIX_FMT_YVU410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 4, .vdiv = 4 },
-- 
2.37.2

