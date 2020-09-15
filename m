Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4BF26B4A7
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 01:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgIOX3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 19:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgIOX27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 19:28:59 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45346C06178B;
        Tue, 15 Sep 2020 16:28:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so4974495wrx.7;
        Tue, 15 Sep 2020 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wlMH8QuyjYR1doRko83qgCbVSL0B0yuQuD817gAzTi4=;
        b=nCImKK7qVweclYFnPpSdKdNg5bCcq9ghNZnf9NG5qcxImcCnw8Deph43+A8rA1bSzu
         /oVYxBJEXGj8VU/iT5OC2kDswPCcUnC+ZOHAbpan4Zm9MGRPIBz7TkHwqR9AZpOc+9tp
         fodiasMqoFE9SUFolIdqz1rviK6j+tchlvq9RD/1txE/jA6OOyTvrPBShzeZ0aQGLjVv
         sqqqllcLZ/m8EdGuHPYB0UWxd0fT0UjJOX3vE6+5dvZQa4XvboFzmlOiht3Rg7Ft2WAY
         c8wGmbqpAtYFyBeitRqqN7n9JXZstndM28RuzV1GtyyNH67ognjIXxCQPjWAZ2bYD/tM
         NOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wlMH8QuyjYR1doRko83qgCbVSL0B0yuQuD817gAzTi4=;
        b=c1/nhIAtkrNC6bgOkEN/eA7eXCWA8C4bXPbJX2n4Idcnx35qcuPxkUcky4HHofCxTw
         EDIeZ30njzhjkoVT31qrbJ5uAJOJQ81bv9Cyxa1iJTJzF+rFbusAXG/DAr9jn2YIl+ZP
         Fq7QzqTQbDhdZV2Dis5cyM6OHFEWEf1yvUNYthrIPZBrSZRzQAZIKWblOPpDLYyGBNi+
         Vl8QnL42I+OpQjDHBeW0KnasXTbtdeU4EkngC8AD3W5NYuHQwuxsYxuKCQyp1EXhFTId
         Fmk/8bd2M4/gacJBuQ9fnxSbjr5REpZdYTtobfFqS6oTMPRlL5sS06PmULCYxucA1REI
         2+Bw==
X-Gm-Message-State: AOAM530AYaXKKs633C10ya0VtSaXXObEKRjmhbxer3ASujQ6ZsXGuVGK
        k9pkJBtYdNPMPutKS878ctf9dvY3ErAtH69C
X-Google-Smtp-Source: ABdhPJyrBNyK85g/jRR3+OJXgVBTv0WqbqJQ11xvPlpQPkLEStVItcgpHlkjExYoJxOLyz/cwUmRHA==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr23006769wrm.375.1600212533961;
        Tue, 15 Sep 2020 16:28:53 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id f1sm28624374wrx.75.2020.09.15.16.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 16:28:53 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, kieran.bingham@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com
Subject: [PATCH v2] software_node: Add support for fwnode_graph*() family of functions
Date:   Wed, 16 Sep 2020 00:28:27 +0100
Message-Id: <20200915232827.3416-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

This implements the remaining .graph_* callbacks in the
fwnode operations vector for the software nodes. That makes
the fwnode_graph*() functions available in the drivers also
when software nodes are used.

The implementation tries to mimic the "OF graph" as much as
possible, but there is no support for the "reg" device
property. The ports will need to have the index in their
name which starts with "port" (for example "port0", "port1",
...) and endpoints will use the index of the software node
that is given to them during creation. The port nodes can
also be grouped under a specially named "ports" subnode,
just like in DT, if necessary.

The remote-endpoints are reference properties under the
endpoint nodes that are named "remote-endpoint". 

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Co-developed-by: Daniel Scally <djrscally@gmail.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
changes in v2:
	- added software_node_device_is_available
	- altered software_node_get_next_child to get references
	- altered software_node_get_next_endpoint to release references
	to ports and avoid passing invalid combinations of swnodes to
	software_node_get_next_child
	- altered swnode_graph_find_next_port to release port rather than
	old
	
 drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 2 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 010828fc785b..d69034b807e3 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
 	kobject_put(&swnode->kobj);
 }
 
+static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
+{
+	return is_software_node(fwnode);
+}
+
 static bool software_node_property_present(const struct fwnode_handle *fwnode,
 					   const char *propname)
 {
@@ -450,7 +455,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
 		c = list_next_entry(c, entry);
 	else
 		c = list_first_entry(&p->children, struct swnode, entry);
-	return &c->fwnode;
+	return software_node_get(&c->fwnode);
 }
 
 static struct fwnode_handle *
@@ -536,9 +541,125 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static struct fwnode_handle *
+swnode_graph_find_next_port(const struct fwnode_handle *parent,
+			    struct fwnode_handle *port)
+{
+	struct fwnode_handle *old = port;
+
+	while ((port = software_node_get_next_child(parent, old))) {
+		if (!strncmp(to_swnode(port)->node->name, "port", 4))
+			return port;
+		fwnode_handle_put(port);
+		old = port;
+	}
+
+	return NULL;
+}
+
+static struct fwnode_handle *
+software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
+				      struct fwnode_handle *endpoint)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	struct fwnode_handle *old = endpoint;
+	struct fwnode_handle *parent_of_old;
+	struct fwnode_handle *parent;
+	struct fwnode_handle *port;
+
+	if (!swnode)
+		return NULL;
+
+	if (endpoint) {
+		port = software_node_get_parent(endpoint);
+		parent = software_node_get_parent(port);
+	} else {
+		parent = software_node_get_named_child_node(fwnode, "ports");
+		if (!parent)
+			parent = software_node_get(&swnode->fwnode);
+
+		port = swnode_graph_find_next_port(parent, NULL);
+	}
+
+	for (; port; port = swnode_graph_find_next_port(parent, port)) {
+
+		if (old) {
+			parent_of_old = software_node_get_parent(old);
+
+			if (parent_of_old != port)
+				old = NULL;
+
+			fwnode_handle_put(parent_of_old);
+		}
+
+		endpoint = software_node_get_next_child(port, old);
+		fwnode_handle_put(old);
+		if (endpoint)
+			break;
+
+		fwnode_handle_put(port);
+	}
+
+	fwnode_handle_put(port);
+	software_node_put(parent);
+
+	return endpoint;
+}
+
+static struct fwnode_handle *
+software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	const struct software_node_ref_args *ref;
+	const struct property_entry *prop;
+
+	if (!swnode)
+		return NULL;
+
+	prop = property_entry_get(swnode->node->properties, "remote-endpoint");
+	if (!prop || prop->type != DEV_PROP_REF || prop->is_inline)
+		return NULL;
+
+	ref = prop->pointer;
+
+	return software_node_get(software_node_fwnode(ref[0].node));
+}
+
+static struct fwnode_handle *
+software_node_graph_get_port_parent(struct fwnode_handle *fwnode)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	struct fwnode_handle *parent;
+
+	if (!strcmp(swnode->parent->node->name, "ports"))
+		parent = &swnode->parent->parent->fwnode;
+	else
+		parent = &swnode->parent->fwnode;
+
+	return software_node_get(parent);
+}
+
+static int
+software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
+				   struct fwnode_endpoint *endpoint)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	int ret;
+
+	ret = kstrtou32(swnode->parent->node->name + 4, 10, &endpoint->port);
+	if (ret)
+		return ret;
+
+	endpoint->id = swnode->id;
+	endpoint->local_fwnode = fwnode;
+
+	return 0;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
+	.device_is_available = software_node_device_is_available,
 	.property_present = software_node_property_present,
 	.property_read_int_array = software_node_read_int_array,
 	.property_read_string_array = software_node_read_string_array,
@@ -547,7 +668,11 @@ static const struct fwnode_operations software_node_ops = {
 	.get_parent = software_node_get_parent,
 	.get_next_child_node = software_node_get_next_child,
 	.get_named_child_node = software_node_get_named_child_node,
-	.get_reference_args = software_node_get_reference_args
+	.get_reference_args = software_node_get_reference_args,
+	.graph_get_next_endpoint = software_node_graph_get_next_endpoint,
+	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
+	.graph_get_port_parent = software_node_graph_get_port_parent,
+	.graph_parse_endpoint = software_node_graph_parse_endpoint,
 };
 
 /* -------------------------------------------------------------------------- */
-- 
2.17.1

