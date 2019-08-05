Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510B88280D
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731292AbfHEXfn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:43 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36935 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731280AbfHEXfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:42 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so37084980plr.4;
        Mon, 05 Aug 2019 16:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2TmLGvTN3FaWVeRsZPV3e4KNsmV2AReP7cWUVSqpqFQ=;
        b=YW2JbBhT1KOAfZKebBO9NM/G5Db95SUaRLnTey3pDLof4EeuR2oudZUxy8zi3ksHrp
         n/rM4Ga7htyDE97Ns+wPj+3Z8PhgQ/mkooxrj+Oj+RLx4/nnq0bUD+aDUnVf1LBrq9xF
         dY0j2ZVZAyPgtxwlAKR9qwP4wj/h48HGi4ffXdnH8gu8bIzxJ8uHY2W+u7NH0GnqxTD8
         dRHgc922vuRBkdb5WRupFzWcgYSpGtu+hSoihVTRk9nHn6Zo5xvrqkBk6f2tAOvr6c0G
         mFXWCA9xq+KMxQdYSaIZjMOJSVwdiGQuFvo1KeBfdkD79sC1CTS7ef5vvvfOPlyvigqS
         IVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2TmLGvTN3FaWVeRsZPV3e4KNsmV2AReP7cWUVSqpqFQ=;
        b=teNXJwM2nAyOGhatMv1pZrNVWswP76C7iQvGHwog712DchYdMjhi7mDy1woI8d8v0H
         hGNfk9jk/Y0H5uOOU4a22AzzrcvmjT3Uk9T3wJb3YWrUnQfdjsoX95am9prX9GnAvu0S
         Guuj/G0GeCMhBi4SYXa6CVjKtgghq01ycTzwXrw4wMkPa7ZggL/IBYStVeFVNGCuwAal
         wLrJ7SySRsI+Eyoqf7NtgY2Zd3/PzRuhTjyHTahMRuBOTFCTMTz1ulBYpNzyXGyzvTrQ
         BIi/2PIE/wLw8q+G4G6kiz8MhP3QeUx/xO9Nld9zcb4tfwfybhDCsE++Sa1j/vxvNOGw
         w7GQ==
X-Gm-Message-State: APjAAAXVBfW3rDE/IdYLv5oRoJCcpWuiMWgvpmjtRiCCghMU0zEEWWI3
        LkAV5k9nP74M2oom8XlzUKWt1vPf
X-Google-Smtp-Source: APXvYqzJbrsuJ3HwTZ98E/Apw4jZA8VmFc9SY7qiYBjg/8j77ZDblKl2/AqIbDwaFPx6pAGuizw+Iw==
X-Received: by 2002:a17:902:6a87:: with SMTP id n7mr251709plk.336.1565048141256;
        Mon, 05 Aug 2019 16:35:41 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:40 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 22/22] media: imx: TODO: Remove issues regarding media link creation
Date:   Mon,  5 Aug 2019 16:35:05 -0700
Message-Id: <20190805233505.21167-23-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the TODO items regarding media link creation, these issues are
resolved after exporting media link creation to individual entity bound
callbacks and the use of media_create_fwnode_links(),
media_create_fwnode_pad_links(), and media_entity_get_fwnode_pad().

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

