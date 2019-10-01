Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2239FC381C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 16:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfJAOz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 10:55:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33485 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfJAOz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 10:55:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id q1so1813451pgb.0
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Sn9Zfn+XhULxHVCD81RfCVoZrivT06JVI9E5/FBOWiM=;
        b=j4yDI2nTwT2Cgc79IjkCT0/2mH4FjvELE85s/xf0MfVHY3aisg4o85vfihFmdM4e10
         zb6aKwrfsrEpu3HFEJ/AfK2R2Qp24gh432aljuykgZbcLHX0vINWSW/CfPx2JXLV34BC
         MK2Tm93cZxSNwwKu2+i9nMXoF+i8NvjwYtLYHOhnrFxzIbKuFuAMOdPm9qZlCyLrT08v
         tAip/I4DUATMO6N0p1IoF2WpYHX2RTZNffK0cGF82KlC3ElUe21UdGu+ylop2XiqSe4B
         268oFTLJREkZUaEc6eBxzYcKsWpt9cU/c74x4c3h0ETfKn+bl5QtMOaIwPR32ZQT0307
         PbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Sn9Zfn+XhULxHVCD81RfCVoZrivT06JVI9E5/FBOWiM=;
        b=WqVUEpYlOH6XVCySRWA1FSIYB7k++sLxuGon54q5ts05s15HH2DYI/OHrzoVnL8uZY
         v9cjI77+vdIi8EjgKX/qCBcaryNX+2pHiXJSukYU99yQ1q7VYacsa87YO4lt+dx/frND
         nEx0zMaxe7Gwkv2TfKQLp2K/krfAvp+RR3DNFgZgH4amGeiMirOjrWIUHhwZ3ijtJv57
         KRaEXV94jAbWDaUVye60QZLxVkx4JU53swEECMF1vOo/qt+vRnjMoSUX9Wn75lW8EVtx
         YhMWRsXN3uI3r28ZkYZmMI2xDwl1EVCD2zrcfTSyffOz690cQ9/eMje3bEsc0PqqrHmF
         oNIw==
X-Gm-Message-State: APjAAAVGWvqbqkjU5cuJSS211VD7obyginSIBGmUyeVb3DfpLY4L6ZXw
        pl4U19q8wAJglnxBl4u5MMsL
X-Google-Smtp-Source: APXvYqytjxnXlEfgN5g4cVgsr0bfkseqn3HCY4tDoIp5KYTwVSF2SrMY3ghvmweQ/gXi+bqtz9EKug==
X-Received: by 2002:a63:8c52:: with SMTP id q18mr4520549pgn.284.1569941723896;
        Tue, 01 Oct 2019 07:55:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:631a:1d56:6a:8714:31a4:1f8])
        by smtp.gmail.com with ESMTPSA id k93sm3333433pjh.3.2019.10.01.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 07:55:22 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] media: i2c: max9286: Pass default bus type when parsing fwnode endpoint
Date:   Tue,  1 Oct 2019 20:25:03 +0530
Message-Id: <20191001145503.5170-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The caller of v4l2_fwnode_endpoint_alloc_parse() is expected to pass a
valid bus_type parameter for proper working of this API. Hence, pass
V4L2_MBUS_CSI2_DPHY as the bus_type parameter as this driver only supports
MIPI CSI2 for now. Without this commit, the API fails on 96Boards
Dragonboard410c connected to MAX9286 deserializer.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

This patch depends on the latest "MAX9286 GMSL Support" series posted
by Kieran Bingham.

 drivers/media/i2c/max9286.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9390edf5ad9c..6e1299f15493 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -976,7 +976,9 @@ static int max9286_parse_dt(struct max9286_device *max9286)
 
 		/* For the source endpoint just parse the bus configuration. */
 		if (ep.port == MAX9286_SRC_PAD) {
-			struct v4l2_fwnode_endpoint vep;
+			struct v4l2_fwnode_endpoint vep = {
+				.bus_type = V4L2_MBUS_CSI2_DPHY
+			};
 			int ret;
 
 			ret = v4l2_fwnode_endpoint_alloc_parse(
-- 
2.17.1

