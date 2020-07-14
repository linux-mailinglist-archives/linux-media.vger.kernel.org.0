Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42EF21F400
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 16:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgGNOZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 10:25:44 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:18513 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbgGNOZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 10:25:43 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BAC28240011;
        Tue, 14 Jul 2020 14:25:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH v2 3/3] media: MAINTAINERS: ov5647: Add myself as maintainer
Date:   Tue, 14 Jul 2020 16:28:56 +0200
Message-Id: <20200714142856.58365-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the current maintainer email address bounces back, replace
the entry and make myself maintainer of the driver since I have the
sensor and platforms to test it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1742fa1a88cd..e2128afd83b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12607,7 +12607,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5640.c
 
 OMNIVISION OV5647 SENSOR DRIVER
-M:	Luis Oliveira <lolivei@synopsys.com>
+M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.27.0

