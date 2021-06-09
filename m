Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1FC3A13F8
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 14:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbhFIMQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 08:16:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41094 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239734AbhFIMQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 08:16:06 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lqx60-0000hx-GF; Wed, 09 Jun 2021 12:14:08 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: remove redundant initialization of variable ret
Date:   Wed,  9 Jun 2021 13:14:08 +0100
Message-Id: <20210609121408.186239-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read,
it is being updated later on. The assignment is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index e698b63d6cb7..769dc122f266 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -932,7 +932,7 @@ static int ov5693_q_exposure(struct v4l2_subdev *sd, s32 *value)
 static int ad5823_t_focus_vcm(struct v4l2_subdev *sd, u16 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = -EINVAL;
+	int ret;
 	u8 vcm_code;
 
 	ret = ad5823_i2c_read(client, AD5823_REG_VCM_CODE_MSB, &vcm_code);
-- 
2.31.1

