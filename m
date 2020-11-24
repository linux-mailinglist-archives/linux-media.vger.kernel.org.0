Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1E32C21B8
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731514AbgKXJii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:38 -0500
Received: from retiisi.eu ([95.216.213.190]:45010 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731496AbgKXJif (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:35 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 8A1CE634CA5;
        Tue, 24 Nov 2020 11:37:52 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 19/30] ccs-pll: Fix MODULE_LICENSE
Date:   Tue, 24 Nov 2020 11:32:15 +0200
Message-Id: <20201124093226.23737-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change MODULE_LICENSE to "GPL v2" as indicated by the SPDX tag.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index d2f0f7375f5c..58f5fe7062ae 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -477,4 +477,4 @@ EXPORT_SYMBOL_GPL(ccs_pll_calculate);
 
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
 MODULE_DESCRIPTION("Generic MIPI CCS/SMIA/SMIA++ PLL calculator");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

