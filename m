Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEE13756FB
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbhEFP2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235579AbhEFP1z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E82DD613F9;
        Thu,  6 May 2021 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314800;
        bh=xz8CqpZ4+x3T0PuHBH80JgKsOsDXkGM9E9TZgFaHE80=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WVkPCXeD/lC2yqMDp38ScqUMAWU2/1tLoLJHjvaCXAv5jVf6FqVdqIlH/vUsJLOdf
         HPng1B2hSGwakbAMEiMzLFQU8RnQVP0SlAiNKfgv8RgqF00Daeg8zUY2R4JM4MPJtv
         6YXBNmenQpA9aXDdCKQcaGj9y5aankpgBvLNT/1Ws7ZcWgmjyoCrN5venUu29Iq7mw
         XCXF82uZr4o7gHAl8wfelwaFKYyKLYDhBYnbJW8phEYWNuyWBP1dOdegxCOKE4l998
         Ud6xdnulaQJbSA3vcY/oketjMySqcLTCSeEVTP5y4t2ePpcs/QdGFlvzdoe6vjw6VS
         xR54OYXPCZupg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBH-PC; Thu, 06 May 2021 17:26:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 04/25] staging: media: cedrus_video: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:42 +0200
Message-Id: <be4047dc72232adcedfa319aa4dfcee7bcde8d80.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

