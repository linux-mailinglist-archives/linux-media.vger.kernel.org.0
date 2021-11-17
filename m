Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11D04547D2
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 14:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236377AbhKQN42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 08:56:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:57266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230266AbhKQN41 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 08:56:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACD2A61B64;
        Wed, 17 Nov 2021 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637157208;
        bh=/WHQ1Ps5XYsLA7IaGT1brD7EntvRlSrCZToN1LoCfUE=;
        h=From:To:Cc:Subject:Date:From;
        b=FiOoYQfUgWcmql6ljTYeQBKfiwuBOX1VY+l7c8M3N1NwSLqdHATKY6oe5hRD+2qX3
         n62N8kJSSXapbJ7MbUBijPkMn5q/3JHuY7LGrQgbutAeHg+vb9Zn5pfZ33Tqfz45KG
         aNmnDqBRoZiyDAl8rk1WugNRRotQ7bSh67KJYirYG+bFmYt271qoaZFS7UTNUUYrts
         UHh/Hvlo3nmooadoml03szgTKKaYKoM49oHuWObVoZH90JHeZZFrEngsnwbuzOUtAj
         Ta3SfLwKERa5VImvA0gsJebc1xyQyxc5wd2sT0hYnA4nALQyTBsTDEkVXJPFt/4FM3
         +2AOBfwU7lI1g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnLNN-00DLYp-P6; Wed, 17 Nov 2021 13:53:25 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Dan Carpenter" <dan.carpenter@oracle.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2] media: atomisp: sh_css_sp: better support the current firmware
Date:   Wed, 17 Nov 2021 13:53:24 +0000
Message-Id: <072927d1cebf47eb3020c26d2d2db3f51936c928.1637157198.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
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
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 778639f391cb..615500a7d3c4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1032,16 +1032,14 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
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
+	else
+		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
 #else
 	(void)pipe; /*avoid build warning*/
 #endif
-- 
2.33.1

