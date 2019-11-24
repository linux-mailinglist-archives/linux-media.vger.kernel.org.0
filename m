Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E741108497
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfKXTHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:21 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34761 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKXTHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:21 -0500
Received: by mail-pg1-f193.google.com with SMTP id z188so5947683pgb.1
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4ph62gNreQJ316vv67Ff1MLtxGjOWFn3EwRPlk4hDDA=;
        b=CSBrgqgGNrvT5dqtvwVc7cGfUE/uXv87CW7bnbs8+nQbFWbkxcDp/NW49GSySNyAOX
         gyL8od3VIqtXKOVrFD5SA5kQ23BEf+JwfO6X4Y9fWVWyxbrHzP+e4C/HUFYJ9Y0hhIEN
         iefKBlcoMrKazgv0u9NzTfBB63ESG3Rs3hV5xfF1oZQtGoZ74Bg4/xKB+yPf+a6xPfMW
         CEzugMhxT3ltliZ8bzQGJKCIN7NUe0b541gERuBJNsffySWJ0P0Z5IQ4Ht1Rid3leRGZ
         EfDnRCfcCujkW/NaXX22oKwah1leokad43RjgWq6YqqWupmMBZ+eqXF0GhCTQE4OPPz+
         zclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4ph62gNreQJ316vv67Ff1MLtxGjOWFn3EwRPlk4hDDA=;
        b=HBctc5iet4uyJVB4OzHS5BCY8iuVUf/Us6utgTLyBempTVAR6i6gbWM6qzY0j/zfbX
         XDXGgE2GQFOwoJNxxJSrIRM34Wh2E/UgRrq2O1Xpw9ZAMcCJAlwjqX5deyazqm9AeEot
         nBvP5huTB0yeW99hsvIVx4MhicHIEGewbhTsuOrLgIcet+Qb7ZV6ERyFWRokJ593u2CN
         cql84/40onV0mShYYkX3V0oullHjCDWrIWusO5JcPCystu6OGZjRs31mzM9xPKrPcrLM
         1mz5TyvhUKqAQkKzaJWhxtrn9WD5hnO0r9RkZzNFTNbIOMJOmJboRxXrV9h59MpagJh8
         G3QA==
X-Gm-Message-State: APjAAAXx4IGuoFbhNtO2mpxkls355vzOcFgYl/afHEEz9XdAV2gQK1G9
        YRD8Uap2MUN03ZrYop5UGWg2OibBpBo=
X-Google-Smtp-Source: APXvYqyjrLon9/6TMvbNt4VETLZKYBRpuvL2o67rYr2Wk4VNgQA4fpZiKVgD8KB11fA1MS4TApfH5Q==
X-Received: by 2002:a62:7796:: with SMTP id s144mr29061738pfc.37.1574622440188;
        Sun, 24 Nov 2019 11:07:20 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:19 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 07/23] media: rcar-csi2: Fix fwnode media link creation
Date:   Sun, 24 Nov 2019 11:06:47 -0800
Message-Id: <20191124190703.12138-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

rcsi2_notify_bound() passes the bound subdev's match fwnode to
media_entity_get_fwnode_pad() to determine the subdev's source
pad for creating the media link to it. When the bound subdev is
the adv748x-csi2 transmitter, this is in fact correctly the endpoint
fwnode. For other subdevices this likely will not be the case, the
asd match fwnode is usually not an endpoint fwnode but rather the
port parent fwnode. So rcar-csi2 will fail to get the correct source
pad for bound subdev's other than the adv748x.

To fix and make rcar-csi2 connect more generally to other subdevices,
replace the calls to media_entity_get_fwnode_pad() and
media_create_pad_link() with a call to media_create_fwnode_pad_links().

Fixes: 769afd212b160 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 23 +++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb23a2e9..df6cb6d91d7e 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -738,23 +738,20 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 			      struct v4l2_async_subdev *asd)
 {
 	struct rcar_csi2 *priv = notifier_to_csi2(notifier);
-	int pad;
+	int ret;
 
-	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
-					  MEDIA_PAD_FL_SOURCE);
-	if (pad < 0) {
-		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
-		return pad;
-	}
+	ret = media_create_fwnode_pad_links(&priv->subdev.entity.pads[0],
+					    dev_fwnode(priv->dev),
+					    &subdev->entity,
+					    dev_fwnode(subdev->dev),
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret)
+		return ret;
 
 	priv->remote = subdev;
 
-	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
-
-	return media_create_pad_link(&subdev->entity, pad,
-				     &priv->subdev.entity, 0,
-				     MEDIA_LNK_FL_ENABLED |
-				     MEDIA_LNK_FL_IMMUTABLE);
+	return 0;
 }
 
 static void rcsi2_notify_unbind(struct v4l2_async_notifier *notifier,
-- 
2.17.1

