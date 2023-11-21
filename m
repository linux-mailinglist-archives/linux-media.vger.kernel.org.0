Return-Path: <linux-media+bounces-684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025A7F3883
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 22:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD71B21A68
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 21:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02F738FB0;
	Tue, 21 Nov 2023 21:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="NDnrPzHz"
X-Original-To: linux-media@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A448E191
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 13:53:20 -0800 (PST)
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id 5BpjrnKKpWcCI5YgJriP2a; Tue, 21 Nov 2023 21:53:19 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id 5YgIr9T9fRGmS5YgIrQqbf; Tue, 21 Nov 2023 21:53:19 +0000
X-Authority-Analysis: v=2.4 cv=efcuwpIH c=1 sm=1 tr=0 ts=655d26cf
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=BNY50KLci1gA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8 a=DMYseSosFT8iEa8lxTYA:9
 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uQvqv7ApYAt3fIxqRb0LQx+mXtiPdkYD99IIk0ilvOU=; b=NDnrPzHzCe023I75c2f+B6JEFh
	RPwWi6igyvcYlxjTW9+S8yfQFfXf/JJRmDNmqMBLkQOXvSBCwWoUis1DBi+FpUJBEraZOG4vGfweh
	nUJ87dMKOpF9SRGgA32PsDAnJNVgOlCUnHoIwsmRrhzivoMFGEgx8JCu4xsumbT9JWrQ=;
Received: from [50.126.89.90] (port=53726 helo=localhost.localdomain)
	by gator3086.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1r5YgI-000He6-3A;
	Tue, 21 Nov 2023 15:53:18 -0600
From: Dean Anderson <dean@sensoray.com>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-dev@sensoray.com,
	Dean Anderson <dean@sensoray.com>
Subject: [PATCH] media: usb: s2255: custom V4L2_CIDs
Date: Tue, 21 Nov 2023 13:53:23 -0800
Message-Id: <20231121215323.462427-1-dean@sensoray.com>
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
X-Exim-ID: 1r5YgI-000He6-3A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [50.126.89.90]:53726
X-Source-Auth: dean@sensoray.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfD9SwXZIl4aSUKQ0v16MIFuoAQZRTcYaiQHJreCne6RcLEmd1u5vI2A/0GqXOfbP3aBjslrcTSyoVIDRL2phvX3ywQbfbv/NT6/686UNxwlInAbi/Wod
 3cmS3pgZUSZ5rfZRw57IRej9kS9SJuF1z4odzmwAmAnnP1Nf9e+CDXNMDg6kVhp2DM67ee2rgeSdtrWqkUDPKQSQC4BT5Ak5Bv8=

Adding read-only V4L2 control ids for device-id and on-board
firmware versions.

base-commit: 3e238417254bfdcc23fe207780b59cbb08656762

Signed-off-by: Dean Anderson <dean@sensoray.com>

---
 drivers/media/usb/s2255/s2255drv.c | 98 ++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 3c2627712fe9..1c7cb1d37353 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -262,6 +262,7 @@ struct s2255_dev {
 	int                     chn_ready;
 	/* dsp firmware version (f2255usb.bin) */
 	int                     dsp_fw_ver;
+	int                     usb_fw_ver;
 	u16                     pid; /* product id */
 #define S2255_CMDBUF_SIZE 512
 	__le32                  *cmdbuf;
@@ -323,6 +324,9 @@ struct s2255_buffer {
 #define S2255_V4L2_YC_ON  1
 #define S2255_V4L2_YC_OFF 0
 #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
+#define V4L2_CID_S2255_DEVICEID (V4L2_CID_USER_S2255_BASE + 1)
+#define V4L2_CID_S2255_DSPFWVER (V4L2_CID_USER_S2255_BASE + 2)
+#define V4L2_CID_S2255_USBFWVER (V4L2_CID_USER_S2255_BASE + 3)
 
 /* frame prefix size (sent once every frame) */
 #define PREFIX_SIZE		512
@@ -1232,6 +1236,56 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int s2255_read_reg_burst(struct s2255_dev *dev, u8 dev_addr,
+				u16 reg_addr, u8 *data, u8 datalen)
+{
+	int rc;
+
+	rc = s2255_vendor_req(dev, 0x22, reg_addr, dev_addr >> 1, data, datalen, 0);
+	return rc;
+}
+
+static int s2255_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	u8 *outbuf;
+	int rc;
+	struct s2255_vc *vc =
+		container_of(ctrl->handler, struct s2255_vc, hdl);
+	struct s2255_dev *dev = vc->dev;
+
+	if (ctrl->id == V4L2_CID_S2255_DSPFWVER) {
+		ctrl->val = dev->dsp_fw_ver;
+		return 0;
+	}
+	if (ctrl->id == V4L2_CID_S2255_USBFWVER) {
+		ctrl->val = dev->usb_fw_ver;
+		return 0;
+	}
+	if (ctrl->id != V4L2_CID_S2255_DEVICEID)
+		return -EINVAL;
+	if (dev == NULL)
+		return -EINVAL;
+#define S2255_I2C_SIZE     16
+	outbuf = kzalloc(S2255_I2C_SIZE * sizeof(u8), GFP_KERNEL);
+	if (outbuf == NULL)
+		return -ENOMEM;
+#define S2255_I2C_SNDEV    0xa2
+#define S2255_I2C_SNOFFSET 0x1ff0
+	rc = s2255_read_reg_burst(dev, S2255_I2C_SNDEV, S2255_I2C_SNOFFSET, outbuf, S2255_I2C_SIZE);
+	if (rc < 0) {
+		kfree(outbuf);
+		return rc;
+	}
+	// verify marker code
+	if (*(unsigned int *)outbuf != 0xddccbbaa) {
+		kfree(outbuf);
+		return -EFAULT;
+	}
+	ctrl->val = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] << 8) + outbuf[15];
+	kfree(outbuf);
+	return 0;
+}
+
 static int vidioc_g_jpegcomp(struct file *file, void *priv,
 			 struct v4l2_jpegcompression *jc)
 {
@@ -1569,6 +1623,7 @@ static const struct video_device template = {
 
 static const struct v4l2_ctrl_ops s2255_ctrl_ops = {
 	.s_ctrl = s2255_s_ctrl,
+	.g_volatile_ctrl = s2255_g_volatile_ctrl,
 };
 
 static const struct v4l2_ctrl_config color_filter_ctrl = {
@@ -1581,6 +1636,42 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
 	.def = 1,
 };
 
+static const struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
+	.ops = &s2255_ctrl_ops,
+	.name = "Device ID",
+	.id = V4L2_CID_S2255_DEVICEID,
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.max = 0xffffffff,
+	.min = 0,
+	.step = 1,
+	.def = 0,
+	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
+};
+
+static const struct v4l2_ctrl_config v4l2_ctrl_dspfwver = {
+	.ops = &s2255_ctrl_ops,
+	.name = "DSP Firmware",
+	.id = V4L2_CID_S2255_DSPFWVER,
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.max = 0xffffffff,
+	.min = 0,
+	.step = 1,
+	.def = 0,
+	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
+};
+
+static const struct v4l2_ctrl_config v4l2_ctrl_usbfwver = {
+	.ops = &s2255_ctrl_ops,
+	.name = "USB Firmware",
+	.id = V4L2_CID_S2255_USBFWVER,
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.max = 0xffffffff,
+	.min = 0,
+	.step = 1,
+	.def = 0,
+	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
+};
+
 static int s2255_probe_v4l(struct s2255_dev *dev)
 {
 	int ret;
@@ -1615,6 +1706,12 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 		    (dev->pid != 0x2257 || vc->idx <= 1))
 			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
 					     NULL);
+		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_deviceid,
+				NULL);
+		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_usbfwver,
+				NULL);
+		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_dspfwver,
+				NULL);
 		if (vc->hdl.error) {
 			ret = vc->hdl.error;
 			v4l2_ctrl_handler_free(&vc->hdl);
@@ -1983,6 +2080,7 @@ static int s2255_board_init(struct s2255_dev *dev)
 	}
 	/* query the firmware */
 	fw_ver = s2255_get_fx2fw(dev);
+	dev->usb_fw_ver = fw_ver;
 
 	pr_info("s2255: usb firmware version %d.%d\n",
 		(fw_ver >> 8) & 0xff,
-- 
2.30.2


