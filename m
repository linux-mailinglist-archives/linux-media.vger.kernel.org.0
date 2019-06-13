Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3249443F0C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389962AbfFMPyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:54:32 -0400
Received: from sauhun.de ([88.99.104.3]:41948 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390102AbfFMPy1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:54:27 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id F3DF44A12B1;
        Thu, 13 Jun 2019 17:54:25 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: zd1301_demod: don't check retval after our own assignemt
Date:   Thu, 13 Jun 2019 17:54:20 +0200
Message-Id: <20190613155421.16408-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
References: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need to check a retval after we assigned a constant to it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/dvb-frontends/zd1301_demod.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/zd1301_demod.c b/drivers/media/dvb-frontends/zd1301_demod.c
index 96adbba7a82b..bbabe6a2d4f4 100644
--- a/drivers/media/dvb-frontends/zd1301_demod.c
+++ b/drivers/media/dvb-frontends/zd1301_demod.c
@@ -421,8 +421,7 @@ static int zd1301_demod_i2c_master_xfer(struct i2c_adapter *adapter,
 	} else {
 		dev_dbg(&pdev->dev, "unknown msg[0].len=%u\n", msg[0].len);
 		ret = -EOPNOTSUPP;
-		if (ret)
-			goto err;
+		goto err;
 	}
 
 	return num;
-- 
2.20.1

