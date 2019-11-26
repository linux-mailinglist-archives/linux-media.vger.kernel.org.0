Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8506E109D91
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 13:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbfKZMKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 07:10:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49552 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbfKZMKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 07:10:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D7C63283C6B
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 1/3] media: vimc: Add the implementation for the configfs api
Date:   Tue, 26 Nov 2019 13:10:18 +0100
Message-Id: <20191126121020.11597-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126121020.11597-1-dafna.hirschfeld@collabora.com>
References: <20191126121020.11597-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the code that implements the usage of configfs in order
to create and configure a device topology from userspace.
The code is only added in this patch but is not used.
It will be used in next patch in the series.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
[refactored for upstream]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/Kconfig         |   2 +-
 drivers/media/platform/vimc/Makefile        |   2 +-
 drivers/media/platform/vimc/vimc-capture.c  |  21 +
 drivers/media/platform/vimc/vimc-common.h   |  64 ++
 drivers/media/platform/vimc/vimc-configfs.c | 720 ++++++++++++++++++++
 drivers/media/platform/vimc/vimc-configfs.h |  41 ++
 drivers/media/platform/vimc/vimc-debayer.c  |  22 +
 drivers/media/platform/vimc/vimc-scaler.c   |  22 +
 drivers/media/platform/vimc/vimc-sensor.c   |  21 +
 9 files changed, 913 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/vimc/vimc-configfs.c
 create mode 100644 drivers/media/platform/vimc/vimc-configfs.h

diff --git a/drivers/media/platform/vimc/Kconfig b/drivers/media/platform/vimc/Kconfig
index bd221d3e1a4a..6e292f19e859 100644
--- a/drivers/media/platform/vimc/Kconfig
+++ b/drivers/media/platform/vimc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_VIMC
 	tristate "Virtual Media Controller Driver (VIMC)"
-	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && CONFIGFS_FS
 	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_TPG
 	help
diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
index a53b2b532e9f..eb03d487f308 100644
--- a/drivers/media/platform/vimc/Makefile
+++ b/drivers/media/platform/vimc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
-		vimc-debayer.o vimc-scaler.o vimc-sensor.o
+		vimc-debayer.o vimc-scaler.o vimc-sensor.o  vimc-configfs.o
 
 obj-$(CONFIG_VIDEO_VIMC) += vimc.o
 
diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index c5a645f98c66..ab9d9d93b241 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -9,6 +9,7 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
+#include "vimc-configfs.h"
 #include "vimc-common.h"
 #include "vimc-streamer.h"
 
@@ -478,3 +479,23 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	return NULL;
 }
+
+static void vimc_cap_create_cfs_pads(struct config_group *ent_group)
+{
+	vimc_cfs_add_sink_pad(ent_group, 0, VIMC_CFS_SINK_PAD_NUM(0));
+}
+
+struct vimc_cfs_ent_type vimc_cap_cfs_ent_type = {
+	.name = VIMC_CAP_NAME,
+	.create_pads = vimc_cap_create_cfs_pads,
+};
+
+void vimc_cap_exit(void)
+{
+	vimc_cfs_ent_type_unregister(&vimc_cap_cfs_ent_type);
+}
+
+void vimc_cap_init(void)
+{
+	vimc_cfs_ent_type_register(&vimc_cap_cfs_ent_type);
+}
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 99beb2134d40..228f1354d766 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -14,6 +14,7 @@
 #include <media/v4l2-device.h>
 
 #define VIMC_PDEV_NAME "vimc"
+#define VIMC_MAX_NAME_LEN V4L2_SUBDEV_NAME_SIZE
 
 /* VIMC-specific controls */
 #define VIMC_CID_VIMC_BASE		(0x00f00000 | 0xf000)
@@ -32,6 +33,11 @@
 #define VIMC_IS_SRC(pad)	(pad)
 #define VIMC_IS_SINK(pad)	(!(pad))
 
+#define VIMC_DEB_NAME "vimc-debayer"
+#define VIMC_SEN_NAME "vimc-sensor"
+#define VIMC_SCA_NAME "vimc-scaler"
+#define VIMC_CAP_NAME "vimc-capture"
+
 /**
  * struct vimc_colorimetry_clamp - Adjust colorimetry parameters
  *
@@ -58,6 +64,20 @@ do {									\
 		(fmt)->xfer_func = V4L2_XFER_FUNC_DEFAULT;		\
 } while (0)
 
+/**
+ * struct vimc_platform_data - platform data to the core
+ *
+ * @topology_mutex: mutex to sync the access to the topology
+ * @ents: list of vimc_entity_data objects allocated by the configfs
+ * @links: list of vimc_link_data objects allocated by the configfs
+ *
+ */
+struct vimc_platform_data {
+	struct mutex topology_mutex;
+	struct list_head ents;
+	struct list_head links;
+};
+
 /**
  * struct vimc_pix_map - maps media bus code with v4l2 pixel format
  *
@@ -75,6 +95,42 @@ struct vimc_pix_map {
 	bool bayer;
 };
 
+/**
+ * struct vimc_entity_data - a struct contating data about the entity
+ *			     the data is given from userspace using configfs
+ *
+ * @name:	the name of the entity
+ * @type_name:	the type of the entity
+ * @entry:	the entry in the list 'ents' in the vimc_platform_data
+ *
+ */
+struct vimc_entity_data {
+	char name[VIMC_MAX_NAME_LEN];
+	const char *type_name;
+	struct list_head entry;
+};
+
+/**
+ * struct vimc_link_data - a struct containing data about the link
+ *			   the data is given from userspace using configfs
+ *
+ * @source:		the source of the link
+ * @sink:		the sink of the link
+ * @source_pad:		the source pad of the link
+ * @sink_pad:		the sink pad of the link
+ * @flags:		the flags of the link
+ * @entry:		the entry in the list 'links' in the vimc_platform_data
+ *
+ */
+struct vimc_link_data {
+	struct vimc_entity_data *source;
+	struct vimc_entity_data *sink;
+	u16 source_pad;
+	u16 sink_pad;
+	u32 flags;
+	struct list_head entry;
+};
+
 /**
  * struct vimc_ent_device - core struct that represents an entity in the
  * topology
@@ -152,21 +208,29 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
 void vimc_cap_unregister(struct vimc_ent_device *ved);
 void vimc_cap_release(struct vimc_ent_device *ved);
+void vimc_cap_init(void);
+void vimc_cap_exit(void);
 
 struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
 void vimc_deb_unregister(struct vimc_ent_device *ved);
 void vimc_deb_release(struct vimc_ent_device *ved);
+void vimc_deb_init(void);
+void vimc_deb_exit(void);
 
 struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
 void vimc_sca_unregister(struct vimc_ent_device *ved);
 void vimc_sca_release(struct vimc_ent_device *ved);
+void vimc_sca_init(void);
+void vimc_sca_exit(void);
 
 struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
 void vimc_sen_unregister(struct vimc_ent_device *ved);
 void vimc_sen_release(struct vimc_ent_device *ved);
+void vimc_sen_init(void);
+void vimc_sen_exit(void);
 
 /**
  * vimc_pix_map_by_index - get vimc_pix_map struct by its index
diff --git a/drivers/media/platform/vimc/vimc-configfs.c b/drivers/media/platform/vimc/vimc-configfs.c
new file mode 100644
index 000000000000..81e6be5b30c5
--- /dev/null
+++ b/drivers/media/platform/vimc/vimc-configfs.c
@@ -0,0 +1,720 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * vimc-configfs.c Virtual Media Controller Driver
+ *
+ * Copyright (C) 2018 Helen Koike <helen.koike@collabora.com>
+ */
+
+#include <linux/platform_device.h>
+
+#include "vimc-common.h"
+#include "vimc-configfs.h"
+
+#define CHAR_SEPARATOR ':'
+#define CFS_SUBSYS_NAME "vimc"
+#define MAX_PAD_DIGI_NUM 4
+
+#define ci_err(ci, fmt, ...) \
+	pr_err("vimc: %s: " pr_fmt(fmt), (ci)->ci_name, ##__VA_ARGS__)
+#define cg_err(cg, ...) ci_err(&(cg)->cg_item, ##__VA_ARGS__)
+#define ci_warn(ci, fmt, ...) \
+	pr_warn("vimc: %s: " pr_fmt(fmt), (ci)->ci_name, ##__VA_ARGS__)
+#define cg_warn(cg, ...) ci_warn(&(cg)->cg_item, ##__VA_ARGS__)
+#define ci_dbg(ci, fmt, ...)					\
+	pr_debug("vimc: %s: %s:" pr_fmt(fmt), (ci)->ci_name,	\
+	__func__, ##__VA_ARGS__)
+#define cg_dbg(cg, ...) ci_dbg(&(cg)->cg_item, ##__VA_ARGS__)
+
+#define IS_PLUGGED(cfs) (!!(cfs)->pdev)
+#define VIMC_MAX_CFS_NAME_LEN (VIMC_MAX_NAME_LEN * 2 + 1)
+
+/*
+ * currently there is no entity with more than two pads, this will
+ * change when adding the splitter entity
+ */
+#define VIMC_ENT_MAX_PADS 2
+
+enum vimc_cfs_hotplug_state {
+	VIMC_CFS_HOTPLUG_STATE_UNPLUGGED = 0,
+	VIMC_CFS_HOTPLUG_STATE_PLUGGED = 1,
+};
+
+const static char *vimc_cfs_hotplug_values[2][3] = {
+	[VIMC_CFS_HOTPLUG_STATE_UNPLUGGED] = {"unplugged\n", "unplug\n", "0\n"},
+	[VIMC_CFS_HOTPLUG_STATE_PLUGGED] = {"plugged\n", "plug\n", "1\n"},
+};
+
+static void vimc_cfs_subsys_drop_dev_item(struct config_group *group,
+					  struct config_item *item);
+static struct config_group *vimc_cfs_subsys_make_dev_group(
+		struct config_group *group, const char *name);
+
+static struct configfs_group_operations vimc_cfs_subsys_group_ops = {
+	.make_group	= vimc_cfs_subsys_make_dev_group,
+	.drop_item	= vimc_cfs_subsys_drop_dev_item,
+};
+
+static struct config_item_type vimc_cfs_subsys_type = {
+	.ct_group_ops = &vimc_cfs_subsys_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct vimc_cfs_subsystem {
+	struct configfs_subsystem subsys;
+	struct list_head ent_types;
+} vimc_cfs_subsys = {
+	.subsys = {
+		.su_group = {
+			.cg_item = {
+				.ci_namebuf = CFS_SUBSYS_NAME,
+				.ci_type = &vimc_cfs_subsys_type,
+			},
+		},
+		.su_mutex = __MUTEX_INITIALIZER(vimc_cfs_subsys.subsys.su_mutex),
+	},
+	.ent_types = LIST_HEAD_INIT(vimc_cfs_subsys.ent_types),
+};
+
+/* Structure of a vimc device in configfs */
+struct vimc_cfs_device {
+	struct mutex pdev_mutex;
+	struct platform_device *pdev;
+	struct vimc_platform_data pdata;
+	struct config_group gdev;
+};
+
+/* Structure of for entity in configfs */
+struct vimc_cfs_ent {
+	struct vimc_entity_data ent;
+	struct config_group cg;
+	struct config_group pad_groups[VIMC_ENT_MAX_PADS];
+};
+
+/* Structure for link in configfs */
+struct vimc_cfs_link {
+	struct vimc_link_data link;
+	struct config_item ci;
+};
+
+void vimc_cfs_ent_type_register(struct vimc_cfs_ent_type *c_ent_type)
+{
+	pr_debug("%s: adding entity type %s\n", __func__, c_ent_type->name);
+	list_add(&c_ent_type->entry, &vimc_cfs_subsys.ent_types);
+}
+
+void vimc_cfs_ent_type_unregister(struct vimc_cfs_ent_type *c_ent_type)
+{
+	pr_debug("%s: removing entity type %s\n", __func__, c_ent_type->name);
+	list_del(&c_ent_type->entry);
+}
+
+/* --------------------------------------------------------------------------
+ * Platform Device builders
+ */
+
+static void vimc_cfs_device_unplug(struct vimc_cfs_device *cfs)
+{
+	mutex_lock(&cfs->pdev_mutex);
+	if (!IS_PLUGGED(cfs)) {
+		mutex_unlock(&cfs->pdev_mutex);
+		return;
+	}
+	dev_dbg(&cfs->pdev->dev, "Unplugging device\n");
+	platform_device_unregister(cfs->pdev);
+
+	cfs->pdev = NULL;
+	mutex_unlock(&cfs->pdev_mutex);
+}
+
+static void vimc_cfs_platform_dev_release(struct device *dev)
+{
+}
+
+static int vimc_cfs_device_plug(struct vimc_cfs_device *cfs)
+{
+	int ret;
+
+	cg_dbg(&cfs->gdev, "Plugging device\n");
+
+	mutex_lock(&cfs->pdata.topology_mutex);
+	if (list_empty(&cfs->pdata.ents)) {
+		cg_warn(&cfs->gdev,
+			"At least one entity is required to plug the device\n");
+		mutex_unlock(&cfs->pdata.topology_mutex);
+		return -EINVAL;
+	}
+	mutex_unlock(&cfs->pdata.topology_mutex);
+
+	mutex_lock(&cfs->pdev_mutex);
+	if (IS_PLUGGED(cfs)) {
+		mutex_unlock(&cfs->pdev_mutex);
+		return 0;
+	}
+
+	cfs->pdev = kzalloc(sizeof(*cfs->pdev), GFP_KERNEL);
+
+	if (!cfs->pdev) {
+		mutex_unlock(&cfs->pdev_mutex);
+		return -ENOMEM;
+	}
+
+	cfs->pdev->name = "vimc-core";
+	cfs->pdev->id = PLATFORM_DEVID_AUTO;
+	cfs->pdev->dev.platform_data = &cfs->pdata;
+	cfs->pdev->dev.release = vimc_cfs_platform_dev_release;
+
+	ret =  platform_device_register(cfs->pdev);
+	if (ret) {
+		kfree(cfs->pdev);
+		cfs->pdev = NULL;
+		mutex_unlock(&cfs->pdev_mutex);
+		return ret;
+	}
+	mutex_unlock(&cfs->pdev_mutex);
+
+	return 0;
+}
+
+/* --------------------------------------------------------------------------
+ * Links
+ */
+
+/*
+ * return true if 'buf' contains the string 'str' as is or followed by newline
+ */
+static bool buf_contains(const char *buf, const char *str)
+{
+	size_t strln;
+
+	if (!strstarts(buf, str))
+		return false;
+	strln = strlen(str);
+	if (buf[strln] == '\0')
+		return true;
+	if (buf[strln] == '\n' && buf[strln + 1] == '\0')
+		return true;
+	return false;
+}
+
+static ssize_t vimc_cfs_link_type_store(struct config_item *item,
+					   const char *buf,
+					   size_t size)
+{
+	struct vimc_cfs_link *c_link =
+		container_of(item, struct vimc_cfs_link, ci);
+
+	ci_dbg(item, "buf = '%s'\n", buf);
+	if (buf_contains(buf, "disabled") || buf_contains(buf, "off")) {
+		c_link->link.flags &= ~MEDIA_LNK_FL_IMMUTABLE;
+		c_link->link.flags &= ~MEDIA_LNK_FL_ENABLED;
+	} else if (buf_contains(buf, "enabled") || buf_contains(buf, "on")) {
+		c_link->link.flags &= ~MEDIA_LNK_FL_IMMUTABLE;
+		c_link->link.flags |= MEDIA_LNK_FL_ENABLED;
+	} else if (buf_contains(buf, "immutable")) {
+		c_link->link.flags |= MEDIA_LNK_FL_IMMUTABLE;
+		c_link->link.flags |= MEDIA_LNK_FL_ENABLED;
+	} else {
+		ci_err(item, "'%s' is an invalid value, see vimc doc for valid values",
+		       buf);
+		return -EINVAL;
+	}
+	return strlen(buf);
+}
+
+
+static ssize_t vimc_cfs_link_type_show(struct config_item *item,
+					  char *buf)
+{
+	struct vimc_cfs_link *c_link =
+		container_of(item, struct vimc_cfs_link, ci);
+
+	if (c_link->link.flags & MEDIA_LNK_FL_IMMUTABLE)
+		strcpy(buf, "immutable\n");
+	else if (c_link->link.flags & MEDIA_LNK_FL_ENABLED)
+		strcpy(buf, "enabled\n");
+	else
+		strcpy(buf, "disabled\n");
+	return strlen(buf);
+}
+
+CONFIGFS_ATTR(vimc_cfs_link_, type);
+
+/*
+ * add the link to the list of links
+ * this function assumes src and target are valid and that the su_mutex
+ * is locked
+ */
+static int vimc_cfs_adding_link(struct config_item *src,
+				struct config_item *target)
+{
+	struct config_item *src_ent_ci = src->ci_parent;
+	struct config_item *trgt_ent_ci = target->ci_parent->ci_parent;
+	struct vimc_cfs_link *c_link =
+		container_of(target, struct vimc_cfs_link, ci);
+	struct vimc_cfs_ent *vimc_src_ent =
+		container_of(src_ent_ci, struct vimc_cfs_ent, cg.cg_item);
+	struct vimc_cfs_ent *vimc_trgt_ent =
+		container_of(trgt_ent_ci, struct vimc_cfs_ent, cg.cg_item);
+	struct vimc_cfs_device *cfs =
+		container_of(src_ent_ci->ci_parent, struct vimc_cfs_device,
+			     gdev.cg_item);
+
+	mutex_lock(&cfs->pdata.topology_mutex);
+	if (c_link->link.source) {
+		ci_warn(src, "the sink target %s is already linked\n",
+				target->ci_name);
+		mutex_unlock(&cfs->pdata.topology_mutex);
+		return -EINVAL;
+	}
+
+	/* src and target validation already done in the allow_link callback,
+	 * so there is no need to check sscanf result
+	 */
+	sscanf(src->ci_name, VIMC_CFS_SRC_PAD "%hu",
+	       &c_link->link.source_pad);
+	sscanf(target->ci_parent->ci_name, VIMC_CFS_SINK_PAD "%hu",
+	       &c_link->link.sink_pad);
+
+	c_link->link.source = &vimc_src_ent->ent;
+	c_link->link.sink = &vimc_trgt_ent->ent;
+
+	cg_dbg(&cfs->gdev, "creating link %s:%u->%s:%u\n",
+	       c_link->link.source->name, c_link->link.source_pad,
+	       c_link->link.sink->name, c_link->link.sink_pad);
+
+	list_add(&c_link->link.entry, &cfs->pdata.links);
+	mutex_unlock(&cfs->pdata.topology_mutex);
+	return 0;
+}
+
+static void vimc_cfs_drop_link(struct config_item *src,
+			       struct config_item *target)
+{
+	struct vimc_cfs_link *c_link =
+		container_of(target, struct vimc_cfs_link, ci);
+	struct config_item *src_ent_ci = src->ci_parent;
+	struct vimc_cfs_device *cfs =
+		container_of(src_ent_ci->ci_parent, struct vimc_cfs_device,
+			     gdev.cg_item);
+
+	mutex_lock(&cfs->pdata.topology_mutex);
+	ci_dbg(&c_link->ci, "dropping link %s:%u->%s:%u\n",
+	       c_link->link.source->name, c_link->link.source_pad,
+	       c_link->link.sink->name, c_link->link.sink_pad);
+
+	c_link->link.source_pad = 0;
+	c_link->link.sink_pad = 0;
+	c_link->link.source = NULL;
+	c_link->link.sink = NULL;
+	list_del(&c_link->link.entry);
+	mutex_unlock(&cfs->pdata.topology_mutex);
+}
+
+static int vimc_cfs_allow_link(struct config_item *src,
+			       struct config_item *target)
+{
+	struct config_item *src_vimc_dev;
+	struct config_item *target_vimc_dev;
+	struct config_item *tmp;
+	struct config_item *src_ent_ci, *trgt_ent_ci;
+	int target_depth = 0, ret = 0;
+
+
+	mutex_lock(&vimc_cfs_subsys.subsys.su_mutex);
+
+	/* the allow_link callback exists only for dirs of the form
+	 * $CONFIGFS/vimc/<dev>/vimc-<type>:<name>/source:<pad>/
+	 * therefore, we can be sure that parent and grandparent are non NULL
+	 * and that grandparent is the vimc device
+	 */
+	src_vimc_dev = src->ci_parent->ci_parent;
+
+
+	/* the target must be of the form:
+	 * $CONFIGFS/vimc/<dev>/vimc-<type>:<name>/sink:<pad>/<link-name>
+	 * so we should make sure that it's depth is exactly 5
+	 */
+	for (tmp = target->ci_parent; tmp; tmp = tmp->ci_parent)
+		target_depth++;
+
+	if (target_depth != 5) {
+		ci_warn(src, "link target (%s) is not a sink pad\n",
+			target->ci_name);
+		ret = -EINVAL;
+		goto end;
+	}
+
+	target_vimc_dev = target->ci_parent->ci_parent->ci_parent;
+	if (src_vimc_dev != target_vimc_dev) {
+		ci_warn(src, "linking between different vimc devices: (%s), (%s) is not allowed\n",
+			src_vimc_dev->ci_name, target_vimc_dev->ci_name);
+		ret = -EINVAL;
+		goto end;
+	}
+
+	src_ent_ci = src->ci_parent;
+	trgt_ent_ci = target->ci_parent->ci_parent;
+	if (src_ent_ci == trgt_ent_ci) {
+		ci_warn(src, "a link from an entity (%s) to itself is not allowed\n",
+			src_ent_ci->ci_name);
+		ret = -EINVAL;
+		goto end;
+	}
+	ret = vimc_cfs_adding_link(src, target);
+end:
+	mutex_unlock(&vimc_cfs_subsys.subsys.su_mutex);
+	return ret;
+}
+
+static void vimc_cfs_link_target_release(struct config_item *item)
+{
+	struct vimc_cfs_link *c_link =
+		container_of(item, struct vimc_cfs_link, ci);
+
+	ci_dbg(item, "releasing link target '%s'", item->ci_name);
+	kfree(c_link);
+}
+
+static struct configfs_attribute *vimc_cfs_link_attrs[] = {
+	&vimc_cfs_link_attr_type,
+	NULL,
+};
+
+static struct configfs_item_operations vimc_cfs_link_target_ops = {
+	.release	= vimc_cfs_link_target_release,
+};
+
+
+static struct config_item_type vimc_cfs_link_target_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_attrs = vimc_cfs_link_attrs,
+	.ct_item_ops = &vimc_cfs_link_target_ops,
+};
+
+/* --------------------------------------------------------------------------
+ * Source pad instance
+ */
+
+static void vimc_cfs_sink_pad_link_target_drop_item(
+		struct config_group *sink_pad_group,
+		struct config_item *c_link)
+{
+
+	struct config_item *cfs_item;
+	struct vimc_cfs_device *cfs;
+	/*
+	 * from the configfs doc:
+	 * A config_group cannot be removed while it still has child items.
+	 *
+	 * Therefore it is safe to reference sink_pad_group.cg_item.ci_parent.
+	 */
+	cfs_item = sink_pad_group->cg_item.ci_parent->ci_parent;
+	cfs = container_of(cfs_item, struct vimc_cfs_device, gdev.cg_item);
+	cg_dbg(&cfs->gdev, "dropping link target '%s' cfs=%p\n",
+	       c_link->ci_name, cfs);
+	config_item_put(c_link);
+}
+
+static struct config_item *vimc_cfs_sink_pad_link_target_make_item(
+			   struct config_group *group,
+			   const char *name)
+{
+	struct vimc_cfs_link *c_link = kzalloc(sizeof(*c_link), GFP_KERNEL);
+
+	if (!c_link)
+		return ERR_PTR(-ENOMEM);
+
+	cg_dbg(group, "link target name is '%s'\n", name);
+	config_item_init_type_name(&c_link->ci, name,
+				   &vimc_cfs_link_target_type);
+	return &c_link->ci;
+}
+
+static struct configfs_group_operations vimc_cfs_sink_pad_ops = {
+	.make_item = vimc_cfs_sink_pad_link_target_make_item,
+	.drop_item = vimc_cfs_sink_pad_link_target_drop_item,
+};
+
+static struct configfs_item_operations vimc_cfs_src_pad_ops = {
+	.allow_link = vimc_cfs_allow_link,
+	.drop_link = vimc_cfs_drop_link,
+};
+
+
+static struct config_item_type vimc_cfs_src_pad_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_item_ops = &vimc_cfs_src_pad_ops,
+};
+
+static struct config_item_type vimc_cfs_sink_pad_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_group_ops = &vimc_cfs_sink_pad_ops,
+};
+
+
+/* --------------------------------------------------------------------------
+ * Device instance
+ */
+
+static void vimc_cfs_ent_release(struct config_item *item)
+{
+	struct vimc_cfs_ent *c_ent =
+		container_of(item, struct vimc_cfs_ent, cg.cg_item);
+
+	ci_dbg(item, "releasing entity '%s' of type '%s'",
+	       c_ent->ent.name, c_ent->ent.type_name);
+	kfree(c_ent);
+}
+
+static struct configfs_item_operations vimc_cfs_ent_item_ops = {
+	.release	= vimc_cfs_ent_release,
+};
+
+static struct config_item_type vimc_cfs_ent_type = {
+	.ct_owner = THIS_MODULE,
+	.ct_item_ops = &vimc_cfs_ent_item_ops,
+};
+
+void vimc_cfs_add_sink_pad(struct config_group *ent_group,
+					int pad_idx, const char *name)
+{
+	struct vimc_cfs_ent *c_ent =
+		container_of(ent_group, struct vimc_cfs_ent, cg);
+
+	config_group_init_type_name(&c_ent->pad_groups[pad_idx], name,
+				    &vimc_cfs_sink_pad_type);
+	configfs_add_default_group(&c_ent->pad_groups[pad_idx], ent_group);
+}
+
+
+void vimc_cfs_add_source_pad(struct config_group *ent_group,
+					  int pad_idx, const char *name)
+{
+	struct vimc_cfs_ent *c_ent =
+		container_of(ent_group, struct vimc_cfs_ent, cg);
+
+	config_group_init_type_name(&c_ent->pad_groups[pad_idx], name,
+				    &vimc_cfs_src_pad_type);
+	configfs_add_default_group(&c_ent->pad_groups[pad_idx], ent_group);
+}
+
+static void vimc_cfs_dev_drop_ent_item(struct config_group *dev_group,
+				       struct config_item *ent_item)
+{
+	struct vimc_cfs_ent *c_ent =
+		container_of(ent_item, struct vimc_cfs_ent, cg.cg_item);
+	struct vimc_cfs_device *cfs =
+		container_of(dev_group, struct vimc_cfs_device, gdev);
+
+	cg_dbg(&cfs->gdev, "dropping entity '%s' of type '%s'",
+	       c_ent->ent.name, c_ent->ent.type_name);
+	mutex_lock(&cfs->pdata.topology_mutex);
+	list_del(&c_ent->ent.entry);
+	mutex_unlock(&cfs->pdata.topology_mutex);
+	config_item_put(ent_item);
+}
+
+static struct config_group *vimc_cfs_dev_make_ent_group(
+			struct config_group *group, const char *name)
+{
+	struct vimc_cfs_device *cfs =
+		container_of(group, struct vimc_cfs_device, gdev);
+	char *type_name, *ent_name, *sep;
+	struct vimc_cfs_ent *c_ent;
+	struct vimc_entity_data *ent;
+	struct vimc_cfs_ent_type *c_ent_type = NULL;
+	struct vimc_cfs_ent_type *found_ent_type = NULL;
+	char buf[VIMC_MAX_CFS_NAME_LEN];
+
+	cg_dbg(group, "trying to make entity '%s'\n", name);
+	if (snprintf(buf, VIMC_MAX_CFS_NAME_LEN, "%s", name) >= sizeof(buf))
+		return ERR_PTR(-ENAMETOOLONG);
+
+	/* Parse format "type_name:ent_name" */
+	sep = strchr(buf, CHAR_SEPARATOR);
+	if (!sep) {
+		cg_warn(&cfs->gdev,
+			"Could not find separator '%c'\n", CHAR_SEPARATOR);
+		goto syntax_error;
+	}
+	*sep = '\0';
+
+	ent_name = &sep[1];
+	type_name = buf;
+
+	if (!*ent_name || sep == type_name) {
+		cg_warn(&cfs->gdev,
+			"%s: Driver name and entity name can't be empty.\n",
+			name);
+		goto syntax_error;
+	}
+	if (strlen(ent_name) >= VIMC_MAX_NAME_LEN) {
+		cg_err(&cfs->gdev,
+		       "%s: Driver name length should be less than %u.\n",
+		       name, VIMC_MAX_NAME_LEN);
+		goto syntax_error;
+	}
+	mutex_lock(&cfs->pdata.topology_mutex);
+	list_for_each_entry(ent, &cfs->pdata.ents, entry) {
+		if (!strncmp(ent->name, ent_name, sizeof(ent->name))) {
+			cg_err(&cfs->gdev, "entity `%s` already exist\n",
+			       ent->name);
+			mutex_unlock(&cfs->pdata.topology_mutex);
+			goto syntax_error;
+		}
+	}
+
+	c_ent = kzalloc(sizeof(*c_ent), GFP_KERNEL);
+	if (!c_ent) {
+		mutex_unlock(&cfs->pdata.topology_mutex);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	strscpy(c_ent->ent.name, ent_name, sizeof(c_ent->ent.name));
+
+	list_for_each_entry(c_ent_type, &vimc_cfs_subsys.ent_types, entry) {
+		if (!strcmp(type_name, c_ent_type->name)) {
+			found_ent_type = c_ent_type;
+			break;
+		}
+	}
+	if (!found_ent_type) {
+		mutex_unlock(&cfs->pdata.topology_mutex);
+		cg_warn(&cfs->gdev, "entity type '%s' not found\n", type_name);
+		kfree(c_ent);
+		return ERR_PTR(-EINVAL);
+	}
+	config_group_init_type_name(&c_ent->cg, ent_name,
+				    &vimc_cfs_ent_type);
+	if (found_ent_type->create_pads)
+		found_ent_type->create_pads(&c_ent->cg);
+	c_ent->ent.type_name = found_ent_type->name;
+	list_add(&c_ent->ent.entry, &cfs->pdata.ents);
+	mutex_unlock(&cfs->pdata.topology_mutex);
+	return &c_ent->cg;
+
+syntax_error:
+	cg_err(&cfs->gdev,
+	       "couldn't create entity '%s' wrong syntax.", name);
+	return ERR_PTR(-EINVAL);
+}
+
+static int vimc_cfs_decode_state(const char *buf, size_t size)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(vimc_cfs_hotplug_values); i++)
+		for (j = 0; j < ARRAY_SIZE(vimc_cfs_hotplug_values[0]); j++)
+			if (!strncmp(buf, vimc_cfs_hotplug_values[i][j], size))
+				return i;
+	return -EINVAL;
+}
+
+static ssize_t vimc_cfs_dev_hotplug_show(struct config_item *item,
+					 char *buf)
+{
+	struct vimc_cfs_device *cfs =
+		container_of(item, struct vimc_cfs_device, gdev.cg_item);
+
+	cg_dbg(&cfs->gdev, "%s: cfs=%p\n", __func__, cfs);
+	strcpy(buf, vimc_cfs_hotplug_values[IS_PLUGGED(cfs)][0]);
+	return strlen(buf);
+}
+
+static ssize_t vimc_cfs_dev_hotplug_store(struct config_item *item,
+					  const char *buf, size_t size)
+{
+	struct vimc_cfs_device *cfs =
+		container_of(item, struct vimc_cfs_device, gdev.cg_item);
+	int state = vimc_cfs_decode_state(buf, size);
+
+	cg_dbg(&cfs->gdev, "%s: cfs=%p\n", __func__, cfs);
+	if (state == VIMC_CFS_HOTPLUG_STATE_UNPLUGGED) {
+		vimc_cfs_device_unplug(cfs);
+	} else if (state == VIMC_CFS_HOTPLUG_STATE_PLUGGED) {
+		int ret = vimc_cfs_device_plug(cfs);
+
+		if (ret)
+			return ret;
+	}
+	return size;
+}
+
+CONFIGFS_ATTR(vimc_cfs_dev_, hotplug);
+
+static void vimc_cfs_dev_release(struct config_item *item)
+{
+	struct vimc_cfs_device *cfs =
+		container_of(item, struct vimc_cfs_device, gdev.cg_item);
+
+	ci_dbg(item, "releasing dev %s (%p)\n", item->ci_name, cfs);
+	kfree(cfs);
+}
+
+static struct configfs_group_operations vimc_cfs_dev_group_ops = {
+	.make_group = vimc_cfs_dev_make_ent_group,
+	.drop_item = vimc_cfs_dev_drop_ent_item,
+};
+
+static struct configfs_item_operations vimc_cfs_dev_item_ops = {
+	.release = vimc_cfs_dev_release,
+};
+
+static struct configfs_attribute *vimc_cfs_dev_attrs[] = {
+	&vimc_cfs_dev_attr_hotplug,
+	NULL,
+};
+
+static struct config_item_type vimc_cfs_dev_type = {
+	.ct_group_ops = &vimc_cfs_dev_group_ops,
+	.ct_item_ops = &vimc_cfs_dev_item_ops,
+	.ct_attrs = vimc_cfs_dev_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+/* --------------------------------------------------------------------------
+ * Subsystem
+ * --------------------------------------------------------------------------
+ */
+
+static void vimc_cfs_subsys_drop_dev_item(struct config_group *group,
+				   struct config_item *item)
+{
+	struct vimc_cfs_device *cfs =
+		container_of(to_config_group(item), struct vimc_cfs_device,
+			     gdev);
+
+	cg_dbg(&cfs->gdev, "dropping dev item '%s'", item->ci_name);
+	vimc_cfs_device_unplug(cfs);
+	config_item_put(item);
+}
+
+static struct config_group *vimc_cfs_subsys_make_dev_group(
+				struct config_group *group, const char *name)
+{
+	struct vimc_cfs_device *cfs = kzalloc(sizeof(*cfs), GFP_KERNEL);
+
+	if (!cfs)
+		return ERR_PTR(-ENOMEM);
+
+	cg_dbg(&cfs->gdev, "making dev group '%s'", name);
+	/* Configure platform data */
+	mutex_init(&cfs->pdata.topology_mutex);
+	INIT_LIST_HEAD(&cfs->pdata.ents);
+	INIT_LIST_HEAD(&cfs->pdata.links);
+	mutex_init(&cfs->pdev_mutex);
+	config_group_init_type_name(&cfs->gdev, name, &vimc_cfs_dev_type);
+
+	return &cfs->gdev;
+}
+
+int vimc_cfs_subsys_register(void)
+{
+	config_group_init(&vimc_cfs_subsys.subsys.su_group);
+	return configfs_register_subsystem(&vimc_cfs_subsys.subsys);
+}
+
+void vimc_cfs_subsys_unregister(void)
+{
+	configfs_unregister_subsystem(&vimc_cfs_subsys.subsys);
+}
diff --git a/drivers/media/platform/vimc/vimc-configfs.h b/drivers/media/platform/vimc/vimc-configfs.h
new file mode 100644
index 000000000000..d6789914850c
--- /dev/null
+++ b/drivers/media/platform/vimc/vimc-configfs.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * vimc-configfs.h Virtual Media Controller Driver
+ *
+ * Copyright (C) 2018 Helen Koike <helen.koike@collabora.com>
+ */
+
+#ifndef _VIMC_CONFIGFS_H_
+#define _VIMC_CONFIGFS_H_
+
+#include <linux/configfs.h>
+
+#define VIMC_CFS_SRC_PAD "source:"
+#define VIMC_CFS_SINK_PAD "sink:"
+
+#define VIMC_CFS_SRC_PAD_NUM(n) "source:" #n
+#define VIMC_CFS_SINK_PAD_NUM(n) "sink:" #n
+
+extern struct config_item_type vimc_default_cfs_pad_type;
+
+void vimc_cfs_add_source_pad(struct config_group *ent_group,
+					int pad_idx, const char *name);
+
+void vimc_cfs_add_sink_pad(struct config_group *ent_group,
+				      int pad_idx, const char *name);
+struct vimc_cfs_ent_type {
+	const char *name;
+	struct list_head entry;
+
+	void (*const create_pads)(struct config_group *parent);
+};
+
+int vimc_cfs_subsys_register(void);
+
+void vimc_cfs_subsys_unregister(void);
+
+void vimc_cfs_ent_type_register(struct vimc_cfs_ent_type *c_ent_type);
+
+void vimc_cfs_ent_type_unregister(struct vimc_cfs_ent_type *c_ent_type);
+
+#endif
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 3beec7f95b47..48a868c9e9f1 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-subdev.h>
 
 #include "vimc-common.h"
+#include "vimc-configfs.h"
 
 enum vimc_deb_rgb_colors {
 	VIMC_DEB_RED = 0,
@@ -587,3 +588,24 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 
 	return NULL;
 }
+
+static void vimc_deb_create_cfs_pads(struct config_group *ent_group)
+{
+	vimc_cfs_add_source_pad(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(1));
+	vimc_cfs_add_sink_pad(ent_group, 1, VIMC_CFS_SINK_PAD_NUM(0));
+}
+
+struct vimc_cfs_ent_type vimc_deb_cfs_ent_type = {
+	.name = VIMC_DEB_NAME,
+	.create_pads = vimc_deb_create_cfs_pads,
+};
+
+void vimc_deb_exit(void)
+{
+	vimc_cfs_ent_type_unregister(&vimc_deb_cfs_ent_type);
+}
+
+void vimc_deb_init(void)
+{
+	vimc_cfs_ent_type_register(&vimc_deb_cfs_ent_type);
+}
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 2d1415b97ff8..577b81312658 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -10,6 +10,7 @@
 #include <linux/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
+#include "vimc-configfs.h"
 #include "vimc-common.h"
 
 static unsigned int sca_mult = 3;
@@ -381,3 +382,24 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 
 	return &vsca->ved;
 }
+
+static void vimc_sca_create_cfs_pads(struct config_group *ent_group)
+{
+	vimc_cfs_add_source_pad(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(1));
+	vimc_cfs_add_sink_pad(ent_group, 1, VIMC_CFS_SINK_PAD_NUM(0));
+}
+
+struct vimc_cfs_ent_type vimc_sca_cfs_ent_type = {
+	.name = VIMC_SCA_NAME,
+	.create_pads = vimc_sca_create_cfs_pads,
+};
+
+void vimc_sca_exit(void)
+{
+	vimc_cfs_ent_type_unregister(&vimc_sca_cfs_ent_type);
+}
+
+void vimc_sca_init(void)
+{
+	vimc_cfs_ent_type_register(&vimc_sca_cfs_ent_type);
+}
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 14eeaf461e93..b3f8730b2598 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -12,6 +12,7 @@
 #include <media/v4l2-subdev.h>
 #include <media/tpg/v4l2-tpg.h>
 
+#include "vimc-configfs.h"
 #include "vimc-common.h"
 
 struct vimc_sen_device {
@@ -382,3 +383,23 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 
 	return NULL;
 }
+
+static void vimc_sen_create_cfs_pads(struct config_group *ent_group)
+{
+	vimc_cfs_add_source_pad(ent_group, 0, VIMC_CFS_SRC_PAD_NUM(0));
+}
+
+struct vimc_cfs_ent_type vimc_sen_cfs_ent_type = {
+	.name = VIMC_SEN_NAME,
+	.create_pads = vimc_sen_create_cfs_pads,
+};
+
+void vimc_sen_exit(void)
+{
+	vimc_cfs_ent_type_unregister(&vimc_sen_cfs_ent_type);
+}
+
+void vimc_sen_init(void)
+{
+	vimc_cfs_ent_type_register(&vimc_sen_cfs_ent_type);
+}
-- 
2.20.1

