Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B5A7A0C7B
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241340AbjINSRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241366AbjINSRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D691FFF
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80560880A;
        Thu, 14 Sep 2023 20:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715364;
        bh=wMvjW857UeaIfYXGRjzJCCqnYm4BQIqlfD6meHb/pJs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XnNYyuvR00rfXRaiVM2u5VtRZW2RWp7kaODhS4HLTcocKinfDfiF6lZJwj0LS9Bk6
         nb7o/5x9M/AzSd86nc5kdbM4YH25XUZsPzIblLW9CPI27x+X6lDJIG8cfonlPz6ay7
         nVsWhC7PKk8KGluU7DZmQK2lrLADbMPaqkIhSgpo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 32/57] Documentation: media: camera-sensor: Use link to upstream DT bindings
Date:   Thu, 14 Sep 2023 21:16:39 +0300
Message-ID: <20230914181704.4811-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Documentation/devicetree/bindings/clock/clock-bindings.txt file is
deprecated and points to clock-bindings.yaml, which is not hosted in the
kernel source tree. Use an HTTPS link to refer to the YAML binding
document.

While at it, drop "currently" from the paragraph, as the whole file
refers to the current recommended practices except where explicitly
noted.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 96cfbc261b6e..3510a57ecb9a 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -32,10 +32,11 @@ can rely on this frequency being used.
 Devicetree
 ~~~~~~~~~~
 
-The currently preferred way to achieve this is using ``assigned-clocks``,
-``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See
-``Documentation/devicetree/bindings/clock/clock-bindings.txt`` for more
-information. The driver then gets the frequency using ``clk_get_rate()``.
+The preferred way to achieve this is using ``assigned-clocks``,
+``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See the
+`clock device tree bindings <https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml>`_
+for more information. The driver then gets the frequency using
+``clk_get_rate()``.
 
 This approach has the drawback that there's no guarantee that the frequency
 hasn't been modified directly or indirectly by another driver, or supported by
-- 
Regards,

Laurent Pinchart

