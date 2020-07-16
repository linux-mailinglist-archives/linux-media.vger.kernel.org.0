Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5774222096
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 12:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgGPK0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 06:26:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgGPK03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 06:26:29 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A0F42B7;
        Thu, 16 Jul 2020 12:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594895181;
        bh=lrT8IjddjsaqTl860GVt/qWeziwjzrtvJRaCG3E6txA=;
        h=From:To:Cc:Subject:Date:From;
        b=oj73CEHBU7ACmqEjrH+xyN7KG8E88z4YQZEJfY3Z+vesJG7toQkwNVJgYUXvfuAI8
         0CFLHtHqNnOh7g2dks5OkyocWyTE56+8v/pSFXOL9C7zeUpSwfNOGiQFNOvQMaSIEt
         GI9tr8Ku3CFfdIe1nWXBOj9/2mLJhekYp0f9sasM=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sakari.ailus@iki.fi
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] MAINTAINERS: Fix sort order for RDACM20
Date:   Thu, 16 Jul 2020 11:25:52 +0100
Message-Id: <20200716102552.1390223-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The files maintained as part of the RDACM20 were incorrectly sorted
while they were added.

Correct the sort-order.

Fixes: 874a93adf972 ("media: i2c: Add RDACM20 driver")
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 373e4198d2b1..8bd8d4ab8b5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14412,9 +14412,9 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
-F:	drivers/media/i2c/rdacm20.c
 F:	drivers/media/i2c/max9271.c
 F:	drivers/media/i2c/max9271.h
+F:	drivers/media/i2c/rdacm20.c
 
 RDC R-321X SoC
 M:	Florian Fainelli <florian@openwrt.org>
-- 
2.25.1

