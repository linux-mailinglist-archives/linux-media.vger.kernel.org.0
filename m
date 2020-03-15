Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 518C9185BE8
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 11:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgCOK1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 06:27:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55808 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgCOK1l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 06:27:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id 6so14454833wmi.5;
        Sun, 15 Mar 2020 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=isehurdj5wn3c+W0oK2ewJ+9tH4P/AOAlMD4rcT40Og=;
        b=cMHf4rPne7z6O1NtW/tIDnS7Ed17XFMOs7//4UgHUIMFSKXY4IPBOQSu+lO3Wu2Tgd
         bvbCn1+z0NWM1+d6IdOnjyRV5glDnal6/TcJFM6hGQ90+2Uuglxw4lhhDZt29/mkaP5t
         OTcYItOdIdng2dK9o6wnwnBu08nDgLMKnqTDNtMK0yaTEVsMVniNW1D6IKmhMO5VbabB
         wNwuDFRh2IZuZbEuuWvGw00Gz6D4qTqr1fu9Zm9KecZiLClNwakimQfgtz7uhRveiKva
         R9ogkTAYud88FKChCyJ38m9F3NeX/G7N2AUwUn8Vl6uU1yWtXIXFeSoCzgZ2B8LtPcXv
         dlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=isehurdj5wn3c+W0oK2ewJ+9tH4P/AOAlMD4rcT40Og=;
        b=lrQjWiVvD1279DAd4WNqrXJKeH3Kt4ymg4TWonJ3Y/N6n1OZd1/UszrrF3rDnAk96J
         l58/dNZSVBonP0nuAsipuDkJEM/Wb05K5BQk8lu6kvkxZx9VliComfDxvl5r/DJzW36f
         8oYJfnKy6jX/EKc2ZeSt9ZMigNhxaRFJHKqQgn9ZhP+15JQMaOnIYDHJkjUDG71j9NTI
         s2Jqa78V1UqB3cpXFW0ozli/zeo2cVUhjEy/33tD4KeUHNLeFc31b6VTnEobnr6AUOo9
         WUnPxPwjB5zW9hnnVjD3B69ZHue0jEyITuRhcar8TNss9BVncNmyirlVAxnMipOTPa01
         OUIw==
X-Gm-Message-State: ANhLgQ3C6Eeseq0v7FvHuoSGRRC5H03YcyOUxarbqEqsS0XGcMC2AJDa
        fwWpxtIR/f954659JMiL5gk=
X-Google-Smtp-Source: ADFU+vtn37wVG0Czz5ac7f88DgLlkYZBCN3tu4vX7BZfFUoq59AvFNtKNfD9qN2LgEeLwpkzLITj3w==
X-Received: by 2002:a1c:dc55:: with SMTP id t82mr21131825wmg.6.1584268058919;
        Sun, 15 Mar 2020 03:27:38 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2510:d000:2c12:3438:7cb7:556d])
        by smtp.gmail.com with ESMTPSA id z129sm25765190wmb.7.2020.03.15.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 03:27:38 -0700 (PDT)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] media: rcar-csi2: Let the driver handle fwnode matching using match_custom callback
Date:   Sun, 15 Mar 2020 10:27:24 +0000
Message-Id: <20200315102724.26850-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rcar-csi2 driver uses the v4l2-async framework to do endpoint matching
instead of node matching. This is needed as it needs to work with the
adv748x driver which register it self in v4l2-async using endpoints
instead of nodes. The reason for this is that from a single DT node it
creates multiple subdevices, one for each endpoint.

But when using subdevs which register itself in v4l2-async using nodes,
the rcar-csi2 driver failed to find the matching endpoint because the
match.fwnode was pointing to remote endpoint instead of remote parent
port.

This commit adds support in rcar-csi2 driver to handle both the cases
where subdev registers in v4l2-async using endpoints/nodes, by using
match_type as V4L2_ASYNC_MATCH_CUSTOM and implementing the match()
callback to compare the fwnode of either remote/parent.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 46 +++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb23a2e9..1bbf05e9f025 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -808,6 +808,46 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 	return 0;
 }
 
+static bool rcsi2_asd_match(struct v4l2_subdev *sd,
+			    struct v4l2_async_subdev *asd)
+{
+	struct rcar_csi2 *priv = (struct rcar_csi2 *)asd->match.custom.priv;
+	struct fwnode_handle *remote_endpoint;
+	struct fwnode_handle *subdev_endpoint;
+	struct device_node *np;
+	bool matched = false;
+
+	np = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
+	if (!np) {
+		dev_err(priv->dev, "Not connected to subdevice\n");
+		return matched;
+	}
+
+	remote_endpoint =
+		fwnode_graph_get_remote_endpoint(of_fwnode_handle(np));
+	if (!remote_endpoint) {
+		dev_err(priv->dev, "Failed to get remote endpoint\n");
+		of_node_put(np);
+		return matched;
+	}
+	of_node_put(np);
+
+	if (sd->fwnode != dev_fwnode(sd->dev)) {
+		if (remote_endpoint == sd->fwnode)
+			matched = true;
+	} else {
+		subdev_endpoint =
+		      fwnode_graph_get_next_endpoint(dev_fwnode(sd->dev), NULL);
+		if (remote_endpoint == subdev_endpoint)
+			matched = true;
+		fwnode_handle_put(subdev_endpoint);
+	}
+
+	fwnode_handle_put(remote_endpoint);
+
+	return matched;
+}
+
 static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 {
 	struct device_node *ep;
@@ -833,9 +873,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 		return ret;
 	}
 
-	priv->asd.match.fwnode =
-		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
-	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
+	priv->asd.match.custom.match = &rcsi2_asd_match;
+	priv->asd.match.custom.priv = priv;
+	priv->asd.match_type = V4L2_ASYNC_MATCH_CUSTOM;
 
 	of_node_put(ep);
 
-- 
2.20.1

