Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61AE398DD5
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 17:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhFBPHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 11:07:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231200AbhFBPHK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 11:07:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4E36613BF;
        Wed,  2 Jun 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622646327;
        bh=O+MVZK2/VWrOv0uNopPTZk4ef5SjBfIFg4HgutEUxc4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M2dpSqDMav4VZzm17qWX3o18vHiY0sFfvlftLEIwcDyfxZs9nS51U7xANVUh31S1X
         h1EuuzY13soZbe19UGG+tJwuPRb4pIjaeBPxy2lliZkdCaiJcO8BHAQi8DwIT08i+u
         M6JomKk3PBwSPnf+zyJGMK9DRUnwQBPVVr84KEtEQoT9+9DjnkVlGoRQULVCrkFqvO
         TwKGKG2OezPfo+Ty45YS68LT/LrXR8dSd1fT9qFuKZhP6KPUMWbuxPekOKB5vOv9OK
         hJCh7y4/rm/U2Inex1qDwUqMHZBTyjZHxkxZ63PJbDFf3KQVqCAM38wUEg23Ky/YjI
         j2o62Dkf/dzzQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loSQu-006Wan-T3; Wed, 02 Jun 2021 17:05:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/6] media: saa7134: drop a NO-BREAK SPACE
Date:   Wed,  2 Jun 2021 17:05:21 +0200
Message-Id: <c5bfa09582f2bf1e9eb4666b12758ffda01db8b6.1622646256.git.mchehab+huawei@kernel.org>
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

There are two spaces on a comment there, being one of them
an U+00a0 (' '): NO-BREAK SPACE.

Drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/saa7134/saa7134-tvaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-tvaudio.c b/drivers/media/pci/saa7134/saa7134-tvaudio.c
index aa0895d2d735..9e0c442abc76 100644
--- a/drivers/media/pci/saa7134/saa7134-tvaudio.c
+++ b/drivers/media/pci/saa7134/saa7134-tvaudio.c
@@ -871,7 +871,7 @@ void saa7134_enable_i2s(struct saa7134_dev *dev)
 	switch (dev->pci->device) {
 	case PCI_DEVICE_ID_PHILIPS_SAA7133:
 	case PCI_DEVICE_ID_PHILIPS_SAA7135:
-		/* Set I2S format (SONY)  */
+		/* Set I2S format (SONY) */
 		saa_writeb(SAA7133_I2S_AUDIO_CONTROL, 0x00);
 		/* Start I2S */
 		saa_writeb(SAA7134_I2S_AUDIO_OUTPUT, 0x11);
-- 
2.31.1

