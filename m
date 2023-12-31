Return-Path: <linux-media+bounces-3123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAE820B07
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A299281DA2
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F07610A;
	Sun, 31 Dec 2023 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNmW28IT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8525A566D
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hqcqn3wVFqcuHnInqOuIW31KNg+Ka5D/Uw9Vs/4vzU0=;
	b=jNmW28ITqbs7FUdKY7XFxU+2wRAX5BUv3427xVFBnHTXaIbwo1kSHPU6laDZYpE4gITfAF
	ERYRWFLx3r1lUEnuj1rTo+4BHMSZuxv4g3xKubFQJOwYNY4KPaF/vNXgg59qb5ZBg/6eLJ
	Xy3/pE1QikDJjC8rZg2qUCDzzjaeWoM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659--f0QRKQEOnat25G1pLQ1lA-1; Sun, 31 Dec 2023 05:31:27 -0500
X-MC-Unique: -f0QRKQEOnat25G1pLQ1lA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 965E0101A52A;
	Sun, 31 Dec 2023 10:31:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D43E492BC6;
	Sun, 31 Dec 2023 10:31:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 11/15] media: atomisp: Replace atomisp_drvfs attr with using driver.dev_groups attr
Date: Sun, 31 Dec 2023 11:30:53 +0100
Message-ID: <20231231103057.35837-12-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

sysfs attributes preferably should not be manually be registered but
instead the driver.groups / driver.dev_groups driver struct members
should be used to have the driver core handle this in a race free
manner.

Using driver.groups would be the most direct replacement for
driver_[add|remove]_file, but some of the attributes actually need access
to the struct atomisp_device (*), so as part of modernizing this part of
the atomisp driver this change also makes the sysfs attribute device
attributes instead of driver attributes.

*) Before this change accessing these attributes without the driver having
bound would result in a NULL pointer deref, this commit fixes this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_drvfs.c | 148 +++++++-----------
 .../staging/media/atomisp/pci/atomisp_drvfs.h |   5 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   9 +-
 3 files changed, 62 insertions(+), 100 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index 1df534bf54d3..293171da1266 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -27,31 +27,17 @@
 #include "hmm/hmm.h"
 #include "ia_css_debug.h"
 
+#define OPTION_BIN_LIST			BIT(0)
+#define OPTION_BIN_RUN			BIT(1)
+#define OPTION_VALID			(OPTION_BIN_LIST | OPTION_BIN_RUN)
+
 /*
- * _iunit_debug:
- * dbglvl: iunit css driver trace level
  * dbgopt: iunit debug option:
  *        bit 0: binary list
  *        bit 1: running binary
  *        bit 2: memory statistic
-*/
-struct _iunit_debug {
-	struct device_driver	*drv;
-	struct atomisp_device	*isp;
-	unsigned int		dbglvl;
-	unsigned int		dbgfun;
-	unsigned int		dbgopt;
-};
-
-#define OPTION_BIN_LIST			BIT(0)
-#define OPTION_BIN_RUN			BIT(1)
-#define OPTION_VALID			(OPTION_BIN_LIST \
-					| OPTION_BIN_RUN)
-
-static struct _iunit_debug iunit_debug = {
-	.dbglvl = 0,
-	.dbgopt = OPTION_BIN_LIST,
-};
+ */
+unsigned int dbgopt = OPTION_BIN_LIST;
 
 static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 				    unsigned int opt)
@@ -88,34 +74,44 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 	return ret;
 }
 
-static ssize_t iunit_dbglvl_show(struct device_driver *drv, char *buf)
+static ssize_t dbglvl_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
-	iunit_debug.dbglvl = dbg_level;
-	return sysfs_emit(buf, "dtrace level:%u\n", iunit_debug.dbglvl);
+	unsigned int dbglvl = ia_css_debug_get_dtrace_level();
+
+	return sysfs_emit(buf, "dtrace level:%u\n", dbglvl);
 }
 
-static ssize_t iunit_dbglvl_store(struct device_driver *drv, const char *buf,
-				  size_t size)
+static ssize_t dbglvl_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t size)
 {
-	if (kstrtouint(buf, 10, &iunit_debug.dbglvl)
-	    || iunit_debug.dbglvl < 1
-	    || iunit_debug.dbglvl > 9) {
+	unsigned int dbglvl;
+	int ret;
+
+	ret = kstrtouint(buf, 10, &dbglvl);
+	if (ret)
+		return ret;
+
+	if (dbglvl < 1 || dbglvl > 9)
 		return -ERANGE;
-	}
-	ia_css_debug_set_dtrace_level(iunit_debug.dbglvl);
 
+	ia_css_debug_set_dtrace_level(dbglvl);
 	return size;
 }
+static DEVICE_ATTR_RW(dbglvl);
 
-static ssize_t iunit_dbgfun_show(struct device_driver *drv, char *buf)
+static ssize_t dbgfun_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
-	iunit_debug.dbgfun = atomisp_get_css_dbgfunc();
-	return sysfs_emit(buf, "dbgfun opt:%u\n", iunit_debug.dbgfun);
+	unsigned int dbgfun = atomisp_get_css_dbgfunc();
+
+	return sysfs_emit(buf, "dbgfun opt:%u\n", dbgfun);
 }
 
-static ssize_t iunit_dbgfun_store(struct device_driver *drv, const char *buf,
-				  size_t size)
+static ssize_t dbgfun_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t size)
 {
+	struct atomisp_device *isp = dev_get_drvdata(dev);
 	unsigned int opt;
 	int ret;
 
@@ -123,23 +119,20 @@ static ssize_t iunit_dbgfun_store(struct device_driver *drv, const char *buf,
 	if (ret)
 		return ret;
 
-	ret = atomisp_set_css_dbgfunc(iunit_debug.isp, opt);
-	if (ret)
-		return ret;
+	return atomisp_set_css_dbgfunc(isp, opt);
+}
+static DEVICE_ATTR_RW(dbgfun);
 
-	iunit_debug.dbgfun = opt;
-
-	return size;
+static ssize_t dbgopt_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return sysfs_emit(buf, "option:0x%x\n", dbgopt);
 }
 
-static ssize_t iunit_dbgopt_show(struct device_driver *drv, char *buf)
-{
-	return sysfs_emit(buf, "option:0x%x\n", iunit_debug.dbgopt);
-}
-
-static ssize_t iunit_dbgopt_store(struct device_driver *drv, const char *buf,
-				  size_t size)
+static ssize_t dbgopt_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t size)
 {
+	struct atomisp_device *isp = dev_get_drvdata(dev);
 	unsigned int opt;
 	int ret;
 
@@ -147,56 +140,27 @@ static ssize_t iunit_dbgopt_store(struct device_driver *drv, const char *buf,
 	if (ret)
 		return ret;
 
-	iunit_debug.dbgopt = opt;
-	ret = iunit_dump_dbgopt(iunit_debug.isp, iunit_debug.dbgopt);
+	dbgopt = opt;
+	ret = iunit_dump_dbgopt(isp, dbgopt);
 	if (ret)
 		return ret;
 
 	return size;
 }
+static DEVICE_ATTR_RW(dbgopt);
 
-static const struct driver_attribute iunit_drvfs_attrs[] = {
-	__ATTR(dbglvl, 0644, iunit_dbglvl_show, iunit_dbglvl_store),
-	__ATTR(dbgfun, 0644, iunit_dbgfun_show, iunit_dbgfun_store),
-	__ATTR(dbgopt, 0644, iunit_dbgopt_show, iunit_dbgopt_store),
+static struct attribute *dbg_attrs[] = {
+	&dev_attr_dbglvl.attr,
+	&dev_attr_dbgfun.attr,
+	&dev_attr_dbgopt.attr,
+	NULL
 };
 
-static int iunit_drvfs_create_files(struct device_driver *drv)
-{
-	int i, ret = 0;
+static const struct attribute_group dbg_attr_group = {
+	.attrs = dbg_attrs,
+};
 
-	for (i = 0; i < ARRAY_SIZE(iunit_drvfs_attrs); i++)
-		ret |= driver_create_file(drv, &iunit_drvfs_attrs[i]);
-
-	return ret;
-}
-
-static void iunit_drvfs_remove_files(struct device_driver *drv)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(iunit_drvfs_attrs); i++)
-		driver_remove_file(drv, &iunit_drvfs_attrs[i]);
-}
-
-int atomisp_drvfs_init(struct atomisp_device *isp)
-{
-	struct device_driver *drv = isp->dev->driver;
-	int ret;
-
-	iunit_debug.isp = isp;
-	iunit_debug.drv = drv;
-
-	ret = iunit_drvfs_create_files(iunit_debug.drv);
-	if (ret) {
-		dev_err(isp->dev, "drvfs_create_files error: %d\n", ret);
-		iunit_drvfs_remove_files(iunit_debug.drv);
-	}
-
-	return ret;
-}
-
-void atomisp_drvfs_exit(void)
-{
-	iunit_drvfs_remove_files(iunit_debug.drv);
-}
+const struct attribute_group *dbg_attr_groups[] = {
+	&dbg_attr_group,
+	NULL
+};
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.h b/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
index 8f4cc722b881..8495cc133c06 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
@@ -19,7 +19,8 @@
 #ifndef	__ATOMISP_DRVFS_H__
 #define	__ATOMISP_DRVFS_H__
 
-int atomisp_drvfs_init(struct atomisp_device *isp);
-void atomisp_drvfs_exit(void);
+#include <linux/sysfs.h>
+
+extern const struct attribute_group *dbg_attr_groups[];
 
 #endif /* __ATOMISP_DRVFS_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 6e8c9add35f9..0c78c1d82659 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1468,8 +1468,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		goto error_unload_firmware;
 	}
 
-	atomisp_drvfs_init(isp);
-
 	return 0;
 
 error_unload_firmware:
@@ -1497,8 +1495,6 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 {
 	struct atomisp_device *isp = pci_get_drvdata(pdev);
 
-	atomisp_drvfs_exit();
-
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_forbid(&pdev->dev);
 	dev_pm_domain_set(&pdev->dev, NULL);
@@ -1529,11 +1525,12 @@ static const struct pci_device_id atomisp_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ATOMISP_PCI_DEVICE_SOC_CHT)},
 	{0,}
 };
-
 MODULE_DEVICE_TABLE(pci, atomisp_pci_tbl);
 
-
 static struct pci_driver atomisp_pci_driver = {
+	.driver = {
+		.dev_groups = dbg_attr_groups,
+	},
 	.name = "atomisp-isp2",
 	.id_table = atomisp_pci_tbl,
 	.probe = atomisp_pci_probe,
-- 
2.43.0


