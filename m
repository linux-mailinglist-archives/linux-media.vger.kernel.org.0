Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE151C1B6E
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgEARQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729951AbgEARQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:33 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7951C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:32 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d24so3846058pll.8
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=oh6/4+lTRtxuDurfROSG0h4tUeTfPfdAf2Z8+ixz3dSaZAr1nlT/B+PYRMD5Pq95Fn
         VvOYxziFwdvP89uJEW6eDcpYSZoigiKCt5SfbusDQEBnjQ2V6LDvlFlPyJgJvtvNhe+d
         uNn3tl9KOf8Q/wzLIZd/ErB+hmr477uKZkIcB+DDSmsK+5Cuu80WoWbfQh8pDGtur2E3
         DU56Xc4vCGPTJowoJ0fC41A2Sr2y1+sOzS4vXj/Cni+UxQiOQF06bLiuVeGm1c129Mn0
         l+sNuokS+PxFMKZKZCKV8jrupfuGYbkY7qirG588MuU22ZrLmNw8VDMg4vWReiWSdobX
         CjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=YVTHFojZ7HkrkYu1OBhrzJMhD4K9Ih9cURZurvqZWSJ6mePRoLdJWU63bTOxcwhvRr
         NeYojGGcL70gzntnbdsqXs27EKVT0th+vBewtOSrdwt3UeKK+o2yMQJtl71LJADWwUqX
         PmwjEfLLSBtbJDYW+T9N5e2SdRxHQ1DV366l3ttvnyu7HSHH2mwD8jbKIRVWJtX0Cpzc
         qb2Khh3ylJLRKeKRPPgw6LnNtDnsPxxe6hJCVAA+F4cMob+qSau05aMZsdLFrxsLBgSQ
         7NkoFHm4fAulCfMEula7/ab3/0g6KwMWWW0KJtDFSSdwE9lolBf68/th93Prv4GYD8gb
         9ujQ==
X-Gm-Message-State: AGi0PuYEwbB2rIEp36PWGpX20efFOiyy+EbmF3wBQHONXbC1VYTShAf7
        BPnXXGAS/IGN88nSnVob73wtnLkU
X-Google-Smtp-Source: APiQypK5sQOd8+H9jVCejE9rccsY6gZ/S+UPB10u4HlY97ANFt8A3tphUI4Jv0pCXCtbOqx29yX2hg==
X-Received: by 2002:a17:90a:80c2:: with SMTP id k2mr749889pjw.6.1588353392120;
        Fri, 01 May 2020 10:16:32 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:31 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 22/22] media: imx: TODO: Remove media link creation todos
Date:   Fri,  1 May 2020 10:15:56 -0700
Message-Id: <20200501171556.14731-23-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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

