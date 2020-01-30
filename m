Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0178D14D7A1
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 09:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgA3Ib6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 03:31:58 -0500
Received: from retiisi.org.uk ([95.216.213.190]:50680 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726757AbgA3Ib6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 03:31:58 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 94619634C8B;
        Thu, 30 Jan 2020 10:31:06 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Benoit Parrot <bparrot@ti.com>
Subject: [PATCH 1/1] MAINTAINERS: Fix ti-vpe binding file line
Date:   Thu, 30 Jan 2020 10:31:56 +0200
Message-Id: <20200130083156.10959-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add "F:" prefix to the ti,cal.yaml line to tell it's a file.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index da05666e9ade..02e5aad82c94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16584,7 +16584,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 S:	Maintained
 F:	drivers/media/platform/ti-vpe/
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
-	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,cal.yaml
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.20.1

