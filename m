Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1A23EB7D6
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 17:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241421AbhHMPJc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 11:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241397AbhHMPJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 11:09:27 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2038C06129E
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 08:09:00 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k29so13726510wrd.7
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aBRuit42IxEUIwCkR+zV1zkqANFvSAk/TjoZTt2MMGw=;
        b=iwNgaFK9cWzQLs5cUEnsoG7FFlx4b+NNX6tmMVvoD3qn72yi12KCmRwEZDKP5X+l99
         dQd/raH6BcQ2tl4BLAnz1H0Nk29AzEkxxE9GgWb6S7+v0sYBKOMYKsd3sFXx1W93hdw8
         lfzXI0+bJXPAu47JSY1w3z/e+hcNgTyDexgLfY+TxssKGw3igoHOPyRx2pqbcA3oC42E
         Tmh/PsMwog6XQZbl7hoLz/aXpG1I4D7hNba0AnOdwkWlS91pd7i5cHHTJ2+2sEqUDOaQ
         wDh/LpYZBK9K0p1EuN+wKgrjZqoA6QEs60quPBuEwUV/zPrffXHOOg62Yxr6SSqFr5Ng
         Gddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aBRuit42IxEUIwCkR+zV1zkqANFvSAk/TjoZTt2MMGw=;
        b=lPTTgSuG3meaTMwnMMVAZZmRJuLojseHmDytWU7AMwEYJlaDO876juVmpIOuQXk200
         +ZkY/vcrC/yuJ3+6+HEnwzIt61r51AogmcwuXxWcONQ45gaIQw8mPyoKiAE5mgcBHErN
         0UaG9KlAosFIXFhV5l7A1uTrVI1T0xYVClJS6hoeTylVNU4u5e6nht8kUC7NzaejjKvm
         xSGMPsbFyalkci2SSh1sTOGXwp+DVK6wIsTDn1SHEqz+0vL/ZGJqFzCWWW4bkm1Hhhwq
         FL0iQC53K3Y2xL0P74Ek54RENtWmBedWO28F4ref96jdlOlAuggtrvspgOXY9QCBQ8g/
         03jg==
X-Gm-Message-State: AOAM53233CSgu7H6hJFfP/m3qvgKw+WF8R09qvWxXJ0wwKk2lSJgM7SF
        UEWuXrxsbt/FrGsjEbKamDJO2A==
X-Google-Smtp-Source: ABdhPJzdcgGAcabk9eunY75UKqtfzAFql7s3y8K9es1bXfigDeuxEcLw+Khc5167gR7xbzLBJ9z+4Q==
X-Received: by 2002:a5d:58da:: with SMTP id o26mr3866594wrf.140.1628867339233;
        Fri, 13 Aug 2021 08:08:59 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h4sm1799575wrm.42.2021.08.13.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:08:58 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Suresh Udipi <sudipi@jp.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] media: rcar-csi2: Add warning for PHY speed less than minimum
Date:   Fri, 13 Aug 2021 17:07:55 +0200
Message-Id: <20210813150756.131826-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813150756.131826-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210813150756.131826-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Suresh Udipi <sudipi@jp.adit-jv.com>

Add a warning message when the selected PHY speed is less
than supported minimum PHY speed given in the hsfreq table[1].

For raspberry pi camera capture on Kingfisher board with resolution
640x480, the calculated PHY speed is 48 mbps which is less than
the minimum PHY speed 80 Mbps from the table[1]. But in this cases
capture is successful.

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]

Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index d042967335edbd6a..5b531e0bb5a08f9c 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -545,6 +545,10 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	const struct rcsi2_mbps_reg *hsfreq;
 	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
 
+	if (mbps < priv->info->hsfreqrange->mbps)
+		dev_warn(priv->dev, "%u Mbps less than min PHY speed %u Mbps",
+			 mbps, priv->info->hsfreqrange->mbps);
+
 	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
 		if (hsfreq->mbps >= mbps)
 			break;
-- 
2.32.0

