Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3770036DEC4
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 20:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243437AbhD1SHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 14:07:52 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:35256 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243398AbhD1SHt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 14:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619633216; bh=+c5igyr8ENA48LJUJ/MMslL7XQZTgfJo1NBswH6SmIo=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=CfqfDaxIVm/aoCteFsNNFRU4sUSTJEjh1RH4MLgp4aGZ7bSIJ84MHXW54ko3gb2Vf
         alfIm74EcGAjv9UPm63zSw+TYahJ34Ofr+/N4we9/1Ef1eoHeKWAKJzx8V2jX4nB1t
         M04fIU3PD0dUQxNVlSRaxGYdsnCFpal7UhporQD8=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 20:06:56 +0200 (CEST)
X-EA-Auth: +kU11S5f0ZcelkzG3a+GaSCjPWDesBvh4IV8IbrpdtwTS/md0f6X9qSiFEPSj1t9kFxuweCmS3pFKVyLFfvSYS5fAdVjnvdN
Date:   Wed, 28 Apr 2021 23:36:50 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH v4 3/9] staging: media: atomisp: remove unnecessary braces
Message-ID: <c27f1b162f697bcc4456f68311ad2d08e9038204.1619630709.git.drv@mailo.com>
References: <cover.1619630709.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619630709.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the coding style guidelines, if...else blocks with single
instructions do not need enclosing braces. This resolves checkpatch
WARNING / CHECK complaints.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v3:
   - introduced.
Changes since v2:
   - None.
Changes since v1:
   - None.


 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index c90730513438..f167781e258a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -461,11 +461,11 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 	ret = ov2680_read_reg(client, 1, OV2680_FLIP_REG, &val);
 	if (ret)
 		return ret;
-	if (value) {
+	if (value)
 		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
-	} else {
+	else
 		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
-	}
+
 	ret = ov2680_write_reg(client, 1,
 			       OV2680_FLIP_REG, val);
 	if (ret)
-- 
2.31.1



