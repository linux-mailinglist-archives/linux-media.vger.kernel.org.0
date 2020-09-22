Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5596B2742DE
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 15:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVNXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 09:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIVNXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 09:23:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27CFC061755;
        Tue, 22 Sep 2020 06:23:00 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q9so3320114wmj.2;
        Tue, 22 Sep 2020 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5+TdI69s71UpiSohxrIi+53Z0Xdo4ZlpIKvQrOrDnBY=;
        b=Um8Z+mMxo/2rVzNbDQp6ifa2EVHTDWgs2y/i3vmH7je2myxIVZ5q13rPtiZcKTjrC9
         TA5AXX/dQkiXVGPnBeA2zf/J6gLme1PPl2u1pT1Cvhn1IhG5I8/nTJYFXF3LdRgEx8d4
         hLZOdeHMEX9l83pjiesV7SVzeESncBxRb621W5csQ/3iA8/fbtbimAiCJUabeiBOUOMN
         HrsxyiNN+N+dLQmU9xUBLRk/dg0B5DvyCAuouRpfkQDla7GETm8NAHeWOle61rNRkL/a
         Z3KlWcBVr6ToR/2uMfC6AZ6y7caT3nrQepDUTRUhVH8QJiQyuG63ga0siEGOIRxgEf6O
         cPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5+TdI69s71UpiSohxrIi+53Z0Xdo4ZlpIKvQrOrDnBY=;
        b=EuuZ0sL25TDs1FxipVY/R0fcZLSVLA+b7hRBOrq0cnm28CIGehxVNGi+uWagGUdO1i
         VJHEBrkJVhrHCZXrufh+L6HHMypvDrXZ5H+Js9Um+9kKvC8WtCdNKC1vx1RI0CqLJsSK
         xAEaf/5H5cKvsEEa3AUYXYOeZlYoDVv7ry58HBZBtKpR9fMpdpzDuaS0/9st1lld1mmQ
         N1DT9v3Cd947ywKqxadHOfREgyVJ8bI0KtCLpxDvXNTVlmOXI2Mitd87U6uC5+qMfkGz
         wS41NAF/SWjuk9KQ8TONL/ER80OOsuWo4pBuwVnPD5fLB84nXISBYqlx3tYn3ow3WDBP
         KISA==
X-Gm-Message-State: AOAM532L5Lqs14naeHRWq5Zb0O+lwJfEOy1MbY9Kr7YMUZjH+CvAKqmy
        /1J1iHS9e8J/qzZz1pIr2hw=
X-Google-Smtp-Source: ABdhPJyIYgRmcTmJR7pqaYyhH65VlIPeuXBBPWeYtVIb/FylP3iskDP37ON7dSCgGCFWSS39O1zVOQ==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr1060651wmi.55.1600780979543;
        Tue, 22 Sep 2020 06:22:59 -0700 (PDT)
Received: from necip-pc.vpn.ucf.edu ([85.153.226.252])
        by smtp.gmail.com with ESMTPSA id h3sm27181490wrq.0.2020.09.22.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 06:22:58 -0700 (PDT)
From:   Necip Fazil Yildiran <fazilyildiran@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: [PATCH] media: mantis: remove orphan mantis_core.c
Date:   Tue, 22 Sep 2020 16:22:22 +0300
Message-Id: <20200922132221.2051769-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no Makefile rule to have drivers/media/pci/mantis/mantis_core.o
in build since the code overhaul with commit b3b961448f70
("V4L/DVB (13795): [Mantis/Hopper] Code overhaul, add Hopper devices into the PCI ID list").

It looks like drivers/media/pci/mantis/mantis_core.c is a leftover.

Remove the orphan code.

Fixes: b3b961448f70 ("V4L/DVB (13795): [Mantis/Hopper] Code overhaul, add Hopper devices into the PCI ID list").
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 drivers/media/pci/mantis/mantis_ca.c   |   1 -
 drivers/media/pci/mantis/mantis_core.c | 200 -------------------------
 drivers/media/pci/mantis/mantis_core.h |   2 -
 3 files changed, 203 deletions(-)
 delete mode 100644 drivers/media/pci/mantis/mantis_core.c

diff --git a/drivers/media/pci/mantis/mantis_ca.c b/drivers/media/pci/mantis/mantis_ca.c
index f2baf5e5c921..0fad0a923e35 100644
--- a/drivers/media/pci/mantis/mantis_ca.c
+++ b/drivers/media/pci/mantis/mantis_ca.c
@@ -109,7 +109,6 @@ static int mantis_ts_control(struct dvb_ca_en50221 *en50221, int slot)
 	struct mantis_pci *mantis = ca->ca_priv;
 
 	dprintk(MANTIS_DEBUG, 1, "Slot(%d): TS control", slot);
-/*	mantis_set_direction(mantis, 1); */ /* Enable TS through CAM */
 
 	return 0;
 }
diff --git a/drivers/media/pci/mantis/mantis_core.c b/drivers/media/pci/mantis/mantis_core.c
deleted file mode 100644
index f303f68d4ef2..000000000000
--- a/drivers/media/pci/mantis/mantis_core.c
+++ /dev/null
@@ -1,200 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
-	Mantis PCI bridge driver
-
-	Copyright (C) Manu Abraham (abraham.manu@gmail.com)
-
-*/
-
-#include "mantis_common.h"
-#include "mantis_core.h"
-#include "mantis_vp1033.h"
-#include "mantis_vp1034.h"
-#include "mantis_vp1041.h"
-#include "mantis_vp2033.h"
-#include "mantis_vp2040.h"
-#include "mantis_vp3030.h"
-
-static int read_eeprom_byte(struct mantis_pci *mantis, u8 *data, u8 length)
-{
-	int err;
-	struct i2c_msg msg[] = {
-		{
-			.addr = 0x50,
-			.flags = 0,
-			.buf = data,
-			.len = 1
-		}, {
-			.addr = 0x50,
-			.flags = I2C_M_RD,
-			.buf = data,
-			.len = length
-		},
-	};
-
-	err = i2c_transfer(&mantis->adapter, msg, 2);
-	if (err < 0) {
-		dprintk(verbose, MANTIS_ERROR, 1,
-			"ERROR: i2c read: < err=%i d0=0x%02x d1=0x%02x >",
-			err, data[0], data[1]);
-
-		return err;
-	}
-
-	return 0;
-}
-
-static int get_mac_address(struct mantis_pci *mantis)
-{
-	int err;
-
-	mantis->mac_address[0] = 0x08;
-	err = read_eeprom_byte(mantis, &mantis->mac_address[0], 6);
-	if (err < 0) {
-		dprintk(verbose, MANTIS_ERROR, 1, "Mantis EEPROM read error");
-
-		return err;
-	}
-	dprintk(verbose, MANTIS_ERROR, 0,
-		"    MAC Address=[%pM]\n", mantis->mac_address);
-
-	return 0;
-}
-
-#define MANTIS_MODEL_UNKNOWN	"UNKNOWN"
-#define MANTIS_DEV_UNKNOWN	"UNKNOWN"
-
-struct mantis_hwconfig unknown_device = {
-	.model_name	= MANTIS_MODEL_UNKNOWN,
-	.dev_type	= MANTIS_DEV_UNKNOWN,
-};
-
-static void mantis_load_config(struct mantis_pci *mantis)
-{
-	switch (mantis->subsystem_device) {
-	case MANTIS_VP_1033_DVB_S:	/* VP-1033 */
-		mantis->hwconfig = &vp1033_mantis_config;
-		break;
-	case MANTIS_VP_1034_DVB_S:	/* VP-1034 */
-		mantis->hwconfig = &vp1034_mantis_config;
-		break;
-	case MANTIS_VP_1041_DVB_S2:	/* VP-1041 */
-	case TECHNISAT_SKYSTAR_HD2:
-		mantis->hwconfig = &vp1041_mantis_config;
-		break;
-	case MANTIS_VP_2033_DVB_C:	/* VP-2033 */
-		mantis->hwconfig = &vp2033_mantis_config;
-		break;
-	case MANTIS_VP_2040_DVB_C:	/* VP-2040 */
-	case CINERGY_C:	/* VP-2040 clone */
-	case TECHNISAT_CABLESTAR_HD2:
-		mantis->hwconfig = &vp2040_mantis_config;
-		break;
-	case MANTIS_VP_3030_DVB_T:	/* VP-3030 */
-		mantis->hwconfig = &vp3030_mantis_config;
-		break;
-	default:
-		mantis->hwconfig = &unknown_device;
-		break;
-	}
-}
-
-int mantis_core_init(struct mantis_pci *mantis)
-{
-	int err = 0;
-
-	mantis_load_config(mantis);
-	dprintk(verbose, MANTIS_ERROR, 0, "found a %s PCI %s device on (%02x:%02x.%x),\n",
-		mantis->hwconfig->model_name, mantis->hwconfig->dev_type,
-		mantis->pdev->bus->number, PCI_SLOT(mantis->pdev->devfn), PCI_FUNC(mantis->pdev->devfn));
-	dprintk(verbose, MANTIS_ERROR, 0, "    Mantis Rev %d [%04x:%04x], ",
-		mantis->revision,
-		mantis->subsystem_vendor, mantis->subsystem_device);
-	dprintk(verbose, MANTIS_ERROR, 0,
-		"irq: %d, latency: %d\n    memory: 0x%lx, mmio: 0x%p\n",
-		mantis->pdev->irq, mantis->latency,
-		mantis->mantis_addr, mantis->mantis_mmio);
-
-	err = mantis_i2c_init(mantis);
-	if (err < 0) {
-		dprintk(verbose, MANTIS_ERROR, 1, "Mantis I2C init failed");
-		return err;
-	}
-	err = get_mac_address(mantis);
-	if (err < 0) {
-		dprintk(verbose, MANTIS_ERROR, 1, "get MAC address failed");
-		return err;
-	}
-	err = mantis_dma_init(mantis);
-	if (err < 0) {
-		dprintk(verbose, MANTIS_ERROR, 1, "Mantis DMA init failed");
-		return err;
-	}
-	err = mantis_dvb_init(mantis);
-	if (err < 0) {
-		dprintk(verbose, MANTIS_DEBUG, 1, "Mantis DVB init failed");
-		return err;
-	}
-	err = mantis_uart_init(mantis);
-	if (err < 0) {
-		dprintk(verbose, MANTIS_DEBUG, 1, "Mantis UART init failed");
-		return err;
-	}
-
-	return 0;
-}
-
-int mantis_core_exit(struct mantis_pci *mantis)
-{
-	mantis_dma_stop(mantis);
-	dprintk(verbose, MANTIS_ERROR, 1, "DMA engine stopping");
-
-	mantis_uart_exit(mantis);
-	dprintk(verbose, MANTIS_ERROR, 1, "UART exit failed");
-
-	if (mantis_dma_exit(mantis) < 0)
-		dprintk(verbose, MANTIS_ERROR, 1, "DMA exit failed");
-	if (mantis_dvb_exit(mantis) < 0)
-		dprintk(verbose, MANTIS_ERROR, 1, "DVB exit failed");
-	if (mantis_i2c_exit(mantis) < 0)
-		dprintk(verbose, MANTIS_ERROR, 1, "I2C adapter delete.. failed");
-
-	return 0;
-}
-
-/* Turn the given bit on or off. */
-void gpio_set_bits(struct mantis_pci *mantis, u32 bitpos, u8 value)
-{
-	u32 cur;
-
-	cur = mmread(MANTIS_GPIF_ADDR);
-	if (value)
-		mantis->gpio_status = cur | (1 << bitpos);
-	else
-		mantis->gpio_status = cur & (~(1 << bitpos));
-
-	mmwrite(mantis->gpio_status, MANTIS_GPIF_ADDR);
-	mmwrite(0x00, MANTIS_GPIF_DOUT);
-	udelay(100);
-}
-
-/* direction = 0 , no CI passthrough ; 1 , CI passthrough */
-void mantis_set_direction(struct mantis_pci *mantis, int direction)
-{
-	u32 reg;
-
-	reg = mmread(0x28);
-	dprintk(verbose, MANTIS_DEBUG, 1, "TS direction setup");
-	if (direction == 0x01) {
-		/* to CI */
-		reg |= 0x04;
-		mmwrite(reg, 0x28);
-		reg &= 0xff - 0x04;
-		mmwrite(reg, 0x28);
-	} else {
-		reg &= 0xff - 0x04;
-		mmwrite(reg, 0x28);
-		reg |= 0x04;
-		mmwrite(reg, 0x28);
-	}
-}
diff --git a/drivers/media/pci/mantis/mantis_core.h b/drivers/media/pci/mantis/mantis_core.h
index 1b0468ff791c..93c89a10a2c7 100644
--- a/drivers/media/pci/mantis/mantis_core.h
+++ b/drivers/media/pci/mantis/mantis_core.h
@@ -39,7 +39,5 @@ extern void mantis_dma_start(struct mantis_pci *mantis);
 extern void mantis_dma_stop(struct mantis_pci *mantis);
 extern int mantis_i2c_init(struct mantis_pci *mantis);
 extern int mantis_i2c_exit(struct mantis_pci *mantis);
-extern int mantis_core_init(struct mantis_pci *mantis);
-extern int mantis_core_exit(struct mantis_pci *mantis);
 
 #endif /* __MANTIS_CORE_H */
-- 
2.25.1

