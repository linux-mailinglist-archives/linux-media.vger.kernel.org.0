Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9170C1E3A0A
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgE0HMf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbgE0HMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:18 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F8FC03E979;
        Wed, 27 May 2020 00:12:18 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k22so9806036pls.10;
        Wed, 27 May 2020 00:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o9MqodWCLjikP8AmTG/rqhpi4jiJNC1PbUROm6v1d2Y=;
        b=cJB55FZzIe+wbZbOjO4+gkJQe15YMlmFQTxt+DZL0GpogJ10Wqsx3OHLygNdzhlD5t
         qE7H8Jj4R+LviV2dMs8V7qO5bBlsYuG68ANB7g0XTKFzNNeT0SXRE6zDFXFCxmznfA0v
         mN5KMi5gIwI48uC8b0Kcgk4k/59LITp4LV3NEwAqBrNzC7VqiBGxnIumjWCigThafMq3
         B6nQmRcMCtEBFe8j8GqQkP9nw6oMqmMpWAHy/oAYFQnqJTvKLst21e2EXIA7wlvDmudE
         U2eAYVMwlIYwiraTrd8FmigcrRtv/pRy5jFwCFoJ5eV++L8RCEmfTVmIq6A1BuASY/d+
         6ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o9MqodWCLjikP8AmTG/rqhpi4jiJNC1PbUROm6v1d2Y=;
        b=htm1jZ9zFvSDzi85pUCoUDZB5aIAhaVh2/VJNwZ3N93vig+xomt0HOFk0uWiEn/DVR
         HqiYiFZsdCAqK3YTDKvljqx53eEaC3w+REM7/SZeL2jXUccnIh9KGy6PK7z+e8m9Ql/f
         HW3SxwLHdumgEbDV6udnciXYGMZ4m48VL3KZO9yzbKbmfXGEcmeGYzKxCPEvcil7Xd+b
         c3zM9driQzbpLJhANsXzBiFW6mbIWxxO/A1m+4ZRolsUO4utH4bVT++rTTk43BcWG1K/
         64I2kCAUz+fVWCBUzr9pM9rAcIlCcpFa7hSC1/0wud9VTHYDXB8EfyNrjdwmDFKSJbc3
         ayIQ==
X-Gm-Message-State: AOAM531XSKKDxShFU/IicWFxEzFoiptf4Ds1qysqESomZU2upjLgh6Mp
        Zsy+tu3JcH63VxBpKCfxcYF4zcpnniY=
X-Google-Smtp-Source: ABdhPJxoHRdGCzwo58GDaHJ6G/BJrSAN4ab49i2zjyZzqDrlxy7DIG+b4ZCydP80auPUjGxfCvGnNg==
X-Received: by 2002:a17:902:8d8d:: with SMTP id v13mr4730527plo.67.1590563537552;
        Wed, 27 May 2020 00:12:17 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:16 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 4/7] media: atomisp: Remove unnecessary NULL checks in ia_css_pipe_load_extension
Date:   Wed, 27 May 2020 00:11:47 -0700
Message-Id: <20200527071150.3381228-5-natechancellor@gmail.com>
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

../drivers/staging/media/atomisp/pci/sh_css.c:8537:14: warning: address
of 'pipe->output_stage' will always evaluate to 'true'
[-Wpointer-bool-conversion]
                if (&pipe->output_stage)
                ~~   ~~~~~~^~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/sh_css.c:8545:14: warning: address
of 'pipe->vf_stage' will always evaluate to 'true'
[-Wpointer-bool-conversion]
                if (&pipe->vf_stage)
                ~~   ~~~~~~^~~~~~~~

output_stage and vf_stage are pointers in the middle of a struct, their
addresses cannot be NULL if pipe is not NULL and pipe is already checked
for NULL in this function. Simplify this if block.

Link: https://github.com/ClangBuiltLinux/linux/issues/1036
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index d77432254a2c..b8626cdb2436 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8533,22 +8533,9 @@ ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
 	}
 
 	if (firmware->info.isp.type == IA_CSS_ACC_OUTPUT)
-	{
-		if (&pipe->output_stage)
-			append_firmware(&pipe->output_stage, firmware);
-		else {
-			IA_CSS_LEAVE_ERR_PRIVATE(IA_CSS_ERR_INTERNAL_ERROR);
-			return IA_CSS_ERR_INTERNAL_ERROR;
-		}
-	} else if (firmware->info.isp.type == IA_CSS_ACC_VIEWFINDER)
-	{
-		if (&pipe->vf_stage)
-			append_firmware(&pipe->vf_stage, firmware);
-		else {
-			IA_CSS_LEAVE_ERR_PRIVATE(IA_CSS_ERR_INTERNAL_ERROR);
-			return IA_CSS_ERR_INTERNAL_ERROR;
-		}
-	}
+		append_firmware(&pipe->output_stage, firmware);
+	else if (firmware->info.isp.type == IA_CSS_ACC_VIEWFINDER)
+		append_firmware(&pipe->vf_stage, firmware);
 	err = acc_load_extension(firmware);
 
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
-- 
2.27.0.rc0

