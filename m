Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3740143735A
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhJVH5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:57:42 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17502 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbhJVH5U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889303; x=1666425303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wDcAUxy4+J7U+nbdqT4H/qC13HwZeJ4M+KkOlbGfiME=;
  b=WNKYFIsX6oeMYEYqqdpd7eX4+WsBGHcvme8EvBUy0b8BtnB7EAG5teWn
   Q53mNfWvjlvrMIihHz/ol9OFp9vJ1Wy7aZImxLKnNDizBT32c8vw434ff
   vLsZVpv1R95P3ZSH2lT0FMnjF/2PmZ4PiK4GqrRZqtzbvkJ40jFXSMXzM
   9JA+qnk3+4KtpO7PDaJ8D9mncGy7KuzE+puWnEVJkJ01m8rZmv7hKbroZ
   f6KNXN6MQFUbPHSZ0YDItxurG5zrcmi6ikNerOfVJ9MV3CVobLj6DQb4V
   ZaSpjzvi3jGAyLzYc3NS8PPAN+0tTxIqtNSmzyxYEzNu0ONM7pf7pw9SZ
   Q==;
IronPort-SDR: pQHfuea1n6HvBzLnXY4q2xY5gL5e2sVLtU/XkIjxJXH5IWwVumJOUTKrqIA4G48+f0LYa3v0/N
 j1O+74QXzZ4BWFHn7fdcWoQBndpZAWNvdleLQwWVktbIRErYMkB3chhmeQGT5oYpk/z8rTXr34
 ea5j/qt0GGRdHGZ1j51UXtf9Tmx8kG/30/qqSYLzUN9J+GsKvpv4idcEKe6Z7I9wXNWCD3+LOm
 T4sR+Y5gjQtpi2VNltRGTo3dp5mFWf0zSyDe9Mh63RxHnW4Kuzni2G/Bj45jdqYTG/POrBDRst
 c/pzKP+Rd+GTzkMdKxxqGoVD
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="136538173"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:55:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:55:02 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:58 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 21/21] media: atmel: atmel-isc-base: clamp wb gain coefficients
Date:   Fri, 22 Oct 2021 10:52:47 +0300
Message-ID: <20211022075247.518880-22-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

White balance computed gains can overflow above the 13 bits hardware
coefficient that can be used, in some specific scenarios like a subexposure
from the sensor when the image is mostly black.
In this case the computed gain has to be clamped to the maximum value
allowed by the hardware.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 071ac5eec7ec..53141de78f67 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1416,6 +1416,10 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
 		/* multiply both gains and adjust for decimals */
 		ctrls->gain[c] = s_gain[c] * gw_gain[c];
 		ctrls->gain[c] >>= 9;
+
+		/* make sure we are not out of range */
+		ctrls->gain[c] = clamp_val(ctrls->gain[c], 0, GENMASK(12, 0));
+
 		v4l2_dbg(1, debug, &isc->v4l2_dev,
 			 "isc wb: component %d, final gain %u\n",
 			 c, ctrls->gain[c]);
-- 
2.25.1

