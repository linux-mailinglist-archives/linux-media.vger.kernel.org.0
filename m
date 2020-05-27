Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7991E3A02
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbgE0HMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729144AbgE0HMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3BBC061A0F;
        Wed, 27 May 2020 00:12:19 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ci23so1115115pjb.5;
        Wed, 27 May 2020 00:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YnWT8s8ink/KeJFRPdHxxy0KnE9QXS2EIJkcc7O9gtk=;
        b=DM3vqxu8dRtwoGww+IORQKfTTdW1nnuAvY8aRKzh62Cx8kqBbcP5lV1qm8URdE5NwI
         c2s+2BV+jhzfiL+hWF6uvl3M3rc4SZRksRliKnmNBhwzO3LalGMUVe/pJ2seJegirKxY
         3aOolQxZqc5UnpX0y292F3vEt7C88vjlI+mWd1ad8e7/AVNK0GAZHXd/EGkAQqw/UBTH
         4FdXsSMJJ6gziYNmWfGWpUTvBl7utKor+c7qe3gR/aiDXEO/tQmdBPMArs0FI5akiEKH
         M//WCYPyz0r/qDeJbXVWbWEsEqaiuJB+R7TwqXi3Sib+9NJec9jV4Mz0yT4Sowh2E8du
         Rn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YnWT8s8ink/KeJFRPdHxxy0KnE9QXS2EIJkcc7O9gtk=;
        b=nxRNR9vv8F9+dHzen2skCCMM9jktoOhr+OCtbxX8mdtEzAEDXNxUMziKuz2JESqRSa
         YnDWMOT5qrK6lwL6RNgy8pRYul+CB/TKrXa163p0XLFE6/BswNG09JtyZTMgBLF+CFLB
         nrFJ4IUoemtVnK0d3NoIiu/bcRa/ptJqyTHeXPNv3DyvMB8pZjw1lfuGRcViDQ+vgbha
         Xarzfc3fNr6gg9oIT1S9H+5Ss0Kx9bUSlCdHFPAbrzuuQafArNrXFaWSugLaP++HyCiU
         OaG6w3LqgUNJuaogL8TFVepJ4DaOMRGjRSpwoyptRlab5HhLfiE3XH1HGkaTLJENnHW/
         HGoQ==
X-Gm-Message-State: AOAM532YUOiFuaDl/fPqd2PK5S98ORGh8B+toxQ8sKzuw09AlYhGtJ2U
        1qe6fpTwpFEVcUsGmf5Gh73FpRQ+ywE=
X-Google-Smtp-Source: ABdhPJyFCpOYMkAVV78W52jBC29vXxFB27ZW9sqjVDAn5HIxYxToCi4u+31xoW8h3BEW8uRCIWxYTw==
X-Received: by 2002:a17:902:fe81:: with SMTP id x1mr4672432plm.239.1590563539414;
        Wed, 27 May 2020 00:12:19 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:18 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 5/7] media: atomisp: Remove unnecessary NULL check in atomisp_param
Date:   Wed, 27 May 2020 00:11:48 -0700
Message-Id: <20200527071150.3381228-6-natechancellor@gmail.com>
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

drivers/staging/media/atomisp/pci/atomisp_cmd.c:4278:17: warning:
address of 'config->info' will always evaluate to 'true'
[-Wpointer-bool-conversion]
                if (!&config->info) {
                    ~ ~~~~~~~~^~~~

config cannot be NULL because it comes from an ioctl, which ensures that
the user is not giving us an invalid pointer through copy_from_user. If
config is not NULL, info cannot be NULL. Remove this check.

Link: https://github.com/ClangBuiltLinux/linux/issues/1036
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5be690f876c1..105c5aeb83ac 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4264,7 +4264,6 @@ int atomisp_set_parameters(struct video_device *vdev,
 int atomisp_param(struct atomisp_sub_device *asd, int flag,
 		  struct atomisp_parm *config)
 {
-	struct atomisp_device *isp = asd->isp;
 	struct ia_css_pipe_config *vp_cfg =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		    pipe_configs[IA_CSS_PIPE_ID_VIDEO];
@@ -4275,10 +4274,6 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 		    atomisp_css_get_dvs_grid_info(
 			&asd->params.curr_grid_info);
 
-		if (!&config->info) {
-			dev_err(isp->dev, "ERROR: NULL pointer in grid_info\n");
-			return -EINVAL;
-		}
 		atomisp_curr_user_grid_info(asd, &config->info);
 
 		/* We always return the resolution and stride even if there is
-- 
2.27.0.rc0

