Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE02ED319
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 12:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfKCLYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 06:24:48 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54793 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727501AbfKCLYs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 06:24:48 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDzviydbGTzKrRDzzigkL0; Sun, 03 Nov 2019 12:24:47 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/8] em28xx: fix two smatch warnings
Date:   Sun,  3 Nov 2019 12:23:35 +0100
Message-Id: <20191103112338.22569-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNNAn3hofzIq14hM2fVcja2yCx3Ix9gAlypF/SDzL7S+scT4oo/G226iEDwO2OgHb1x6yIF1Ox8NT6od6rUkbAc7G/5Ql0B8pO3Z1Io5u88Cs7usu2zZ
 DNZwglDg295YaoMnzl+C4DMXRom4AJb7LTjyw+WQl/F0KDRD4WBW3+9vQkxneaotqEH2qNvwlylKIEL7/q3Od3icsHfSVbLxOCErTT79X/aA9DmbRhiQ10ee
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use sizeof instead of ARRAY_SIZE to fix this smatch warning:

drivers/media/usb/em28xx/em28xx-i2c.c:952 em28xx_do_i2c_scan() warn: calling memset(x, y, ARRAY_SIZE());

Do the same for the em28xx_hash_mem() call in the same function.
smatch didn't pick that up, but there too it should use sizeof instead
of ARRAY_SIZE.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/em28xx/em28xx-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index a3155ec196cc..592b98b3643a 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -949,7 +949,7 @@ void em28xx_do_i2c_scan(struct em28xx *dev, unsigned int bus)
 	unsigned char buf;
 	int i, rc;
 
-	memset(i2c_devicelist, 0, ARRAY_SIZE(i2c_devicelist));
+	memset(i2c_devicelist, 0, sizeof(i2c_devicelist));
 
 	for (i = 0; i < ARRAY_SIZE(i2c_devs); i++) {
 		dev->i2c_client[bus].addr = i;
@@ -964,7 +964,7 @@ void em28xx_do_i2c_scan(struct em28xx *dev, unsigned int bus)
 
 	if (bus == dev->def_i2c_bus)
 		dev->i2c_hash = em28xx_hash_mem(i2c_devicelist,
-						ARRAY_SIZE(i2c_devicelist), 32);
+						sizeof(i2c_devicelist), 32);
 }
 
 /*
-- 
2.23.0

