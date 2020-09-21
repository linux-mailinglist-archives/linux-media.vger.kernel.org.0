Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90085272077
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgIUKV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgIUKVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:12 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAB2C0613D5
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so12097665wrl.12
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/tLZJac8Ffn37A7WxCGBPX2NFTEQpF30SJ7IB/uL5Ro=;
        b=Lw9bQeNtWzONKIvulMFjqZHVSIBJ+YzkdscnghB6hFyde4iXLIzLYP1EH06krH95mx
         qWKW+RACGF499CYTQYQltWRp5KikOm05rdE4iWUWESguLaMIbqIQVQ/hXQffI+c887uJ
         e80o9Du+VecLUlF7azvUsuv5ZIMhZagcb+sN4uzNxipodcf4W+pHvU20pU86nrJRrV45
         +glL7EqH15veYuWY1d9TCz/Mkt3vlXIAbsBf05s1sqgIUC7BsamzrMUrYbN2lagI0idX
         +qOabI1hNMHz3JKC1YSr6GsuMrlqbhrpHJFszkVbVpPvX+Aa2wOp8/gxmk8UGYk7Im/f
         jpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/tLZJac8Ffn37A7WxCGBPX2NFTEQpF30SJ7IB/uL5Ro=;
        b=R1RDO+k248gdLrgcyyv163TOpCzAyS0Ot1oW/qEG01lG+C8d/6JlYsIwyP07l1fuLW
         vNm43ivvuBe0dZ/RPlffDEvCmceu+Q+pC0Ar54sqmYWYSzetP/5nXJukGDexMzN1kHj0
         Ajq5ft2cWDx+tBjaHraUEAjLAUhZazUyiXWZ47kTITa1/DsjFsXUE8Xc64ieRIgOkDu/
         KOubuhxZsIDa4wmZU7SfNCaiWYumzHaqNJS6xWbB7Bf7gauGHEQ0HIu1H2preujhgheS
         aqoTiquyEHSVEpkMYqykgoiEsFacpYNYXFkreWQsq+l1Zfj+N9z7750JsI2n34qltlTz
         VVbw==
X-Gm-Message-State: AOAM530z7VbB52HdR8JHll/KqMxN674R0j0gBo1a+Uy5yLqVPbJeNvUW
        yNDlhdSqSaVYE90qRxP7Et8S6g==
X-Google-Smtp-Source: ABdhPJwSumtffxKSLF97N4tc6ojqM+H7kM2XB8Kv/SA4FWEXUIxHjZRiLLW+NqoyuVtvuhn1JfNBQA==
X-Received: by 2002:a5d:668b:: with SMTP id l11mr50275532wru.89.1600683670944;
        Mon, 21 Sep 2020 03:21:10 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:10 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 41/49] staging: media: zoran: enable makefile
Date:   Mon, 21 Sep 2020 10:20:16 +0000
Message-Id: <1600683624-5863-42-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
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

