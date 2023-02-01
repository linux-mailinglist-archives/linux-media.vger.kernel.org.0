Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729E667C00F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 23:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjAYWl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 17:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235286AbjAYWlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 17:41:24 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BE2611D4;
        Wed, 25 Jan 2023 14:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674686482; x=1706222482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8AEwD6hBNOEhHBSFt+FqJ33GfT8c+EMAHHmOhuTlE2U=;
  b=DUjoGbFtQrQ6Kh4Orj0unOJbwryt7RNq37nZFX5cyWqmQ6gFDCaeMMJE
   BvbS9n22Wan5xLZRMO30twJ+Gv8dAp5lBLr7pVaWtJivXEiP+l4mAP3G8
   08vF3ol6YqvgbJjtIV020fcjMF8bGCV4FHYhiCIATC/cM77ja7iy/43hK
   R3oQZzAxyHsiyghYYMJfL1W/pTxQcE3haNYMAm6q1XijGg5bzB6rLptTy
   SZumhm4spZOYy4B8u7NE4E0lIY+O90YbgNY+/HoyGu66ZVUU+gKHgIAxp
   u6JwDr+ETBP6pkIYLTn4otRcnRwa+HtDfFp0ODGGG4ZN87ckkNZ3e6LCm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="389040012"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; 
   d="scan'208";a="389040012"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 14:41:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="786604544"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; 
   d="scan'208";a="786604544"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 14:41:17 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 53BFE122728;
        Thu, 26 Jan 2023 00:41:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pKoS7-001gPR-AD; Thu, 26 Jan 2023 00:41:11 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-acpi@vger.kernel.org
Cc:     linux-media@vger.kernel.org, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com
Subject: [PATCH v3 4/8] ACPI: property: Generate camera swnodes for ACPI and DisCo for Imaging
Date:   Thu, 26 Jan 2023 00:40:57 +0200
Message-Id: <20230125224101.401285-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230125224101.401285-1-sakari.ailus@linux.intel.com>
References: <20230125224101.401285-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Generate software nodes for information parsed from ACPI _CRS for CSI-2 as
well as MIPI DisCo for Imaging spec. The software nodes are compliant with
existing ACPI or DT definitions and are parsed by relevant drivers without
changes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/acpi/internal.h |   1 +
 drivers/acpi/mipi.c     | 353 ++++++++++++++++++++++++++++++++++++++++
 drivers/acpi/scan.c     |  19 +++
 include/acpi/acpi_bus.h |  49 ++++++
 4 files changed, 422 insertions(+)

diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
index 1ec4aa92bf17a..fac87404e294c 100644
--- a/drivers/acpi/internal.h
+++ b/drivers/acpi/internal.h
@@ -288,5 +288,6 @@ static inline void acpi_init_lpit(void) { }
 
 void acpi_crs_csi2_swnodes_del_free(void);
 void acpi_bus_scan_crs_csi2(acpi_handle handle);
+void acpi_init_swnodes(struct acpi_device *device);
 
 #endif /* _ACPI_INTERNAL_H_ */
diff --git a/drivers/acpi/mipi.c b/drivers/acpi/mipi.c
index 269a6965d56e6..5dbdf33a13831 100644
--- a/drivers/acpi/mipi.c
+++ b/drivers/acpi/mipi.c
@@ -14,6 +14,8 @@
 #include <linux/sort.h>
 #include <linux/string.h>
 
+#include <media/v4l2-fwnode.h>
+
 #include "internal.h"
 
 struct crs_csi2_swnodes {
@@ -24,6 +26,17 @@ struct crs_csi2_swnodes {
 
 static LIST_HEAD(crs_csi2_swnodes);
 
+static struct acpi_device_software_nodes *crs_csi2_swnode_get(acpi_handle handle)
+{
+	struct crs_csi2_swnodes *swnodes;
+
+	list_for_each_entry(swnodes, &crs_csi2_swnodes, list)
+		if (swnodes->handle == handle)
+			return swnodes->ads;
+
+	return NULL;
+}
+
 static void crs_csi2_swnode_del_free(struct crs_csi2_swnodes *swnodes)
 {
 	list_del(&swnodes->list);
@@ -141,6 +154,32 @@ struct acpi_handle_ref {
 
 #define NO_CSI2_PORT (~1U)
 
+static unsigned int next_csi2_port_index(struct acpi_device_software_nodes *ads,
+					 unsigned int port_nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < ads->num_ports; i++) {
+		struct acpi_device_software_node_port *port = &ads->ports[i];
+
+		if (port->port_nr == port_nr)
+			return i;
+
+		if (port->port_nr != NO_CSI2_PORT)
+			continue;
+
+		port->port_nr = port_nr;
+
+		return i;
+	}
+
+	return NO_CSI2_PORT;
+}
+
+#define GRAPH_PORT_NAME(var, num)					    \
+	(snprintf((var), sizeof(var), SWNODE_GRAPH_PORT_NAME_FMT, (num)) >= \
+	 sizeof(var))
+
 static int crs_handle_cmp(const void *__a, const void *__b)
 {
 	const struct acpi_handle_ref *a = __a, *b = __b;
@@ -165,6 +204,9 @@ static void crs_csi2_release(struct list_head *crs_csi2_handles)
 	}
 }
 
+#define ACPI_CRS_CSI2_PHY_TYPE_C	0
+#define ACPI_CRS_CSI2_PHY_TYPE_D	1
+
 /**
  * acpi_bus_scan_crs_csi2 - Scan a device and its child devices for _CRS CSI-2
  *
@@ -184,6 +226,8 @@ static void crs_csi2_release(struct list_head *crs_csi2_handles)
  * 4. Allocate memory for swnodes each ACPI device requires later on, and
  *    generate a list of such allocations.
  *
+ * 5. Set up properties for software nodes.
+ *
  * Note that struct acpi_device isn't available yet at this time.
  *
  * acpi_scan_lock in scan.c must be held when calling this function.
@@ -314,7 +358,316 @@ void acpi_bus_scan_crs_csi2(acpi_handle handle)
 		this_count = this->count;
 	}
 
+	/*
+	 * Allocate and set up necessary software nodes for each device and set
+	 * up properties from _CRS CSI2 descriptor.
+	 */
+	list_for_each_entry(csi2, &crs_csi2_handles, list) {
+		struct acpi_device_software_nodes *local_swnodes;
+		struct crs_csi2_instance *inst;
+
+		local_swnodes = crs_csi2_swnode_get(csi2->handle);
+		if (WARN_ON_ONCE(!local_swnodes))
+			continue;
+
+		list_for_each_entry(inst, &csi2->buses, list) {
+			struct acpi_device_software_nodes *remote_swnodes;
+			struct acpi_device_software_node_port *local_port;
+			struct acpi_device_software_node_port *remote_port;
+			struct software_node *local_node, *remote_node;
+			unsigned int local_index, remote_index;
+			unsigned int bus_type;
+
+			remote_swnodes = crs_csi2_swnode_get(inst->remote_handle);
+			if (WARN_ON_ONCE(!remote_swnodes))
+				continue;
+
+			local_index = next_csi2_port_index(local_swnodes, inst->csi2.local_port_instance);
+			remote_index = next_csi2_port_index(remote_swnodes, inst->csi2.resource_source.index);
+
+			if (WARN_ON_ONCE(local_index >= local_swnodes->num_ports) ||
+			    WARN_ON_ONCE(remote_index >= remote_swnodes->num_ports))
+				goto out_free;
+
+			switch (inst->csi2.phy_type) {
+			case ACPI_CRS_CSI2_PHY_TYPE_C:
+				bus_type = V4L2_FWNODE_BUS_TYPE_CSI2_CPHY;
+				break;
+			case ACPI_CRS_CSI2_PHY_TYPE_D:
+				bus_type = V4L2_FWNODE_BUS_TYPE_CSI2_DPHY;
+				break;
+			default:
+				acpi_handle_info(handle,
+						 "ignoring CSI-2 PHY type %u\n",
+						 inst->csi2.phy_type);
+				continue;
+			}
+
+			local_port = &local_swnodes->ports[local_index];
+			local_node = &local_swnodes->nodes[ACPI_DEVICE_SWNODE_EP(local_index)];
+			local_port->remote_ep_ref[0] = SOFTWARE_NODE_REFERENCE(local_node);
+			local_port->crs_csi2_local = true;
+
+			remote_port = &remote_swnodes->ports[remote_index];
+			remote_node = &remote_swnodes->nodes[ACPI_DEVICE_SWNODE_EP(remote_index)];
+			remote_port->remote_ep_ref[0] = SOFTWARE_NODE_REFERENCE(remote_node);
+
+			local_port->ep_props[ACPI_DEVICE_SWNODE_EP_REMOTE_EP] =
+				PROPERTY_ENTRY_REF_ARRAY("remote-endpoint",
+							 remote_port->remote_ep_ref);
+			local_port->ep_props[ACPI_DEVICE_SWNODE_EP_BUS_TYPE] =
+				PROPERTY_ENTRY_U32("bus-type", bus_type);
+			local_port->ep_props[ACPI_DEVICE_SWNODE_EP_REG] =
+				PROPERTY_ENTRY_U32("reg", 0);
+			local_port->port_props[ACPI_DEVICE_SWNODE_PRT_REG] =
+				PROPERTY_ENTRY_U32("reg", inst->csi2.local_port_instance);
+			if (GRAPH_PORT_NAME(local_port->port_name,
+					    inst->csi2.local_port_instance))
+				acpi_handle_warn(handle,
+						 "name for local port %u too long",
+						 inst->csi2.local_port_instance);
+
+			remote_port->ep_props[ACPI_DEVICE_SWNODE_EP_REMOTE_EP] =
+				PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", local_port->remote_ep_ref);
+			remote_port->ep_props[ACPI_DEVICE_SWNODE_EP_BUS_TYPE] =
+				PROPERTY_ENTRY_U32("bus-type", bus_type);
+			remote_port->ep_props[ACPI_DEVICE_SWNODE_EP_REG] =
+				PROPERTY_ENTRY_U32("reg", 0);
+			remote_port->port_props[ACPI_DEVICE_SWNODE_PRT_REG] =
+				PROPERTY_ENTRY_U32("reg",
+						   inst->csi2.resource_source.index);
+			if (GRAPH_PORT_NAME(remote_port->port_name,
+					    inst->csi2.resource_source.index))
+				acpi_handle_warn(handle,
+						 "name for remote port %u too long",
+						 inst->csi2.resource_source.index);
+		}
+	}
+
+out_free:
 	kfree(handle_refs);
 
 	crs_csi2_release(&crs_csi2_handles);
 }
+
+/*
+ * Get the index of the next property in the property array, with a given
+ * maximum values.
+ */
+#define NEXT_PROPERTY(index, max)				\
+	(WARN_ON(++(index) >= ACPI_DEVICE_SWNODE_##max) ?	\
+	 ACPI_DEVICE_SWNODE_##max : (index) - 1)
+
+static struct fwnode_handle *get_mipi_port_handle(struct acpi_device *device,
+						  unsigned int port)
+{
+	static const char mipi_port_prefix[] = "mipi-img-port-";
+	char mipi_port_name[sizeof(mipi_port_prefix) + 2];
+
+	if (snprintf(mipi_port_name, sizeof(mipi_port_name), "%s%u",
+		     mipi_port_prefix, port) >= sizeof(mipi_port_name)) {
+		acpi_handle_info(acpi_device_handle(device),
+				 "mipi port name too long for port %u\n", port);
+		return NULL;
+	}
+
+	return fwnode_get_named_child_node(acpi_fwnode_handle(device),
+					   mipi_port_name);
+}
+
+static void init_port_csi2_common(struct acpi_device *device,
+				  struct fwnode_handle *mipi_port_fwnode,
+				  unsigned int *ep_prop_index,
+				  unsigned int port_nr)
+{
+	unsigned int port_index = next_csi2_port_index(device->swnodes, port_nr);
+	struct acpi_device_software_nodes *ads = device->swnodes;
+	struct acpi_device_software_node_port *port = &ads->ports[port_index];
+	unsigned int num_lanes = 0;
+	union {
+		u32 val;
+		/* Data lanes + the clock lane */
+		u8 val8[BITS_TO_BYTES(ARRAY_SIZE(port->data_lanes) + 1)];
+	} u;
+	int ret;
+
+	*ep_prop_index = ACPI_DEVICE_SWNODE_EP_CLOCK_LANES;
+
+	if (GRAPH_PORT_NAME(port->port_name, port_nr))
+		return;
+
+	ads->nodes[ACPI_DEVICE_SWNODE_PRT(port_index)] =
+		SOFTWARE_NODE(port->port_name, port->port_props,
+			      &ads->nodes[ACPI_DEVICE_SWNODE_ROOT]);
+
+	ret = fwnode_property_read_u8(mipi_port_fwnode, "mipi-img-clock-lane", u.val8);
+	if (!ret) {
+		port->ep_props[NEXT_PROPERTY(*ep_prop_index, EP_CLOCK_LANES)] =
+			PROPERTY_ENTRY_U32("clock-lanes", *u.val8);
+	}
+	ret = fwnode_property_count_u8(mipi_port_fwnode, "mipi-img-data-lanes");
+	if (ret > 0) {
+		num_lanes = ret;
+
+		if (num_lanes > ARRAY_SIZE(port->data_lanes)) {
+			acpi_handle_warn(acpi_device_handle(device),
+					 "too many data lanes (%u)\n",
+					 num_lanes);
+			num_lanes = ARRAY_SIZE(port->data_lanes);
+		}
+
+		ret = fwnode_property_read_u8_array(mipi_port_fwnode, "mipi-img-data-lanes",
+						    u.val8, num_lanes);
+		if (!ret) {
+			unsigned int i;
+
+			for (i = 0; i < num_lanes; i++)
+				port->data_lanes[i] = u.val8[i];
+
+			port->ep_props[NEXT_PROPERTY(*ep_prop_index, EP_DATA_LANES)] =
+				PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", port->data_lanes,
+							     num_lanes);
+		}
+	}
+
+	ret = fwnode_property_count_u8(mipi_port_fwnode, "mipi-img-lane-polarities");
+	if (ret > 0) {
+		unsigned int bytes = min_t(unsigned int, ret, sizeof(u.val8));
+
+		fwnode_property_read_u8_array(mipi_port_fwnode,
+					      "mipi-img-lane-polarities",
+					      u.val8, bytes);
+
+		/* Total number of lanes here is clock lane + data lanes */
+		if (bytes * BITS_PER_TYPE(u8) >= 1 + num_lanes) {
+			unsigned int i;
+
+			/* Move polarity bits to the lane polarity u32 array */
+			for (i = 0; i < 1 + num_lanes; i++)
+				port->lane_polarities[i] =
+					(bool)(u.val8[i >> 3] & (1 << (i & 7)));
+
+			port->ep_props[NEXT_PROPERTY(*ep_prop_index, EP_LANE_POLARITIES)] =
+				PROPERTY_ENTRY_U32_ARRAY_LEN("lane-polarities",
+							     port->lane_polarities,
+							     1 + num_lanes);
+		} else {
+			acpi_handle_warn(acpi_device_handle(device),
+					 "too few lane polarity bytes (%u)\n",
+					 bytes);
+		}
+	}
+
+	ads->nodes[ACPI_DEVICE_SWNODE_EP(port_index)] =
+		SOFTWARE_NODE("endpoint@0", ads->ports[port_index].ep_props,
+			      &ads->nodes[ACPI_DEVICE_SWNODE_PRT(port_index)]);
+}
+
+static void init_port_csi2_local(struct acpi_device *device,
+				 unsigned int port_nr)
+{
+	unsigned int port_index = next_csi2_port_index(device->swnodes, port_nr);
+	struct fwnode_handle *mipi_port_fwnode =
+		get_mipi_port_handle(device, port_nr);
+	struct acpi_device_software_node_port *port =
+		&device->swnodes->ports[port_index];
+	unsigned int ep_prop_index;
+	int ret;
+
+	init_port_csi2_common(device, mipi_port_fwnode, &ep_prop_index, port_nr);
+
+	ret = fwnode_property_count_u64(mipi_port_fwnode, "mipi-img-link-frequencies");
+	if (ret > 0) {
+		unsigned int num_link_freqs = ret;
+
+		if (num_link_freqs > ARRAY_SIZE(port->link_frequencies)) {
+			acpi_handle_info(acpi_device_handle(device),
+					 "too many link frequencies %u\n",
+					 num_link_freqs);
+			num_link_freqs = ARRAY_SIZE(port->link_frequencies);
+		}
+
+		ret = fwnode_property_read_u64_array(mipi_port_fwnode,
+						     "mipi-img-link-frequencies",
+						     port->link_frequencies,
+						     num_link_freqs);
+		if (!ret)
+			port->ep_props[NEXT_PROPERTY(ep_prop_index, EP_LINK_FREQUENCIES)] =
+				PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies",
+							     port->link_frequencies,
+							     num_link_freqs);
+		else
+			acpi_handle_info(acpi_device_handle(device),
+					 "can't get link frequencies (%d)\n",
+					 ret);
+	}
+
+	fwnode_handle_put(mipi_port_fwnode);
+}
+
+static void init_port_csi2_remote(struct acpi_device *device,
+				  unsigned int port_nr)
+{
+	struct fwnode_handle *mipi_port_fwnode = get_mipi_port_handle(device, port_nr);
+	unsigned int ep_prop_index;
+
+	init_port_csi2_common(device, mipi_port_fwnode, &ep_prop_index, port_nr);
+
+	fwnode_handle_put(mipi_port_fwnode);
+}
+
+/**
+ * acpi_init_swnodes - Set up software nodes for properties gathered elsewhere
+ *
+ * @device: ACPI device for which the software nodes are initialised
+ *
+ * Initialise and register software nodes for properties for which the data is
+ * gathered elsewhere, e.g. _CRS CSI-2 descriptors. The process itself takes
+ * place before this function is called.
+ *
+ * acpi_scan_lock in scan.c must be held when calling this function.
+ */
+void acpi_init_swnodes(struct acpi_device *device)
+{
+	struct acpi_device_software_nodes *ads;
+	struct acpi_buffer buffer = { .length = ACPI_ALLOCATE_BUFFER };
+	struct fwnode_handle *primary;
+	unsigned int i;
+	int ret;
+
+	device->swnodes = ads = crs_csi2_swnode_get(device->handle);
+	if (!ads)
+		return;
+
+	if (ACPI_FAILURE(acpi_get_name(device->handle, ACPI_FULL_PATHNAME, &buffer))) {
+		acpi_handle_warn(acpi_device_handle(device), "cannot get path name\n");
+		return;
+	}
+
+	ads->nodes[ACPI_DEVICE_SWNODE_ROOT] =
+		SOFTWARE_NODE(buffer.pointer, ads->dev_props, NULL);
+
+	for (i = 0; i < ads->num_ports; i++) {
+		struct acpi_device_software_node_port *port = &ads->ports[i];
+
+		if (port->crs_csi2_local)
+			init_port_csi2_local(device, port->port_nr);
+		else
+			init_port_csi2_remote(device, port->port_nr);
+	}
+
+	ret = software_node_register_node_group(ads->nodeptrs);
+	if (ret < 0) {
+		acpi_handle_warn(acpi_device_handle(device),
+				 "cannot register software nodes (%d)!\n", ret);
+		device->swnodes = NULL;
+		return;
+	}
+
+	/*
+	 * Note we can't use set_secondary_fwnode() here as the device's
+	 * primary fwnode hasn't been set yet.
+	 */
+	primary = acpi_fwnode_handle(device);
+	primary->secondary = software_node_fwnode(ads->nodes);
+}
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 50de874b8f208..9cc30c9c87080 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -449,10 +449,28 @@ static void acpi_free_power_resources_lists(struct acpi_device *device)
 	}
 }
 
+static void acpi_free_swnodes(struct acpi_device *device)
+{
+	struct acpi_device_software_nodes *ads = device->swnodes;
+	struct fwnode_handle *primary;
+
+	if (!ads)
+		return;
+
+	software_node_unregister_node_group(ads->nodeptrs);
+	primary = acpi_fwnode_handle(device);
+	primary->secondary = NULL;
+	kfree(ads->nodes[ACPI_DEVICE_SWNODE_ROOT].name);
+	kfree(ads);
+
+	device->swnodes = NULL;
+}
+
 static void acpi_device_release(struct device *dev)
 {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 
+	acpi_free_swnodes(acpi_dev);
 	acpi_free_properties(acpi_dev);
 	acpi_free_pnp_ids(&acpi_dev->pnp);
 	acpi_free_power_resources_lists(acpi_dev);
@@ -1771,6 +1789,7 @@ void acpi_init_device_object(struct acpi_device *device, acpi_handle handle,
 	acpi_device_get_busid(device);
 	acpi_set_pnp_ids(handle, &device->pnp, type);
 	acpi_init_properties(device);
+	acpi_init_swnodes(device);
 	acpi_bus_get_flags(device);
 	device->flags.match_driver = false;
 	device->flags.initialized = true;
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index a05fe22c1175c..9a7729e96d14c 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -360,8 +360,54 @@ struct acpi_device_data {
 
 struct acpi_gpio_mapping;
 
+enum acpi_device_swnode_dev_props {
+	ACPI_DEVICE_SWNODE_DEV_NUM_OF,
+	ACPI_DEVICE_SWNODE_DEV_NUM_ENTRIES
+};
+
+enum acpi_device_swnode_port_props {
+	ACPI_DEVICE_SWNODE_PRT_REG,
+	ACPI_DEVICE_SWNODE_PRT_NUM_OF,
+	ACPI_DEVICE_SWNODE_PRT_NUM_ENTRIES
+};
+
+enum acpi_device_swnode_ep_props {
+	ACPI_DEVICE_SWNODE_EP_REMOTE_EP,
+	ACPI_DEVICE_SWNODE_EP_BUS_TYPE,
+	ACPI_DEVICE_SWNODE_EP_REG,
+	ACPI_DEVICE_SWNODE_EP_CLOCK_LANES,
+	ACPI_DEVICE_SWNODE_EP_DATA_LANES,
+	ACPI_DEVICE_SWNODE_EP_LANE_POLARITIES,
+	/* TX only */
+	ACPI_DEVICE_SWNODE_EP_LINK_FREQUENCIES,
+	ACPI_DEVICE_SWNODE_EP_NUM_OF,
+	ACPI_DEVICE_SWNODE_EP_NUM_ENTRIES
+};
+
+#define ACPI_DEVICE_SWNODE_ROOT			0
+/*
+ * Each device has a root swnode plus two times as many nodes as the
+ * number of CSI-2 ports.
+ */
+#define ACPI_DEVICE_SWNODE_PRT(port)		(1 + 2 * (port))
+#define ACPI_DEVICE_SWNODE_EP(endpoint)	\
+	(ACPI_DEVICE_SWNODE_PRT(endpoint) + 1)
+
+#define ACPI_DEVICE_SWNODE_CSI2_DATA_LANES		4
+
 struct acpi_device_software_node_port {
+	char port_name[8];
+	u32 data_lanes[ACPI_DEVICE_SWNODE_CSI2_DATA_LANES];
+	u32 lane_polarities[1 /* clock lane */ +
+			    ACPI_DEVICE_SWNODE_CSI2_DATA_LANES];
+	u64 link_frequencies[4];
 	unsigned int port_nr;
+	bool crs_csi2_local;
+
+	struct property_entry port_props[ACPI_DEVICE_SWNODE_PRT_NUM_ENTRIES];
+	struct property_entry ep_props[ACPI_DEVICE_SWNODE_EP_NUM_ENTRIES];
+
+	struct software_node_ref_args remote_ep_ref[1];
 };
 
 struct acpi_device_software_nodes {
@@ -369,6 +415,8 @@ struct acpi_device_software_nodes {
 	struct software_node *nodes;
 	const struct software_node **nodeptrs;
 	unsigned int num_ports;
+
+	struct property_entry dev_props[ACPI_DEVICE_SWNODE_DEV_NUM_ENTRIES];
 };
 
 /* Device */
@@ -377,6 +425,7 @@ struct acpi_device {
 	int device_type;
 	acpi_handle handle;		/* no handle for fixed hardware */
 	struct fwnode_handle fwnode;
+	struct acpi_device_software_nodes *swnodes;
 	struct list_head wakeup_list;
 	struct list_head del_list;
 	struct acpi_device_status status;
-- 
2.30.2

