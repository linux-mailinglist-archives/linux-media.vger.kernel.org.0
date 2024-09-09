Return-Path: <linux-media+bounces-17986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7B9715DC
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E9291C22DC8
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 10:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877BB1B5833;
	Mon,  9 Sep 2024 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2qrryht"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B764A1B4C4A;
	Mon,  9 Sep 2024 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879520; cv=none; b=YuMRJQrFGjUkLyoecX2NIBz1mC594WvKPSvzoPPkjldiz6p7Wha3hPQua86VvirTlLkzJLJ2DpmcksLhvV/9eyg7cecQ16AuAA5imrfCzsFgrZ89dWqsuU9V7uX2vGhMlYjEsGvxW94ZxICOwAXSOuh4ERTASixaC0D/HeTEq7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879520; c=relaxed/simple;
	bh=onJ5upb8Ykr8cDpubjsnRjByMpxVloV892H1A9Y/+kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j5kqr3jfGby7B6a7/pApkxQJynC4mVVML3YSuzoZi9OBrBom64VdLpKDHej/4afpnZ9xfJwhgI4PtYRr4RgdTeqGRIt/qqYxE3pM5rtkrnUm25KzRLByvGybZxa/eTM8VLjsw4YkQBdDJ9v9Z9VSBbEovkucSRqWKGDuIfcthLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2qrryht; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53653682246so5135763e87.1;
        Mon, 09 Sep 2024 03:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879516; x=1726484316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHd5zin9CvlzGoEPmh4YIRpb/8jCL2v5byn2zUgbpcc=;
        b=X2qrryht8vvw5sN+o8RYGvjsqsfr1D4FqjBt9SXyyTzFZYbZQ/etA+5HuM7y8H/BVp
         49IoIVlOcxBqj+iU1SebWOXJzAcie8EyJ4AXBjPzH/EzNiRTS5YCQVYjyL4HVDl71s4z
         Zw/p3+5+naMhrE68oRoFKFiuscpSU9PEAVzIBCQhGpnZoaLXtiB65vd17NDuDR/TbOVw
         fL5Xlg3vujpGcgXhHyCyoVb2/9u4WEq0mPggJ+ZcwWa95MeFtXuDzB25S/AA5AW4Ywol
         /hjT6Uh8WsuEmbf+tF4jwYOs+9Y0lgFvarN+V0nStWc+bZ/7nHJKq+uhnJTGQgeHYPy+
         SsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879516; x=1726484316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHd5zin9CvlzGoEPmh4YIRpb/8jCL2v5byn2zUgbpcc=;
        b=eb906427aSFPUpbpMN/iOmNDBnjyKDr7W/mpRQgzqjnjpCEtmVHCHGk/A6Xf9Um7J7
         flQO2NNzTvWYX44q4lZVcjSZKwg+/mJNW9f5G/24UE1iB43tKNxljtA/eO9/mRbnIzCN
         uGrckYTVCHaL5UFqX3LBKTbFYL4I/Kf8oGoVtmfQUeP2pBKSLn+KStD1qWvFyndkRrCR
         /OPVk6ItUpGtk0j+1yTdIpOJqRisEcO9lbh37sKNAq0Ehs0ESlHPNDhMBqaetuPZvQ7l
         xTaMHGm7FO4JLUKhgBj1XfxMnUobgI+4VKx4MoXiqnFIUQWBFWHBnoI0o4bowdHp/9Ne
         avfg==
X-Forwarded-Encrypted: i=1; AJvYcCWGOAIVzNWQiTADuJ7GPvhgeUZ/kGmKAl8pN1KJf6PcPywAPBO9XKQCr+/ZeBgbEVO7w6G688vPzw8P6DM=@vger.kernel.org, AJvYcCWyY3AYLZ2/SdP7x7n9u4+0H0n5/AVtaSVwix7WtsykVCU9+ms4baE65RLbjngkpintsFDaBd0M2jnkpbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMz7QrjQyfZZgxKxqzhrlxN+eqFWu+JBuztyyLsIvjoEQPciJQ
	Kgu7AYBMmxSYEoL04EtmcDIxNMS53sRxhzrnImENJd4RfJGODfHU
X-Google-Smtp-Source: AGHT+IGUrTgGxYbNZb78fRFw/xTYHUG9wcK0pIXIBucjJOEHhk1NvEYyUybsbj6nvj9fmmL2Qtbw4A==
X-Received: by 2002:a05:6512:691:b0:533:483f:957b with SMTP id 2adb3069b0e04-5365881586fmr6414381e87.61.1725879515596;
        Mon, 09 Sep 2024 03:58:35 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a2b281sm328281366b.92.2024.09.09.03.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 03:58:35 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	mhecht73@gmail.com,
	michael.roeder@avnet.eu,
	hverkuil@xs4all.nl,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: i2c: alvium: add camera sysfs attributes
Date: Mon,  9 Sep 2024 12:58:30 +0200
Message-Id: <20240909105831.684371-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909105831.684371-1-tomm.merciai@gmail.com>
References: <20240909105831.684371-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following sysfs attributes:

 - cci_register_layout_version: dump current cci regs layout version
 - csi_clock_mhz: dump current csi2 freq
 - device_capabilities: dump alvium device capabilities
 - device_guid: dump alvium device guid
 - device_version: dump device version
 - family_name: dump alvium device family name
 - genio: generic camera input/output xfer
 - lane_count: dump alvium device data lanes number
 - manufacturer_info: custom manufacturer info
 - manufacturer_name: manufacturer info
 - mode: show/set bcm/gencp mode
 - model_name: dump alvium device model name
 - serial_number: dump alvium device serial number
 - user_defined_name: show user defined name

 alvium_sysfs_add_dev_info() create alvium sysfs attributes.
 alvium_sysfs_rm_dev_info() remove alvium attributes.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 484 ++++++++++++++++++++++++++++++++
 drivers/media/i2c/alvium-csi2.h |  25 ++
 2 files changed, 509 insertions(+)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 5ddfd3dcb188..11bfeb3bb1fd 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1653,6 +1653,482 @@ static int alvium_hw_init(struct alvium_dev *alvium)
 	return 0;
 }
 
+/* --------------- Sysfs attributes --------------- */
+static ssize_t cci_register_layout_version_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 min, maj, ver;
+	int ret = 0;
+
+	ret = alvium_read(alvium, REG_BCRM_MINOR_VERSION_R, &min, &ret);
+	ret = alvium_read(alvium, REG_BCRM_MAJOR_VERSION_R, &maj, &ret);
+	if (ret)
+		return ret;
+
+	ver = (maj << 16) | min;
+
+	return sysfs_emit(buf, "%u\n", (u32)ver);
+}
+static DEVICE_ATTR_RO(cci_register_layout_version);
+
+static ssize_t csi_clock_mhz_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val;
+	int ret;
+
+	ret = alvium_read(alvium, REG_BCRM_CSI2_CLOCK_RW, &val, NULL);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", (u32)val);
+}
+static DEVICE_ATTR_RO(csi_clock_mhz);
+
+static ssize_t device_capabilities_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val;
+	int ret;
+
+	ret = alvium_read(alvium, REG_CCI_DEV_CAP_RW, &val, NULL);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%llx\n", val);
+}
+static DEVICE_ATTR_RO(device_capabilities);
+
+static ssize_t device_guid_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_DEVICE_GUID_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(device_guid);
+
+static ssize_t device_version_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_DEVICE_VERSION_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(device_version);
+
+static ssize_t family_name_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_DEVICE_FAMILY_NAME_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(family_name);
+
+static void alvium_genio_read_prepare(struct alvium_dev *alvium,
+				      struct alvium_genio_proto *proto)
+{
+	alvium->req_data.reg = proto->reg;
+	alvium->req_data.count = proto->count;
+}
+
+static ssize_t alvium_genio_xfer(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	struct alvium_genio_proto *proto;
+	char *kbuf;
+	char *data;
+	int ret = 0;
+
+	switch (alvium->genio_op) {
+	case ALVIUM_GENIO_READ:
+		kbuf = kzalloc(alvium->req_data.count, GFP_KERNEL);
+		if (!kbuf)
+			return -ENOMEM;
+
+		ret = regmap_bulk_read(alvium->regmap, alvium->req_data.reg,
+				       (char *)kbuf, alvium->req_data.count);
+		if (ret)
+			goto genio_xfer_done;
+
+		memcpy((char *)buf, kbuf, alvium->req_data.count);
+
+		ret = alvium->req_data.count;
+		break;
+
+	case ALVIUM_GENIO_WRITE:
+		proto = (struct alvium_genio_proto *)buf;
+		data = (char *)(proto + 1);
+
+		kbuf = kzalloc(proto->count, GFP_KERNEL);
+		if (!kbuf)
+			return -ENOMEM;
+
+		memcpy(kbuf, data, proto->count);
+
+		ret = regmap_bulk_write(alvium->regmap, proto->reg,
+					kbuf, proto->count);
+		if (ret)
+			goto genio_xfer_done;
+
+		ret = proto->count;
+		break;
+	}
+
+genio_xfer_done:
+	kfree(kbuf);
+	return ret;
+}
+
+static ssize_t genio_show(struct device *dev,
+			  struct device_attribute *attr,
+			  char *buf)
+{
+	return alvium_genio_xfer(dev, attr, buf, 0);
+}
+
+static ssize_t genio_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	struct alvium_genio_proto *proto = (struct alvium_genio_proto *)buf;
+	int ret = 0;
+
+	if (proto->op) {
+		alvium->genio_op = ALVIUM_GENIO_READ;
+		alvium_genio_read_prepare(alvium, proto);
+		return ret;
+	}
+
+	alvium->genio_op = ALVIUM_GENIO_WRITE;
+
+	return alvium_genio_xfer(dev, attr, buf, count);
+}
+static DEVICE_ATTR_RW(genio);
+
+static ssize_t lane_count_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+
+	return sysfs_emit(buf, "%d\n", alvium->h_sup_csi_lanes);
+}
+static DEVICE_ATTR_RO(lane_count);
+
+static ssize_t manufacturer_info_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_MANUFACTURER_INFO_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(manufacturer_info);
+
+static ssize_t manufacturer_name_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_MANUFACTURER_NAME_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(manufacturer_name);
+
+static ssize_t mode_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t len)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val;
+	int ret = 0;
+
+	if (strncmp(buf, "bcm", strlen(buf) - 1) == 0)
+		alvium->bcrm_mode = ALVIUM_BCM_MODE;
+	else if (strncmp(buf, "gencp", strlen(buf) - 1) == 0)
+		alvium->bcrm_mode = ALVIUM_GENCP_MODE;
+	else
+		return -EINVAL;
+
+	alvium_write(alvium, REG_GENCP_CHANGEMODE_W,
+		     (u8)alvium->bcrm_mode, &ret);
+	if (ret)
+		return ret;
+
+	read_poll_timeout(alvium_read, val,
+			  (val == alvium->bcrm_mode),
+			  15000, 45000, true,
+			  alvium, REG_GENCP_CURRENTMODE_R,
+			  &val, &ret);
+	if (ret) {
+		dev_err(dev, "poll curr mode fail\n");
+		return ret;
+	}
+
+	return ret ? ret : len;
+}
+
+static ssize_t mode_show(struct device *dev,
+			 struct device_attribute *attr,
+			 char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 mode;
+	int ret = 0;
+
+	ret = alvium_read(alvium, REG_GENCP_CURRENTMODE_R, &mode, NULL);
+	if (ret)
+		return ret;
+
+	switch (mode) {
+	case ALVIUM_BCM_MODE:
+		return sysfs_emit(buf, "bcm\n");
+	case ALVIUM_GENCP_MODE:
+		return sysfs_emit(buf, "gencp\n");
+	}
+
+	return sysfs_emit(buf, "Alvium is in invalid Mode: 0x%x\n", (u8)mode);
+}
+static DEVICE_ATTR_RW(mode);
+
+static ssize_t model_name_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_DEVICE_MODEL_NAME_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(model_name);
+
+static ssize_t serial_number_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_DEVICE_SERIAL_NUMBER_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(serial_number);
+
+static ssize_t user_defined_name_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct alvium_dev *alvium = sd_to_alvium(sd);
+	u64 val[8];
+	int i, ret = 0;
+
+	/* 64 bytes length */
+	for (i = 0; i < 8; i++)
+		alvium_read(alvium, REG_CCI_USER_DEFINED_NAME_R + 8 * i,
+			    &val[i], &ret);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", (char *)&val);
+}
+static DEVICE_ATTR_RO(user_defined_name);
+
+static int alvium_sysfs_add_dev_info(struct alvium_dev *alvium)
+{
+	struct device *dev = &alvium->i2c_client->dev;
+	int ret;
+
+	ret = device_create_file(dev, &dev_attr_cci_register_layout_version);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_cci_register_layout_version);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_csi_clock_mhz);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_csi_clock_mhz);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_device_capabilities);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_device_capabilities);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_device_guid);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_device_guid);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_device_version);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_device_version);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_family_name);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_family_name);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_genio);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_genio);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_lane_count);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_lane_count);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_manufacturer_info);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_manufacturer_info);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_manufacturer_name);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_manufacturer_name);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_serial_number);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_serial_number);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_mode);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_mode);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_model_name);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_model_name);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_user_defined_name);
+	if (ret) {
+		device_remove_file(dev, &dev_attr_user_defined_name);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void alvium_sysfs_rm_dev_info(struct alvium_dev *alvium)
+{
+	struct device *dev = &alvium->i2c_client->dev;
+
+	device_remove_file(dev, &dev_attr_cci_register_layout_version);
+	device_remove_file(dev, &dev_attr_csi_clock_mhz);
+	device_remove_file(dev, &dev_attr_device_capabilities);
+	device_remove_file(dev, &dev_attr_device_guid);
+	device_remove_file(dev, &dev_attr_device_version);
+	device_remove_file(dev, &dev_attr_family_name);
+	device_remove_file(dev, &dev_attr_genio);
+	device_remove_file(dev, &dev_attr_lane_count);
+	device_remove_file(dev, &dev_attr_manufacturer_info);
+	device_remove_file(dev, &dev_attr_manufacturer_name);
+	device_remove_file(dev, &dev_attr_mode);
+	device_remove_file(dev, &dev_attr_model_name);
+	device_remove_file(dev, &dev_attr_serial_number);
+	device_remove_file(dev, &dev_attr_user_defined_name);
+}
+
 /* --------------- Subdev Operations --------------- */
 static int alvium_s_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
@@ -2469,6 +2945,12 @@ static int alvium_probe(struct i2c_client *client)
 		goto err_powerdown;
 	}
 
+	ret = alvium_sysfs_add_dev_info(alvium);
+	if (ret) {
+		dev_err_probe(dev, ret, "sysfs_add_dev_info fail\n");
+		goto err_powerdown;
+	}
+
 	/*
 	 * Enable runtime PM without autosuspend:
 	 *
@@ -2499,6 +2981,7 @@ static int alvium_probe(struct i2c_client *client)
 err_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
+	alvium_sysfs_rm_dev_info(alvium);
 	kfree(alvium->alvium_csi2_fmt);
 err_powerdown:
 	alvium_set_power(alvium, false);
@@ -2513,6 +2996,7 @@ static void alvium_remove(struct i2c_client *client)
 	struct device *dev = &alvium->i2c_client->dev;
 
 	v4l2_async_unregister_subdev(sd);
+	alvium_sysfs_rm_dev_info(alvium);
 	alvium_subdev_cleanup(alvium);
 	kfree(alvium->alvium_csi2_fmt);
 	/*
diff --git a/drivers/media/i2c/alvium-csi2.h b/drivers/media/i2c/alvium-csi2.h
index 978af44f76c7..8567898d39ed 100644
--- a/drivers/media/i2c/alvium-csi2.h
+++ b/drivers/media/i2c/alvium-csi2.h
@@ -28,7 +28,16 @@
 /* Basic Control Register Map register offsets (BCRM) */
 #define REG_BCRM_MINOR_VERSION_R			CCI_REG16(0x0000)
 #define REG_BCRM_MAJOR_VERSION_R			CCI_REG16(0x0002)
+#define REG_CCI_DEV_CAP_RW				CCI_REG64(0x0008)
 #define REG_BCRM_REG_ADDR_R				CCI_REG16(0x0014)
+#define REG_CCI_DEVICE_GUID_R				CCI_REG64_LE(0x0018)
+#define REG_CCI_MANUFACTURER_NAME_R			CCI_REG64_LE(0x0058)
+#define REG_CCI_DEVICE_MODEL_NAME_R			CCI_REG64_LE(0x0098)
+#define REG_CCI_DEVICE_FAMILY_NAME_R			CCI_REG64_LE(0x00d8)
+#define REG_CCI_DEVICE_VERSION_R			CCI_REG64_LE(0x0118)
+#define REG_CCI_MANUFACTURER_INFO_R			CCI_REG64_LE(0x0158)
+#define REG_CCI_DEVICE_SERIAL_NUMBER_R			CCI_REG64_LE(0x0198)
+#define REG_CCI_USER_DEFINED_NAME_R			CCI_REG64_LE(0x01d8)
 
 #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
 #define REG_BCRM_DEVICE_FW				REG_BCRM_V4L2_64BIT(0x0010)
@@ -211,6 +220,19 @@
 #define BCRM_DEVICE_FW_SPEC_MASK			GENMASK_ULL(7, 0)
 #define BCRM_DEVICE_FW_SPEC_SHIFT			0
 
+enum alvium_fw_ops {
+	ALVIUM_GENIO_WRITE,
+	ALVIUM_GENIO_READ,
+	ALVIUM_GENIO_NUM_OPS
+};
+
+struct alvium_genio_proto {
+	u16 reg;
+	u16 count;
+	u8 op;
+	u8 reserved[3];
+};
+
 enum alvium_bcrm_mode {
 	ALVIUM_BCM_MODE,
 	ALVIUM_GENCP_MODE,
@@ -461,6 +483,9 @@ struct alvium_dev {
 
 	u8 streaming;
 	u8 apply_fiv;
+
+	u8 genio_op;
+	struct alvium_genio_proto req_data;
 };
 
 static inline struct alvium_dev *sd_to_alvium(struct v4l2_subdev *sd)
-- 
2.34.1


