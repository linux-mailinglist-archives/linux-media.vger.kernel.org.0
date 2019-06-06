Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF8D374C5
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfFFNCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:02:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49870 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbfFFNC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 09:02:29 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id AE88F634C85;
        Thu,  6 Jun 2019 16:02:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v2 6/9] v4l2-async: Safely clean up an uninitialised notifier
Date:   Thu,  6 Jun 2019 16:02:22 +0300
Message-Id: <20190606130225.10751-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the V4L2 async framework a bit more robust by allowing to clean up an
uninitialised notifier. Otherwise the result would be a (close to) NULL
pointer dereference.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2ea8afbcbf8f..9107776b4550 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -537,7 +537,7 @@ static void __v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_subdev *asd, *tmp;
 
-	if (!notifier)
+	if (!notifier || !notifier->asd_list.next)
 		return;
 
 	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
-- 
2.11.0

