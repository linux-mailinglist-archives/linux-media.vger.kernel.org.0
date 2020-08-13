Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C422440DB
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHMVrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgHMVrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:47:20 -0400
Received: from mail.tuxforce.de (tuxforce.de [IPv6:2a00:5080:1:16d::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2CDC061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 14:47:20 -0700 (PDT)
Received: from desktop.fritz.box (2001-4dd5-ac5b-0-6dff-1ee7-1f0b-53a0.ipv6dyn.netcologne.de [IPv6:2001:4dd5:ac5b:0:6dff:1ee7:1f0b:53a0])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 88BEA52008B;
        Thu, 13 Aug 2020 23:47:19 +0200 (CEST)
From:   Lukas Middendorf <kernel@tuxforce.de>
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Lukas Middendorf <kernel@tuxforce.de>
Subject: [PATCH 2/2] media: si2168: also cache Si2168 B40 fallback firmware
Date:   Thu, 13 Aug 2020 23:45:38 +0200
Message-Id: <20200813214538.8474-2-kernel@tuxforce.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200813214538.8474-1-kernel@tuxforce.de>
References: <20200813214538.8474-1-kernel@tuxforce.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

we can not know beforehand whether we have to access that firmware
file during resume. We just request the caching so we don't run
into any problems later

Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
---
 drivers/media/dvb-frontends/si2168.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index ea4b2d91697e..f2dd1deb75ff 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -768,6 +768,19 @@ static int si2168_probe(struct i2c_client *client,
 				dev->firmware_name);
 	}
 
+	/* also request caching of fw for Si2168 B40 under its old file name.
+	 * Since we can't know now whether we might have to access that file,
+	 * we just make sure we have that covered
+	 */
+	if (dev->chip_id == SI2168_CHIP_ID_B40) {
+		ret = firmware_request_cache(&client->dev, SI2168_B40_FIRMWARE_FALLBACK);
+		if (ret) {
+			dev_err(&client->dev,
+					"firmware caching for '%s' failed\n",
+					SI2168_B40_FIRMWARE_FALLBACK);
+		}
+	}
+
 	return 0;
 err_kfree:
 	kfree(dev);
-- 
2.26.2

