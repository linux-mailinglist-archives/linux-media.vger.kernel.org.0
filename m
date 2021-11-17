Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC3D454A27
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 16:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238379AbhKQPn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 10:43:28 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19166 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbhKQPn1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 10:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637163629; x=1668699629;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=enMUqlx+vZWPISNtVY3ZvMflAeCf39MRdthDieUsjA4=;
  b=1maKecxhXo/COjIITXCHX8bUmqrsJkltNuy47NI8o6r4Kdx9/rMkA7Te
   ZhIWn+1AetEe5vxy/1miYB/ZdcZI/ernjmCMvmMv7QHQOyCdoOn+rG0kD
   BCslLr8glhQzfcw3SiSEKWINGGdpUz6zVZlRPyivRM3pKOkMjYsIV+mZn
   gJM1pXeLTUSOCiS5t/8HA/MiDvRLBsAB9D2C4Sef9RTNHDjjglAyuunwC
   hD7/S3gsfyVkmfm96/6fDWQy/sepofvvixFgorZRoraTmnv1Ma1vqHAp9
   4ot3Pftal1xIvGzaDkjbSU6YajrhK8OjPw7CXp2cmTpARg/VGFBANTeOh
   w==;
IronPort-SDR: wBWTC3oNdhCIFTn4w8gV+TkShhNf2letQpL8sZyFR+Ud5Ea6gSUOH4d8q/t9VqHnZDc9NdjZ1X
 7c/jpPQpk9Eqv4WZw0DppdtH35NkaH1jAkEn6iCx0nWki/CEzvladH7m14FSny/x80rqbddLHe
 d9D9txDZ3YH1oxJ4eLkZm0wM1Wz/3Y7y+A7AEeRa2uKQkCsuT+FOuOGzOHdFSRwWG/kJVqUoI6
 s6AXJXHKzf/OWLNAEloMqWm+Q26c8ogetpkAk31k9sqeP+rwcuDqT/YftUjcrpkq+IaiqPpN/8
 5JOyFOJxg/PNSj9P/6AVzOal
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; 
   d="scan'208";a="139444472"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2021 08:40:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 08:40:21 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 08:40:18 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>
CC:     <skomatineni@nvidia.com>, <sakari.ailus@linux.intel.com>,
        <luca@lucaceresoli.net>, <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: i2c: imx274: fix s_frame_interval runtime resume not requested
Date:   Wed, 17 Nov 2021 17:40:09 +0200
Message-ID: <20211117154009.261787-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pm_runtime_resume_and_get should be called when the s_frame_interval
is called.

The driver will try to access device registers to configure VMAX, coarse
time and exposure.

Currently if the runtime is not resumed, this fails:
 # media-ctl -d /dev/media0 --set-v4l2 '"IMX274 1-001a":0[fmt:SRGGB10_1X10/3840x2
160@1/10]'

IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 3840x2160, goodness 0
IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1920x1080, goodness -3000
IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1280x720, goodness -4000
IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1280x540, goodness -4180
IMX274 1-001a: __imx274_change_compose: selected 1x1 binning
IMX274 1-001a: imx274_set_frame_interval: input frame interval = 1 / 10
IMX274 1-001a: imx274_read_mbreg : addr 0x300e, val=0x1 (2 bytes)
IMX274 1-001a: imx274_set_frame_interval : register SVR = 1
IMX274 1-001a: imx274_read_mbreg : addr 0x30f6, val=0x6a8 (2 bytes)
IMX274 1-001a: imx274_set_frame_interval : register HMAX = 1704
IMX274 1-001a: imx274_set_frame_length : input length = 2112
IMX274 1-001a: imx274_write_mbreg : i2c bulk write failed, 30f8 = 884 (3 bytes)
IMX274 1-001a: imx274_set_frame_length error = -121
IMX274 1-001a: imx274_set_frame_interval error = -121
Unable to setup formats: Remote I/O error (121)

The device is not resumed thus the remote I/O error.

Setting the frame interval works at streaming time, because
pm_runtime_resume_and_get is called at s_stream time before sensor setup.
The failure happens when only the s_frame_interval is called separately
independently on streaming time.

Fixes: ad97bc37426c ("media: i2c: imx274: Add IMX274 power on and off sequence"
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/imx274.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index e89ef35a71c5..6e63fdcc5e46 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1420,6 +1420,10 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
 	int min, max, def;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(&imx274->client->dev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&imx274->lock);
 	ret = imx274_set_frame_interval(imx274, fi->interval);
 
@@ -1451,6 +1455,7 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
 
 unlock:
 	mutex_unlock(&imx274->lock);
+	pm_runtime_put(&imx274->client->dev);
 
 	return ret;
 }
-- 
2.25.1

