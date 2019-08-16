Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2F28FB2A
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 08:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfHPGiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 02:38:20 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45843 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725945AbfHPGiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 02:38:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yVsLh0XayzaKOyVsPhl5SQ; Fri, 16 Aug 2019 08:38:17 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] gspca: zero usb_buf on error
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <93b16731-3504-30fc-48da-abf53fbc4303@xs4all.nl>
Date:   Fri, 16 Aug 2019 08:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPyJIJMUUP1v3imHFVDBMk0XfiXYzWlS3z6ZjxfGEgI7Liipgdcz9QiW27G6KVRpIUeRV9FwEFPsrGtA31DRmcEoeKt9mITsg31JceubydlNYpT75COA
 NP3lZHrGextL7pQI23h1S9w1+Ui504t/e+0FksJymwIguzz0h2CKDoDX691QQtQigWPaf9AibFJQgA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If reg_r() fails, then gspca_dev->usb_buf was left uninitialized,
and some drivers used the contents of that buffer in logic.

This caused several syzbot errors:

https://syzkaller.appspot.com/bug?extid=397fd082ce5143e2f67d
https://syzkaller.appspot.com/bug?extid=1a35278dd0ebfb3a038a
https://syzkaller.appspot.com/bug?extid=06ddf1788cfd048c5e82

I analyzed the gspca drivers and zeroed the buffer where needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-and-tested-by: syzbot+1a35278dd0ebfb3a038a@syzkaller.appspotmail.com
Reported-and-tested-by: syzbot+397fd082ce5143e2f67d@syzkaller.appspotmail.com
Reported-and-tested-by: syzbot+06ddf1788cfd048c5e82@syzkaller.appspotmail.com
---
Changes in v2: use USB_BUF_SZ instead of sizeof(gspca_dev->usb_buf) since
usb_buf is a pointer.
---
diff --git a/drivers/media/usb/gspca/konica.c b/drivers/media/usb/gspca/konica.c
index d8e40137a204..53db9a2895ea 100644
--- a/drivers/media/usb/gspca/konica.c
+++ b/drivers/media/usb/gspca/konica.c
@@ -114,6 +114,11 @@ static void reg_r(struct gspca_dev *gspca_dev, u16 value, u16 index)
 	if (ret < 0) {
 		pr_err("reg_r err %d\n", ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, 2);
 	}
 }

diff --git a/drivers/media/usb/gspca/nw80x.c b/drivers/media/usb/gspca/nw80x.c
index 59649704beba..db3e1657670b 100644
--- a/drivers/media/usb/gspca/nw80x.c
+++ b/drivers/media/usb/gspca/nw80x.c
@@ -1572,6 +1572,11 @@ static void reg_r(struct gspca_dev *gspca_dev,
 	if (ret < 0) {
 		pr_err("reg_r err %d\n", ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, USB_BUF_SZ);
 		return;
 	}
 	if (len == 1)
diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
index cfb1f53bc17e..f417dfc0b872 100644
--- a/drivers/media/usb/gspca/ov519.c
+++ b/drivers/media/usb/gspca/ov519.c
@@ -2073,6 +2073,11 @@ static int reg_r(struct sd *sd, u16 index)
 	} else {
 		gspca_err(gspca_dev, "reg_r %02x failed %d\n", index, ret);
 		sd->gspca_dev.usb_err = ret;
+		/*
+		 * Make sure the result is zeroed to avoid uninitialized
+		 * values.
+		 */
+		gspca_dev->usb_buf[0] = 0;
 	}

 	return ret;
@@ -2101,6 +2106,11 @@ static int reg_r8(struct sd *sd,
 	} else {
 		gspca_err(gspca_dev, "reg_r8 %02x failed %d\n", index, ret);
 		sd->gspca_dev.usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, 8);
 	}

 	return ret;
diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
index 56521c991db4..185c1f10fb30 100644
--- a/drivers/media/usb/gspca/ov534.c
+++ b/drivers/media/usb/gspca/ov534.c
@@ -693,6 +693,11 @@ static u8 ov534_reg_read(struct gspca_dev *gspca_dev, u16 reg)
 	if (ret < 0) {
 		pr_err("read failed %d\n", ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the result is zeroed to avoid uninitialized
+		 * values.
+		 */
+		gspca_dev->usb_buf[0] = 0;
 	}
 	return gspca_dev->usb_buf[0];
 }
diff --git a/drivers/media/usb/gspca/ov534_9.c b/drivers/media/usb/gspca/ov534_9.c
index 867f860a9650..91efc650cf76 100644
--- a/drivers/media/usb/gspca/ov534_9.c
+++ b/drivers/media/usb/gspca/ov534_9.c
@@ -1145,6 +1145,7 @@ static u8 reg_r(struct gspca_dev *gspca_dev, u16 reg)
 	if (ret < 0) {
 		pr_err("reg_r err %d\n", ret);
 		gspca_dev->usb_err = ret;
+		return 0;
 	}
 	return gspca_dev->usb_buf[0];
 }
diff --git a/drivers/media/usb/gspca/se401.c b/drivers/media/usb/gspca/se401.c
index 061deee138c3..e087cfb5980b 100644
--- a/drivers/media/usb/gspca/se401.c
+++ b/drivers/media/usb/gspca/se401.c
@@ -101,6 +101,11 @@ static void se401_read_req(struct gspca_dev *gspca_dev, u16 req, int silent)
 			pr_err("read req failed req %#04x error %d\n",
 			       req, err);
 		gspca_dev->usb_err = err;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, READ_REQ_SIZE);
 	}
 }

diff --git a/drivers/media/usb/gspca/sn9c20x.c b/drivers/media/usb/gspca/sn9c20x.c
index b43f89fee6c1..490af88e88ac 100644
--- a/drivers/media/usb/gspca/sn9c20x.c
+++ b/drivers/media/usb/gspca/sn9c20x.c
@@ -909,6 +909,11 @@ static void reg_r(struct gspca_dev *gspca_dev, u16 reg, u16 length)
 	if (unlikely(result < 0 || result != length)) {
 		pr_err("Read register %02x failed %d\n", reg, result);
 		gspca_dev->usb_err = result;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, USB_BUF_SZ);
 	}
 }

diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
index 046fc2c2a135..4d655e2da9cb 100644
--- a/drivers/media/usb/gspca/sonixb.c
+++ b/drivers/media/usb/gspca/sonixb.c
@@ -453,6 +453,11 @@ static void reg_r(struct gspca_dev *gspca_dev,
 		dev_err(gspca_dev->v4l2_dev.dev,
 			"Error reading register %02x: %d\n", value, res);
 		gspca_dev->usb_err = res;
+		/*
+		 * Make sure the result is zeroed to avoid uninitialized
+		 * values.
+		 */
+		gspca_dev->usb_buf[0] = 0;
 	}
 }

diff --git a/drivers/media/usb/gspca/sonixj.c b/drivers/media/usb/gspca/sonixj.c
index 50a6c8425827..acf931a2bf1f 100644
--- a/drivers/media/usb/gspca/sonixj.c
+++ b/drivers/media/usb/gspca/sonixj.c
@@ -1162,6 +1162,11 @@ static void reg_r(struct gspca_dev *gspca_dev,
 	if (ret < 0) {
 		pr_err("reg_r err %d\n", ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, USB_BUF_SZ);
 	}
 }

diff --git a/drivers/media/usb/gspca/spca1528.c b/drivers/media/usb/gspca/spca1528.c
index 2ae03b60163f..ec1811895f85 100644
--- a/drivers/media/usb/gspca/spca1528.c
+++ b/drivers/media/usb/gspca/spca1528.c
@@ -71,6 +71,11 @@ static void reg_r(struct gspca_dev *gspca_dev,
 	if (ret < 0) {
 		pr_err("reg_r err %d\n", ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, USB_BUF_SZ);
 	}
 }

diff --git a/drivers/media/usb/gspca/sq930x.c b/drivers/media/usb/gspca/sq930x.c
index d1ba0888d798..cd9bf31ed437 100644
--- a/drivers/media/usb/gspca/sq930x.c
+++ b/drivers/media/usb/gspca/sq930x.c
@@ -425,6 +425,11 @@ static void reg_r(struct gspca_dev *gspca_dev,
 	if (ret < 0) {
 		pr_err("reg_r %04x failed %d\n", value, ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, USB_BUF_SZ);
 	}
 }

diff --git a/drivers/media/usb/gspca/sunplus.c b/drivers/media/usb/gspca/sunplus.c
index d0ddfa957ca9..0648d0db5515 100644
--- a/drivers/media/usb/gspca/sunplus.c
+++ b/drivers/media/usb/gspca/sunplus.c
@@ -255,6 +255,11 @@ static void reg_r(struct gspca_dev *gspca_dev,
 	if (ret < 0) {
 		pr_err("reg_r err %d\n", ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, USB_BUF_SZ);
 	}
 }

diff --git a/drivers/media/usb/gspca/vc032x.c b/drivers/media/usb/gspca/vc032x.c
index 588a847ea483..e652a6becb3e 100644
--- a/drivers/media/usb/gspca/vc032x.c
+++ b/drivers/media/usb/gspca/vc032x.c
@@ -2906,6 +2906,11 @@ static void reg_r_i(struct gspca_dev *gspca_dev,
 	if (ret < 0) {
 		pr_err("reg_r err %d\n", ret);
 		gspca_dev->usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(gspca_dev->usb_buf, 0, USB_BUF_SZ);
 	}
 }
 static void reg_r(struct gspca_dev *gspca_dev,
diff --git a/drivers/media/usb/gspca/w996Xcf.c b/drivers/media/usb/gspca/w996Xcf.c
index 16b679c2de21..a8350ee9712f 100644
--- a/drivers/media/usb/gspca/w996Xcf.c
+++ b/drivers/media/usb/gspca/w996Xcf.c
@@ -133,6 +133,11 @@ static int w9968cf_read_sb(struct sd *sd)
 	} else {
 		pr_err("Read SB reg [01] failed\n");
 		sd->gspca_dev.usb_err = ret;
+		/*
+		 * Make sure the buffer is zeroed to avoid uninitialized
+		 * values.
+		 */
+		memset(sd->gspca_dev.usb_buf, 0, 2);
 	}

 	udelay(W9968CF_I2C_BUS_DELAY);
