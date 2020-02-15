Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B851E160043
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbgBOTnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:43:14 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42564 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbgBOTnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:43:12 -0500
Received: by mail-pg1-f193.google.com with SMTP id w21so6901975pgl.9;
        Sat, 15 Feb 2020 11:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=S78uU5ELv/QGHroNn0uGOcuYzw18JAgX+7W/Y+sH2djZV6Vh7nNYxxoxFE3sHWuBoX
         6BBzuJNdmRimqXlI/HqIyTIJ2GfkC7+O8766q44qqEidVEthYlMIYEPl07bL9Wgep32f
         vjePn3AZeAPDj3Bg+7s/mo4uNYimgtk3dTWYIQMWILZoa0Eee8MqzHDueQapO93VX0Pg
         7/DrRSQMZnLMCIWQN5xjQ68AD0KaEoZ8s5xm2BddTE48VERtoFMniIMhANWsX0kwvEuZ
         J9qtsO35u1pFAxGnFyn6mAmZv0ZRm8/otvzSQIklu4h3EPPvKIrXzya2Xdpnkk3k7xE3
         URtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AS+AHCuMQWIyLmWzD2RHQ/sZnkJFO9p0vLnea6pI0u8=;
        b=iXllR2+P9QBW8+2ubcJgXUlApBqoiS9HDF6FotIfZAzJV5oP3ZENYXoMJwL8XVCROB
         Z1FxOnCWcd2fSD+zpPtgygIJL1EoDYwk9WmBsdovc3KTqCWnxizMUprBOhdO+esjsmQk
         iz9u9FI2/o6Xp2RYUMpby5FpYtl6oQYPUPlv+xUNv3sv6IWeNx3E2S1aK70AjocZamb2
         oQsmr8bNdUEiiWtonEmzPU1CuAXgGmbgenGmKsDgpKpbVcTwXe4kD7e7YbOO9IXg9a3b
         e8/OrVgdAFfSRLGm+NGIsRSQcdpSW9eKsqtk7Grx7NTiVUJYDR+Y+1CJZm0OD/InuKTQ
         1Ukw==
X-Gm-Message-State: APjAAAXFpaqJNty/9Q+SFEacZTisHnG0yPDMKLNCOcZHAUxoIU0GSDc+
        aOngbsYe7VDDWn7skKe5Tani1SB8AHQ=
X-Google-Smtp-Source: APXvYqwczQn4UX/8KSaTLZ7YHrgD3Ijj7sbqrRkHMXnOMUogEhVvwFylvxV8ataNMmBYV8zmnCZ8yg==
X-Received: by 2002:a63:d207:: with SMTP id a7mr10044400pgg.225.1581795791183;
        Sat, 15 Feb 2020 11:43:11 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:43:10 -0800 (PST)
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
        Rui Miguel Silva <rui.silva@linaro.org>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 17/17] media: imx: TODO: Remove media link creation todos
Date:   Sat, 15 Feb 2020 11:41:36 -0800
Message-Id: <20200215194136.10131-18-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
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

