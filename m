Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF7034B9D4
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 23:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhC0WUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 18:20:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:30344 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231189AbhC0WUQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 18:20:16 -0400
IronPort-SDR: S/FeV6jDuC0WhUs6evgYV6ZuiWjmDfbiAh/U9C74peyXmnffOkFbCW+p5PQDflLoH+xyugpRT3
 O6cjAVapJSYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9936"; a="171343878"
X-IronPort-AV: E=Sophos;i="5.81,284,1610438400"; 
   d="scan'208";a="171343878"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2021 15:20:16 -0700
IronPort-SDR: zQiDHXu7GDLDsku6wxtsgSBjXCscK30U39o3qbUErh4jkFkJNrGfZ8zbV5WpTbTKTNJn08D1sW
 1OsT1Qr+PZRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,284,1610438400"; 
   d="scan'208";a="410447020"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 27 Mar 2021 15:20:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D524C103; Sun, 28 Mar 2021 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-acpi@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v1 2/8] software node: Introduce software_node_alloc()/software_node_free()
Date:   Sun, 28 Mar 2021 00:20:06 +0200
Message-Id: <20210327222012.54103-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327222012.54103-1-andriy.shevchenko@linux.intel.com>
References: <20210327222012.54103-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce software_node_alloc() and software_node_free() helpers.
This will help with code readability and maintenance.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/swnode.c | 47 ++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 456f5fe58b58..19aa44bc2628 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -720,19 +720,30 @@ software_node_find_by_name(const struct software_node *parent, const char *name)
 }
 EXPORT_SYMBOL_GPL(software_node_find_by_name);
 
-static int
-software_node_register_properties(struct software_node *node,
-				  const struct property_entry *properties)
+static struct software_node *software_node_alloc(const struct property_entry *properties)
 {
 	struct property_entry *props;
+	struct software_node *node;
 
 	props = property_entries_dup(properties);
 	if (IS_ERR(props))
-		return PTR_ERR(props);
+		return ERR_CAST(props);
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node) {
+		property_entries_free(props);
+		return ERR_PTR(-ENOMEM);
+	}
 
 	node->properties = props;
 
-	return 0;
+	return node;
+}
+
+static void software_node_free(const struct software_node *node)
+{
+	property_entries_free(node->properties);
+	kfree(node);
 }
 
 static void software_node_release(struct kobject *kobj)
@@ -746,10 +757,9 @@ static void software_node_release(struct kobject *kobj)
 		ida_simple_remove(&swnode_root_ids, swnode->id);
 	}
 
-	if (swnode->allocated) {
-		property_entries_free(swnode->node->properties);
-		kfree(swnode->node);
-	}
+	if (swnode->allocated)
+		software_node_free(swnode->node);
+
 	ida_destroy(&swnode->child_ids);
 	kfree(swnode);
 }
@@ -964,7 +974,6 @@ fwnode_create_software_node(const struct property_entry *properties,
 	struct fwnode_handle *fwnode;
 	struct software_node *node;
 	struct swnode *p = NULL;
-	int ret;
 
 	if (parent) {
 		if (IS_ERR(parent))
@@ -974,23 +983,15 @@ fwnode_create_software_node(const struct property_entry *properties,
 		p = to_swnode(parent);
 	}
 
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
-	if (!node)
-		return ERR_PTR(-ENOMEM);
-
-	ret = software_node_register_properties(node, properties);
-	if (ret) {
-		kfree(node);
-		return ERR_PTR(ret);
-	}
+	node = software_node_alloc(properties);
+	if (IS_ERR(node))
+		return ERR_CAST(node);
 
 	node->parent = p ? p->node : NULL;
 
 	fwnode = swnode_register(node, p, 1);
-	if (IS_ERR(fwnode)) {
-		property_entries_free(node->properties);
-		kfree(node);
-	}
+	if (IS_ERR(fwnode))
+		software_node_free(node);
 
 	return fwnode;
 }
-- 
2.30.2

