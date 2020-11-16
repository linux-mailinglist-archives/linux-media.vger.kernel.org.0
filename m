Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806CF2B4222
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 12:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbgKPLEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 06:04:41 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:34791 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgKPLEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 06:04:40 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DF19840014;
        Mon, 16 Nov 2020 11:04:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] media: rcar-vin: Remove unused macro
Date:   Mon, 16 Nov 2020 12:04:27 +0100
Message-Id: <20201116110428.27338-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116110428.27338-1-jacopo+renesas@jmondi.org>
References: <20201116110428.27338-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VNCSI_IFMD_CSI_CHSEL_MASK is not used: remove it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f6e84fa29bce..378514a75bc2 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -137,7 +137,6 @@
 #define VNCSI_IFMD_DES1		(1 << 26)
 #define VNCSI_IFMD_DES0		(1 << 25)
 #define VNCSI_IFMD_CSI_CHSEL(n) (((n) & 0xf) << 0)
-#define VNCSI_IFMD_CSI_CHSEL_MASK 0xf
 
 /* Video n scaling control register (Gen3) */
 #define VNUDS_CTRL_AMD		(1 << 30)
-- 
2.29.1

