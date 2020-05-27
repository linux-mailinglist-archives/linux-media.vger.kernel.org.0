Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFA21E39FC
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgE0HMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgE0HML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:11 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751FBC061A0F;
        Wed, 27 May 2020 00:12:11 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d10so11370032pgn.4;
        Wed, 27 May 2020 00:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lhqAHEvRLnCQw7o+jUfsPtsKFyOebABISvsPaRwN9pA=;
        b=tqxJOttPm9K91CJ00mLJnUiAm1t1uMYT9X8Uz2q1H8u9cWNxW1ufnkn62fGcdyZewN
         2+9ifHAzzHrwSgF7fZcih1x3rXo5v9q6lIJRcqUw3kMRr29v7wuE1aATEWiY0a1OsTx4
         HafOHxpmDKCCFWMX70fPy0aPqsABeWUCUuERe5uOwWo1cxhFPfYjFVW+aqSaGBcF11oN
         UT+X71CayWscpuzgUOtuN2809KmW3/BQjrcbddJGInKHdb4bsnaSKRUQj44HEvaIfOYo
         kDvygzPkh025tfoujSQyefU39dt/TUqTWQvz1LgeRmjYVAN1vJ9pYe/Qel+Aj6OPCyIm
         RjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lhqAHEvRLnCQw7o+jUfsPtsKFyOebABISvsPaRwN9pA=;
        b=nPUzTcIWzqEab2T0nfQVgEY7AwxMSVpiooylGmFEYCCSkV5zAYIucXffVdp5w+U1Bv
         W+bQ1bVHWDqrjcUqy0b9/GPEv18jQ7E4NlSxhT5O4wx0yJ4nnQs8RThkEjlIr6Mbwlpf
         DbB/Zh5IRe5mYL/ILlpVpBrcab7ENutHKITmMOtLSawrpWFoiTsyWXuiUp052dCvKdqA
         NtgVT86LQfuDSmP1XzP/W/4ypsdH4muu9dXECEZz1IpELLzkkKlLFlf5qb2oyUD9nPlc
         VR5/erTJSoFD5Lt6NgRSxB7FLx1/UYWO457Cl9+NnckkPJQNo9QNh24VrwI/zfI9dRNo
         i/tQ==
X-Gm-Message-State: AOAM530h81LNyq8jRmFAikLDc0/1RZP/rOYxdUvfvJgRsXnRB6blKeJQ
        Sk6l8SpOhIyCROmKRY8SNKk=
X-Google-Smtp-Source: ABdhPJxJ26ZoY/VgMQTRMEVnpnq9cud32xiSg/d3bcZs3eFcYav/pHsIvDXVtq4L/0Mqm9sua55Yiw==
X-Received: by 2002:a62:7c02:: with SMTP id x2mr2597592pfc.70.1590563530733;
        Wed, 27 May 2020 00:12:10 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:10 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 1/7] media: atomisp: Clean up if block in sh_css_sp_init_stage
Date:   Wed, 27 May 2020 00:11:44 -0700
Message-Id: <20200527071150.3381228-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200527071150.3381228-1-natechancellor@gmail.com>
References: <20200527071150.3381228-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 27 +++----------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index e574396ad0f4..e242a539d3d8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1015,34 +1015,15 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		return err;
 
 #ifdef USE_INPUT_SYSTEM_VERSION_2401
-#ifndef ISP2401
-	if (args->in_frame)
-	{
-		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
-		if (!pipe)
-			return IA_CSS_ERR_INTERNAL_ERROR;
-		ia_css_get_crop_offsets(pipe, &args->in_frame->info);
-	} else if (&binary->in_frame_info)
-	{
+	if (stage == 0) {
 		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
 		if (!pipe)
 			return IA_CSS_ERR_INTERNAL_ERROR;
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

base-commit: 938b29db3aa9c293c7c1366b16e55e308f1a1ddd
-- 
2.27.0.rc0

