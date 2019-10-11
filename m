Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6923BD4971
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 22:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbfJKUsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 16:48:47 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:20871 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbfJKUsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 16:48:47 -0400
Received: from localhost.localdomain ([93.22.132.170])
        by mwinf5d31 with ME
        id CLoj210093gkMzx03Lojbg; Fri, 11 Oct 2019 22:48:45 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 11 Oct 2019 22:48:45 +0200
X-ME-IP: 93.22.132.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: i2c: adv7842: make array cri static and const, makes object smaller
Date:   Fri, 11 Oct 2019 22:48:29 +0200
Message-Id: <20191011204829.11537-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't populate the array 'cri' on the stack but instead make it
static and const. Makes the object code smaller by 165 bytes.

Turn the 2nd parameter of 'log_infoframe()' const accordingly.

Before:
   text	   data	    bss	    dec	    hex	filename
  98533	  20024	    256	 118813	  1d01d	drivers/media/i2c/adv7842.o

After:
   text	   data	    bss	    dec	    hex	filename
  98304	  20088	    256	 118648	  1cf78	drivers/media/i2c/adv7842.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/adv7842.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 885619841719..0855f648416d 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2547,7 +2547,7 @@ struct adv7842_cfg_read_infoframe {
 	u8 payload_addr;
 };
 
-static void log_infoframe(struct v4l2_subdev *sd, struct adv7842_cfg_read_infoframe *cri)
+static void log_infoframe(struct v4l2_subdev *sd, const struct adv7842_cfg_read_infoframe *cri)
 {
 	int i;
 	u8 buffer[32];
@@ -2585,7 +2585,7 @@ static void log_infoframe(struct v4l2_subdev *sd, struct adv7842_cfg_read_infofr
 static void adv7842_log_infoframes(struct v4l2_subdev *sd)
 {
 	int i;
-	struct adv7842_cfg_read_infoframe cri[] = {
+	static const struct adv7842_cfg_read_infoframe cri[] = {
 		{ "AVI", 0x01, 0xe0, 0x00 },
 		{ "Audio", 0x02, 0xe3, 0x1c },
 		{ "SDP", 0x04, 0xe6, 0x2a },
-- 
2.20.1

