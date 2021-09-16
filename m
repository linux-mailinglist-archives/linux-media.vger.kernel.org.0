Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5AF40E535
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 19:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344139AbhIPRJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 13:09:02 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54124
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345292AbhIPRGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 13:06:30 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4520440293
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631811908;
        bh=iLBqEScFScgxWKcmf9ZOnKkcn3SW2EPjpclUhT/HEPQ=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=wKgX6tHpMJQhbfgh0pUH437exTtcEL5knjJJUqWu6ka3oorKQwOLl4lvEweH3YUFg
         9dbqW3A32cuWUrkCcRGpM/OFCDYjGqkIjDQlZht9g0CwTPkZSYOPqbccmAueDpbmdc
         JVjOf99jUnCy93jiFUFad5bclDeegrzmX0w9J/pdvt8Lq+uLq7jO54ujMKbJWiFMRJ
         /Ip2P9XAq5REpRJoffvhz/aLjjwj12pNeMJRWjxW8Ghi9U62IAQLip+gj4CI5mmg2L
         NolOQR7A/hq/yi9WeTqLnU7GmJuyYsZa28CKHXLnK7NOc8KkTbu0B/NLSO2ix2CB6S
         dkJ7Yq23/t7rg==
Received: by mail-wm1-f71.google.com with SMTP id m4-20020a05600c3b0400b00303b904380dso2804900wms.6
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 10:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iLBqEScFScgxWKcmf9ZOnKkcn3SW2EPjpclUhT/HEPQ=;
        b=MJE6bTV0Y1582BP1GobzfjjhCrTY9qMu4lLJ6dqAJpaeGEyKfDUxBo3l+aP9D4udHy
         FgfU5b35aSSI536p7PfoxNddWh14FmOmCooGruwUeCzD1dxhRjPP/7NtBBMnV95yUW7Y
         CtUTehk8KGH32W1RKIU/FBwfz4O7qd5dR/LFt4ivx8agNxnkWDN8qzHr9MCGBDT8Bwk2
         KYkd3pdlccPSFwSj9NLvfnj1CDgOtIj8nXzSqFv3ffkw2xMyGIcIoiG0YJK31zJypFuO
         OVfAYkJetx6WEdaNfUUgHTU7e9fvoBMBPPSUt1oELHuY3RreNdvp5/BjSRmzDy8HFlQL
         L+KA==
X-Gm-Message-State: AOAM533w/RfzOWYC+jPNsYRZ8XuvJMhXfBHmRZhHPe6/DxMy+/RuzmCd
        GMAltQ7lnmBAaOVJ36wVK/Z3a9rK5/fDPq4jAJR7XRMAZsnpAfrB3M6vReJvE1A0M7bXpQ6y47n
        rXC6/L3v4Rtkw2CuSN/iQK+qLGA600x+1dn4IvcRl
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr11043284wme.191.1631811907603;
        Thu, 16 Sep 2021 10:05:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFoPVpcbs+WRaVV7dRF1QA4InnI52r35X3w7JnJnSdjjA+61N6godLhYSuzpSl7b5GhJi+DQ==
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr11043255wme.191.1631811907375;
        Thu, 16 Sep 2021 10:05:07 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d8sm4278794wrv.20.2021.09.16.10.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 10:05:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 19:05:03 +0200
Message-Id: <20210916170503.137757-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 45f9d797b9da..3daa636b67db 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -2081,4 +2081,3 @@ module_platform_driver(imx_csi_driver);
 MODULE_DESCRIPTION("i.MX CSI subdev driver");
 MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx-ipuv3-csi");
-- 
2.30.2

