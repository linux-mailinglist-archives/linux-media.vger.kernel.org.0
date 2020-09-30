Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E0527E136
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgI3Gg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727879AbgI3GgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30EA820848;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=wRYmwrJoVTlKYVhTNle0w913kEMZ6oaUyWqGxVGBwB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=APyXEFLZxmBH9JVPmlic2CgB61ETploF0apWqh/vfvTt/8jio6Iuyj+NgsPnPeYPZ
         G3sd3rfkp9tS8LarDdksrlO+CKxGhMSXzDhiHvpoYWapZIfU2rxg2d5SSioZjFre2o
         R2emtxwhJiXsMbOduU1Ct6itiJpcQqis7cP9lA9M=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVid-001QmU-Td; Wed, 30 Sep 2020 08:36:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] media: dvb-frontends: remove a clone of a kernel-doc markup at zd1301_demod.h
Date:   Wed, 30 Sep 2020 08:35:57 +0200
Message-Id: <d743e0e22443692b97017b0c1a943634735b86df.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The same markup are there twice, causing warnings with
Sphinx 3.x. Drop the second copy.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-frontends/zd1301_demod.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/zd1301_demod.h b/drivers/media/dvb-frontends/zd1301_demod.h
index d56196f5c801..01eaacf76a13 100644
--- a/drivers/media/dvb-frontends/zd1301_demod.h
+++ b/drivers/media/dvb-frontends/zd1301_demod.h
@@ -43,12 +43,6 @@ struct i2c_adapter *zd1301_demod_get_i2c_adapter(struct platform_device *pdev);
 
 #else
 
-/**
- * zd1301_demod_get_dvb_frontend() - Attach a zd1301 frontend
- * @dev: Pointer to platform device
- *
- * Return: Pointer to %struct dvb_frontend or NULL if attach fails.
- */
 static inline struct dvb_frontend *zd1301_demod_get_dvb_frontend(struct platform_device *dev)
 {
 	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
-- 
2.26.2

