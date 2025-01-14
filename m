Return-Path: <linux-media+bounces-24735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031DA11167
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882C47A39A1
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A4820F088;
	Tue, 14 Jan 2025 19:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9NYVKyn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4931120D50A
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884009; cv=none; b=oGa2PifuDsBu3m3DTj+MM/2c9drmNWkbSOY+wVvC94Wm49MEk/CrXzxqFL4vl1hGFUqucaFQtQydrRRcbPFbC4/eY/2kirOyDyGqZsTpmkSSItm88zdk/6wJee0ePfQ3OjjJGIF9HJlqMHC+fUsPyl/yILK7udvL4FedvG5yJCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884009; c=relaxed/simple;
	bh=xJqUFbKJjMAn0/Od9YpDhzFdLkz0P9My4LhrT0/sZDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmVE9O8jTQpF7PnQwsZvQmZLMfISSHZxxmYY3puBIDmfEF9obAE14gvmA10je5scz4XUpGm0xraMTk8fJ2+HPL0fNwvs+pAJ/0qqNUsIcoSjkO7kg6RILOeQ02BO2b9t7Vn9eFEbzQzV9/3Irun/T7VrLL/dl4OaWIRLzeNXNK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9NYVKyn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so7436575e9.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736884006; x=1737488806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67CHzqR0NGAhPXiF76xhJRPDghorG4lwSKb7EV1ANtM=;
        b=H9NYVKynn5lLJDSGnj73OWIKuOaZ7eyoEkhTtd4btR3n0Lhnmy/oY+nTc58co4QExi
         iCa9AOQldSCO0NXNiOqtb5vnDTtJdwTtxJkA0Nof0qAtx0+jKtiNIxH50LDBRzKIWB4S
         9lTiaRKW/d6Dc6B1mfqZtZdhhSSYzOtKBdggAbkC13AaHvZW1d8d+pWsXrfzo2+ka+/x
         NsXcHZLcDWOvLqgGflsp2Km5ixKwRZy8Lzrs3kz4XbJqeVvAXaT/Vm5iHTPLmPs4fKaB
         TiAQlCm55de2B9oc5h28pnJpZQ84oXXcvSmqNWjisGN+3TEvR1RzC4bLwQyT2aXbrysL
         hElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736884006; x=1737488806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67CHzqR0NGAhPXiF76xhJRPDghorG4lwSKb7EV1ANtM=;
        b=dgkX23jeNUVjvsBLbe3BPRyZonYcbaHwcUKCaJMq681axywhbb3YZhPUP5O+XWsyrL
         Ug0Xmc6saImRpGdfxKv2Atsd5LQ0czPvPmHDCYnivR2NMa7jd2SCKLGK04+A+I4yyBi0
         ZMtGXTBsxPfLUjima/oNOs379H5325LchsKLxXilLuKMRjEUCqxC321EWXujLsPm1SMI
         G8Ur5MfiErP0m0XMVEduSQGd2+hUxtxlH7Asjadgx0W1xfNgzUKnT7JU6LaTsVp21lBN
         I6wu2Abp449/6Nl4GK2eEuuHow5Bq0f9BINfjfOIdz6ITK9G+6JAj35TmkAEmeadrJdF
         bZzg==
X-Gm-Message-State: AOJu0Ywpet7ncfel/CBTHUhZHPX8+lyYXbOQ2BVgx93SxzA8OHcFg6EM
	8wQPtwZHSG4SnaIBJa19FstvVVK85dSjAuQIyjzYmXddwpL2OuCVdTVI0hB5qY4=
X-Gm-Gg: ASbGncuWARUhelAzvWIqTdlZYPkx8hmDqYcxwxv38Fm8k5IJjjnsOV0plvSHLEPTY/q
	+8wdGxL/KCOXzJt2dw65/TjDMoFzwDinR3K4Q5cvLYPjfm93Iltpd4jKQrKVFuKWpa0ZMEcnm0y
	LAf19OE0JlGIMWDSd5DoMiQnaJjzn1bd4WHyosv+qANIRCgNCLqPT+Xti9z40VRs+zKXxCuDUd4
	g0qqwy0mcGq+/fcMxz7y3MKeYiLEWJ9wB8kbSbT4RnTnAjK0o8TJtBfCV/PDbvMb1Fwt8je
X-Google-Smtp-Source: AGHT+IGPjDJ9m07byRLBjgx6tN+VSFCzyc8H9uuurwKNCKZBLybu1mumb2wfDdFAIncsm0+4iFtamQ==
X-Received: by 2002:a05:600c:19cc:b0:434:ff85:dd77 with SMTP id 5b1f17b1804b1-436e269be52mr95034245e9.3.1736884005536;
        Tue, 14 Jan 2025 11:46:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm184337515e9.28.2025.01.14.11.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:46:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 20:46:22 +0100
Subject: [PATCH 6/6] media: usb: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-media-v1-6-9316270aa65f@linaro.org>
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
In-Reply-To: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17702;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xJqUFbKJjMAn0/Od9YpDhzFdLkz0P9My4LhrT0/sZDc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhr8U5EAwq7CJAw0kU7bheXeNNv9XjDneSVs48
 8ehALCuaFKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4a/FAAKCRDBN2bmhouD
 1yAiD/9Cec70F5kbMxn8lPvkeMkaJKJUqZYPu//i6zaRPxb4YcRoEOLhy+0ggKMis23PmXCkVcj
 Ce7raDO3MQfuHD8Rrgl4YW0pD9GhBpzE0N7QcGIp/O+YAbPU8/N9zLskteUMsIx+nrDy1jEDmwH
 kXxdC8O2/KrcxF9MLSOTD0SZaM0QuIsprLG33ykle4O1vkWMAa6k4Lr6Klq3HvYYcVc7TBNL+jq
 EOxG/ckiDl/YDhK3M+tcUGA3KFRIVSuxQvOiLl+GDDHgCFBrp90CLDwiHsL+Py0dAd5+DaF85wz
 hb7vZP5lc3mKnIbkaOJwqYvvwcUA5fCsdYV/GXvHpWhyZ7ytIbTMC5DRzgmLVw/mssrXjiYuJ2Q
 BWlzn6GHz3HDClV6Fla43u6Ku8dl5UW2t+Za3zwzdT8au1P+ot5Km1RDBTPjzJwvSIu7Ygis9qo
 lyjhZpxEVScL7/5QmVFLjqm09nSSN/JTIzJI51MqSA2I3m6VmwbKI2kWTsv1FmRUGqIiavqblWX
 I8tWAKMTax8Dl8cskVWXXHoK7Fcs1UpsXNesjTaGCWB5gYutwnhpg/DQUwS8AtLfaruf08e80Sv
 wXf4ex76bVM/6JxlD1l0dqsjWSVfEOR+e7YQeqYR3jY0ZgKtVnYsdWOnJlxg4xanVRh0WA+19XP
 udK840QDoIGR1Ug==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c      | 5 +++--
 drivers/media/usb/cx231xx/cx231xx-video.c    | 5 +++--
 drivers/media/usb/dvb-usb-v2/az6007.c        | 5 +++--
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c  | 5 +++--
 drivers/media/usb/dvb-usb/af9005-fe.c        | 5 +++--
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c      | 7 ++++---
 drivers/media/usb/dvb-usb/opera1.c           | 9 +++++----
 drivers/media/usb/em28xx/em28xx-i2c.c        | 5 +++--
 drivers/media/usb/em28xx/em28xx-video.c      | 5 +++--
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c     | 3 ++-
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c | 3 ++-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c  | 6 +++---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c      | 7 ++++---
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c | 4 ++--
 14 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index 6da8e7943d94a38a8d38ec3944d80fedfb44f76b..abace421612c6d40a28ce4120a8fd03b2b024565 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
+#include <linux/string_choices.h>
 #include <media/v4l2-common.h>
 #include <media/tuner.h>
 
@@ -370,7 +371,7 @@ static int cx231xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 		addr = msgs[i].addr;
 
 		dprintk2(2, "%s %s addr=0x%x len=%d:",
-			 (msgs[i].flags & I2C_M_RD) ? "read" : "write",
+			 str_read_write(msgs[i].flags & I2C_M_RD),
 			 i == num - 1 ? "stop" : "nonstop", addr, msgs[i].len);
 		if (!msgs[i].len) {
 			/* no len: check only for device presence */
@@ -399,7 +400,7 @@ static int cx231xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 			/* read bytes */
 			dprintk2(2, "plus %s %s addr=0x%x len=%d:",
-				(msgs[i+1].flags & I2C_M_RD) ? "read" : "write",
+				str_read_write(msgs[i + 1].flags & I2C_M_RD),
 				i+1 == num - 1 ? "stop" : "nonstop", addr, msgs[i+1].len);
 			rc = cx231xx_i2c_recv_bytes_with_saddr(i2c_adap,
 							       &msgs[i],
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 2cd4e333bc4b012f97df98f8771f2508d81c3b3c..03a071834cb5b38fb6e0fbdac6825ebd3c03038d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -20,6 +20,7 @@
 #include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
@@ -141,14 +142,14 @@ static int cx231xx_enable_analog_tuner(struct cx231xx *dev)
 			dev_err(dev->dev,
 				"Couldn't change link %s->%s to %s. Error %d\n",
 				source->name, sink->name,
-				flags ? "enabled" : "disabled",
+				str_enabled_disabled(flags),
 				ret);
 			return ret;
 		} else
 			dev_dbg(dev->dev,
 				"link %s->%s was %s\n",
 				source->name, sink->name,
-				flags ? "ENABLED" : "disabled");
+				str_enabled_disabled(flags));
 	}
 #endif
 	return 0;
diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 2410054ddb2c345909fad792bd815e5a0584e7c3..53eadfb5bd49d58eaa331f49393107b8f4135990 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -15,6 +15,7 @@
 
 #include "drxk.h"
 #include "mt2063.h"
+#include <linux/string_choices.h>
 #include <media/dvb_ca_en50221.h>
 #include "dvb_usb.h"
 #include "cypress_firmware.h"
@@ -79,7 +80,7 @@ static int drxk_gate_ctrl(struct dvb_frontend *fe, int enable)
 	struct dvb_usb_adapter *adap = fe->sec_priv;
 	int status = 0;
 
-	pr_debug("%s: %s\n", __func__, enable ? "enable" : "disable");
+	pr_debug("%s: %s\n", __func__, str_enable_disable(enable));
 
 	if (!adap || !st)
 		return -EINVAL;
@@ -189,7 +190,7 @@ static int az6007_streaming_ctrl(struct dvb_frontend *fe, int onoff)
 {
 	struct dvb_usb_device *d = fe_to_d(fe);
 
-	pr_debug("%s: %s\n", __func__, onoff ? "enable" : "disable");
+	pr_debug("%s: %s\n", __func__, str_enable_disable(onoff));
 
 	return az6007_write(d, 0xbc, onoff, 0, NULL, 0);
 }
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8de1bb13fbecc110a33243161888d..1220283e59d3db25ec76a4a7ac5a5c32812e5947 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -7,6 +7,7 @@
  */
 
 #include "dvb_usb_common.h"
+#include <linux/string_choices.h>
 #include <media/media-device.h>
 
 static int dvb_usbv2_disable_rc_polling;
@@ -247,7 +248,7 @@ static int dvb_usb_start_feed(struct dvb_demux_feed *dvbdmxfeed)
 	dev_dbg(&d->udev->dev,
 			"%s: adap=%d active_fe=%d feed_type=%d setting pid [%s]: %04x (%04d) at index %d\n",
 			__func__, adap->id, adap->active_fe, dvbdmxfeed->type,
-			adap->pid_filtering ? "yes" : "no", dvbdmxfeed->pid,
+			str_yes_no(adap->pid_filtering), dvbdmxfeed->pid,
 			dvbdmxfeed->pid, dvbdmxfeed->index);
 
 	/* wait init is done */
@@ -334,7 +335,7 @@ static int dvb_usb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 	dev_dbg(&d->udev->dev,
 			"%s: adap=%d active_fe=%d feed_type=%d setting pid [%s]: %04x (%04d) at index %d\n",
 			__func__, adap->id, adap->active_fe, dvbdmxfeed->type,
-			adap->pid_filtering ? "yes" : "no", dvbdmxfeed->pid,
+			str_yes_no(adap->pid_filtering), dvbdmxfeed->pid,
 			dvbdmxfeed->pid, dvbdmxfeed->index);
 
 	if (adap->active_fe == -1)
diff --git a/drivers/media/usb/dvb-usb/af9005-fe.c b/drivers/media/usb/dvb-usb/af9005-fe.c
index 404e56b32145f1e629b08809ed866371b6efb0fa..d742fde9c1259930382c3d4688a64454be4bf863 100644
--- a/drivers/media/usb/dvb-usb/af9005-fe.c
+++ b/drivers/media/usb/dvb-usb/af9005-fe.c
@@ -12,6 +12,7 @@
 #include "af9005-script.h"
 #include "mt2060.h"
 #include "qt1010.h"
+#include <linux/string_choices.h>
 #include <asm/div64.h>
 
 struct af9005_fe_state {
@@ -787,7 +788,7 @@ static int af9005_fe_power(struct dvb_frontend *fe, int on)
 	struct af9005_fe_state *state = fe->demodulator_priv;
 	u8 temp = on;
 	int ret;
-	deb_info("power %s tuner\n", on ? "on" : "off");
+	deb_info("power %s tuner\n", str_on_off(on));
 	ret = af9005_send_command(state->d, 0x03, &temp, 1, NULL, 0);
 	return ret;
 }
@@ -1279,7 +1280,7 @@ static int af9005_fe_get_frontend(struct dvb_frontend *fe,
 	if (ret)
 		return ret;
 	/* if temp is set = high priority */
-	deb_info("PRIORITY %s\n", temp ? "high" : "low");
+	deb_info("PRIORITY %s\n", str_high_low(temp));
 
 	/* high coderate */
 	ret =
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 0a7f8ba9099261d057064120901abd9ada8f1b32..5ff3f71503889f3873e9eedee9118477c2474034 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -8,6 +8,7 @@
  * linux-dvb API.
  */
 #include "dvb-usb-common.h"
+#include <linux/string_choices.h>
 #include <media/media-device.h>
 
 /* does the complete input transfer handling */
@@ -44,9 +45,9 @@ static int dvb_usb_ctrl_feed(struct dvb_demux_feed *dvbdmxfeed, int onoff)
 
 	/* activate the pid on the device specific pid_filter */
 	deb_ts("setting pid (%s): %5d %04x at index %d '%s'\n",
-		adap->fe_adap[adap->active_fe].pid_filtering ?
-		"yes" : "no", dvbdmxfeed->pid, dvbdmxfeed->pid,
-		dvbdmxfeed->index, onoff ? "on" : "off");
+		str_yes_no(adap->fe_adap[adap->active_fe].pid_filtering),
+		dvbdmxfeed->pid, dvbdmxfeed->pid,
+		dvbdmxfeed->index, str_on_off(onoff));
 	if (adap->props.fe[adap->active_fe].caps & DVB_USB_ADAP_HAS_PID_FILTER &&
 		adap->fe_adap[adap->active_fe].pid_filtering &&
 		adap->props.fe[adap->active_fe].pid_filter != NULL)
diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index 268f05fc8691bcaecc16e02596212191ff242c76..05539133fff0b13fbd69eda49a623fe76aeacb06 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -9,6 +9,7 @@
 
 #define DVB_USB_LOG_PREFIX "opera"
 
+#include <linux/string_choices.h>
 #include "dvb-usb.h"
 #include "stv0299.h"
 
@@ -280,7 +281,7 @@ static int opera1_power_ctrl(struct dvb_usb_device *d, int onoff)
 	u8 val = onoff ? 0x01 : 0x00;
 
 	if (dvb_usb_opera1_debug)
-		info("power %s", onoff ? "on" : "off");
+		info("power %s", str_on_off(onoff));
 	return opera1_xilinx_rw(d->udev, 0xb7, val,
 				&val, 1, OPERA_WRITE_MSG);
 }
@@ -293,7 +294,7 @@ static int opera1_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 		{.addr = ADDR_B1A6_STREAM_CTRL,.buf = onoff ? buf_start : buf_stop,.len = 2},
 	};
 	if (dvb_usb_opera1_debug)
-		info("streaming %s", onoff ? "on" : "off");
+		info("streaming %s", str_on_off(onoff));
 	i2c_transfer(&adap->dev->i2c_adap, start_tuner, 1);
 	return 0;
 }
@@ -307,7 +308,7 @@ static int opera1_pid_filter(struct dvb_usb_adapter *adap, int index, u16 pid,
 	};
 	if (dvb_usb_opera1_debug)
 		info("pidfilter index: %d pid: %d %s", index, pid,
-			onoff ? "on" : "off");
+		     str_on_off(onoff));
 	b_pid[0] = (2 * index) + 4;
 	b_pid[1] = onoff ? (pid & 0xff) : (0x00);
 	b_pid[2] = onoff ? ((pid >> 8) & 0xff) : (0x00);
@@ -323,7 +324,7 @@ static int opera1_pid_filter_control(struct dvb_usb_adapter *adap, int onoff)
 		{.addr = ADDR_B1A6_STREAM_CTRL,.buf = b_pid,.len = 3},
 	};
 	if (dvb_usb_opera1_debug)
-		info("%s hw-pidfilter", onoff ? "enable" : "disable");
+		info("%s hw-pidfilter", str_enable_disable(onoff));
 	for (; u < 0x7e; u += 2) {
 		b_pid[0] = u;
 		b_pid[1] = 0;
diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index a7eb11f7fb349114172cba5e02d1553ecbede2b2..c4af40ebc885a910ba1a3c95e7e80b9c7726576d 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -15,6 +15,7 @@
 #include <linux/usb.h>
 #include <linux/i2c.h>
 #include <linux/jiffies.h>
+#include <linux/string_choices.h>
 
 #include "xc2028.h"
 #include <media/v4l2-common.h>
@@ -576,7 +577,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 			goto error;
 
 		dprintk(2, "%s %s addr=%02x len=%d: %*ph\n",
-			(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+			str_read_write(msgs[i].flags & I2C_M_RD),
 			i == num - 1 ? "stop" : "nonstop",
 			addr, msgs[i].len,
 			msgs[i].len, msgs[i].buf);
@@ -587,7 +588,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 error:
 	dprintk(2, "%s %s addr=%02x len=%d: %sERROR: %i\n",
-		(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+		str_read_write(msgs[i].flags & I2C_M_RD),
 		i == num - 1 ? "stop" : "nonstop",
 		addr, msgs[i].len,
 		(rc == -ENODEV) ? "no device " : "",
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 66c09bc6d59ed29328c081c03e0084877ea8d7d0..1d0bc7d7d96220abb21df54ac25f472d17826441 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -24,6 +24,7 @@
 #include <linux/mm.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "em28xx-v4l.h"
 #include <media/v4l2-common.h>
@@ -938,14 +939,14 @@ static int em28xx_enable_analog_tuner(struct em28xx *dev)
 			dev_err(&dev->intf->dev,
 				"Couldn't change link %s->%s to %s. Error %d\n",
 				source->name, sink->name,
-				flags ? "enabled" : "disabled",
+				str_enabled_disabled(flags),
 				ret);
 			return ret;
 		}
 
 		em28xx_videodbg("link %s->%s was %s\n",
 				source->name, sink->name,
-				flags ? "ENABLED" : "disabled");
+				str_enabled_disabled(flags));
 	}
 #endif
 	return 0;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
index 8ae3ad80cccb6826c70baff6fbfca7e1ce027a1c..5ae285042752f4e99b1b7155f8ddabd195adb97c 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
@@ -8,6 +8,7 @@
 #include "pvrusb2-hdw-internal.h"
 #include <linux/errno.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/mutex.h>
 
 
@@ -521,7 +522,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
 		*len = scnprintf(buf,maxlen,"%d",val);
 		ret = 0;
 	} else if (cptr->info->type == pvr2_ctl_bool) {
-		*len = scnprintf(buf,maxlen,"%s",val ? "true" : "false");
+		*len = scnprintf(buf, maxlen, "%s", str_true_false(val));
 		ret = 0;
 	} else if (cptr->info->type == pvr2_ctl_enum) {
 		const char * const *names;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
index 81d711269ab57308493f8bd22f2f88b8d80b606b..9e4eb03133c9dce6cfde3790f69d2fc0a0cbe10a 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include "pvrusb2-debugifc.h"
 #include "pvrusb2-hdw.h"
 #include "pvrusb2-debug.h"
@@ -148,7 +149,7 @@ int pvr2_debugifc_print_status(struct pvr2_hdw *hdw,
 	bcnt += ccnt; acnt -= ccnt; buf += ccnt;
 
 	ccnt = scnprintf(buf,acnt,"Streaming is %s\n",
-			 pvr2_hdw_get_streaming(hdw) ? "on" : "off");
+			 str_on_off(pvr2_hdw_get_streaming(hdw)));
 	bcnt += ccnt; acnt -= ccnt; buf += ccnt;
 
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
index c8102772344b8ea24c292e6b33a1947828bdcf69..adf5fcbb291db86906157c1ddda4db5c886f5478 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
@@ -7,6 +7,7 @@
 
 #include <linux/device.h>   // for linux/firmware.h
 #include <linux/firmware.h>
+#include <linux/string_choices.h>
 #include "pvrusb2-util.h"
 #include "pvrusb2-encoder.h"
 #include "pvrusb2-hdw-internal.h"
@@ -262,14 +263,13 @@ rdData[0]);
 			pvr2_trace(PVR2_TRACE_STBITS,
 				   "State bit %s <-- %s",
 				   "state_encoder_ok",
-				   (hdw->state_encoder_ok ? "true" : "false"));
+				   str_true_false(hdw->state_encoder_ok));
 			if (hdw->state_encoder_runok) {
 				hdw->state_encoder_runok = 0;
 				pvr2_trace(PVR2_TRACE_STBITS,
 				   "State bit %s <-- %s",
 					   "state_encoder_runok",
-					   (hdw->state_encoder_runok ?
-					    "true" : "false"));
+					   str_true_false(hdw->state_encoder_runok));
 			}
 			pvr2_trace(
 				PVR2_TRACE_ERROR_LEGS,
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 29cc207194b9fa55d13ad5d25607c75432de7cdc..79d2665d174c74771627c44d182ed1b8492141e1 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -6,6 +6,7 @@
 
 #include <linux/errno.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/firmware.h>
@@ -338,7 +339,7 @@ static void trace_stbit(const char *name,int val)
 {
 	pvr2_trace(PVR2_TRACE_STBITS,
 		   "State bit %s <-- %s",
-		   name,(val ? "true" : "false"));
+		   name, str_true_false(val));
 }
 
 static int ctrl_channelfreq_get(struct pvr2_ctrl *cptr,int *vp)
@@ -1660,7 +1661,7 @@ static int pvr2_decoder_enable(struct pvr2_hdw *hdw,int enablefl)
 	   anyway, just in case somebody else wants to hear the
 	   command... */
 	pvr2_trace(PVR2_TRACE_CHIPS, "subdev v4l2 stream=%s",
-		   (enablefl ? "on" : "off"));
+		   str_on_off(enablefl));
 	v4l2_device_call_all(&hdw->v4l2_dev, 0, video, s_stream, enablefl);
 	v4l2_device_call_all(&hdw->v4l2_dev, 0, audio, s_stream, enablefl);
 	if (hdw->decoder_client_id) {
@@ -1724,7 +1725,7 @@ int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
 		hdw->state_pipeline_req = enable_flag != 0;
 		pvr2_trace(PVR2_TRACE_START_STOP,
 			   "/*--TRACE_STREAM--*/ %s",
-			   enable_flag ? "enable" : "disable");
+			   str_enable_disable(enable_flag));
 	}
 	pvr2_hdw_state_sched(hdw);
 	LOCK_GIVE(hdw->big_lock);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
index 63db04fe12d39d599861204d98fecc5b2fc3dd58..c50c6a7bffffe5e995926ecf35be9177f7179407 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
@@ -6,6 +6,7 @@
 
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/string_choices.h>
 #include <media/i2c/ir-kbd-i2c.h>
 #include "pvrusb2-i2c-core.h"
 #include "pvrusb2-hdw-internal.h"
@@ -472,8 +473,7 @@ static int pvr2_i2c_xfer(struct i2c_adapter *i2c_adap,
 			       idx+1,num,
 			       msgs[idx].addr,
 			       cnt,
-			       (msgs[idx].flags & I2C_M_RD ?
-				"read" : "write"));
+			       str_read_write(msgs[idx].flags & I2C_M_RD));
 			if ((ret > 0) || !(msgs[idx].flags & I2C_M_RD)) {
 				if (cnt > 8) cnt = 8;
 				pr_cont(" [");

-- 
2.43.0


