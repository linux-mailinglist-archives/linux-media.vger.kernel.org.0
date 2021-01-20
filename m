Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F6A2FCE6C
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387600AbhATKlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:41:05 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40641 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731652AbhATJoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:44:44 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Cl8jFp; Wed, 20 Jan 2021 10:43:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135794; bh=IDsjD26s9Euj4LyFV2CX/jH5MvgJQtDQzudauhxg5Es=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=kn+T8KzmzfKD1JHGc5chdePZs0CS823G0kbJ70WCSa6vb0OeMRmufD2YrT185rIFT
         KqXgameTx8Ld/B4/WbURMCHrpBmUIQBCitQKiQwxyBhLlpkMZOenVqVIwT9xt9igf9
         txbtEt1wFK2xgzoAt1c9T0Ju2q9ffo50IiuEL6jBQ4gUgOZxtAykkT1Ruk411q9CE+
         18H4rn9Q6VUGYS/fdFoDym/uD5s3nfZiWrYRXYaTHvkCjTsy/VuaLygZBR5pwhR5Ze
         QmTLCrFeFGK2jE8/q2qTRE65csEpMYARHmSwUHjByrm1FimYfH8ggdvNGpuLtyvUqW
         iTA1/fikqAnRw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 14/14] i2c/ov02a10.c: add cast to fix type mismatch
Date:   Wed, 20 Jan 2021 10:43:06 +0100
Message-Id: <20210120094306.784318-15-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFBmGvvIwAai6tS3xwV9jizlTIpPC1BRkt5zPhw/jABfdUFd8iZJDaGlQzyTlMRxlWvat/SWxV7oqACoU1YyUVOyjCwTWyP12TnFGah7LkRj926zOx+1
 CanBVhBYdbVOCeUxqt/9PyeJ5nT4/YorDGl3CNNkHZAMkgsMGqFUnLM+4qS47DqniBN8MxgADgUL+X4MXacdfA21CmbZW3hjOH4/5LCHFJF53oXTHYtXgiXs
 +VKVew8VTexvUxYzSAPp+Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By adding this cast '(__force __le16)' this sparse warning
is fixed:

drivers/media/i2c/ov02a10.c:391:19: warning: cast to restricted __le16

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/ov02a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 8683ffd3287a..60b4bc645334 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -388,7 +388,7 @@ static int ov02a10_check_sensor_id(struct ov02a10 *ov02a10)
 	if (ret < 0)
 		return ret;
 
-	chip_id = le16_to_cpu(ret);
+	chip_id = le16_to_cpu((__force __le16)ret);
 
 	if ((chip_id & OV02A10_ID_MASK) != OV02A10_ID) {
 		dev_err(&client->dev, "unexpected sensor id(0x%04x)\n", chip_id);
-- 
2.29.2

