Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBD57AFF19
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 10:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjI0I4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 04:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjI0I4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 04:56:32 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C51D6
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 01:56:29 -0700 (PDT)
Received: from [192.168.179.7] ([37.24.11.236]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mi2aH-1rFpPF0YKn-00e3Na; Wed, 27 Sep 2023 10:56:16 +0200
Message-ID: <918ce2ca-55ff-aff8-ea6c-0c17f566d59d@online.de>
Date:   Wed, 27 Sep 2023 10:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
From:   Max Schulze <max.schulze@online.de>
Subject: [PATCH] read ov9281 sensor-id in 2-steps in case the firmware locks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:olbm5KOY3EHfwC+dC1TRZGcoiArhePBk46w65BIwZ81A0R4FMOw
 Bv42Z+gS+LZ1XnXjs0Mi6pVS4rkrxNd5O+827+Myxr+ExNpKMX5Wkq/DeD0uKGrsASqdX6s
 6CER9QeeYlw8noyCKE5hXH1Qn7vUHDIu5Ztzb+Alf8Q+pxzaJOr2fyzjI4+kifnuZ9h+vHg
 EswEESk7qnaVBuw7XVPPg==
UI-OutboundReport: notjunk:1;M01:P0:PPPU0Q50hKg=;7TFuVd/Rvec4wfEOoguCcSkIYre
 FCoJNuL4MOTy99PQL5R74SIWsYdI4OtsrjBPmnjXakRph8USZ/J5A+fVZcnDx+9RjrVk4pIoy
 rUmoJ6NV19vGFvNT6RozYuTLtmLcs/qhLABeptXFeQ72sykEOA9zzk+1gEoh51NxipAOjUpL+
 0ZxLva9vgWbPPNPvilEWcDSo9zkpKxQXwiQXpBDT7Y516e1h3mMFIwkZk1DT61zHa3rFcs8rv
 pThfGjUfrPBcBtkL3CeeJqF0PmzpIIwIQJIrmgRDSGQ+F7mpHjCci7t+cPIcm5iHPym+7+Qrr
 kNmcCqrJgk9r2dS/RXxJqXcEFhPCaqHWwQDhoxkwV55n7TLVgdn+wakPCPOnQOSPzW30Y6J4i
 UAiV/MLUImAo29qSgJi4CgogOi0T1X5C3IAkiHsoSJ7waC7NIJnx/r2S/0abhOl8BmtCXMfak
 snSihECb6KNmGpWBdFeDK/7mqce4FvHN6+wnMfppsESgmTHxz/mu9KcXlUVtYWJT9YmD1pJc/
 JUhanPtJlBBn4Wk9dWYTGXsiRMNJhLorLjgaliTf2xgIWSulc/gJvYsIjyXMLlptnHkmMcfbS
 a3jPoLocDlekvjmAH/Q3xaghz2Pf5owPikGmr23YnAiU7xi5DjQrPTj53YCpX0pm6JFoKTz5v
 /LYNtApFx3Kw2OEMz8q+suRJglfWz3AgQZDR61ElLgoYhfalN+V/dvhhRLTigAX1lgKcCZyRa
 5suWH8BHfVmwbscgt2rB2wHv5Pe3ocCoHWgznheCNeJRHXFqwQIz4TyZIBRjuokQjBBWoSxDz
 triL+S1TFvJiRv91srtIUJ5D+izjtx/t4emIi6Q3bDGWFq/nlOyViqy3+ob08aGBK5qc8j3b0
 ptkdiDMVbo2Z5xQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov9281 produced by vision-components does not support 
auto-incremented reads, so read the id in 2 separate steps 
to circumvent the error:
  kernel: ov9282 10-0060: chip id mismatch: 9281!=92ff
  kernel: ov9282 10-0060: failed to find sensor: -6


Signed-off-by: Max Schulze <max.schulze@online.de>
Tested-by: Max Schulze <max.schulze@online.de>
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
This was tested on rpi cm4 with two ov9281 at the same time, 
one from vc, one from inno-maker.

The rpi kernel supported ov9281 out-of-tree until kernel 6.1.
It carried this change originally made by Dave to support the vc
sensor. Switching to mainline now broke support for it.

I could not find a single-commit for the original change to which I 
could link, only squashed ones, i.e.

https://github.com/raspberrypi/linux/commit/eb00efc993d8cd835221255b44e9019a31708abe

 media: i2c: ov9281: Read chip ID via 2 reads

 Vision Components have made an OV9281 module which blocks reading
 back the majority of registers to comply with NDAs, and in doing
 so doesn't allow auto-increment register reading as used when
 reading the chip ID.
---
 drivers/media/i2c/ov9282.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 068c7449f50e..3b687f6d4581 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1078,13 +1078,16 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 static int ov9282_detect(struct ov9282 *ov9282)
 {
 	int ret;
-	u32 val;
+	u32 val = 0, id_msb = 0;
 
-	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
-	if (ret)
-		return ret;
+	// some firmware limits auto-increment register writes, so do it separately
+	ret = ov9282_read_reg(ov9282, OV9282_REG_ID + 1, 1, &val);
+	if (!ret)
+		ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 1, &id_msb);
+
+	val |= (id_msb << 8);
 
-	if (val != OV9282_ID) {
+	if (ret || val != OV9282_ID) {
 		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
 			OV9282_ID, val);
 		return -ENXIO;
-- 
2.30.2
