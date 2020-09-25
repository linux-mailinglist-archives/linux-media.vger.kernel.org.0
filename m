Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D45B2790B9
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbgIYSfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729718AbgIYSfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:08 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CA8C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:08 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so3984143pfg.13
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/tLZJac8Ffn37A7WxCGBPX2NFTEQpF30SJ7IB/uL5Ro=;
        b=NijnwCAOmsCb2aBVRKlNwgmrQotpLKDdSWVvypG6iEl9ysVLEUa9ZnkMttcIhl4L74
         XdqMa01kqAfV+e+hflv2pda81/Yfn2Y85LdAbFz+Qz4qA5uH0m7Ez6t/42wQectA36mO
         pP1G9m7RUHiuB5D7l91GegxJqFR8y/rl8hAlRoJekdUaAiyxFTEMIpvYYbNYykYZjF0K
         Nw3MR171eAQK8n6l0dJbQvTN4KantfBGlZkOcgXPt1uoC0k/aQyJW4wtIjvPds2w29B2
         46xHPKf8u3e76Aimf5zPVugS0Q0u1bPoAgwXlbMRlmHEgXbiNnQwVuyDlDSKr2WnCgOx
         Dsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/tLZJac8Ffn37A7WxCGBPX2NFTEQpF30SJ7IB/uL5Ro=;
        b=mUXd2gbi/ESh/GDJaplFEohg/wt89MPs8aYOEfwguVFjXQTZtLjLvf/bq57mG4uj5l
         HJ1tsCu4+yDj7cZ7xY0oPdlbnwU1MqM+yyis0SJ1f9ZzoAfRzfh+BegeIpo80ZDvEWHI
         nPjceo8DaDG3uYkwPk2Yqo4Na218jBGfiQVTaR9AU+R1oODCPkXwaHY9JeoWaNLETYoW
         mTWFGytrSZfUhqr/iSI4iqWyieRvv5fPDqXvqMejHD1MJVFtRl7cdnclYRoop1wD7842
         Cj7UOJ7lO0B9Cxqkad+OzAzWXvtVgpILj0XC3JTv/aVa1XfBTmp4m2ZhlV/WCcN+IX7Y
         7j/w==
X-Gm-Message-State: AOAM531+1C9rV4l/DDtCgKSW1TeF89ZGW2looI4gi6N+ZkyaIc5cTHYG
        8nRVzLXRRnjOQTLdpPkZuZdBbHF7cGUl7g==
X-Google-Smtp-Source: ABdhPJwmG5aDiBjtSY30e1R53S/Hb5Hzen2pnlQWJLzC7uPefi8m2TpdWkdwfom27BaXGNQ8kIl7Kw==
X-Received: by 2002:a17:902:c3c9:b029:d1:e5e7:bdd9 with SMTP id j9-20020a170902c3c9b02900d1e5e7bdd9mr681699plj.57.1601058907590;
        Fri, 25 Sep 2020 11:35:07 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:07 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 39/47] staging: media: zoran: enable makefile
Date:   Fri, 25 Sep 2020 18:30:49 +0000
Message-Id: <1601058657-14042-40-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch enables compilation of the zoran driver.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 25910221b100..965a8b0e6cf2 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_PHY_ROCKCHIP_DPHY_RX0)	+= phy-rockchip-dphy-rx0/
 obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rkisp1/
+obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
-- 
2.26.2

