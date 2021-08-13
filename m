Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C353EB7DB
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 17:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241479AbhHMPJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 11:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241406AbhHMPJ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 11:09:28 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601CDC0617AE
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 08:09:01 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id l18so13746481wrv.5
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W8ZDF8z+b7ZAjV4vNrnorD1PEm8hr1QtFpmDxBnDqKg=;
        b=VX9JcxnfMM2tnvlJOsz34xq7pwp9ssD8+/TH0LQZnJ2sSRZSNW/mjdLEFOhULrMNmQ
         HXtTgwsl+kf4RGD2CLTPzCMdm5dyNZjgNM8L/SPFlY/AL4UwUWTBH7oRfj/RlV+JMSHH
         OPgdbnv30EcUrdxlul3W8poZj0O+hfyiv6rWtCDAbXPaX1F705jZ5luOPOaf+VHWosFX
         YEy13fZWjp2a4QCLdvz5zukoAQ1Kq5XzlNCoCxFwMXt9S3DAP/54wZIUnNcvxrN5TbjX
         hpzb4SGZUbzJkUem/s+vtSfmD0flu/FHQ8Fg6OvrBsgy+GoTR8bfZTv2pNj90Z/7ZCtW
         6e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W8ZDF8z+b7ZAjV4vNrnorD1PEm8hr1QtFpmDxBnDqKg=;
        b=m8yqI6jnVMTKFdi6/3vcj5KRLa1KTSAvel9LZIdbAIQ5tvIcWlclIyUB5DjI70tYvM
         F/hsn9HqHk9LxTbwDZx+lrLEr0b0HBfLxTLP/o7AT74D/lGR/7imrDphlgNXmPsemabD
         mWOFZdRAy4b9cGjceBJ76oRGymGzHp8dsXtDH5u6LYcF6GFI8yIpi/lH5KNVDe6hFd5d
         G/Yai3WFDT2/8h4QTcPnoynBHGarq8ls86pxWsMtuj86ts7plEYHc3UgpBIuBkfQHphX
         ncuq/8wdcyy6yphAwk3ojTHdGGAtGRrXF9GyUyNyx56U0AeRXHd8fg9Vs7Q0pCr0StPY
         5c/g==
X-Gm-Message-State: AOAM531+AIvQDy0YlqZ/+1iIomx33G/g2wDq6tCGfTQYP7oxf9SO+ZwE
        WG8Fz4YKdkBO9i0cIs+Oz14Tlw==
X-Google-Smtp-Source: ABdhPJyGjTiuYAtrjcvhLSl8gbO6XVV1t3LdztqT9zh+jTuH+0J/ydhnwERR+YQFPworBdi9fqMXPQ==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr3697049wru.257.1628867340063;
        Fri, 13 Aug 2021 08:09:00 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h4sm1799575wrm.42.2021.08.13.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:08:59 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Suresh Udipi <sudipi@jp.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: rcar-csi2: Optimize the selection PHTW register
Date:   Fri, 13 Aug 2021 17:07:56 +0200
Message-Id: <20210813150756.131826-4-niklas.soderlund+renesas@ragnatech.se>
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

PHTW register is selected based on default bit rate from Table[1].
for the bit rates less than or equal to 250. Currently first
value of default bit rate which is greater than or equal to
the caculated mbps is selected. This selection can be further
improved by selecting the default bit rate which is nearest to
the calculated value.

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.12]

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 5b531e0bb5a08f9c..4a27ea8ce96dceaf 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1099,10 +1099,17 @@ static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
 				 const struct rcsi2_mbps_reg *values, u16 code)
 {
 	const struct rcsi2_mbps_reg *value;
+	const struct rcsi2_mbps_reg *prev_value = NULL;
 
-	for (value = values; value->mbps; value++)
+	for (value = values; value->mbps; value++) {
 		if (value->mbps >= mbps)
 			break;
+		prev_value = value;
+	}
+
+	if (prev_value &&
+	    ((mbps - prev_value->mbps) <= (value->mbps - mbps)))
+		value = prev_value;
 
 	if (!value->mbps) {
 		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
-- 
2.32.0

