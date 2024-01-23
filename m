Return-Path: <linux-media+bounces-4109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF29A839A0F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 21:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9C791C28449
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 20:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AF482D98;
	Tue, 23 Jan 2024 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="SimLHw3f"
X-Original-To: linux-media@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C7481AAE
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706040619; cv=none; b=X9HA5AShCxIpAJEMjGXFtRtQwS04yJbvoiTDxfBB0L9dzpsCN8doQTnvq7gjblpqZAHgd13hqhw+G4vpByAbvGuaU/BVlt2DyzXNcHQJsFoD91Z9Hr6NIJRbreiN8gP3iuVtFOeRM+PeFC3+Yzt4hpDEY925hc3dNK446/BTqVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706040619; c=relaxed/simple;
	bh=ByKTlt8oecjLt+NLZnsDNSkT6shUPMccBoZhAgk8Mb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ljcGM4YkPD2eB9yr6mudDb6Kvz6wrIDz10sOfnk2TJEoCrmj1mFjJOwqC+n7zjs8OeOaEbftyubNj3VJ88ArZ2BBEf2qxjCdZUqzLMuOJJwH/iTDGnxP1wF9A4wuA9Q0ry/N9mvCkqi/bQ0QNjOWnD5+wlZPmip4YxRwim3VEio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sensoray.com; spf=pass smtp.mailfrom=sensoray.com; dkim=pass (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b=SimLHw3f; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sensoray.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sensoray.com
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id SDZdraIdaCF6GSN63rYEQN; Tue, 23 Jan 2024 20:10:11 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id SN61rvlUyL3AmSN62rFEHm; Tue, 23 Jan 2024 20:10:10 +0000
X-Authority-Analysis: v=2.4 cv=Sdrky9du c=1 sm=1 tr=0 ts=65b01d22
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=dEuoMetlWLkA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8 a=gIYMGs8S214ERZT_mbgA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5CjmxEDyanYCKZZu7J49EekmXXhQ38HgYat3QkREnm0=; b=SimLHw3fjbNT8mrn3xY5CPQQ02
	+tu3YpwuxhABlpHdf/6G9PB4PrnMpwPOonsXHh+SZ+g/Xs+uDbEhZw6yIOROAOuKv5gjOamPlVkv3
	YaCPGTKPwgjXD5O70/spcPhxZ+2fBlpFP5KlmyAme1q414WPqbj94OQg43XYaxJykC44=;
Received: from [50.126.89.90] (port=41476 helo=localhost.localdomain)
	by gator3086.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1rSN61-002x5k-7g;
	Tue, 23 Jan 2024 14:10:09 -0600
From: Dean Anderson <dean@sensoray.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	geert+renesas@glider.be,
	linux-media@vger.kernel.org
Cc: dean@sensoray.com
Subject: [PATCHv4] media: usb: s2255: media_device and serial number added
Date: Tue, 23 Jan 2024 12:12:12 -0800
Message-Id: <20240123201212.23896-1-dean@sensoray.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 50.126.89.90
X-Source-L: No
X-Exim-ID: 1rSN61-002x5k-7g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [50.126.89.90]:41476
X-Source-Auth: dean@sensoray.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCqtu5V0oZYaPpz7Xe/aShR6SnKp6fjej+X1YBlumYEiW0BMxgmwEakj6hGsOHmo5yjK1Zw6Q6OEoZr57TvEfU6/RXioQjbIHhqpIizfY+flj5r4Fuep
 C06u4KrZgVtJGwlIeqe2OzLgtIE2repNyLbwvTOZNsyAxpu2mCHNEb6Va3fZ/w58Zif8HEEPsb5jgzgkjFUaWGUT6IJntXzVPoY=

Adding media_device support including the serial number.

Signed-off-by: Dean Anderson <dean@sensoray.com>

---
 drivers/media/usb/s2255/s2255drv.c | 45 ++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 3c2627712fe9..2319cf93e726 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -60,6 +60,7 @@
 #define S2255_MIN_BUFS          2
 #define S2255_SETMODE_TIMEOUT   500
 #define S2255_VIDSTATUS_TIMEOUT 350
+#define S2255_MARKER_SERIALNUM	cpu_to_le32(0xDDCCBBAAL)
 #define S2255_MARKER_FRAME	cpu_to_le32(0x2255DA4AL)
 #define S2255_MARKER_RESPONSE	cpu_to_le32(0x2255ACACL)
 #define S2255_RESPONSE_SETMODE  cpu_to_le32(0x01)
@@ -245,6 +246,7 @@ struct s2255_vc {
 
 
 struct s2255_dev {
+	struct media_device     mdev;
 	struct s2255_vc         vc[MAX_CHANNELS];
 	struct v4l2_device      v4l2_dev;
 	atomic_t                num_channels;
@@ -323,6 +325,7 @@ struct s2255_buffer {
 #define S2255_V4L2_YC_ON  1
 #define S2255_V4L2_YC_OFF 0
 #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
+#define V4L2_CID_S2255_SERIALNUM (V4L2_CID_USER_S2255_BASE + 1)
 
 /* frame prefix size (sent once every frame) */
 #define PREFIX_SIZE		512
@@ -1232,6 +1235,29 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+/*
+ * serial number is not used in usb device descriptors.
+ * returns serial number from device, 0 if none found.
+ */
+
+static int s2255_g_serialnum(struct s2255_dev *dev, u32 *serial)
+{
+#define S2255_I2C_SIZE     16
+#define S2255_I2C_SERIALNUM 0xa2
+#define S2255_I2C_SERIALNUM_OFFSET 0x1ff0
+#define S2255_VENDOR_READREG 0x22
+	u8 buf[16];
+	int rc;
+
+	rc = s2255_vendor_req(dev, S2255_VENDOR_READREG, S2255_I2C_SERIALNUM_OFFSET,
+			      S2255_I2C_SERIALNUM >> 1, buf, S2255_I2C_SIZE, 0);
+	if (rc != S2255_I2C_SIZE || *(__le32 *)buf != S2255_MARKER_SERIALNUM)
+		return -EINVAL;
+	/* Unlike the other parameters, the serial number is sent as big endian */
+	*serial = be32_to_cpu(*((__be32 *)buf + 3));
+	return 0;
+}
+
 static int vidioc_g_jpegcomp(struct file *file, void *priv,
 			 struct v4l2_jpegcompression *jc)
 {
@@ -1500,6 +1526,9 @@ static void s2255_destroy(struct s2255_dev *dev)
 	s2255_reset_dsppower(dev);
 	mutex_destroy(&dev->lock);
 	usb_put_dev(dev->udev);
+	if (media_devnode_is_registered(dev->mdev.devnode))
+		media_device_unregister(&dev->mdev);
+	media_device_cleanup(&dev->mdev);
 	v4l2_device_unregister(&dev->v4l2_dev);
 	kfree(dev->cmdbuf);
 	kfree(dev);
@@ -2206,14 +2235,13 @@ static int s2255_probe(struct usb_interface *interface,
 	int retval = -ENOMEM;
 	__le32 *pdata;
 	int fw_size;
-
+	u32 serialno;
 	/* allocate memory for our device state and initialize it to zero */
 	dev = kzalloc(sizeof(struct s2255_dev), GFP_KERNEL);
 	if (dev == NULL) {
 		s2255_dev_err(&interface->dev, "out of memory\n");
 		return -ENOMEM;
 	}
-
 	dev->cmdbuf = kzalloc(S2255_CMDBUF_SIZE, GFP_KERNEL);
 	if (dev->cmdbuf == NULL) {
 		s2255_dev_err(&interface->dev, "out of memory\n");
@@ -2237,6 +2265,15 @@ static int s2255_probe(struct usb_interface *interface,
 	dev_dbg(&interface->dev, "dev: %p, udev %p interface %p\n",
 		dev, dev->udev, interface);
 	dev->interface = interface;
+
+	dev->mdev.dev = &interface->dev;
+	strscpy(dev->mdev.model, "Sensoray Model 2255", sizeof(dev->mdev.model));
+	usb_make_path(dev->udev, dev->mdev.bus_info, sizeof(dev->mdev.bus_info));
+	dev->mdev.hw_revision = le16_to_cpu(dev->udev->descriptor.bcdDevice);
+	if (s2255_g_serialnum(dev, &serialno) == 0)
+		snprintf(dev->mdev.serial, sizeof(dev->mdev.serial), "%d", serialno);
+	media_device_init(&dev->mdev);
+	dev->v4l2_dev.mdev = &dev->mdev;
 	/* set up the endpoint information  */
 	iface_desc = interface->cur_altsetting;
 	dev_dbg(&interface->dev, "num EP: %d\n",
@@ -2311,6 +2348,10 @@ static int s2255_probe(struct usb_interface *interface,
 	retval = s2255_probe_v4l(dev);
 	if (retval)
 		goto errorBOARDINIT;
+
+	if (media_device_register(&dev->mdev) < 0)
+		goto errorBOARDINIT;
+
 	dev_info(&interface->dev, "Sensoray 2255 detected\n");
 	return 0;
 errorBOARDINIT:
-- 
2.30.2


