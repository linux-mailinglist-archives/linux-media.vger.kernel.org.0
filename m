Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A211F76F6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 12:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgFLK4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 06:56:22 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:58513 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgFLK4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 06:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591959380; x=1623495380;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WWTV6V3EFdUZ6uazqf/6M9yQYgZJ+MIkC2KGee9erVs=;
  b=FSm9EqJji3KWUbCWNX3gfccQyXcse0jB+UqMkyiCZah5wb8M9/skPY3m
   XAEhLxJFgyJnlweqItO2I4KXQa5DJFgDHbUTlnqIMRguiJF8b1WH5WPi1
   3/XaKewgFMdB6qZ1DHKynALAzSQymoE4Y4tLYLW1YpF8ecVljYP9BmiZW
   rLLUbhcVlWVY27zBfVch57sxdLQX+gQRHOtx8FmeSUI4nQD2RKvgOFGhg
   9rIOVd6PO7VrzEHWpZs8yqn3SrrmJFMALCiyE0qE0dHGAsdGmcEsJ5Um4
   IHGWBjfXfaEXE4I2SL7aS/F577G7MOHUG5c/JGHh1a06hgFB45WAFNLfx
   g==;
IronPort-SDR: Iq7B5YvpwuoVaOGLIs9fPMJo81/7L0RzDvZDcsw2isMNxcvUuc5X9liNcNGl1KOXt87rkTGXOp
 es+pp/u1MxfjsrpntiXpVRtHWtzKDreIAnMC6Yi5uSiEVPtTwR93CvU88kb7m/C4/gQs1ZfzH2
 oC7rozV9hNu22RjifYbPaZYgKCijWc567HsmKcGd+ttyAVCBaYcXmI1bJ6t28KlBqVQjW/jwBG
 dhaH19avIdHBoCzo+C1yvllXhGiyTXdnjHLE49ZDnYmZ57ODnEZUiO5Uqec6+HBMeUfbfAEHwt
 AWA=
X-IronPort-AV: E=Sophos;i="5.73,503,1583218800"; 
   d="scan'208";a="83307579"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2020 03:56:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 12 Jun 2020 03:56:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 12 Jun 2020 03:56:17 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: atmel: atmel-sama5d2-isc: fix warning in configs without OF
Date:   Fri, 12 Jun 2020 13:56:02 +0300
Message-ID: <20200612105602.203036-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/media/platform/atmel/atmel-sama5d2-isc.c:323:34: warning: unused variable 'atmel_isc_of_match' [-Wunused-const-variable]
static const struct of_device_id atmel_isc_of_match[] = {
^
1 warning generated.

vim +/atmel_isc_of_match +323 drivers/media/platform/atmel/atmel-sama5d2-isc.c

   322
 > 323  static const struct of_device_id atmel_isc_of_match[] = {
   324          { .compatible = "atmel,sama5d2-isc" },
   325          { }
   326  };
   327  MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
   328

Fixed warning by guarding the atmel_isc_of_match by CONFIG_OF.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 78381651238d..a3304f49e499 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -321,11 +321,13 @@ static const struct dev_pm_ops atmel_isc_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(isc_runtime_suspend, isc_runtime_resume, NULL)
 };
 
+#if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id atmel_isc_of_match[] = {
 	{ .compatible = "atmel,sama5d2-isc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
+#endif
 
 static struct platform_driver atmel_isc_driver = {
 	.probe	= atmel_isc_probe,
-- 
2.25.1

