Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6EA1786A4
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgCCXnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:37 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36202 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbgCCXnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:37 -0500
Received: by mail-pf1-f194.google.com with SMTP id i13so2325186pfe.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=nx+iRQ9rlI/UN8xYS4H2lgIfb7SwrIUVzaIj6QFmCJ44w5wVtFapFsZYhvHhnjQS4L
         Q+IENjrnYfJUs8Ue1Szh1hQDSksOngWvI+jgTEz+ztT/So0aY9EBJe7GxC+bbyAP1nv2
         BhIrS6tGLC5WVXRkYsmdCxHGcEF88C/hffNTyUy4I5DALDvSdweC3yvdxxgUUuA6UU1Y
         KK84k8flEhs2iHekB90IwCw6QgMwSsQvvQqxKdf3I9kt2GxqofPs7XAjNgLGUW6/ygf2
         ncmY90srO+Rwud1c4/nNtOBTIAYtfaFvyK51xYT5let7aQ/cati0WqWlYLgk+x7Namhb
         FuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=E8kiyk+azbztIOPEL+k5mtApXWxMKgRH9i+uTWBMQtGPrAhSzkQENI5CcYd/PeE8/Y
         ct3ojzxNp37Huy+Jexyao4QOdecsWpGaByKvMBR2GzYtMomXww+z5vCIYRXWUKA5/7KD
         aeNEnHIGiRsTa+T0T8x1QQXu34BPgsqw9VjD67ZW47fNTVFwYWvSNlsYXyHiRuoEwWiW
         MXMaLQOb0Ao0Gw8vZm6vMlu7R9hm1LsjAWoZxFPbn8JAEQfSsCIoz7RxS8sHYzq22v6l
         krKD/+lt1BYkO36JjbYKPKFpFR5MoVHkWZ3E5D3RQiUmtFV9+xHCpnWX5msuojnE3hVa
         rf+w==
X-Gm-Message-State: ANhLgQ3/wuSP496s1U/cxZ1lZdmRiwPI3dmyM2MkFYwksN8h6mGRr26Y
        w1lNGO8qsqw41XGEWlJixvIoaopzAMg=
X-Google-Smtp-Source: ADFU+vt8YPvn85p+KvVGysds4MYZkP2OT0DYvBlkIydwUd2Ki9GXRwVyLjW/7MsdRJ+I2F40y3b7rA==
X-Received: by 2002:aa7:947b:: with SMTP id t27mr201118pfq.212.1583279016089;
        Tue, 03 Mar 2020 15:43:36 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:35 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 17/17] media: imx: TODO: Remove media link creation todos
Date:   Tue,  3 Mar 2020 15:42:56 -0800
Message-Id: <20200303234256.8928-18-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the TODO items regarding media link creation, these issues are
resolved by moving media link creation to individual entity bound
callbacks and the implementation of the get_fwnode_pad operation.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/TODO | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 6f29b5ca5324..a371cdedcdb0 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -17,35 +17,6 @@
   decided whether this feature is useful enough to make it generally
   available by exporting to v4l2-core.
 
-- After all async subdevices have been bound, v4l2_fwnode_parse_link()
-  is used to form the media links between the devices discovered in
-  the OF graph.
-
-  While this approach allows support for arbitrary OF graphs, there
-  are some assumptions for this to work:
-
-  1. If a port owned by a device in the graph has endpoint nodes, the
-     port is treated as a media pad.
-
-     This presents problems for devices that don't make this port = pad
-     assumption. Examples are SMIAPP compatible cameras which define only
-     a single output port node, but which define multiple pads owned
-     by multiple subdevices (pixel-array, binner, scaler). Or video
-     decoders (entity function MEDIA_ENT_F_ATV_DECODER), which also define
-     only a single output port node, but define multiple pads for video,
-     VBI, and audio out.
-
-     A workaround at present is to set the port reg properties to
-     correspond to the media pad index that the port represents. A
-     possible long-term solution is to implement a subdev API that
-     maps a port id to a media pad index.
-
-  2. Every endpoint of a port owned by a device in the graph is treated
-     as a media link.
-
-     Which means a port must not contain mixed-use endpoints, they
-     must all refer to media links between V4L2 subdevices.
-
 - i.MX7: all of the above, since it uses the imx media core
 
 - i.MX7: use Frame Interval Monitor
-- 
2.17.1

