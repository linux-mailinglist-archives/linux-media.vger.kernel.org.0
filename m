Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FC81AFF52
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgDTAkL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDTAkK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:40:10 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980DFC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:10 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h69so4201291pgc.8
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=nOIpwk+/SXXpNdXIg0pLKG9+XTHKRZ/7CRt5FSoITv+k0UE5B3QgA9nV+UmogS+X0w
         ajv+eL35aNu1z4q4bom4mUV1V9LupOHkGh0EJU2zeeZqpcrTtFVhmYoUDnmDnCzuDtfT
         x9tjHK8lfzIv/KWh9DP79hktZyNFy2YqBk5ufitz/aDkSWuU5ELgeMCjWbkQME08GrVZ
         ed46kgv4hZiVtZGjBo0T1vRZiF+ow5z5rOpQiRcv3CqnBTvRGDr79Dz6z7SdzC3aJAoW
         oi6afMh5WYkmkePlm188/oK009WW1EsShflDQtfBXhxifaC2o/2DRi2iv3GY1CfC+4At
         8bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=YRf8/79dbntnKbeFWNbjMfzPHl6vbMrdfXLC5D11QFNKuY/Ot/AJr9VcadKqmrLnb3
         JW5L3dadjPQKXum6IG1xrjc5pQ7ImpOb/cjK7PExbmu2mmNgjpTKrs6O8W47kxmo1KME
         YeH8vbGX/OLXHrOjgzPR8WGxbyVTHM4GvrunzoaDgGidwln55cIaSq131TsncXY6XZtD
         dq3cbACyBTDid8Afl8qU+5GeSMoJ6kDHQ7sk8vYXk+9ZhhkBO5EnRshtkPKxc9devSGL
         yyX6lqs8bCx2xnLabKla+z/tzzXW0jlMRVhvuWU06xTXpb/SugB4Ec7urm9I/BwOXFg+
         U3zQ==
X-Gm-Message-State: AGi0PuYg/R0XiaXFhLVvPapNb3L7jlpeAXWe6RaTV2ZsZmlTmmZixZwg
        2Rn59jJVrDTHkZpoonuNObpoipS48EY=
X-Google-Smtp-Source: APiQypLxor1zhs1LX2Z1E/dQEUMkYtAjUnF4AglmyLj23pMOu08AU71xmNo/iTEtQIys5rYK82qhjA==
X-Received: by 2002:a62:7d11:: with SMTP id y17mr14023458pfc.127.1587343209766;
        Sun, 19 Apr 2020 17:40:09 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:40:09 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 23/23] media: imx: TODO: Remove media link creation todos
Date:   Sun, 19 Apr 2020 17:39:30 -0700
Message-Id: <20200420003930.11463-24-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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

