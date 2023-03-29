Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E506CD75A
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 12:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjC2KKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 06:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjC2KKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 06:10:00 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4291724;
        Wed, 29 Mar 2023 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680084599; x=1711620599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aMaKHZ+sOaceKGE77joDQX5kyAJ9jYBW7/J7dxvAchw=;
  b=SXakLvS/rpT00LGabM7/tAkQMtFVdcsPRpRJOfIt255c/SQL6l7nmSeo
   tb+zpEv/p+PWyTLMgi+5dV75315/OcDQ3NpN2orAlOarQXP09P/fO7aQ+
   Smn4QXz9BC+ZaCI+s6YMdZe3WB68ICtzwOuaplC4KP+vjRH/Y7N58yqCC
   2FflRPb7AJo1+Byjj/detCdYhowgsTtlsK/L2H6+aig2NRxBGghlQY8fe
   LlGjuL79iZ7X++rJYN8uMz5BP6d1UWMHgJQ0OQ8Wh6nWbn0XqxG1727fU
   Yj2a87BtKFC+oC0utuV46nfDRfwPsKt1NXPFZfq26anAPTiqS5T+6ytyO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="343256229"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="343256229"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 03:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773517706"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="773517706"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 03:09:57 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7B339122636;
        Wed, 29 Mar 2023 13:09:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-acpi@vger.kernel.org
Cc:     linux-media@vger.kernel.org, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com
Subject: [PATCH v8 02/10] ACPI: property: Parse data node string references in properties
Date:   Wed, 29 Mar 2023 13:09:43 +0300
Message-Id: <20230329100951.1522322-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329100951.1522322-1-sakari.ailus@linux.intel.com>
References: <20230329100951.1522322-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for parsing property references using strings, besides
reference objects that were previously supported. This allows also
referencing data nodes which was not possible with reference objects.

Also add pr_fmt() macro to prefix printouts.

While at it, update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/acpi/property.c | 110 ++++++++++++++++++++++++++++++++++------
 1 file changed, 94 insertions(+), 16 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index b8d9eb9a433e..08831ffba26c 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -2,14 +2,17 @@
 /*
  * ACPI device specific properties support.
  *
- * Copyright (C) 2014, Intel Corporation
+ * Copyright (C) 2014-2023, Intel Corporation
  * All rights reserved.
  *
  * Authors: Mika Westerberg <mika.westerberg@linux.intel.com>
- *          Darren Hart <dvhart@linux.intel.com>
- *          Rafael J. Wysocki <rafael.j.wysocki@intel.com>
+ *	    Darren Hart <dvhart@linux.intel.com>
+ *	    Rafael J. Wysocki <rafael.j.wysocki@intel.com>
+ *	    Sakari Ailus <sakari.ailus@linux.intel.com>
  */
 
+#define pr_fmt(fmt) "ACPI: " fmt
+
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -795,7 +798,8 @@ acpi_fwnode_get_named_child_node(const struct fwnode_handle *fwnode,
 static int acpi_get_ref_args(struct fwnode_reference_args *args,
 			     struct fwnode_handle *ref_fwnode,
 			     const union acpi_object **element,
-			     const union acpi_object *end, size_t num_args)
+			     const union acpi_object *end, size_t num_args,
+			     bool subnode_string)
 {
 	u32 nargs = 0, i;
 
@@ -803,13 +807,16 @@ static int acpi_get_ref_args(struct fwnode_reference_args *args,
 	 * Find the referred data extension node under the
 	 * referred device node.
 	 */
-	for (; *element < end && (*element)->type == ACPI_TYPE_STRING;
-	     (*element)++) {
-		const char *child_name = (*element)->string.pointer;
-
-		ref_fwnode = acpi_fwnode_get_named_child_node(ref_fwnode, child_name);
-		if (!ref_fwnode)
-			return -EINVAL;
+	if (subnode_string) {
+		for (; *element < end && (*element)->type == ACPI_TYPE_STRING;
+		     (*element)++) {
+			const char *child_name = (*element)->string.pointer;
+
+			ref_fwnode = acpi_fwnode_get_named_child_node(ref_fwnode,
+								      child_name);
+			if (!ref_fwnode)
+				return -EINVAL;
+		}
 	}
 
 	/*
@@ -820,7 +827,8 @@ static int acpi_get_ref_args(struct fwnode_reference_args *args,
 	for (i = 0; (*element) + i < end && i < num_args; i++) {
 		acpi_object_type type = (*element)[i].type;
 
-		if (type == ACPI_TYPE_LOCAL_REFERENCE)
+		if (type == ACPI_TYPE_LOCAL_REFERENCE ||
+		    (!subnode_string && type == ACPI_TYPE_STRING))
 			break;
 
 		if (type == ACPI_TYPE_INTEGER)
@@ -844,6 +852,43 @@ static int acpi_get_ref_args(struct fwnode_reference_args *args,
 	return 0;
 }
 
+static struct fwnode_handle *
+acpi_parse_string_ref(const struct fwnode_handle *fwnode, const char *refstring)
+{
+	acpi_handle scope, handle;
+	struct acpi_data_node *dn;
+	struct acpi_device *device;
+	acpi_status status;
+
+	if (is_acpi_device_node(fwnode)) {
+		scope = to_acpi_device_node(fwnode)->handle;
+	} else if (is_acpi_data_node(fwnode)) {
+		scope = to_acpi_data_node(fwnode)->handle;
+	} else {
+		pr_debug("bad node type for node %pfw\n", fwnode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	status = acpi_get_handle(scope, refstring, &handle);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_debug(scope, "can't get handle for %s", refstring);
+		return ERR_PTR(-EINVAL);
+	}
+
+	device = acpi_fetch_acpi_dev(handle);
+	if (device)
+		return acpi_fwnode_handle(device);
+
+	status = acpi_get_data_full(handle, acpi_nondev_subnode_tag,
+				    (void **)&dn, NULL);
+	if (ACPI_FAILURE(status) || !dn) {
+		acpi_handle_debug(handle, "can't find subnode");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &dn->fwnode;
+}
+
 /**
  * __acpi_node_get_property_reference - returns handle to the referenced object
  * @fwnode: Firmware node to get the property from
@@ -886,6 +931,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
 	const struct acpi_device_data *data;
+	struct fwnode_handle *ref_fwnode;
 	struct acpi_device *device;
 	int ret, idx = 0;
 
@@ -909,16 +955,29 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 		args->fwnode = acpi_fwnode_handle(device);
 		args->nargs = 0;
+		return 0;
+	case ACPI_TYPE_STRING:
+		if (index)
+			return -ENOENT;
+
+		ref_fwnode = acpi_parse_string_ref(fwnode, obj->string.pointer);
+		if (IS_ERR(ref_fwnode))
+			return PTR_ERR(ref_fwnode);
+
+		args->fwnode = ref_fwnode;
+		args->nargs = 0;
+
 		return 0;
 	case ACPI_TYPE_PACKAGE:
 		/*
 		 * If it is not a single reference, then it is a package of
-		 * references followed by number of ints as follows:
+		 * references, followed by number of ints as follows:
 		 *
 		 *  Package () { REF, INT, REF, INT, INT }
 		 *
-		 * The index argument is then used to determine which reference
-		 * the caller wants (along with the arguments).
+		 * Here, REF may be either a local reference or a string. The
+		 * index argument is then used to determine which reference the
+		 * caller wants (along with the arguments).
 		 */
 		break;
 	default:
@@ -942,7 +1001,26 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, num_args);
+						&element, end, num_args, true);
+			if (ret < 0)
+				return ret;
+
+			if (idx == index)
+				return 0;
+
+			break;
+		case ACPI_TYPE_STRING:
+			ref_fwnode =
+				acpi_parse_string_ref(fwnode,
+						      element->string.pointer);
+			if (IS_ERR(ref_fwnode))
+				return PTR_ERR(ref_fwnode);
+
+			element++;
+
+			ret = acpi_get_ref_args(idx == index ? args : NULL,
+						ref_fwnode, &element, end,
+						num_args, false);
 			if (ret < 0)
 				return ret;
 
-- 
2.30.2

