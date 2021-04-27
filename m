Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6BC36C268
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235446AbhD0KOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235133AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0FCF61185;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518430;
        bh=5AHhx16DJL5gdJqgumKoh72s5QcxkeHszhw8tqlTmq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NTA2S1Sonleg150UpGEVecKnFYj5RHSvkQVL4DvMeWJhOWgWc473mJZuzHMDM+8cb
         AOdW6pRJjU3f/SXMbU/eAdTCp3cL4Qbw+Ikdbe69CsKulaLFTh/KREbaWdCAofyzrw
         G9u9zDZNSZwrbax1s1S8HwDL1p89TAxuI3vEXQDmGACKYeFV3owAqx3l4LowUw9E7u
         0cz3kVwhEi6r0FhH3WszSczzCYMHeJoDbNsUgj6FwV7BvLk5D3oM78ONjVT2mdU+U/
         sxeNIrFFaweUH3XMZRM1o3fixW2EgDeTxns4KkX+7dkyBaXWayHIa9M3tsTNZlP7OH
         KNH6mdRPWjGWA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j4m-Ce; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Songjun Wu <songjun.wu@microchip.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 04/79] media: i2c: ov7740: don't resume at remove time
Date:   Tue, 27 Apr 2021 12:12:31 +0200
Message-Id: <7d310b4db4f7b24bd187d76ab21eabc36e4a7856.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling pm_runtime_get_sync() at driver's removal time is
not right, as this will resume PM runtime. This is clearly
not what it is desired there, since it calls
pm_runtime_set_suspended() afterwards.

So, just remove pm runtime get/put logic from the device
removal logic.

Fixes: 39c5c4471b8d ("media: i2c: Add the ov7740 image sensor driver")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ov7740.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 47a9003d29d6..ed6904b2e8f5 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1165,10 +1165,8 @@ static int ov7740_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	ov7740_free_controls(ov7740);
 
-	pm_runtime_get_sync(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
 
 	ov7740_set_power(ov7740, 0);
 	return 0;
-- 
2.30.2

