Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BE21E8EA1
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgE3G6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728854AbgE3G4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 975DD21775;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=yFRa24i4VZ+8r6vgV7GGlJU8KEqcDpSlIGpTIMqi52s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QrhrVxDYZ2Eej4TsUOLZqxyL46Hd+MUo6/ZQz9o4fkqe8da332nVw3OZheLX9rR4E
         a+r6Z0KnyMxfdskCTIdgQ4HacluOyFEz2rRMcbmM7Rghh60ahofnz03aahRZPzDBo7
         W3NdszMRJhApoHiGgoWXODbdaVbawrIrMe4yealg=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hpj-DO; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        kbuild test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 21/41] media: atomisp: Clean up if block in sh_css_sp_init_stage
Date:   Sat, 30 May 2020 08:55:38 +0200
Message-Id: <19d491af1c88d2b2f04a26301aabb05d233c2e28.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

Clang warns:

../drivers/staging/media/atomisp/pci/sh_css_sp.c:1039:23: warning:
address of 'binary->in_frame_info' will always evaluate to 'true'
[-Wpointer-bool-conversion]
                } else if (&binary->in_frame_info) {
                       ~~   ~~~~~~~~^~~~~~~~~~~~~

in_frame_info is not a pointer so if binary is not NULL, in_frame_info's
address cannot be NULL. Change this to an else since it will always be
evaluated as one.

While we are here, clean up this if block. The contents of both if
blocks are the same but a check against "stage == 0" is added when
ISP2401 is defined. USE_INPUT_SYSTEM_VERSION_2401 is only defined when
isp2401_system_global.h is included, which only happens when ISP2401. In
other words, USE_INPUT_SYSTEM_VERSION_2401 always requires ISP2401 to be
defined so the '#ifndef ISP2401' makes no sense. Remove that part of the
block to simplify everything.

Link: https://github.com/ClangBuiltLinux/linux/issues/1036

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 27 +++----------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index db543c3fec51..4f58562fb389 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1027,34 +1027,15 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		return err;
 
 #ifdef USE_INPUT_SYSTEM_VERSION_2401
-#ifndef ISP2401
-	if (args->in_frame)
-	{
+	if (stage == 0) {
 		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
 		if (!pipe)
 			return IA_CSS_ERR_INTERNAL_ERROR;
-		ia_css_get_crop_offsets(pipe, &args->in_frame->info);
-	} else if (&binary->in_frame_info)
-	{
-		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
-		if (!pipe)
-			return IA_CSS_ERR_INTERNAL_ERROR;
-		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
-#else
-	if (stage == 0)
-	{
-		if (args->in_frame) {
-			pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
-			if (!pipe)
-				return IA_CSS_ERR_INTERNAL_ERROR;
+
+		if (args->in_frame)
 			ia_css_get_crop_offsets(pipe, &args->in_frame->info);
-		} else if (&binary->in_frame_info) {
-			pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
-			if (!pipe)
-				return IA_CSS_ERR_INTERNAL_ERROR;
+		else
 			ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
-		}
-#endif
 	}
 #else
 	(void)pipe; /*avoid build warning*/
-- 
2.26.2

