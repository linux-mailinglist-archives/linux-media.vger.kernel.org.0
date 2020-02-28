Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0196173D85
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 17:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgB1QuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 11:50:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40141 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1QuS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 11:50:18 -0500
Received: by mail-wr1-f67.google.com with SMTP id r17so3700119wrj.7;
        Fri, 28 Feb 2020 08:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uYDEPkQwfnUjgPnuuoScpuqFDu5JOLaJrAD58Hc9G7M=;
        b=OCYRuizE3lNV5LfCdbqRbcZToo/GEaDbb8IJk7GvatwGCUzowHV3jpGK7MWfeTJHQV
         5Ka11XAOJDRz3n13LiLjtoMbOKcK3HycLmmN25/RGnsYbOju1uhxf/XqfpW3GzPAI6Rz
         u2aEiewkBkI21A9i7guw+mdzPKt1iSy7RsZtbMZCYQIG3KW10PnWWKLQ+Snmj0B1DlnD
         BF47ytLJGwIXMwAdbRGdIw0SUjxh4ecNTrnRVxUs3jeKpTcdaKE4/ALa1mc0kWjTo3F4
         lsmte4Oss0fq8o6xmJbfNWgW3f5c8vST916aPr8ly4/qqgNZ4f4K0hvMcmmTkWr3uyuv
         ci+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uYDEPkQwfnUjgPnuuoScpuqFDu5JOLaJrAD58Hc9G7M=;
        b=MOvSRMLv6H8NcjhaA7kH4h91OED/2mDW12jA2un5t3+VP84dW89IVjnJCjVm4zamd4
         eCo9UgP7znIMXta/NQ3VwhA8tCK+elmZlGSk/UQVOk+lIbnTRsbe1ZemkXqZMp4W8Hwp
         sAVW2BRWKkAaVH0j9hybFadc+x2DPi5SQOkF85cmxBs3omQX/+kPs5Ihu7zZvEDe1Y5T
         +TGWBx2FyOXaBAMVzZDecEmawkQY2NG1Mzi7qQw9mTiHLZgv8MD0SIDrkRlzun5ICAux
         u4LcQNb7uVX7HL3yJKcVpg8yqlAMbxt/8dD9PoQ01hdjtGwIwPeCGbzxnW3Lp/s9fmyq
         MocA==
X-Gm-Message-State: APjAAAXljOAS92ob9nxux+H6hq30RNgvP8+6OWA/g6fZXR7mugQcevAJ
        AXQbrhYMQlXnEcauLuylopY=
X-Google-Smtp-Source: APXvYqxou3okKCY78l/xXF0q4ljsGL5Ukzt7MiTypHyHS1lCEQFEyXTDMTV+CY8JI4XEkrNV/riuIQ==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr5617141wrt.102.1582908616341;
        Fri, 28 Feb 2020 08:50:16 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:3855:fd13:6b76:a11b])
        by smtp.gmail.com with ESMTPSA id h2sm13263408wrt.45.2020.02.28.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 08:50:15 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] media: rcar-csi2: Fix registering camera endpoint to VIN
Date:   Fri, 28 Feb 2020 16:50:10 +0000
Message-Id: <20200228165011.17898-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CSI2 registers camera/sensor as v4l2 async sub device with fwnode is
remote endpoint and the camera/sensor register itself as v4l2 sub device
with fwnode is remote device as a result the match.fwnode should be
fwnode_graph_get_remote_port_parent and not
fwnode_graph_get_remote_endpoint.

This patch makes use of v4l2 helper function
v4l2_async_notifier_add_fwnode_remote_subdev() which uses
fwnode_graph_get_remote_port_parent as match.fwnode fixing the issue
of registering camera endpoint to the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb23a2e9..5b04e4768eb1 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -833,20 +833,18 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 		return ret;
 	}
 
-	priv->asd.match.fwnode =
-		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
-	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-
-	of_node_put(ep);
-
 	v4l2_async_notifier_init(&priv->notifier);
 
-	ret = v4l2_async_notifier_add_subdev(&priv->notifier, &priv->asd);
+	ret = v4l2_async_notifier_add_fwnode_remote_subdev(&priv->notifier,
+							   of_fwnode_handle(ep),
+							   &priv->asd);
 	if (ret) {
-		fwnode_handle_put(priv->asd.match.fwnode);
+		of_node_put(ep);
 		return ret;
 	}
 
+	of_node_put(ep);
+
 	priv->notifier.ops = &rcar_csi2_notify_ops;
 
 	dev_dbg(priv->dev, "Found '%pOF'\n",
-- 
2.20.1

