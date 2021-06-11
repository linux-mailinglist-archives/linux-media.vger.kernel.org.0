Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1DEC3A3FE9
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 12:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhFKKQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 06:16:48 -0400
Received: from comms.puri.sm ([159.203.221.185]:51616 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231342AbhFKKQr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 06:16:47 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id D84B9E01C9;
        Fri, 11 Jun 2021 03:14:49 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nmdMuW5XXsJ7; Fri, 11 Jun 2021 03:14:49 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: [PATCH v5 5/5] Documentation: i2c-cardlist: add the Hynix hi846 sensor
Date:   Fri, 11 Jun 2021 12:14:04 +0200
Message-Id: <20210611101404.2553818-6-martin.kepplinger@puri.sm>
In-Reply-To: <20210611101404.2553818-1-martin.kepplinger@puri.sm>
References: <20210611101404.2553818-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the SK Hynix Hi-846 8M Pixel CMOS image sensor to the i2c-cardlist.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 Documentation/admin-guide/media/i2c-cardlist.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/media/i2c-cardlist.rst b/Documentation/admin-guide/media/i2c-cardlist.rst
index e60d459d18a9..185e07a3da43 100644
--- a/Documentation/admin-guide/media/i2c-cardlist.rst
+++ b/Documentation/admin-guide/media/i2c-cardlist.rst
@@ -60,6 +60,7 @@ Driver        Name
 ============  ==========================================================
 et8ek8        ET8EK8 camera sensor
 hi556         Hynix Hi-556 sensor
+hi846         Hynix Hi-846 sensor
 imx214        Sony IMX214 sensor
 imx219        Sony IMX219 sensor
 imx258        Sony IMX258 sensor
-- 
2.30.2

