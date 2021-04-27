Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A13A36C28E
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbhD0KO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:34780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235401AbhD0KOf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AECA6140E;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=P8ySBvxIssOsYGuosUcRi8p/mrvcDEnJfSep5KVO8S8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eONmV9/Mm7lWd/FtO3g4WINxflJmJtpHA4XFXzVRMKKfXnwgMPS0ZH9uy+mCadeGT
         5QSjs7E/k4dNVQiEARQRV+kSDoxicT8oxEyt2F6E6r0zC30sPPs7hJncR+mzDYaK4K
         Xi6kseIxUJtpENi8mAnN9kYD+aj0msQWS6CXByKWHJVYCKVKJMGSMyNN8xoagrFhpe
         +9hw/9R2IbfXDmUz4bz6ZGtRRxxs8g7phPZipI9btpAMp9eHG6nHZGRoRAZsG6F53b
         jOsD2M+Z+er6R76BlY2N7x9vqtpaRTS91Nrz0UVyfW4cEmADsEirufNvvYEnrq9fFK
         YbIdlkb6tBtBA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j5k-5k; Tue, 27 Apr 2021 12:13:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 24/79] staging: media: cedrus_video: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:12:51 +0200
Message-Id: <3c993a816dba970cf45d7d9ecbae8b13047ee18a.1619518193.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index b62eb8e84057..9ddd789d0b1f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -490,11 +490,9 @@ static int cedrus_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
-		ret = pm_runtime_get_sync(dev->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(dev->dev);
+		ret = pm_runtime_resume_and_get(dev->dev);
+		if (ret < 0)
 			goto err_cleanup;
-		}
 
 		if (dev->dec_ops[ctx->current_codec]->start) {
 			ret = dev->dec_ops[ctx->current_codec]->start(ctx);
-- 
2.30.2

