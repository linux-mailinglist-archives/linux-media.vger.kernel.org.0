Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9316945CCE7
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351172AbhKXTQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:52798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351103AbhKXTQl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6180261059;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=gTRgvwSM8dbBnWYcx5UP6td6uAyzHJtfnz599HRc3s4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ac5XOsIKaSaoD3/o1PjrUfk4JgFs+YIKfP16uiqwETJ2SLLmy8cQ4grbdOiHGfFYm
         uON3F8I/mXltumZicA8f3QZ6XUbfjHy/nWMGjxp+dW0ngo104jLFM33ibp6XGkUYok
         EeKj+7nWLb79z0yI/Kf4PbipNmYI6ChI6TVRChrKX9QRU+vrMoQw4SESTvYW4xq7y6
         zyt7cQBMh8cdrdS0YlfBpXkmih2rDoV11+XNN6dz2Q96/C52RpDmO11YbiDTsrtvZJ
         oVwKiYefQCvgZjIYuGBg+z1kTzc/wBePSHfVrwODPXuFLYnzSSZp8Zxbl3xwfB2nqb
         g9KODGd/AiyVg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5f-KZ; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 12/20] media: au0828-i2c: drop a duplicated function
Date:   Wed, 24 Nov 2021 20:13:15 +0100
Message-Id: <1c5aeba00713d643e6f5600090b68e3d3689c5dd.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function is not used and it is identical to
i2c_slave_did_read_ack(). So, just drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/usb/au0828/au0828-i2c.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
index 708f01ab47fa..749f90d73b5b 100644
--- a/drivers/media/usb/au0828/au0828-i2c.c
+++ b/drivers/media/usb/au0828/au0828-i2c.c
@@ -23,13 +23,6 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
 #define I2C_WAIT_DELAY 25
 #define I2C_WAIT_RETRY 1000
 
-static inline int i2c_slave_did_write_ack(struct i2c_adapter *i2c_adap)
-{
-	struct au0828_dev *dev = i2c_adap->algo_data;
-	return au0828_read(dev, AU0828_I2C_STATUS_201) &
-		AU0828_I2C_STATUS_NO_WRITE_ACK ? 0 : 1;
-}
-
 static inline int i2c_slave_did_read_ack(struct i2c_adapter *i2c_adap)
 {
 	struct au0828_dev *dev = i2c_adap->algo_data;
-- 
2.33.1

