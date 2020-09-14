Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86470268A8A
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 14:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgINMBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 08:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgINLmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 07:42:54 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41583C06174A
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 04:42:54 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id p65so13146782qtd.2
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KO7Vo/UFbom0XQ02gFw7M+7BSAjhKhvbrD6dSqHvAMQ=;
        b=ENOOvlVthgdjhid6ke8a7N1zoPdV5ZwIslnKJaivi9E6ml1PXqyYgh6zW1eCxvXGVl
         1D5B5Huz9ElO4d9YF9XgoniqfHwX7YgsXEhsfZH2jY5U/QthT1VCFfqHIMP81F3TBvmo
         7IkCPUTAFClkvYgHPcre2zNWks05+JLlpIpQPX5B2rIuNRiz7HFdH+wGlVHQFYNrWDvi
         dYCqRecySlj7NFpdDQjnFVkCzrkuEBkKpFY2RLHyiM9Eohfd/RxqMjo5Q95gXTF1qGnB
         jjeZcLhkjhWN5BeM0Ef0BQCyxX4a2dauSQcpuV6b5g5DtqRhKlgd+PBEOXmpHTR2y8IB
         MoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KO7Vo/UFbom0XQ02gFw7M+7BSAjhKhvbrD6dSqHvAMQ=;
        b=JH5nm3/q5uN+o4FyNBvNYbkrcihRM8ZGdC3DDP52nA/lIhZBg3EOSf3rikMaESSWaO
         iGxFsdO+87oFOcrjEDIUoxRKX+HTwYqaFPdu2YDUEFXhRNOqNSmQ6JHSI2VsJRf+ks27
         1u8oR+k7TegBalwULoOYnl+g/4BJ9Znw/F9moTmylIVCtOgrhoAgI1TvJLNOWYCRBz1x
         JNGJSd8eHUZC9guOIwPa7z6pGSN6Ow9J5DtoWka1rAWn53BvMTcCCallC363JVPMpNbM
         WOu/T7j7eoLSqznLyONgJ6x7EfuNfnlmea4gUfnsOdhx+YZ6YyCJlId7/9WRjxC6kRz+
         50ow==
X-Gm-Message-State: AOAM531rYzdpJA48RS+ccRCbumoDA82w4FnUTeQEU/LZX6HgXpLtBqpU
        RF+b9SZsSlc1d5M7e+/DE+o=
X-Google-Smtp-Source: ABdhPJw1zzjIHhSsoqdw/CFpoOmYWYLYxs8La1mK5yemSz/hleq214flFXUq1ilnYmpFPNruErpgyQ==
X-Received: by 2002:ac8:7b2c:: with SMTP id l12mr12473039qtu.98.1600083773356;
        Mon, 14 Sep 2020 04:42:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:640:9cc0:878:419e:8021])
        by smtp.gmail.com with ESMTPSA id r42sm14176764qtk.29.2020.09.14.04.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 04:42:52 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     lkundrak@v3.sk, mchehab@kernel.org, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: marvell-ccic: Pass __maybe_unused to the PM hooks
Date:   Mon, 14 Sep 2020 08:42:43 -0300
Message-Id: <20200914114244.6036-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Building for the riscv allmodconfig target leads to the following
build warnings:

drivers/media/platform/marvell-ccic/mmp-driver.c:347:12: warning: 'mmpcam_resume' defined but not used [-Wunused-function]
drivers/media/platform/marvell-ccic/mmp-driver.c:338:12: warning: 'mmpcam_suspend' defined but not used [-Wunused-function]

This happens because the generated .config does not select CONFIG_PM and 
CONFIG_PM_SLEEP options.

Mark the PM hooks as __maybe_unused to avoid such warnings.

Reported-by: Olof's autobuilder <build@lixom.net>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/platform/marvell-ccic/mmp-driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index c4b28a00a3a2..097d7775e1ee 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -307,7 +307,7 @@ static int mmpcam_platform_remove(struct platform_device *pdev)
  * Suspend/resume support.
  */
 
-static int mmpcam_runtime_resume(struct device *dev)
+static __maybe_unused int mmpcam_runtime_resume(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 	struct mcam_camera *mcam = &cam->mcam;
@@ -321,7 +321,7 @@ static int mmpcam_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mmpcam_runtime_suspend(struct device *dev)
+static __maybe_unused int mmpcam_runtime_suspend(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 	struct mcam_camera *mcam = &cam->mcam;
@@ -335,7 +335,7 @@ static int mmpcam_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int mmpcam_suspend(struct device *dev)
+static __maybe_unused int mmpcam_suspend(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 
@@ -344,7 +344,7 @@ static int mmpcam_suspend(struct device *dev)
 	return 0;
 }
 
-static int mmpcam_resume(struct device *dev)
+static __maybe_unused int mmpcam_resume(struct device *dev)
 {
 	struct mmp_camera *cam = dev_get_drvdata(dev);
 
-- 
2.17.1

