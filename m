Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FB542B3F2
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 06:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhJMERp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 00:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhJMERp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 00:17:45 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9319C061570;
        Tue, 12 Oct 2021 21:15:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id np13so1177403pjb.4;
        Tue, 12 Oct 2021 21:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoNwDG0VaNCscP5oae7CbtI3WG7cND2vHYt3onq3SNY=;
        b=EONSpaH4SsEm5+DwSQao2ztUky6nZqQ38/ui6H+/JNXaQ+/beQXMMxhvDax+gK31c5
         w88TJPEYrMsBD7xjRDw7ePcJ024b6QIsmXXrFnOWtpPdmKPgCYqW827ztz7s1iJKDKQL
         HoSNQxy8sF2V8Sc/NcGGNIpl6En9E9QCBZZY5caoUxpEbZctYjjEfDxACbbtuxAQcHFr
         ama7qI5agLNNzOq5iQ+Gx7Lyo9cNU9rgYt9bLjHwFmhZTBWUY/ip7OJsgjH5gN3GPt+4
         GGI7sn6+67kOoIBknxgZZj9Mnb/RrIvR21DLwbPsllS1gsuEEOx51I6m4PYplqyFyUFf
         e2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OoNwDG0VaNCscP5oae7CbtI3WG7cND2vHYt3onq3SNY=;
        b=eVtQ63bZ0USev4WVPWq47IrGEhCMD1eq+6zOXrDatSaFxLTVAZ2p03NEhDgFM9a7H+
         Ky2x6QPB5wBVHW3MYQ3GCmjKpHJ2urEQYUo55i4ZM3Q1ZU6zTF/vNBucFHnqTmJG6nKx
         nGYrBN7e5SHHIkUpA2YGfD+OimR7N9GML9e6WJ/MnVunFA2eMza44F/nLgMY9K+lgVOp
         H/8O8rm2uuVPMH1Pjgp2BmNeX8d4nACS39oDuDov1Y/b8lfE9DPCNbxop0/zTT3kX3Pj
         AeINa0y41y9BO5D7N8SDvHesIzkJTZhDiNpOTza6n6QyOPmOxETU+UwLbBrNeEs57YM/
         jYnQ==
X-Gm-Message-State: AOAM531wyplD6MTMhoV6Ybab9dBP6YEAlCiRjKUrWDinkel1ClFMYTuw
        Vd15Hd/cFOyBhhXXi/1i6aeoRPXWIil7aQyHmAI=
X-Google-Smtp-Source: ABdhPJx/W4DMTjZDZyIWn8CLwfUJrNXINXnyIyLGTsU3+wcbAQD85flLv5PcZ62fQOwWo5qfuXahVA==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id oo15mr10582188pjb.169.1634098542104;
        Tue, 12 Oct 2021 21:15:42 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.45])
        by smtp.gmail.com with ESMTPSA id i12sm13062356pgd.56.2021.10.12.21.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 21:15:41 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] driver: bdisp: add pm_runtime_disable in the error handling code
Date:   Wed, 13 Oct 2021 12:15:27 +0800
Message-Id: <20211013041527.2859626-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the error handling code of bdisp_probe, it fails to invoke
pm_runtime_disable in many error sites.

Fix this by adding pm_runtime_disable after pm_runtime_put.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index 6413cd279125..1f220f216b72 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -1394,6 +1394,7 @@ static int bdisp_probe(struct platform_device *pdev)
 	bdisp_hw_free_filters(bdisp->dev);
 err_pm:
 	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
 err_remove:
 	bdisp_debugfs_remove(bdisp);
 	v4l2_device_unregister(&bdisp->v4l2_dev);
-- 
2.25.1

