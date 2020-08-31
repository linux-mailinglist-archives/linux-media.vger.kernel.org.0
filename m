Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF2A25821E
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 21:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729840AbgHaTwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 15:52:53 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8287 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728671AbgHaTwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 15:52:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d54e50000>; Mon, 31 Aug 2020 12:52:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 12:52:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 31 Aug 2020 12:52:50 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 19:52:50 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 19:52:50 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.173.243]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4d55120001>; Mon, 31 Aug 2020 12:52:50 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/4] dt-bindings: media: imx274: Move clock and supplies to required properties
Date:   Mon, 31 Aug 2020 12:52:37 -0700
Message-ID: <1598903558-9691-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
References: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598903525; bh=cI9qXzcPGqGdkxaGFBpZnNBvnOVWFpZQPxddtvK1mz4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=CBMLBDtRBqmu3/996GUca0WoNJxJcwYYW44ay7eQwiYIzMp4S5UPvJv9zJB+ujJ0o
         xYanmKZEWSi280To38pclJenulIOdJAOwD7UmQJFzeNb1r7DSzKQnaGtrvoFRylX9l
         4012zwHHVUIIecCdf9rv28Y7M2rXMx8Q5qMzqTyjzk9UawbcyVZx0ZuTud+2yqn5dP
         orTy92MOCIN3k0hG8FlaXUHlR6uM8QTLFx2ktksXHVVbGqXXTTxdp1W2BiToi14dF+
         SD2TRSxUvBGbdI3lUP5M819ENZqxWTWBo29+qUBT4d/lY62HMb7CZuvsXX/ZJsukVa
         8uj/yKNqDjTaw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clock and supplies are external to IMX274 sensor and are dependent
on camera module design.

So, this patch moves them to required properties.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 Documentation/devicetree/bindings/media/i2c/imx274.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
index d0a5c899..b43bed6 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
+++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
@@ -10,15 +10,15 @@ at 1440 Mbps.
 Required Properties:
 - compatible: value should be "sony,imx274" for imx274 sensor
 - reg: I2C bus address of the device
-
-Optional Properties:
-- reset-gpios: Sensor reset GPIO
 - clocks: Reference to the input clock.
 - clock-names: Should be "inck".
 - vana-supply: Sensor 2.8v analog supply.
 - vdig-supply: Sensor 1.8v digital core supply.
 - vddl-supply: Sensor digital IO 1.2v supply.
 
+Optional Properties:
+- reset-gpios: Sensor reset GPIO
+
 The imx274 device node should contain one 'port' child node with
 an 'endpoint' subnode. For further reading on port node refer to
 Documentation/devicetree/bindings/media/video-interfaces.txt.
-- 
2.7.4

