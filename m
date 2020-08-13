Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBC52440DA
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgHMVrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgHMVrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:47:06 -0400
Received: from mail.tuxforce.de (tuxforce.de [IPv6:2a00:5080:1:16d::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74C2C061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 14:47:05 -0700 (PDT)
Received: from desktop.fritz.box (2001-4dd5-ac5b-0-6dff-1ee7-1f0b-53a0.ipv6dyn.netcologne.de [IPv6:2001:4dd5:ac5b:0:6dff:1ee7:1f0b:53a0])
        by mail.tuxforce.de (Postfix) with ESMTPSA id E75C152008B;
        Thu, 13 Aug 2020 23:47:02 +0200 (CEST)
From:   Lukas Middendorf <kernel@tuxforce.de>
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Lukas Middendorf <kernel@tuxforce.de>
Subject: [PATCH 1/2] media: si2168: request caching of firmware to make it available on resume
Date:   Thu, 13 Aug 2020 23:45:37 +0200
Message-Id: <20200813214538.8474-1-kernel@tuxforce.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

even though request_firmware() is supposed to be safe to call during
resume, it might fail (or even hang the system) when the firmware
has not been loaded previously. Use firmware_request_cache() to
have it cached so it is available reliably on resume.

Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
---
 drivers/media/dvb-frontends/si2168.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 14b93a7d3358..ea4b2d91697e 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -757,6 +757,17 @@ static int si2168_probe(struct i2c_client *client,
 		 dev->version >> 24 & 0xff, dev->version >> 16 & 0xff,
 		 dev->version >> 8 & 0xff, dev->version >> 0 & 0xff);
 
+	/* request caching of the firmware so it is available on resume after suspend.
+	 * The actual caching of the firmware file only occurs during suspend
+	 * The return value does not show whether the firmware file exists
+	 */
+	ret = firmware_request_cache(&client->dev, dev->firmware_name);
+	if (ret) {
+		dev_err(&client->dev,
+				"firmware caching for '%s' failed\n",
+				dev->firmware_name);
+	}
+
 	return 0;
 err_kfree:
 	kfree(dev);
-- 
2.26.2

