Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0838328314C
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 10:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJEIBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 04:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgJEIBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 04:01:18 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C49C0613A7
        for <linux-media@vger.kernel.org>; Mon,  5 Oct 2020 01:01:17 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 6088E634C8C;
        Mon,  5 Oct 2020 11:00:42 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v2 2/5] v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must init vep argument
Date:   Mon,  5 Oct 2020 11:01:12 +0300
Message-Id: <20201005080115.8875-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201005080115.8875-1-sakari.ailus@linux.intel.com>
References: <20201005080115.8875-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that the caller of v4l2_fwnode_endpoint_parse() must init the
fields of struct v4l2_fwnode_endpoint (vep argument) fields.

It used to be that the fields were zeroed by v4l2_fwnode_endpoint_parse
when bus type was set to V4L2_MBUS_UNKNOWN but with recent changes (Fixes:
line below) that no longer makes sense.

Fixes: bb4bba9232fc ("media: v4l2-fwnode: Make bus configuration a struct")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index c09074276543..ed0840f3d5df 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -231,6 +231,9 @@ struct v4l2_fwnode_connector {
  * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
  * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
  *
+ * The caller is required to initialise all fields of @vep, either with
+ * explicitly values, or by zeroing them.
+ *
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
  * NOTE: This function does not parse properties the size of which is variable
@@ -273,6 +276,9 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
  * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
  * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
  *
+ * The caller is required to initialise all fields of @vep, either with
+ * explicitly values, or by zeroing them.
+ *
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
  * v4l2_fwnode_endpoint_alloc_parse() has two important differences to
-- 
2.27.0

