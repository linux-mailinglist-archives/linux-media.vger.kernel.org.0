Return-Path: <linux-media+bounces-862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B48037F50E4
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 20:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 158E0B20C0B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 19:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95F63D3A9;
	Wed, 22 Nov 2023 19:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="UTXca7fw"
X-Original-To: linux-media@vger.kernel.org
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFBB98
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 11:48:19 -0800 (PST)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTPS
	id 5sNErIpgHKOkL5tCsrljFZ; Wed, 22 Nov 2023 19:48:18 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id 5tCsriC7aGKIc5tCsrMxtL; Wed, 22 Nov 2023 19:48:18 +0000
X-Authority-Analysis: v=2.4 cv=E+beGIRl c=1 sm=1 tr=0 ts=655e5b02
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=BNY50KLci1gA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8 a=O5gdn_nqc15GaX5jBfQA:9
 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FxgRLDfk2DeJrI/hOHa3514IqQg2KmB3MnVQtTz3KSE=; b=UTXca7fwdVk7Sb1lC1QeZ2JsUb
	c3TPHTzpZJQMbSLEDr5tooNqh/yzu+C8Blc/G238UgMehwfUxBQbzYHh6DRxer2Pi+rIIdLyEJfvo
	5XqwSiy3XXIZy8JXFJgJ8jDVLHNTnisOxZaMaFgG967uIAe7NSgtqRBlkhqlVYG5YbEw=;
Received: from [50.126.89.90] (port=34980 helo=localhost.localdomain)
	by gator3086.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1r5tCr-000OEw-Rl;
	Wed, 22 Nov 2023 13:48:17 -0600
From: Dean Anderson <dean@sensoray.com>
To: linux-media@vger.kernel.org
Cc: dean@sensoray.com
Subject: [PATCH] media: usb: s2255: device-id custom V4L2_CID
Date: Wed, 22 Nov 2023 11:48:38 -0800
Message-Id: <20231122194838.13285-1-dean@sensoray.com>
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
X-Exim-ID: 1r5tCr-000OEw-Rl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [50.126.89.90]:34980
X-Source-Auth: dean@sensoray.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEocSfzPWi+b+vOItzuuHwhbx7a9YXOsp3eMulpkCgjfgELQJKe4ocz+TyJexhQZsW8SGnewjGTMwfpypHgsJCGqmjW2z8UQvFUSFlCl4UUNcEeHzCrI
 JkjRVNRKFg9msJxAvDf1qxSPKpVWV3nRRvKXFF5jL2oAm2SeIsUz6/xkmYJnBPnDhurRQcIlh/Nm+Jyos6rhfIEAj9EY/ScV/X4=

Adding V4L2 read-only control id for device id as hardware
does not support embedding the device-id in the USB device descriptors.

base-commit: 3e238417254bfdcc23fe207780b59cbb08656762

Signed-off-by: Dean Anderson <dean@sensoray.com>

---
 drivers/media/usb/s2255/s2255drv.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 3c2627712fe9..c2248bbc7840 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -40,7 +40,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 
-#define S2255_VERSION		"1.25.1"
+#define S2255_VERSION		"1.26.1"
 #define FIRMWARE_FILE_NAME "f2255usb.bin"
 
 /* default JPEG quality */
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
+#define V4L2_CID_S2255_DEVICEID (V4L2_CID_USER_S2255_BASE + 1)
 
 /* frame prefix size (sent once every frame) */
 #define PREFIX_SIZE		512
@@ -1232,6 +1234,37 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+/* deviceid/serial number is not used in usb device descriptors.
+ * returns device-id/serial number from device, 0 if none found.
+ */
+#define S2255_DEVICEID_NONE 0
+static int s2255_g_deviceid(struct s2255_dev *dev)
+{
+	u8 *outbuf;
+	int rc;
+	int deviceid = S2255_DEVICEID_NONE;
+#define S2255_I2C_SIZE     16
+	outbuf = kzalloc(S2255_I2C_SIZE * sizeof(u8), GFP_KERNEL);
+	if (outbuf == NULL)
+		return deviceid;
+#define S2255_I2C_SNDEV    0xa2
+#define S2255_I2C_SNOFFSET 0x1ff0
+#define S2255_USBVENDOR_READREG 0x22
+	rc = s2255_vendor_req(dev, S2255_USBVENDOR_READREG, S2255_I2C_SNOFFSET,
+			S2255_I2C_SNDEV >> 1, outbuf, S2255_I2C_SIZE, 0);
+	if (rc < 0)
+		goto exit_g_deviceid;
+
+	/* verify marker code */
+	if (*(__le32 *)outbuf != S2255_MARKER_FIRMWARE)
+		goto exit_g_deviceid;
+
+	deviceid = (outbuf[12] << 24) + (outbuf[13] << 16) + (outbuf[14] << 8) + outbuf[15];
+exit_g_deviceid:
+	kfree(outbuf);
+	return deviceid;
+}
+
 static int vidioc_g_jpegcomp(struct file *file, void *priv,
 			 struct v4l2_jpegcompression *jc)
 {
@@ -1581,6 +1614,17 @@ static const struct v4l2_ctrl_config color_filter_ctrl = {
 	.def = 1,
 };
 
+static struct v4l2_ctrl_config v4l2_ctrl_deviceid = {
+	.ops = &s2255_ctrl_ops,
+	.name = "Device ID",
+	.id = V4L2_CID_S2255_DEVICEID,
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.max = 0xffffffff,
+	.min = 0,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY,
+};
+
 static int s2255_probe_v4l(struct s2255_dev *dev)
 {
 	int ret;
@@ -1615,6 +1659,9 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 		    (dev->pid != 0x2257 || vc->idx <= 1))
 			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
 					     NULL);
+		v4l2_ctrl_deviceid.def = s2255_g_deviceid(dev);
+		v4l2_ctrl_new_custom(&vc->hdl, &v4l2_ctrl_deviceid,
+					NULL);
 		if (vc->hdl.error) {
 			ret = vc->hdl.error;
 			v4l2_ctrl_handler_free(&vc->hdl);
-- 
2.30.2


