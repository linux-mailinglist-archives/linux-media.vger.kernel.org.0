Return-Path: <linux-media+bounces-24732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3CA11161
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BD5A1889315
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6A820CCD9;
	Tue, 14 Jan 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxCwXJ5o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83120C037
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884005; cv=none; b=FZN0bGArZEUf/hmTJqe925MI+4Oexl8XFPgok9vwd+al5VTM0nag1CP/EXiv5kb94wmOCIFAeWFrXYg3RO6iKUdGuRpRqZSVmPYo6yZYGUtQvJAxdwh7JpiTDMHzoLPF1NCfXEVORoFICB6TXAHLcQBpdKCWKv4qKbRNtyfonRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884005; c=relaxed/simple;
	bh=WbLymYMShlzUKl2D3s6BMuVinKFHumRl83lJ3jM2rGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dpw8I+kfCTrpnHc3xH6PBcsgbtYAe0fZvhvbwbWPgFjAsJFgK215hc/kJNoB7EteVo+YOyUnWvj+vpqoFjPiZPGAExiKwLdS35ctAVE2sJPok7eOqHH/2BvU5eEIUxcnHjUG2DbcwMWtNGuWA7lGDiUl10DG4eYg0wl90R++DlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxCwXJ5o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363299010dso6378725e9.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 11:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736884001; x=1737488801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW1RPdJO28XgohYSkXkEoEhTdTmjERSuMwVKq1h1f3I=;
        b=oxCwXJ5oLOJk6ZEPX8t6Ywv9/X/NT5z2VuU925tm5Fzz4qfIMyU8ErE0kL8Qvjrn6V
         jrJo7s/jxMVlzOhs16/Bh7GvYdsprCv7p5KWOyTNmCIrPVgHX+v+aXp/YikkQp3Yw8aB
         3W7zW40mX/kf41K/CnV4gk02o/qp9yb93PAkjOgpJ3xg+KSWc4yIUwbfQ0Nx5FcWgEDa
         wI/VOJDpiJDxm4bZ/BmQhSYsnVXYvLTx5iBL7Sfqi9dpWs7OzO5x48wLka6Kpn2re63w
         iyt/uduO5BKI2uCF3pQWwlFcAGT/Lg3z6msbzrfv5uJfHLRf1xETCmWyth11cI8jHJyB
         pE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736884001; x=1737488801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW1RPdJO28XgohYSkXkEoEhTdTmjERSuMwVKq1h1f3I=;
        b=Ve+TArSCAyv2fvcB5cXdgOFg0/ebEZD5TNTYtkivVRtJtvm3ACOqPlseKsa4nBsKjZ
         UiTQ8Q1SoMp/acg66BPzYZ3As+Gw6ZTW0I85CnY6lrm0CKcKlKWKhPF9g68CjIKPJ2Qw
         mTkOhqXuQbktlxwhJiA+yNN74nij6bJ5nrh8Qsx4Pz4E/WYvJtS/wmiIajPkmIuyN/eA
         xpmvrvJ6pdUm3CdX+EqXZe4mTpPzfhqEMl9WPURwmelPrzKi8TqGNWt+hYuB1YrY+lJ3
         aFhQHH2WgIbI6F9Y5dqAIKBnNwnN9Qy52Cv74bfl4g5BmualVWRKtXY5Z8k0U97ImII9
         e+5w==
X-Gm-Message-State: AOJu0YxtGkx/GgFC2s6FdjLHXZa9I4JVLBtjTZKMRR5qSgwZ24gi4K3v
	q3Wssp0fUCs6U4OTMrE5/+qytIUIAMkZJHaf98jjcJGf46w5vnBxd+oPMvrZX4M=
X-Gm-Gg: ASbGncvGCIJOTS4FKghzjRFppJflVRAJmzFDUUqmAIvIhZ+fqilZBzv+te4DYdVPqkj
	O+O4yLY9HbQalFX83fRkh+YhPL1skBpS4dTXkUSkiuyVTFRRuzMuz2grNBiCc16RldtJTuFekcC
	ohRg80N0+KY2kQhjvbc71OQrXDkRvYG3/S0BR3n0hRHko4/Rg1BZB3qmr/wfo8oYUS6PLj/p9Sz
	YN4HhwpynnR/gvgsnVjPt1Rklp8en/wWbiWd3VT7+E9+sOnhXqUjUX3XaTXNbOSPhb3M4A/
X-Google-Smtp-Source: AGHT+IGGG5GPUhMo1YJf0Z9vXxXLjktJfiE6m89IiYFvnQlQEPy8Ey1Xhvo+Kexsjl7OSohZcbwJpA==
X-Received: by 2002:a05:600c:4e52:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-436eba35780mr82786225e9.3.1736884000979;
        Tue, 14 Jan 2025 11:46:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm184337515e9.28.2025.01.14.11.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:46:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 20:46:20 +0100
Subject: [PATCH 4/6] media: pci: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-media-v1-4-9316270aa65f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18328;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WbLymYMShlzUKl2D3s6BMuVinKFHumRl83lJ3jM2rGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhr8SZ3nNtwMjkF+RaV9wL2nhTZvxvg9kpg65C
 1b37w46FHqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4a/EgAKCRDBN2bmhouD
 16UUD/0Vf5yzQubPciAGEQ5MQ4cu7mYiBSfcPM18nfEu1AuCnN2OTZ3AuaIKrsIsHj4l3q6t5v/
 h7UfNhL36kFAjwKtZugGN4Ijsf1xmDauFQMukuGki2+cXwFZJBs2mC+UnXAZJ94jYmWrSoCc8e4
 g/ZmyKbgM7pMWxgraymA6VJj9InTaWcB4rHoDHaCsmlde7/vFBycWSs8KMe6ajog91fmSjSKNSJ
 f0oGe74Tka2oLNVx6J7hgQUSbzSvJ6VYi25VKivqb7RIAlsOmmIyAPl9p74iUYnh/EyVAn2BtA8
 NZg0N5TwmBvB1XGK6V9C5i+JFnGGOYQj7mH+ywW9CpEflz7IMVZFyCMZVxe7Y2KJzywcvWobj9z
 ZGqeCSu+sEfQss6sJIkjWpjogchvhUS4GND39W9mlopvY6Btw20EyBmETzr+sSMuaQRMaMMGvdt
 9Qh7Xctu4EaJyCGPLVRcf6AEOtoqAQR0IQb06Ie6NUCH1MCsfgTX2xzXQSLc2gwfnob+mXnS2l6
 RnFfMCBKFET/LHj80Jxal6JkLWiT7eOuveAl8Q8PyIKcloS7ipAVLwPVYySrlNOUyji0Ojj8wpp
 wfPHJ2TyxgJHb/CzABCfD1g+haZsG34lGBLRIsRS+ER7cTkWoZJabs1JGuRj5BHwWVmypFUkpOc
 0oYR9VK6HCtuF0Q==
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
 drivers/media/pci/bt8xx/bttv-cards.c          | 17 ++++++------
 drivers/media/pci/bt8xx/bttv-driver.c         |  7 +++--
 drivers/media/pci/cobalt/cobalt-driver.c      |  3 ++-
 drivers/media/pci/cx18/cx18-av-core.c         |  5 ++--
 drivers/media/pci/cx23885/altera-ci.c         |  3 ++-
 drivers/media/pci/cx23885/cimax2.c            |  3 ++-
 drivers/media/pci/cx23885/cx23888-ir.c        | 37 ++++++++++++++-------------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  3 ++-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  3 ++-
 drivers/media/pci/saa7134/saa7134-cards.c     |  4 +--
 drivers/media/pci/saa7134/saa7134-dvb.c       |  3 ++-
 drivers/media/pci/saa7134/saa7134-input.c     |  7 ++---
 drivers/media/pci/saa7134/saa7134-video.c     |  3 ++-
 13 files changed, 54 insertions(+), 44 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
index 365b04e5ae4d27e7f7b092ce69575d938381570c..5d1b08aae077090221d7a284a3614c12db9dc495 100644
--- a/drivers/media/pci/bt8xx/bttv-cards.c
+++ b/drivers/media/pci/bt8xx/bttv-cards.c
@@ -20,6 +20,7 @@
 #include <linux/kmod.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/string_choices.h>
 #include <linux/vmalloc.h>
 #include <linux/firmware.h>
 #include <net/checksum.h>
@@ -3036,12 +3037,12 @@ static void flyvideo_gpio(struct bttv *btv)
 		tuner_type = TUNER_ABSENT; /* No tuner present */
 
 	pr_info("%d: FlyVideo Radio=%s RemoteControl=%s Tuner=%d gpio=0x%06x\n",
-		btv->c.nr, has_radio ? "yes" : "no",
-		has_remote ? "yes" : "no", tuner_type, gpio);
+		btv->c.nr, str_yes_no(has_radio),
+		str_yes_no(has_remote), tuner_type, gpio);
 	pr_info("%d: FlyVideo  LR90=%s tda9821/tda9820=%s capture_only=%s\n",
-		btv->c.nr, is_lr90 ? "yes" : "no",
-		has_tda9820_tda9821 ? "yes" : "no",
-		is_capture_only ? "yes" : "no");
+		btv->c.nr, str_yes_no(is_lr90),
+		str_yes_no(has_tda9820_tda9821),
+		str_yes_no(is_capture_only));
 
 	if (tuner_type != UNSET) /* only set if known tuner autodetected, else let insmod option through */
 		btv->tuner_type = tuner_type;
@@ -3137,7 +3138,7 @@ static void miro_pinnacle_gpio(struct bttv *btv)
 		if (-1 != msp)
 			btv->c.type = BTTV_BOARD_PINNACLEPRO;
 		pr_info("%d: pinnacle/mt: id=%d info=\"%s\" radio=%s\n",
-			btv->c.nr, id, info, btv->has_radio ? "yes" : "no");
+			btv->c.nr, id, info, str_yes_no(btv->has_radio));
 		btv->tuner_type = TUNER_MT2032;
 	}
 }
@@ -4077,8 +4078,8 @@ static void avermedia_eeprom(struct bttv *btv)
 	} else
 		pr_cont("Unknown type");
 	pr_cont(" radio:%s remote control:%s\n",
-	       tuner_tv_fm     ? "yes" : "no",
-	       btv->has_remote ? "yes" : "no");
+	       str_yes_no(tuner_tv_fm),
+	       str_yes_no(btv->has_remote));
 }
 
 /*
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 2782832f5eb8f272cf9acf29d7b4c31620c99227..33921a636b86d9eccf5fbd9792e3fe716de5c65a 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -32,6 +32,7 @@
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
+#include <linux/string_choices.h>
 #include <linux/interrupt.h>
 #include <linux/kdev_t.h>
 #include "bttvp.h"
@@ -2983,12 +2984,10 @@ static irqreturn_t bttv_irq(int irq, void *dev_id)
 			bttv_print_irqbits(stat,astat);
 			if (stat & BT848_INT_HLOCK)
 				pr_cont("   HLOC => %s",
-					dstat & BT848_DSTATUS_HLOC
-					? "yes" : "no");
+					str_yes_no(dstat & BT848_DSTATUS_HLOC));
 			if (stat & BT848_INT_VPRES)
 				pr_cont("   PRES => %s",
-					dstat & BT848_DSTATUS_PRES
-					? "yes" : "no");
+					str_yes_no(dstat & BT848_DSTATUS_PRES));
 			if (stat & BT848_INT_FMTCHG)
 				pr_cont("   NUML => %s",
 					dstat & BT848_DSTATUS_NUML
diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 39e25cc53edb976795319c63c91164bca31edc6f..7fadf588a20c033e80686d02ca79b8b6a16713aa 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <media/i2c/adv7604.h>
 #include <media/i2c/adv7842.h>
 #include <media/i2c/adv7511.h>
@@ -260,7 +261,7 @@ static void msi_config_show(struct cobalt *cobalt, struct pci_dev *pci_dev)
 	u32 adrs_l, adrs_h;
 
 	pci_read_config_word(pci_dev, 0x52, &ctrl);
-	cobalt_info("MSI %s\n", ctrl & 1 ? "enable" : "disable");
+	cobalt_info("MSI %s\n", str_enable_disable(ctrl & 1));
 	cobalt_info("MSI multiple message: Capable %u. Enable %u\n",
 		    (1 << ((ctrl >> 1) & 7)), (1 << ((ctrl >> 4) & 7)));
 	if (ctrl & 0x80)
diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index ee6e71157786ed04ddc5228dac1608bfdf56a7da..ad7bb4d9a8fa78d726f9892bf94be4c56747cc82 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -8,6 +8,7 @@
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
+#include <linux/string_choices.h>
 #include "cx18-driver.h"
 #include "cx18-io.h"
 #include "cx18-cards.h"
@@ -1010,7 +1011,7 @@ static int cx18_av_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
 
-	CX18_DEBUG_INFO_DEV(sd, "%s output\n", enable ? "enable" : "disable");
+	CX18_DEBUG_INFO_DEV(sd, "%s output\n", str_enable_disable(enable));
 	if (enable) {
 		cx18_av_write(cx, 0x115, 0x8c);
 		cx18_av_write(cx, 0x116, 0x07);
@@ -1115,7 +1116,7 @@ static void log_audio_status(struct cx18 *cx)
 	}
 	CX18_INFO_DEV(sd, "Detected audio standard:   %s\n", p);
 	CX18_INFO_DEV(sd, "Audio muted:               %s\n",
-		      (mute_ctl & 0x2) ? "yes" : "no");
+		      str_yes_no(mute_ctl & 0x2));
 	CX18_INFO_DEV(sd, "Audio microcontroller:     %s\n",
 		      (download_ctl & 0x10) ? "running" : "stopped");
 
diff --git a/drivers/media/pci/cx23885/altera-ci.c b/drivers/media/pci/cx23885/altera-ci.c
index 0dc348215b72d0666fd43ddc87629441784484ab..cf490d2bd476e641a163ca5c079112f90f4ee916 100644
--- a/drivers/media/pci/cx23885/altera-ci.c
+++ b/drivers/media/pci/cx23885/altera-ci.c
@@ -41,6 +41,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/string_choices.h>
 #include <media/dvb_demux.h>
 #include <media/dvb_frontend.h>
 #include "altera-ci.h"
@@ -282,7 +283,7 @@ static int altera_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 	mutex_unlock(&inter->fpga_mutex);
 
 	ci_dbg_print("%s: %s: addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", addr,
+			str_read_write(read), addr,
 			(flag == NETUP_CI_FLG_CTL) ? "ctl" : "mem",
 			(read) ? mem : val);
 
diff --git a/drivers/media/pci/cx23885/cimax2.c b/drivers/media/pci/cx23885/cimax2.c
index 06e41f92092dd0283bc04aeef58a207a18c962bc..8d76b436dea2f598a48c166bfadbaa3bb604c30f 100644
--- a/drivers/media/pci/cx23885/cimax2.c
+++ b/drivers/media/pci/cx23885/cimax2.c
@@ -11,6 +11,7 @@
 
 #include "cx23885.h"
 #include "cimax2.h"
+#include <linux/string_choices.h>
 #include <media/dvb_ca_en50221.h>
 
 /* Max transfer size done by I2C transfer functions */
@@ -224,7 +225,7 @@ static int netup_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 			return -EREMOTEIO;
 
 	ci_dbg_print("%s: %s: chipaddr=[0x%x] addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", state->ci_i2c_addr, addr,
+			str_read_write(read), state->ci_i2c_addr, addr,
 			(flag == NETUP_CI_CTL) ? "ctl" : "mem",
 			(read) ? mem : data);
 
diff --git a/drivers/media/pci/cx23885/cx23888-ir.c b/drivers/media/pci/cx23885/cx23888-ir.c
index 222d04421468e998dd02fdcf0784bce9fb7f2794..8d24f059cc8cc5f6dcebc229f0f76e9336ac6ff1 100644
--- a/drivers/media/pci/cx23885/cx23888-ir.c
+++ b/drivers/media/pci/cx23885/cx23888-ir.c
@@ -12,6 +12,7 @@
 
 #include <linux/kfifo.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-device.h>
 #include <media/rc-core.h>
@@ -930,11 +931,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "IR Receiver:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_RXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_RXE));
 	v4l2_info(sd, "\tDemodulation from a carrier:       %s\n",
-		  cntrl & CNTRL_DMD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_DMD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_RFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_RFE));
 	switch (cntrl & CNTRL_EDG) {
 	case CNTRL_EDG_NONE:
 		s = "disabled";
@@ -993,37 +994,37 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, rxclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, rxclk));
 	v4l2_info(sd, "\tLow pass filter:                   %s\n",
-		  filtr ? "enabled" : "disabled");
+		  str_enabled_disabled(filtr));
 	if (filtr)
 		v4l2_info(sd, "\tMin acceptable pulse width (LPF):  %u us, %u ns\n",
 			  lpf_count_to_us(filtr),
 			  lpf_count_to_ns(filtr));
 	v4l2_info(sd, "\tPulse width timer timed-out:       %s\n",
-		  stats & STATS_RTO ? "yes" : "no");
+		  str_yes_no(stats & STATS_RTO));
 	v4l2_info(sd, "\tPulse width timer time-out intr:   %s\n",
-		  irqen & IRQEN_RTE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RTE));
 	v4l2_info(sd, "\tFIFO overrun:                      %s\n",
-		  stats & STATS_ROR ? "yes" : "no");
+		  str_yes_no(stats & STATS_ROR));
 	v4l2_info(sd, "\tFIFO overrun interrupt:            %s\n",
-		  irqen & IRQEN_ROE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_ROE));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_RBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_RBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_RSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_RSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_RSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RSE));
 
 	v4l2_info(sd, "IR Transmitter:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_TXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_TXE));
 	v4l2_info(sd, "\tModulation onto a carrier:         %s\n",
-		  cntrl & CNTRL_MOD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_MOD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_TFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_TFE));
 	v4l2_info(sd, "\tFIFO interrupt watermark:          %s\n",
 		  cntrl & CNTRL_TIC ? "not empty" : "half full or less");
 	v4l2_info(sd, "\tOutput pin level inversion         %s\n",
-		  cntrl & CNTRL_IVO ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_IVO));
 	v4l2_info(sd, "\tCarrier polarity:                  %s\n",
 		  cntrl & CNTRL_CPL ? "space:burst mark:noburst"
 				    : "space:noburst mark:burst");
@@ -1037,11 +1038,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, txclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, txclk));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_TBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_TBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_TSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_TSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_TSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_TSE));
 
 	return 0;
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f439a68aff72c6c01978f7ce1de6fa..029561d84ad53c057c839f9cfaf0777f314c3738 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/minmax.h>
 #include <linux/sprintf.h>
+#include <linux/string_choices.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
@@ -244,7 +245,7 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	u32 mask = 0;
 	u32 i;
 
-	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", enable ? "on" : "off",
+	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", str_on_off(enable),
 		csi2->port, nlanes);
 
 	cfg.port = csi2->port;
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 7947dcd615e882da5240ed6b10dde8449036d019..ea8bb4f3669544780ad7b5502756ff382b27c8dd 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -20,6 +20,7 @@
 #include "ivtv-gpio.h"
 #include "ivtv-controls.h"
 #include "ivtv-cards.h"
+#include <linux/string_choices.h>
 #include <media/i2c/saa7127.h>
 #include <media/tveeprom.h>
 #include <media/v4l2-event.h>
@@ -1558,7 +1559,7 @@ static int ivtv_log_status(struct file *file, void *fh)
 		ivtv_vapi_result(itv, data, CX2341X_OSD_GET_STATE, 0);
 		data[0] |= (read_reg(0x2a00) >> 7) & 0x40;
 		IVTV_INFO("Overlay:      %s, Alpha: %s, Pixel Format: %s\n",
-			data[0] & 1 ? "On" : "Off",
+			str_on_off(data[0] & 1),
 			alpha_mode[(data[0] >> 1) & 0x3],
 			pixel_format[(data[0] >> 3) & 0xf]);
 	}
diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index e80fb4ebfda61b614c73c5273b51acd4edf279bd..148cd43612a2df74135a2441a975c545ebdcc6ec 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
+#include <linux/string_choices.h>
 
 #include "xc2028.h"
 #include <media/v4l2-common.h>
@@ -7980,8 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
 			msg.flags = I2C_M_RD;
 			rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
 			pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
-				   dev->name, msg.addr,
-				   (1 == rc) ? "yes" : "no");
+				   dev->name, msg.addr, str_yes_no(rc == 1));
 			if (rc == 1)
 				dev->has_remote = SAA7134_REMOTE_I2C;
 		}
diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index 6de8a02314af6a68e74c8c271e4d4e687a24576f..2827ae660632ed453d6bd556ceb3a32cf57e1d0a 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
+#include <linux/string_choices.h>
 #include <linux/suspend.h>
 
 #include <media/v4l2-common.h>
@@ -90,7 +91,7 @@ static int pinnacle_antenna_pwr(struct saa7134_dev *dev, int on)
 	saa_setl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 28));
 	udelay(10);
 	ok = saa_readl(SAA7134_GPIO_GPSTATUS0) & (1 << 27);
-	pr_debug("%s %s\n", __func__, ok ? "on" : "off");
+	pr_debug("%s %s\n", __func__, str_on_off(ok));
 
 	if (!ok)
 		saa_clearl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 26));
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 8610eb473b39e1e33e13abb21bcb985760f0221f..23c92a566a603ecb27397b01c184a418dd094849 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #define MODULE_NAME "saa7134"
 
@@ -895,7 +896,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
 		dev->init_data.name = "SnaZio* TVPVR PRO";
@@ -916,7 +917,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(rc == 1) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_KWORLD_PC150U:
 		/* copied and modified from MSI TV@nywhere Plus */
@@ -931,7 +932,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_HAUPPAUGE_HVR1110:
 		dev->init_data.name = saa7134_boards[dev->board].name;
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 43e7b006eb596740771cf893d8fda39df0e4aff4..f36a666103b17d8c8b4d793c864d90fc003c17d0 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
@@ -619,7 +620,7 @@ static int saa7134_enable_analog_tuner(struct saa7134_dev *dev)
 		if (ret) {
 			pr_err("Couldn't change link %s->%s to %s. Error %d\n",
 			       source->name, sink->name,
-			       flags ? "enabled" : "disabled",
+			       str_enabled_disabled(flags),
 			       ret);
 			return ret;
 		}

-- 
2.43.0


