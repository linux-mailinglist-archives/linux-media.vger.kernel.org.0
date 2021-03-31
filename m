Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6428F35058F
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhCaRfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234430AbhCaRfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:31 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56B2C061574;
        Wed, 31 Mar 2021 10:35:30 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k8so20492405wrc.3;
        Wed, 31 Mar 2021 10:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6B26f3IlajNfnhYcTkXd3V9kuoJqzsJf9D1voUcVJjo=;
        b=sHAnutviLbGjmnNVxwDzBbGsYBjFmcvd9GqZeWN4FNVgI+VEMILCalzMLEZp+Y7wlf
         5+HcTCwhnhTOeiaeghRWf3EesgVE88bbiKDT50jWNTGhe/ExryCFoZVKQamI52EXDMpI
         4TWXBZWPDtZbeUrhiOPrw3t+lst0vSD9wu1bBMKfIa38WxM1yPn7WBQZuuruhGb/+l2U
         XVYrN2sZ7/0emmM3jv8yvjPyOInuzA5iaY4vD93bL1N0GTIdzrrnWClCs1Faw0tFxHSt
         HqtIQqIv3LRW1gy4rewAPJD5hTLYunnQsPRBBa+K3y418Unqx2ulXyJOvapPymStP/DP
         U60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6B26f3IlajNfnhYcTkXd3V9kuoJqzsJf9D1voUcVJjo=;
        b=Dd1teWfeE7ix9LifKjJDqm/QzdTg+/UKTIBDAilE1NRg2Sk0svI0lbUJW9hf39nNl1
         SkXs1P6oqug0eTdwlt8HC+sY4xDOmHKOzNBtKYI1/v4myqGhKTreW3QarBj61hKxUB8m
         Ghmo0gyp3AawyxjH6TDpnTMhimi57uyxZDWpJF2gTAkkIBe9IWrZ10RwaPuC5nGjxb9u
         MGAjc6HnQlQxdfGLjrtAkkBXmUxLvjmMBPEGfeCYbRf8J89r05zw9W4PtwlIq7vcTEiv
         +6ufrOa28NfYWucOhMijhxW5XeKiHACiuXhTXKyoof0gFgJIlZB2iiEbuX5ifuz2j17k
         LX2A==
X-Gm-Message-State: AOAM533CwQY8nfD9JLm6VIn0BE9AQo9+psCCPLiJSj3b9daWzqmP1lI3
        rCDJgIkVCK0AS06U5/OeaXw=
X-Google-Smtp-Source: ABdhPJz3U7V2V5vDfHEE+DsPC8CByVvjx0vZ4jRLw21MzeDOjtgytEQYSWZepxSoZVaiPECcaXo4iQ==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr4927082wrn.226.1617212129584;
        Wed, 31 Mar 2021 10:35:29 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:29 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v3 2/9] media: hantro: imx: reuse MB_DIM define
Date:   Wed, 31 Mar 2021 18:35:13 +0100
Message-Id: <20210331173520.184191-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-1-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Swap the hardcoded 16 with MB_DIM define.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index c222de075ef4..1f48c1956cd2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -109,10 +109,10 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = 16,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = 16,
+			.step_height = MB_DIM,
 		},
 	},
 	{
-- 
2.31.1

