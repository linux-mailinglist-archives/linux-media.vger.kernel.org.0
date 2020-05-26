Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129EE1E241A
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 16:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgEZObQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 10:31:16 -0400
Received: from mga12.intel.com ([192.55.52.136]:44723 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726965AbgEZObP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 10:31:15 -0400
IronPort-SDR: uLzWD5KuEvHOc8WBKnUEct9g8OKYtSP52mjhHYw/TIGxji4YkGltDSEJmP4zzTM+YLKwVLjruY
 FDM79DIpBgaw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 07:31:14 -0700
IronPort-SDR: LHLSiFElEiSRmOblMHMvnw15oAJVq/ZJUCnkUSwiK8UrdP2FId8zaPoddZB5WI5qH0UMWTyK55
 /tJ3dlmMwM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; 
   d="scan'208,223";a="375715781"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 May 2020 07:31:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 26 May 2020 17:31:10 +0300
Date:   Tue, 26 May 2020 17:31:10 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
Message-ID: <20200526143110.GC3284396@kuha.fi.intel.com>
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
 <20200517103659.GS17578@paasikivi.fi.intel.com>
 <20200520094400.5137e7f2@coco.lan>
 <20200520082608.GV20066@paasikivi.fi.intel.com>
 <20200520131830.3ff45919@coco.lan>
 <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
 <20200522115736.10cca8eb@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20200522115736.10cca8eb@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 11:57:36AM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 21 May 2020 11:00:19 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> 
> > +Cc: Heikki (swnode expert)
> > 
> > On Wed, May 20, 2020 at 2:19 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > > Em Wed, 20 May 2020 11:26:08 +0300
> > > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:  
> > 
> > ...
> > 
> > > As I said, the problem is not probing the sensor via ACPI, but, instead,
> > > to be able receive platform-specific data.  
> > 
> > There is no problem with swnodes, except missing parts (*).
> > I have Skylake laptop with IPU3 and with half-baked ACPI tables, but
> > since we have drivers in place with fwnode support, we only need to
> > recreate fwnode graph in some board file to compensate the gap in
> > ACPI.
> > 
> > *) Missing part is graph support for swnodes. With that done it will
> > be feasible to achieve the rest.
> > I forgot if we have anything for this already done. Heikki?
> 
> Hmm... I guess I should try this approach. I never heard about swnodes
> before. Do you have already some patch with the needed swnodes setup,
> and the missing parts to recreate the fwnode graph?

Here you go. I tested it with this code:

        static const struct software_node nodes[];

        static const struct property_entry ep0_props[] = {
               PROPERTY_ENTRY_REF("remote-endpoint", &nodes[5]),
               { }
        };

        static const struct property_entry ep1_props[] = {
               PROPERTY_ENTRY_REF("remote-endpoint", &nodes[2]),
               { }
        };

        static const struct software_node nodes[] = {
               { "dev0" },
               { "port0", &nodes[0] },
               { "endpoint", &nodes[1], ep0_props },
               { "dev1" },
               { "port0", &nodes[3] },
               { "endpoint", &nodes[4], ep1_props },
               { }
        };

        void test(void)
        {
                const struct software_node *swnode;
                struct fwnode_handle *fwnode;

                software_node_register_nodes(nodes);

                fwnode = fwnode_graph_get_remote_port_parent(software_node_fwnode(&nodes[5]));
                swnode = to_software_node(fwnode);
                printk("first parent: %s\n", swnode->name);

                fwnode = fwnode_graph_get_remote_port_parent(software_node_fwnode(&nodes[2]));
                swnode = to_software_node(fwnode);
                printk("second parent: %s\n", swnode->name);

                software_node_unregister_nodes(nodes);
        }

thanks,

-- 
heikki

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-software-node-Add-support-for-fwnode_graph-family-of.patch"

From c6f8f2253b09e68bfb74a9110165f04fc2f50c51 Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 19 Aug 2019 11:09:41 +0300
Subject: [PATCH] software node: Add support for fwnode_graph* family of
 functions

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
---
 drivers/base/swnode.c | 109 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index de8d3543e8fe3..7359b3f4e5daa 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -536,6 +536,108 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
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
+		fwnode_handle_put(old);
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
+		endpoint = software_node_get_next_child(port, old);
+		fwnode_handle_put(old);
+		if (endpoint)
+			break;
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
@@ -547,7 +649,12 @@ static const struct fwnode_operations software_node_ops = {
 	.get_parent = software_node_get_parent,
 	.get_next_child_node = software_node_get_next_child,
 	.get_named_child_node = software_node_get_named_child_node,
-	.get_reference_args = software_node_get_reference_args
+	.get_reference_args = software_node_get_reference_args,
+
+	.graph_get_next_endpoint = software_node_graph_get_next_endpoint,
+	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
+	.graph_get_port_parent = software_node_graph_get_port_parent,
+	.graph_parse_endpoint = software_node_graph_parse_endpoint,
 };
 
 /* -------------------------------------------------------------------------- */
-- 
2.26.2


--17pEHd4RhPHOinZp--
