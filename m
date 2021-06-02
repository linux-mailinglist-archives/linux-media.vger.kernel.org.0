Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2684398DD8
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 17:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhFBPHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 11:07:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:37154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231222AbhFBPHK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 11:07:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF42A613DC;
        Wed,  2 Jun 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622646327;
        bh=VcUDzLBpUXY5w7/LYOXYcxyvTx01ee92Vnvy8qVnODQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=puvJ1OCMuD6zuTdAvfzr+bSGjb9RO1Ro86mtJ8F3R4nAi53e35OGbfiUwOFeQLkV2
         RtquLnYsDzjLea6jfh8X+JjwGHhlvvZ0ilB014Qe01co67oJzy17bxVw/uh22s0FyD
         sUtN5J6T7BbvPsp0uKoWQW1ZC+LpaSQtxNbIvpO5PX/OSBUHdgfIZiKETrKwLRAxW4
         7GV6hZQ7CV8a7qZezRCQK0AU3KG/PAGMJSBIdrmgtsY9vGfe1K3ATrsgx0cp9mVvMc
         /P3BbQDPUUOedvs/l3j/OjUWI3hu1ApwyFXu3R59fUfvSM2mr9qwoVZp2UmGUUvLRK
         uftohUaBfTHiw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loSQu-006Wab-On; Wed, 02 Jun 2021 17:05:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/6] media: gspca: ov519: replace RIGHT SINGLE QUOTATION MARK
Date:   Wed,  2 Jun 2021 17:05:18 +0200
Message-Id: <81641fb8f0ed60ccaf9f9291e4ac1d238140bc4a.1622646256.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622646256.git.mchehab+huawei@kernel.org>
References: <cover.1622646256.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the occurences of the following character:

	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK

By a normal single comma character.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/gspca/ov519.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
index cd6776c3163b..bffa94e76da5 100644
--- a/drivers/media/usb/gspca/ov519.c
+++ b/drivers/media/usb/gspca/ov519.c
@@ -614,7 +614,7 @@ static const struct ov_i2c_regvals norm_3620b[] = {
 	/*
 	 * From the datasheet: "Note that after writing to register COMH
 	 * (0x12) to change the sensor mode, registers related to the
-	 * sensor’s cropping window will be reset back to their default
+	 * sensor's cropping window will be reset back to their default
 	 * values."
 	 *
 	 * "wait 4096 external clock ... to make sure the sensor is
-- 
2.31.1

