Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25F636C270
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235501AbhD0KOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235268AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEC5E613CF;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=Dz4yuaAkE3G30hsowoZG+/b+CgXUAS8PpNDZLkNm+lU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LBf4W9RKz5BBonSdEtXhxn5lmb/bEJ9yN6halpTLgkI/cMsCSJ8CJGFBoFe/6MlvK
         uE4rOQO+oQW0k5nRlKLEvRnzgonMoScpGmuIutaGqH20jMZ7DrStIswhsI1cASeR28
         Jv/xYkLc8h6i8BexaOtpohbUDmyWxG/wPEEcIge/2r9+GgCi5GUgKIa6xcNYc/SlNF
         DQlXowrftBJUmHiuE1E0oHzAwC8Yn950smVVRaZ8nZlnC50VgEWon3RaRJuoTfBxy6
         JG0BKJ/bNkObmaUnpmLrpcunepLNOlix4DB0d9DkBD5mbl3n2KefwNeJFNPQTJ++fQ
         68AlL84UtPaTg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j4f-9q; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 02/79] media: i2c: ccs-core: return the right error code at suspend
Date:   Tue, 27 Apr 2021 12:12:29 +0200
Message-Id: <745502b8a3216c0607dcb2a9c401636f245c32ad.1619518193.git.mchehab+huawei@kernel.org>
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

If pm_runtime resume logic fails, return the error code
provided by it, instead of -EAGAIN, as, depending on what
caused it to fail, it may not be something that would be
recovered.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Fixes: cbba45d43631 ("[media] smiapp: Use runtime PM")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9dc3f45da3dc..b05f409014b2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3093,7 +3093,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 	if (rval < 0) {
 		pm_runtime_put_noidle(dev);
 
-		return -EAGAIN;
+		return rval;
 	}
 
 	if (sensor->streaming)
-- 
2.30.2

