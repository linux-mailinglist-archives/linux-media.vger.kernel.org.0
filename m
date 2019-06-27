Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7DD5827A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 14:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfF0MYV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 08:24:21 -0400
Received: from faui03.informatik.uni-erlangen.de ([131.188.30.103]:52512 "EHLO
        faui03.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726375AbfF0MYU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 08:24:20 -0400
X-Greylist: delayed 520 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Jun 2019 08:24:20 EDT
Received: from faui01a.informatik.uni-erlangen.de (faui01a.informatik.uni-erlangen.de [IPv6:2001:638:a000:4160:131:188:60:127])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 6776F241589;
        Thu, 27 Jun 2019 14:15:17 +0200 (CEST)
Received: by faui01a.informatik.uni-erlangen.de (Postfix, from userid 30063)
        id 56D19F40079; Thu, 27 Jun 2019 14:15:17 +0200 (CEST)
From:   Lukas Schneider <lukas.s.schneider@fau.de>
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, st5pub@yandex.ru,
        gabrielfanelli61@gmail.com, code@wizofe.uk,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     Lukas Schneider <lukas.s.schneider@fau.de>,
        Jannik Moritz <jannik.moritz@fau.de>, linux-kernel@i4.cs.fau.de
Subject: [PATCH] media: bcm2048: Macros with complex values should be enclosed in parentheses
Date:   Thu, 27 Jun 2019 14:15:15 +0200
Message-Id: <20190627121515.32029-1-lukas.s.schneider@fau.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix ERROR: Macros with complex values should be enclosed in parentheses,
reported by checkpatch.

Add a do {...} while (0) loop around the macro.

Signed-off-by: Lukas Schneider <lukas.s.schneider@fau.de>
Signed-off-by: Jannik Moritz <jannik.moritz@fau.de>
Cc: <linux-kernel@i4.cs.fau.de>
---
 drivers/staging/media/bcm2048/radio-bcm2048.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
index 2c60a1fb6350..206f2a662f92 100644
--- a/drivers/staging/media/bcm2048/radio-bcm2048.c
+++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
@@ -2001,8 +2001,10 @@ static ssize_t bcm2048_##prop##_read(struct device *dev,		\
 }
 
 #define DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check)		\
-property_write(prop, prop_type, mask, check)				\
-property_read(prop, mask)						\
+do {									\
+	property_write(prop, prop_type, mask, check)			\
+	property_read(prop, mask)					\
+} while (0)								\
 
 #define property_str_read(prop, size)					\
 static ssize_t bcm2048_##prop##_read(struct device *dev,		\
-- 
2.22.0

