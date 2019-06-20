Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B54494D031
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 16:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfFTOR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 10:17:58 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39188 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726786AbfFTOR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 10:17:57 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 05CB2634C7B;
        Thu, 20 Jun 2019 17:17:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] MAINTAINERS: Add maintainers for Media Controller
Date:   Thu, 20 Jun 2019 17:17:53 +0300
Message-Id: <20190620141753.15983-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When Media Controller was merged to mainline long, long time ago, no-one
bothered to think what its MAINTAINERS entry should be. Now that Media
Controller is moved into its own directory, address this at the same time.

So tell people to mail patches to myself and Laurent Pinchart.

Note that the patches are still merged through the Media tree, just like
any other driver or framework bits that have separate "mail patches to"
entries different from the main drivers/media one.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
This patch adds a MAINTAINERS entry for the MC framework and API, as
discussed in this week's weekly meeting.

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad2bf808b02c..0a064d10a5df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9643,6 +9643,17 @@ L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	drivers/iio/dac/cio-dac.c
 
+MEDIA CONTROLLER FRAMEWORK
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+W:	https://www.linuxtv.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Supported
+F:	drivers/media/mc/
+F:	include/media/media-*.h
+F:	include/uapi/linux/media.h
+
 MEDIA DRIVERS FOR ASCOT2E
 M:	Sergey Kozlov <serjk@netup.ru>
 M:	Abylay Ospan <aospan@netup.ru>
-- 
2.11.0

