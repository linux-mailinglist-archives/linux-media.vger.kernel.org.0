Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80E655222F
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 18:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239131AbiFTQZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 12:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240211AbiFTQZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 12:25:24 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1F01D332
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id o23so5357415ljg.13
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=vI292d16D698+Xcw7s2E0paEOfRj1b9GTKU7dbf6A/4=;
        b=L9aA8ENqJhX0SovZYUw+2GkJ70EOm9aZd+4TJz7Ehv9CreCDaa8tv0NciPwtsYWGZr
         4hEU/XHeyyYtTJO5FZxpytP552fmcAQ4rxmyW+YHY8E/1HLKr7eLoC7r/sZIVpMgP3eo
         VsuUAHKVDU4/1Hpyx8CjpxObpMb5TxxdLrHzObzoGzL/ic+43J1vvfQriIwvQ4XhoQBh
         fPkF2gfJs6tFznGVrQAleTMH2Xvvly92Zkzd1ibof6vlXPzhp2SMhiABNA0XhgrM7sPg
         HWmkxZyLu/Pn4UJQUe60xm7RwCPjWzmaIKOGV2PSXCJ/FlKfVQe/3WOW8p7lK2jJgM8L
         2NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=vI292d16D698+Xcw7s2E0paEOfRj1b9GTKU7dbf6A/4=;
        b=LwaChJdSD7uwK3Fsq+XrHitsxQQYCD7NrSP3FlzTMNtxnBAmfnxeibFaXjqRPzlrDP
         ewg2T57ObLvb6VM4i5QvybJAdb/98HgmOvSqJSuxv1DqEGTvrXZcLTFrJAC4ZF8XbWA3
         FrqqWwEOEaUYqbR83vsyuGQ8G3gtNfh2GGFK1/UC+ijGWpEwZ7w89KUQqPkusf/CXxBX
         YKnJTV746cFgGzo6J5akz1yKLfroUpK2XTxWCOK+RYY7JLRs8QrcUl5TZRTgovx7tQ27
         t5wB3FdLl4Ta20um0BMa55H/SLjiwVwNQVPmBYEZSd9Djgh4sXAeWmIqLOhRR07Ovx2+
         qGOg==
X-Gm-Message-State: AJIora85dmkiMZbtq9JjbDmALK1NBHTEq12htLkZ5+1O7cVl+N41sMFv
        IcDzJ5LaLgxJAWMtJsIvwmh9yurbOjCJS2Vce7kPYt8xr90CwmAW7ZFt41RXDVRMdtXg17NnYwh
        lSI+UhRf1O7pOq0IcQNwqAj5RMpxBwNU3H37BUhHVUD3TKyZEys4hQg7WVJ5oNMhTshaidOTQ
X-Google-Smtp-Source: AGRyM1u48tN8pAD6pU4b4oRGq9myPECVfBoYBO8P1bMkMk56jhzGFz9T3tKWT4FJJDzmc9WcFmn44A==
X-Received: by 2002:a05:651c:2110:b0:258:ec9a:3b8 with SMTP id a16-20020a05651c211000b00258ec9a03b8mr11798353ljq.384.1655742321683;
        Mon, 20 Jun 2022 09:25:21 -0700 (PDT)
Received: from vkh-ThinkPad-T490 ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id j12-20020a056512344c00b0047f6d4a1ca7sm593472lfr.238.2022.06.20.09.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 09:25:21 -0700 (PDT)
Date:   Mon, 20 Jun 2022 19:25:19 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org, vkh@melexis.com, ays@melexis.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        kieran.bingham+renesas@ideasonboard.com, devicetree@vger.kernel.org
Subject: [PATCH 2/6] media: xilinx: video: Add 1X12 greyscale format
Message-ID: <20220620162519.GA13995@vkh-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Volodymyr Kharuk <vkh@melexis.com>
To: linux-media@vger.kernel.org
Cc: Volodymyr Kharuk <vkh@melexis.com>,
	Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/6] media: xilinx: video: Add 1X12 greyscale format
Date: Mon, 20 Jun 2022 19:24:33 +0300
Message-Id: <33eb3ccce5d4d0832b07dd0e18c5ec7c800f471a.1655738299.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655738299.git.vkh@melexis.com>
References: <cover.1655738299.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the xilinx video driver with Y12_1X12 greyscale format

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 drivers/media/platform/xilinx/xilinx-vip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index a0073122798f..5b214bf7f93a 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -40,6 +40,8 @@ static const struct xvip_video_format xvip_video_formats[] = {
 	  1, V4L2_PIX_FMT_SGBRG8 },
 	{ XVIP_VF_MONO_SENSOR, 8, "bggr", MEDIA_BUS_FMT_SBGGR8_1X8,
 	  1, V4L2_PIX_FMT_SBGGR8 },
+	{ XVIP_VF_MONO_SENSOR, 12, "mono", MEDIA_BUS_FMT_Y12_1X12,
+	  2, V4L2_PIX_FMT_Y12 },
 };
 
 /**
-- 
BR,
Volodymyr Kharuk

