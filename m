Return-Path: <linux-media+bounces-2474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B944815010
	for <lists+linux-media@lfdr.de>; Fri, 15 Dec 2023 20:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B5A82870B3
	for <lists+linux-media@lfdr.de>; Fri, 15 Dec 2023 19:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CB43FE43;
	Fri, 15 Dec 2023 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="A//1t1iW"
X-Original-To: linux-media@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF013FE30
	for <linux-media@vger.kernel.org>; Fri, 15 Dec 2023 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sensoray.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sensoray.com
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id EAzhrsEq4WcCIEDcZrFEhL; Fri, 15 Dec 2023 19:13:16 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id EDcZrgSAUb8QnEDcZrogfc; Fri, 15 Dec 2023 19:13:15 +0000
X-Authority-Analysis: v=2.4 cv=IuQNzZzg c=1 sm=1 tr=0 ts=657ca54b
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=e2cXIFwxEfEA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8 a=Ah3CWMqqfG97FtdL8iQA:9
 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IBs4qa8TTngcFfgHgS3vpxUhVZItz6QZ++7KnQJbpJA=; b=A//1t1iWSqwAyn4YWJziWDp9d3
	xmcKDLYWqKZE6X+6huHD70PFxR88ZnBGLgqeqvczB15Dqc0UXvSYikyPCUmwaB7duG1LnV2+JkcFb
	VjmdsfAVOChmxLNnUcAmskL/cSAo7F4emzCSXZFmI06ZYeokx9oYKfwdrg7zVCDGWHgY=;
Received: from [50.126.89.90] (port=47918 helo=localhost.localdomain)
	by gator3086.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1rEDcY-0040Vr-Nh;
	Fri, 15 Dec 2023 13:13:14 -0600
From: Dean Anderson <dean@sensoray.com>
To: linux-media@vger.kernel.org
Cc: dean@sensoray.com
Subject: [PATCHv3] media: usb: s2255: add serial number V4L2_CID
Date: Fri, 15 Dec 2023 11:14:21 -0800
Message-Id: <20231215191421.36686-1-dean@sensoray.com>
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
X-Exim-ID: 1rEDcY-0040Vr-Nh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [50.126.89.90]:47918
X-Source-Auth: dean@sensoray.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL+lBVrH5vspieazZVbXRIPI/VQQ6hTr0mTyOLMStsQswMxgwk8zgyCbVIbFEUXn+iTpkIJMZrZoClp5ah8xSgpFU4Motn1X/t34rb6+rWS7yPNyLKAP
 WSarGV+BWN/MFKA+Qdt8KJIkHsCBbJt+OGgebPSK7LbGf6/MJcjpEJttj38WgglDBiLEHSzCFt+Gq0Dj3GP4KIlxhxd7fm4kJaI=

Adding V4L2 read-only control id for serial number as hardware
does not support embedding the serial number in the USB device descriptors.
Comment added noting v4l2_ctrl_handler_setup is not needed for this driver.

Signed-off-by: Dean Anderson <dean@sensoray.com>

---
 drivers/media/usb/s2255/s2255drv.c | 52 +++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 3c2627712fe9..1f3961835711 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -60,6 +60,7 @@
 #define S2255_MIN_BUFS          2
 #define S2255_SETMODE_TIMEOUT   500
 #define S2255_VIDSTATUS_TIMEOUT 350
+#define S2255_MARKER_FIRMWARE	cpu_to_le32(0xDDCCBBAAL)
 #define S2255_MARKER_FRAME	cpu_to_le32(0x2255DA4AL)
 #define S2255_MARKER_RESPONSE	cpu_to_le32(0x2255ACACL)
 #define S2255_RESPONSE_SETMODE  cpu_to_le32(0x01)
@@ -323,6 +324,7 @@ struct s2255_buffer {
 #define S2255_V4L2_YC_ON  1
 #define S2255_V4L2_YC_OFF 0
 #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
+#define V4L2_CID_S2255_SERIALNUM (V4L2_CID_USER_S2255_BASE + 1)
 
 /* frame prefix size (sent once every frame) */
 #define PREFIX_SIZE		512
@@ -1232,6 +1234,36 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+/*
+ * serial number is not used in usb device descriptors.
+ * returns serial number from device, 0 if none found.
+ */
+
+static int s2255_g_serialnum(struct s2255_dev *dev)
+{
+#define S2255_SERIALNUM_NONE 0
+#define S2255_I2C_SIZE     16
+#define S2255_I2C_SERIALNUM 0xa2
+#define S2255_I2C_SERIALNUM_OFFSET 0x1ff0
+#define S2255_VENDOR_READREG 0x22
+
+	u8 *buf;
+	int serialnum = S2255_SERIALNUM_NONE;
+
+	buf = kzalloc(S2255_I2C_SIZE, GFP_KERNEL);
+	if (!buf)
+		return serialnum;
+
+	s2255_vendor_req(dev, S2255_VENDOR_READREG, S2255_I2C_SERIALNUM_OFFSET,
+			 S2255_I2C_SERIALNUM >> 1, buf, S2255_I2C_SIZE, 0);
+
+	/* verify marker code */
+	if (*(__le32 *)buf == S2255_MARKER_FIRMWARE)
+		serialnum = (buf[12] << 24) + (buf[13] << 16) + (buf[14] << 8) + buf[15];
+	kfree(buf);
+	return serialnum;
+}
+
 static int vidioc_g_jpegcomp(struct file *file, void *priv,
 			 struct v4l2_jpegcompression *jc)
 {
@@ -1581,6 +1613,17 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
 	.def = 1,
 };
 
+static const struct v4l2_ctrl_config v4l2_ctrl_serialnum = {
+	.ops = &s2255_ctrl_ops,
+	.name = "Serial Number",
+	.id = V4L2_CID_S2255_SERIALNUM,
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.max = 0x7fffffff,
+	.min = 0,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY,
+};
+
 static int s2255_probe_v4l(struct s2255_dev *dev)
 {
 	int ret;
@@ -1588,6 +1631,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 	int cur_nr = video_nr;
 	struct s2255_vc *vc;
 	struct vb2_queue *q;
+	struct v4l2_ctrl_config tmp = v4l2_ctrl_serialnum;
 
 	ret = v4l2_device_register(&dev->interface->dev, &dev->v4l2_dev);
 	if (ret)
@@ -1598,7 +1642,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 		vc = &dev->vc[i];
 		INIT_LIST_HEAD(&vc->buf_list);
 
-		v4l2_ctrl_handler_init(&vc->hdl, 6);
+		v4l2_ctrl_handler_init(&vc->hdl, 7);
 		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
 				V4L2_CID_BRIGHTNESS, -127, 127, 1, DEF_BRIGHT);
 		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
@@ -1615,6 +1659,8 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 		    (dev->pid != 0x2257 || vc->idx <= 1))
 			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
 					     NULL);
+		tmp.def = s2255_g_serialnum(dev);
+		v4l2_ctrl_new_custom(&vc->hdl, &tmp, NULL);
 		if (vc->hdl.error) {
 			ret = vc->hdl.error;
 			v4l2_ctrl_handler_free(&vc->hdl);
@@ -2306,6 +2352,10 @@ static int s2255_probe(struct usb_interface *interface,
 	retval = s2255_board_init(dev);
 	if (retval)
 		goto errorBOARDINIT;
+	/*
+	 * v4l2_ctrl_handler_setup is not required.
+	 * V4L2 controls initialized when firmware is loaded.
+	 */
 	s2255_fwload_start(dev);
 	/* loads v4l specific */
 	retval = s2255_probe_v4l(dev);
-- 
2.30.2


