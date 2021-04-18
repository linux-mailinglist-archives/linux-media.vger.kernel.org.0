Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2390736368E
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 18:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhDRQQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 12:16:37 -0400
Received: from mail.tuxforce.de ([84.38.66.179]:50052 "EHLO mail.tuxforce.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229783AbhDRQQh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 12:16:37 -0400
Received: from fedora.fritz.box (2001-4dd5-b099-0-19b2-6b8c-f4bb-b22d.ipv6dyn.netcologne.de [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 30F6B52007D;
        Sun, 18 Apr 2021 18:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tuxforce.de 30F6B52007D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxforce.de;
        s=202009; t=1618762568;
        bh=5KSa/49t9tHaZA/Tfw5/BGM1FlUowddwixqU2E02a1g=;
        h=From:To:Cc:Subject:Date:From;
        b=kYLINhWDqMK41nz6N4ogsRlxlUe28ol4BwiFqQsZXxMet0BCYygxvywA0WazGWtjP
         79kpK8obfwsX6BKCrRO4Md3we7dELJO5kI/EXvGKLklnHkqDt4q5ZlBxfRKc0FVwM6
         Siyqjl/+5dEZX+tS1XDt+6VpFt1yzRwfJQ9z6RtLbHjCUBi7x5imVKV0mfkMmOxDDi
         YXxE1VjobNx8jHwPVEKwpm/6+tpNJWleNFYaOGLAxDnlripVbbz36Qz1PFyDH2My9E
         bnPstGHqDsQldmMW+8o8FvHGUK2/dsLFxbiEhobUtM+X45ATWyl+eL4CoDwW9GUr14
         fmc8wFrbPpAyA==
From:   Lukas Middendorf <kernel@tuxforce.de>
To:     linux-media@vger.kernel.org
Cc:     Lukas Middendorf <kernel@tuxforce.de>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: si2168: drop support for old firmware file name for si2168 B40
Date:   Sun, 18 Apr 2021 18:15:44 +0200
Message-Id: <20210418161544.58858-1-kernel@tuxforce.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The si2168 B40 firmware file name has been changed in or before 2014.
During initialization, the new file name is prefered, but the old file name is
used as a fallback when request_firmware with the new file name fails. Once
reading the old file name has been attempted, only this name will be used on
further firmware loading attempts.
During resume, firmware reading with the new file name can (and likely will)
fail even when it actually exists. So this permanent switch to the fallback
firmware name happens even when not desired.

Any system using a recent kernel version can be expected to have the firmware
under the new name. The major distributions are either using the dvb firmware
collection from LibreELEC, which has the new firmware file name, or do not
package the firmware file but have documentation pointing towards a manual
installation of the firmware file under the new name. If the firmware is
available under the old name, it is severely outdated. If the switch to the old
file name is performed, further firmware loading will either permanently fail
(if it is not available) or an outdated firmware version will be used.

Drop support for the fallback firmware file name and fail directly if the
firmware is not available under its current name.
On following attempts, the firmware read will then be retried with the correct
current name instead of the old name.

As reasoned above, there should be no negative effects of this change, while
simplifying code (the B40 variant will be handled identical compared to the
other variants of the si2168) and at the same time fixing possible problems if
firmware loading fails on resume.

Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
---
 drivers/media/dvb-frontends/si2168.c      | 21 ++++-----------------
 drivers/media/dvb-frontends/si2168_priv.h |  1 -
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 14b93a7d3358..7fae5b1b8adf 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -448,23 +448,10 @@ static int si2168_init(struct dvb_frontend *fe)
 	/* request the firmware, this will block and timeout */
 	ret = request_firmware(&fw, dev->firmware_name, &client->dev);
 	if (ret) {
-		/* fallback mechanism to handle old name for Si2168 B40 fw */
-		if (dev->chip_id == SI2168_CHIP_ID_B40) {
-			dev->firmware_name = SI2168_B40_FIRMWARE_FALLBACK;
-			ret = request_firmware(&fw, dev->firmware_name,
-					       &client->dev);
-		}
-
-		if (ret == 0) {
-			dev_notice(&client->dev,
-					"please install firmware file '%s'\n",
-					SI2168_B40_FIRMWARE);
-		} else {
-			dev_err(&client->dev,
-					"firmware file '%s' not found\n",
-					dev->firmware_name);
-			goto err_release_firmware;
-		}
+		dev_err(&client->dev,
+			"firmware file '%s' not found\n",
+			dev->firmware_name);
+		goto err_release_firmware;
 	}
 
 	dev_info(&client->dev, "downloading firmware from file '%s'\n",
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 18bea5222082..4f4d122e3963 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -18,7 +18,6 @@
 #define SI2168_A30_FIRMWARE "dvb-demod-si2168-a30-01.fw"
 #define SI2168_B40_FIRMWARE "dvb-demod-si2168-b40-01.fw"
 #define SI2168_D60_FIRMWARE "dvb-demod-si2168-d60-01.fw"
-#define SI2168_B40_FIRMWARE_FALLBACK "dvb-demod-si2168-02.fw"
 
 /* state struct */
 struct si2168_dev {
-- 
2.31.1

