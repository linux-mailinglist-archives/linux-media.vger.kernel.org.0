Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC0C223C91
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgGQN0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:26:03 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44149 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgGQN0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:26:02 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3E3841C0004;
        Fri, 17 Jul 2020 13:26:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 12/13] MAINTAINERS: ov5640: Add bindings file
Date:   Fri, 17 Jul 2020 15:28:58 +0200
Message-Id: <20200717132859.237120-13-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the newly introduced bindings file to the list of files
associated with the ov5640 driver in the MAINTAINERS file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2730af1265ea..fc2a2129d18e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12604,6 +12604,7 @@ M:	Steve Longerbeam <slongerbeam@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ov5640.yaml
 F:	drivers/media/i2c/ov5640.c
 
 OMNIVISION OV5647 SENSOR DRIVER
-- 
2.27.0

