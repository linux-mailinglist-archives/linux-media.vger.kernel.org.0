Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E182044E8E8
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbhKLOdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:33:20 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:34421 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235213AbhKLOdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727427; x=1668263427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RKT4TsQbf9WhAC/BzpiLxsl35EXH1/8qpv9zRIsAbvo=;
  b=kb3o5ANUdg4+Trlea/tA8r//+XZIPUR7LTlWdR6UFydPXclZ7Zuf5EPa
   QhzcyPQlYYVUTLpSxRIi6y7Crxym9wwJtYu85cIRPVM7VhAbWztoHcwzF
   5OBBoMbGtXoTGS35yi5EvdSbL3mTpNvHYkV3Ekvo6hVMYhnptk5XVM87z
   AW5rW0noRh21NrOwJ1jwiALl4h5x3Uj+2eIvZ9HSuVTUVspphwWU4offs
   WF3YyohwFUcdk1T4EexYa0EEtrIW6AFWYbjrL1JB+tKc7jEiWM3sS4w1k
   0NvxZHUg9uvB/0c0mgaj1ZimugDYJsavgKS9pz5xoW6JXTJVwPGVD42rb
   w==;
IronPort-SDR: rAOX4nJCkwBIPuAd9Kx0cmXhPHk8eniG8kiF/92y7cXZWbZM41OWwMx97BmpcDBPzh13HJq4xz
 gv/UM2YEXPcczeypO0AmmK7QVwQCRKGZbF1rX0XTNTbwR9yuwkhQvIDVyW+q2HOFHhiwkFPc4V
 NQ2KucU3CQV7nJRO5tjYTE+qP22jZgOe71C5qGW9BboR6lIIXtTwXcVJirKvuOoY3njR9SVSPa
 zU3rnANCwsw6Gquw9o5p8TxPDPZchCdpqMr8ZNB7S8Q7EK1aDQxi6AKEhxuFxHeCcS/3aZk5Zv
 pCNyYkC+D3vXJshhOThIwH8L
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="143729960"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:30:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:30:26 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:30:13 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 21/25] media: atmel: atmel-isc-base: clamp wb gain coefficients
Date:   Fri, 12 Nov 2021 16:25:05 +0200
Message-ID: <20211112142509.2230884-22-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
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
index f1f1019f9d82..31c8e3029eee 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1415,6 +1415,10 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
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

