Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1815628314A
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 10:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgJEIBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 04:01:19 -0400
Received: from retiisi.org.uk ([95.216.213.190]:36434 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEIBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 04:01:18 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 8EB00634C8F;
        Mon,  5 Oct 2020 11:00:42 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v2 5/5] v4l2-fwnode: Say it's fine to use v4l2_fwnode_endpoint_parse
Date:   Mon,  5 Oct 2020 11:01:15 +0300
Message-Id: <20201005080115.8875-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201005080115.8875-1-sakari.ailus@linux.intel.com>
References: <20201005080115.8875-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Earlier it was expected that there would be more variable size endpoint
properties and that most if not all drivers would need them. For that
reason it was expected also that v4l2_fwnode_endpoint_parse would no
longer be needed.

What actually happened that not all drivers require "link-frequencies",
the only variable size media endpoint property without a small upper
limit. Therefore drivers that do not need that information are fine using
v4l2_fwnode_endpoint_parse. So don't tell drivers to use
v4l2_fwnode_endpoint_alloc_parse in all cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/media/v4l2-fwnode.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 20b30d770944..be30e066c621 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -245,9 +245,9 @@ struct v4l2_fwnode_connector {
  *
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
- * NOTE: This function does not parse properties the size of which is variable
- * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() in
- * new drivers instead.
+ * NOTE: This function does not parse "link-frequencies" property as its size is
+ * not known in advance. Please use v4l2_fwnode_endpoint_alloc_parse() if you
+ * need properties of variable size.
  *
  * Return: %0 on success or a negative error code on failure:
  *	   %-ENOMEM on memory allocation failure
-- 
2.27.0

