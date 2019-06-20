Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A50244C672
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 07:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfFTFDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 01:03:14 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:37909 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfFTFDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 01:03:14 -0400
Received: by mail-yb1-f193.google.com with SMTP id x7so745597ybg.5;
        Wed, 19 Jun 2019 22:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7HBf20WmjrPf6txW1VcpmTw3TChQSYPo/s7Jh1SViDw=;
        b=egLf0fKBek29Q6g0xEMWHJsZqjLD6PaABBuLgxZXk1EVoBBxiBfl5P3qJeb8GAqZAK
         R9hzutg+bDCdpiXuPiFBssQD4tjMIa6nnJSK4AKfUpBXdWgiAVG3CdkFnhOON05tJtzP
         jFrxm1Qr70r7ZqsjuOzsOpK7t4qZYlLreBOfbsWdNbpngd4dugLu+Phimp5Z623gegST
         rh9c6R8fF9vbTVWZf29JHEuSgQI1+hPJ7DWNkZSM41xgs6VNOP3mNRC7WP4bHrm2Z6wX
         nsA39d5ET2UOuHcL38R8r8IxqESKT2OZ/wb0Dae3/3G3e9ZzWHIYC4TlE6yDvVvieU8s
         Bjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7HBf20WmjrPf6txW1VcpmTw3TChQSYPo/s7Jh1SViDw=;
        b=QR7GvJ786+/44Gv3uyZrtpF6ro6wWJqDkjx96VyLChobgm3k65vdbBLICeYONByJ89
         5xlrNbCm/8R15o4HqSnSI3M9PVaOpESPO4kZTpQM4jn9E8UrtYdWJqO7co6Uph1bYLoE
         prsug2DGAcx0ul17+tNIuGDaOKDT6cBSZ/vEkkVtjMNoSBwWh2CeVq7XlzWMqGflBR1R
         nqVXk82MPaqQDLQ5Y5+HYJ18IB9hA7LRsVTW2fTXftAaGuF/+E1v7LPiKX/0PYsx5FKv
         b8xWFooiv/H6NZ8LpneLH8e1S8c010FY+hRoCqZfxvVELkO1dkzemcomvs8EtHqNZFQW
         iSjA==
X-Gm-Message-State: APjAAAUlmPBBNSpwRvAxo1UV42sXl8b64yIWxQms3rYmLVEIl+F0Nwsv
        ANlgYk3T+CymPEpZOCgFrrlmQRsLKUit3g==
X-Google-Smtp-Source: APXvYqyGgSO8zJA6rmdCOOZ7hvy7jwl85twJno35Lfg1GLYBPQ8cvw2KDGv945sB1wyWUwKVy5mskg==
X-Received: by 2002:a25:5051:: with SMTP id e78mr67384944ybb.496.1561006992903;
        Wed, 19 Jun 2019 22:03:12 -0700 (PDT)
Received: from AHMCPU1978.einfochips.com ([219.65.62.52])
        by smtp.gmail.com with ESMTPSA id b68sm5126586ywf.48.2019.06.19.22.03.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 19 Jun 2019 22:03:12 -0700 (PDT)
From:   Aliasgar Surti <aliasgar.surti500@gmail.com>
X-Google-Original-From: Aliasgar Surti
To:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
Cc:     Aliasgar Surti <aliasgar.surti500@gmail.com>
Subject: [PATCH 1/1] staging: media: fix style problem
Date:   Thu, 20 Jun 2019 10:32:48 +0530
Message-Id: <1561006968-29717-1-git-send-email-aliasgar.surti500@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Aliasgar Surti <aliasgar.surti500@gmail.com>

checkpatch reported "WARNING: line over 80 characters".
This patch fixes the warning for file davinci_vpfe/dm365_isif.c

Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
---
 drivers/staging/media/davinci_vpfe/dm365_isif.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
index 46fd818..12bdf91 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
@@ -532,7 +532,8 @@ static int isif_validate_dfc_params(const struct vpfe_isif_dfc *dfc)
 #define DM365_ISIF_MAX_CLVSV			0x1fff
 #define DM365_ISIF_MAX_HEIGHT_BLACK_REGION	0x1fff
 
-static int isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
+static int isif_validate_bclamp_params(const struct vpfe_isif_black_clamp
+				       *bclamp)
 {
 	int err = -EINVAL;
 
@@ -593,7 +594,8 @@ isif_validate_raw_params(const struct vpfe_isif_raw_config *params)
 	return isif_validate_bclamp_params(&params->bclamp);
 }
 
-static int isif_set_params(struct v4l2_subdev *sd, const struct vpfe_isif_raw_config *params)
+static int isif_set_params(struct v4l2_subdev *sd,
+			   const struct vpfe_isif_raw_config *params)
 {
 	struct vpfe_isif_device *isif = v4l2_get_subdevdata(sd);
 	int ret = -EINVAL;
-- 
2.7.4

