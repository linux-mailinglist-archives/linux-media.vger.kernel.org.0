Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359A9369F3C
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237103AbhDXGqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232556AbhDXGqM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 235B661582;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=P8ySBvxIssOsYGuosUcRi8p/mrvcDEnJfSep5KVO8S8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VKO9//nAW4HuRE83veUq4t2sAUiO1ZD6GT+WtlCJbxh2Pwmt4Emh2dCEsdBFxi3lX
         9Lq9YL7J3aiCAjPuUPqWUDIDMeLTI4VtsTZc3DRGu1CmGqlm4xfODLYLEHgi3Vlog3
         0Nh3yuO5UD7MUqDYXHEmpWSOY+QHCbwQMj67QUR2uCIhuLAYpSpvZyWukopDhnyPcd
         D6d+acRK+Nyazme5Y8Fc0oSAqKz8Bob/prMSZImAZJx3aoAc4/5T0nciIK/hReYzOa
         zA/kFa8s5PPxu5HZ945P5f8JFPYIni3mFsLBOxzwjB2p/KQCDtUNECNEeTSVISwnie
         M/9oehEWrRVwA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JeU-Aw; Sat, 24 Apr 2021 08:45:31 +0200
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
Subject: [PATCH 16/78] staging: media: cedrus_video: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:26 +0200
Message-Id: <58a0e35f0da9e7c25dea9088a439a77c6a448626.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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

