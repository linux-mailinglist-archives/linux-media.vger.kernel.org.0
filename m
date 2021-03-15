Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B4F33B390
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhCONP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:58 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45213 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhCONP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:29 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4CF98FF80E;
        Mon, 15 Mar 2021 13:15:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/18] media: i2c: rdacm21: Give more time to OV490 to boot
Date:   Mon, 15 Mar 2021 14:15:06 +0100
Message-Id: <20210315131512.133720-13-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It has been observed through repeated testing (250 boots) that in the
10% of the cases the RDACM21 initialization sequence errors out due a
timeout waiting for the OV490 firmware to complete its boot phase.

Albeit being the current timeout relatively large (300-600 milliseconds),
doubling it reduces the sporadic error rate down to 1 over an 80 boot
sequences test run.

The firmware boot delay is unfortunately not characterized in the camera
module manual.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 50a9b0d8255d..07cf077d8efd 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -53,7 +53,7 @@
 #define OV490_PID			0x8080300a
 #define OV490_VER			0x8080300b
 #define OV490_PID_TIMEOUT		20
-#define OV490_OUTPUT_EN_TIMEOUT		300
+#define OV490_OUTPUT_EN_TIMEOUT		600
 
 #define OV490_GPIO0			BIT(0)
 #define OV490_SPWDN0			BIT(0)
-- 
2.30.0

