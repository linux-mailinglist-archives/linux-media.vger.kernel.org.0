Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BBC433B5B
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 17:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhJSP6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 11:58:00 -0400
Received: from comms.puri.sm ([159.203.221.185]:33102 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229789AbhJSP6A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 11:58:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 23DD4DFB0D;
        Tue, 19 Oct 2021 08:55:47 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SHidvgBbLDB8; Tue, 19 Oct 2021 08:55:45 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     sakari.ailus@linux.intel.com
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, lkp@intel.com,
        martin.kepplinger@puri.sm, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com
Subject: [PATCH v3 1/2] media: hi846: include property.h instead of of_graph.h
Date:   Tue, 19 Oct 2021 17:55:08 +0200
Message-Id: <20211019155509.1018130-2-martin.kepplinger@puri.sm>
In-Reply-To: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
References: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Include the more portable property.h instead of the OF specific of_graph.h

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/media/i2c/hi846.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 822ce3021fde..614d55932903 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -7,9 +7,9 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-- 
2.30.2

