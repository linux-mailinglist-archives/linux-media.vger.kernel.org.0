Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7079E293191
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 00:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388752AbgJSW73 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgJSW72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:28 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D553C0613CE;
        Mon, 19 Oct 2020 15:59:28 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z22so44808wmi.0;
        Mon, 19 Oct 2020 15:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vIq8EOvuOTh5N+IYYUhaT61dqBKvXkqlLtPj3mV3eio=;
        b=nn8RmuhG6QUfLi1sNNg6dn/zcLE8k1UgxMqoZIryy9FOpLvIC1b0Qr67oXJL8kiUa+
         PFb1u2YneD8mbanzuH3Wi+eiXeoWf8c8i3xYLqVvSSvLp5qwb5kaLBHFOSdQrrVCT4RE
         moiIMrQ44UFWqsTFrqcS8EAz8pzkczp2ZV0gyfu7BY91Rw5EY+lkiQd+MfeqYOtdy4Cd
         Oim6cZpXzdD0a9swrZoz9/GhVFQQ2/IdQVkLxmyJ81kGka/3huoU6ykYAFWcUOxhNleq
         zLCAD7fjbwfTwez5W+dC61KIbMFg/vo32XcV06jZImLQUTd7sYYUKiM19+EcBHdhYDqA
         zhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vIq8EOvuOTh5N+IYYUhaT61dqBKvXkqlLtPj3mV3eio=;
        b=H+vg6Ew6DvOvdO2riBRCIKGsqkxknLqkrKetkclieBQY3TKIe98qIy5BsqVTC1Srpl
         1mTj5zHA0USw1pC1fzS8DXwkWdydnPHZ2qe68n3wP4xPqQzqxUAa8LEnKW+6uLLxI9bu
         CW699eZdW7wYIbvcnKFE+JuWMJrnDk2dG2PhEPQVk9+gpbYgOiMNnqlAy+Pf02BtDPXE
         oF1PlKpHdoG60epRGAzLzEn4GrY4SHmh7T33q7E8vQhvrT+Tav2NWOH5l1HD8OIenkfE
         Qr2c4p3yA41netGFWZdVL2xzdQU/nn5sYXx38y5VPKSegv+a3m0+RAFckoMAMJPuc8u6
         027A==
X-Gm-Message-State: AOAM532r3YIWu/t+DATct4+tFVKKpz83eVVt8zzlFZzkkxCBIUiEIFdb
        Efw43DtP77D8WG65qpsYthvy3wLd14OkDeo+
X-Google-Smtp-Source: ABdhPJwMtvlppH+VK7I6N92iUQVpQcRRtp4+a4CF2TvWVtqlpSFk02jOOKLKVayIfYI4sMVJLw61qQ==
X-Received: by 2002:a1c:6355:: with SMTP id x82mr89865wmb.177.1603148366658;
        Mon, 19 Oct 2020 15:59:26 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:26 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: [RFC PATCH v3 4/9] software_node: Add support for fwnode_graph*() family of functions
Date:   Mon, 19 Oct 2020 23:58:58 +0100
Message-Id: <20201019225903.14276-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
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
changes in v3:
	- removed software_node_device_is_available
	- moved the change to software_node_get_next_child to a separate
	patch
	- switched to use fwnode_handle_put() in graph_get_next_endpoint()
	instead of software_node_put()

changes in v2:
	- added software_node_device_is_available
	- altered software_node_get_next_child to get references
	- altered software_node_get_next_endpoint to release references
	to ports and avoid passing invalid combinations of swnodes to
	software_node_get_next_child
	- altered swnode_graph_find_next_port to release port rather than
	old
 drivers/base/swnode.c | 120 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 741149b90..3732530ce 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -536,6 +536,120 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
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
+	fwnode_handle_put(parent);
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
@@ -547,7 +661,11 @@ static const struct fwnode_operations software_node_ops = {
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

