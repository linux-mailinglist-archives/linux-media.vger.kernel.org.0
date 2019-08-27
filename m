Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6597B9E3EC
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729502AbfH0JWx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:22:53 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60057 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbfH0JWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:22:53 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A94BB1C0008;
        Tue, 27 Aug 2019 09:22:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [DO NOT MERGE] mb/google/poppy/variant/soraka: Add camera properties
Date:   Tue, 27 Aug 2019 11:23:39 +0200
Message-Id: <20190827092339.8858-14-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827092339.8858-1-jacopo@jmondi.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the 'rotation' and 'location' properties to the cameras .asl files.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../poppy/variants/baseboard/include/baseboard/acpi/cam0.asl    | 2 ++
 .../poppy/variants/baseboard/include/baseboard/acpi/cam1.asl    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam0.asl b/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam0.asl
index 5bb8df5b75..07a1bf3ff7 100644
--- a/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam0.asl
+++ b/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam0.asl
@@ -47,6 +47,8 @@ Scope (\_SB.PCI0.I2C2)
 			},
 			ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
 			Package () {
+				Package () { "location", 0 },
+				Package () { "rotation", 0 },
 				Package () { "clock-frequency", 19200000 },
 				Package () { "lens-focus",
 					Package () { \_SB.PCI0.I2C2.VCM0 }
diff --git a/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam1.asl b/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam1.asl
index d7640b249d..1814b422a2 100644
--- a/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam1.asl
+++ b/src/mainboard/google/poppy/variants/baseboard/include/baseboard/acpi/cam1.asl
@@ -47,6 +47,8 @@ Scope (\_SB.PCI0.I2C4)
 			},
 			ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
 			Package () {
+				Package () { "location", 1 },
+				Package () { "rotation", 0 },
 				Package () { "clock-frequency", 19200000 },
 			}
 		})
-- 
2.23.0

