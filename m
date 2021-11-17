Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D759B454463
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbhKQKAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:00:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:35328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235776AbhKQJ74 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EC4B63247;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=M77l7JR0ZRZt9vKWubCd/o4WeZjQYjs7iLZi1U0Zpgo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LudD0ixE4UvfuZSZhnu283TcAUIgmTYQKEQulTEvxgF0C0dXCvg/0IMI95vGWaLoI
         YtYL9pTPDqVYVF0jmp0Qqe+yNEreBVtrZpcnjy3Qgsgt0fAxyDOoCCyga5i9inYBsS
         7O3oC6us+4mIJJfpX+4hCXVTRSkpiFXdCUOJz9/30YGvxXGcnNgkVg8ByWNNwdFI2w
         xSBox+L+mZ4THT0u1N+/KcMq5FxYKvGX/pR+Csr5NM1baKLlmGugmTbZicbMdCGF+/
         lMNwSopShCqkRs949Rj9SUrNXJD96BhAzfT313THImzwRD6tBAsLPuz9Xj36JV56H8
         LiefApBe7qALg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUz-AF; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 12/12] media: atomisp: sh_css_sp: better support the current firmware
Date:   Wed, 17 Nov 2021 09:56:54 +0000
Message-Id: <f2616ee88150b1fce581ac0349fb6c51f0f817b3.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we're using Intel Aero firmware, make the code closer to the
driver for such device.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 778639f391cb..299e1071f837 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1001,6 +1001,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	/* Make sure binary name is smaller than allowed string size */
 	assert(strlen(binary_name) < SH_CSS_MAX_BINARY_NAME - 1);
 	strscpy(sh_css_isp_stage.binary_name, binary_name, SH_CSS_MAX_BINARY_NAME);
+	sh_css_isp_stage.binary_name[SH_CSS_MAX_BINARY_NAME - 1] = 0;
 	sh_css_isp_stage.mem_initializers = *isp_mem_if;
 
 	/*
@@ -1032,16 +1033,14 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		return err;
 
 #ifdef ISP2401
-	if (stage == 0) {
-		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
-		if (!pipe)
-			return -EINVAL;
+	pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
+	if (!pipe)
+		return -EINVAL;
 
-		if (args->in_frame)
-			ia_css_get_crop_offsets(pipe, &args->in_frame->info);
-		else
-			ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
-	}
+	if (args->in_frame)
+		ia_css_get_crop_offsets(pipe, &args->in_frame->info);
+	else if (&binary->in_frame_info)
+		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
 #else
 	(void)pipe; /*avoid build warning*/
 #endif
-- 
2.33.1

