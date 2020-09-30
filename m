Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F18327F33B
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 22:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbgI3UTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 16:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729912AbgI3UTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 16:19:17 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4855C0613D1;
        Wed, 30 Sep 2020 13:19:16 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 62862634C8D;
        Wed, 30 Sep 2020 23:19:01 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [RESEND PATCH 022/100] dt-bindings: nokia,smia: Make vana-supply optional
Date:   Wed, 30 Sep 2020 23:19:10 +0300
Message-Id: <20200930201914.31377-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vana-supply is optional in the spec, therefore make it optional in
bindings, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
index 6c45c79ef91f..5ea4f799877b 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
@@ -16,8 +16,6 @@ Mandatory properties
 
 - compatible: "nokia,smia"
 - reg: I2C address (0x10, or an alternative address)
-- vana-supply: Analogue voltage supply (VANA), typically 2,8 volts (sensor
-  dependent).
 - clocks: External clock to the sensor
 - clock-frequency: Frequency of the external clock to the sensor
 
@@ -31,6 +29,8 @@ Optional properties
 - rotation: Integer property; valid values are 0 (sensor mounted upright)
 	    and 180 (sensor mounted upside down). See
 	    ../video-interfaces.txt .
+- vana-supply: Analogue voltage supply (VANA), typically 2,8 volts (sensor
+  dependent).
 
 
 Endpoint node mandatory properties
-- 
2.27.0

