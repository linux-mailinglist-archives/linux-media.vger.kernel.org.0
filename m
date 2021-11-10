Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0081944BF58
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhKJLCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 06:02:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231248AbhKJLB7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 06:01:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55276611BF;
        Wed, 10 Nov 2021 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636541952;
        bh=5TIG1BRWAdpzcni9lSwygVrJFoLLUWjoMyvM0Rtg+Ro=;
        h=From:To:Cc:Subject:Date:From;
        b=WsAyqdyKsc1yI/6YFYo2V/W7+NfjKeqsU3tQudqBOKv4ExGPL1Riz57Xee5R+g/lB
         vu/D3/3884Wsr/KY0m2o2/kTmHFZS2TIcEzeot0R+LW4aqjAay5I5j5rnleALgouCS
         6w+2fxyFx8Dsu/nk0kvdBHXoLhkKIve/n1cgPJErRwO3yrchQg6eTiaxMIPbJT/MoH
         e+tQ32PxVScuB7rdsTi0a/jJED5LgLVjoWfUkLYV1vERNwrHrgrVCpgoY6QKhrk5jV
         Gsvpt1XIz44LQ+5P1PUN/CfyO00N6LzqA+6rQyV3S90PUQ5m7HtPCsUpCd2lJbPccv
         OBM7rznI6CNaw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mklJt-002rxD-8E; Wed, 10 Nov 2021 10:59:09 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/2] media: atomisp-ov2680: initialize return var
Date:   Wed, 10 Nov 2021 10:59:07 +0000
Message-Id: <46ec939d911fc94b8a5e217874655e60512ad773.1636541941.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the settings are only applied when the device is powered on,
it should return 0 when the device is not powered.

Not doing that causes a warning:

	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: In function 'ov2680_ioctl':
	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:390:16: warning: 'ret' may be used uninitialized in this
	function [-Wmaybe-uninitialized]
	  390 |         return ov2680_set_exposure(sd, coarse_itg, analog_gain, digital_gain);
	      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:359:13: note: 'ret' was declared here
	  359 |         int ret;
	      |             ^~~

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>
Fixes: 6b5b60687ada ("media: atomisp-ov2680: Save/restore exposure and gain over sensor power-down")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 34d008236bd9..497884d332e1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -356,7 +356,7 @@ static int ov2680_set_exposure(struct v4l2_subdev *sd, int exposure,
 			       int gain, int digitgain)
 {
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&dev->input_lock);
 
-- 
2.33.1

