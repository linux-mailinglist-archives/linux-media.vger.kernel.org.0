Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D1945439B
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235071AbhKQJ2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:58818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235004AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED5086323F;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141142;
        bh=BNv/RXf2LPs/ZsQ3yHCR8w+D7SMDn51B2wu47lXDf0M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lTVIXqitVBgsKQyy+zuTuY/303GUsLAnzEFMnUXSTb8uxL486sslEXILw+upe5ilE
         HWioAUxQ8fQkOkBcIA4/aQW+Z1uNfmjLdzpVaJBTZiD6yukouAYTMhyup0OAaK4RFF
         /pgR6hYLeX8+9MKbXAvIxBaMUCwNYIlQOzCwrF4VLJyO9piv1AUiH3C57pNxk+qUkO
         wy7CMIXIeozu6bTyllAPoaKo3Bdz/4w/vOMBntSJnC0Hob4RMf+A0wZn3e/Gyg6XvR
         Iokgobt/WlJRHPzTwUm0oNetwJptjAPCs/JSR8RMP5Xd3ebhYYRxxr+xvG8ROL/k5a
         CaO8DgUsBz+3A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb6D-Cc; Wed, 17 Nov 2021 09:25:39 +0000
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
Subject: [PATCH 13/13] media: atomisp: sh_css_sp: better support the current firmware
Date:   Wed, 17 Nov 2021 09:25:38 +0000
Message-Id: <f0c9b8ec25fedbfccac6d14ff1add2d40beaa088.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
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
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index f6db1f4a0e1d..a11078acb072 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -982,6 +982,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	/* Make sure binary name is smaller than allowed string size */
 	assert(strlen(binary_name) < SH_CSS_MAX_BINARY_NAME - 1);
 	strscpy(sh_css_isp_stage.binary_name, binary_name, SH_CSS_MAX_BINARY_NAME);
+	sh_css_isp_stage.binary_name[SH_CSS_MAX_BINARY_NAME - 1] = 0;
 	sh_css_isp_stage.mem_initializers = *isp_mem_if;
 
 	/*
@@ -1013,16 +1014,14 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
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

