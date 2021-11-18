Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C02E455BFA
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 13:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344955AbhKRM4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 07:56:13 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:59499 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344986AbhKRMzB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 07:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637239921; x=1668775921;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EOyHM8o1vLknnH/Jm6VZx0iPxkh1Fvpl/xnTHtx5hwk=;
  b=XgcGr/FnDW7KycoW4WzQ9H+fin9wigozCPzVB4sAktS9fhtR3LFAc+Zw
   RAKSII00HnlIGVfGjDUonH6Ihlrhi++dpqEsa2PRQDKevI+xlWkh6J0oz
   uP3K1nAoNPANAM1Pzk7c2J5buX2iU5qJgNkHHxcb3zfwiUfxCsgIxEBqR
   5v6YsUR+w3tgqs1S7o/qZ4R4UsJsXk3RfvzMTCMLHtLVUBT57PWtsgosD
   puSU6mus3RIllMLLZB76xwwp2j0+Sbm3IAciliymuxvKiUryxHJlnV9Li
   mlD3K+Ldqz0qlTv8YvIjFuCkeKDuohX8B/COozvi0OQHnPbTbvRRa4AdP
   Q==;
IronPort-SDR: +2ZDFT8Kc+s9St7RhTTfwOTbgY8zsXjhfUMYMfI3Q7yWqA0Q2AtOdomBe1x/lgHPeQ7HRGRJ4g
 3mqJADvTAVYqY9NGpAX8HVOc3KkxlPndLpYgnHHmmJNe4bb0S3TqOm3vstVObbsBeVgfjYClxc
 hcB6ykezTOdZgsFrtKJ7AefrvU/cdTrADlJW2pG48JgDVaurV8iqz3uQxTKd6D2XYgzp4AcIjE
 NtHCorxUgas5mK0V9B7E5hVDR88Rp2SqKxCG4HWCJm3tHEZmYUYIjnfmHkevgyvsCjq6FmgL1F
 qM0GOaNI5wEZ/syO0BVrzagi
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="139572308"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 05:52:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 05:52:00 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 05:51:57 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>
CC:     <skomatineni@nvidia.com>, <sakari.ailus@linux.intel.com>,
        <luca@lucaceresoli.net>, <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: i2c: imx274: fix trivial typo obainted/obtained
Date:   Thu, 18 Nov 2021 14:51:51 +0200
Message-ID: <20211118125151.290144-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo obainted/obtained.

Fixes: 0985dd306f72 ("media: imx274: V4l2 driver for Sony imx274 CMOS sensor")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/imx274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 5312cf3e855d..2e804e3b70c4 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1499,7 +1499,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 /*
  * imx274_get_frame_length - Function for obtaining current frame length
  * @priv: Pointer to device structure
- * @val: Pointer to obainted value
+ * @val: Pointer to obtained value
  *
  * frame_length = vmax x (svr + 1), in unit of hmax.
  *
-- 
2.25.1

