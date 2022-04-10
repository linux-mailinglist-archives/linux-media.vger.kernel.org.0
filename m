Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8283C4FAC97
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 09:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbiDJHqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 03:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbiDJHqb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 03:46:31 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233B5BDF
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 00:44:21 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id n8so11434835plh.1
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rgzlFHYh2b34Mpck7RsDEk8bSCdxwQPK6qvSRDO5vdA=;
        b=LJzK9wU+Sjg/crQMoRIQgm5SoztVwGMJH0PsOIPKicq0HcC0qUdY4Zg4vPU0gj5zxG
         NuXv7c53qIw++ctQt7sxXbvmyk+hU4YPvMG/yXUVRtqwhsPTiO/K4X7G7CT8YPazPLCw
         rZu0o1zA+/srsYgz2yX+MLfQ4ht5fUVS33H73Y1Y9G/r8QVdRwho8T74NDJCh9iuveZv
         qWuHZMbeE16EXIu2OHEV2qZCipGrpn2br5IHn1SQNynyKRRV3C3lSl60S93+FicuEODp
         nJPNen9Y3Xz6Z17D8FpH3wSKYaYKnB16nCAoqsjbiHcc7smTgTGO3eeTmk9lwzCrMLn5
         ZqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rgzlFHYh2b34Mpck7RsDEk8bSCdxwQPK6qvSRDO5vdA=;
        b=aXDl3/ZsoPCHopgxD+fnZt7qWneEXxjRaYr1eWHGS8HkBybs9d57cDBD/1wnhsmWwU
         xATqSq2dvy930TegKCf97sieLG5mWTlfUpDbm7T+XyJNfwOur8+6g6aEZTI8qDkgww1V
         Qf7UEkRA8sdd8YcBRN4JOF0dZMa08+b1wKHvmBZ64kPr5SoFqGVF7IerFiopmH5Aagm0
         zryyc+0Ipw88ihn3W3tZgOPt8iA//gWV22El1rq658rsPpSj/efcGuyoyOiNu9yZvNY4
         EflkTP2T3gPxAfpKfbVoPDsj55g3iMzShnVHBBF+p4S9zdlqRBUYDJd8PTYj0NqeG8Dn
         Zd/Q==
X-Gm-Message-State: AOAM532MibcYdyyRrCv9i58s1pS/PE9zd13JskWV8RriZHo7zS2Stu0f
        kDREfZul9vdGvf7/FiywHO6OCmYh5IJBqBA=
X-Google-Smtp-Source: ABdhPJwReW1xeZtHiYO5p8+FwT9QazElV/FJp/f4Phe4aCcOs88Xjya8eiAplfUKjyOq53S3KshrvA==
X-Received: by 2002:a17:90b:1c8b:b0:1ca:1ff6:607b with SMTP id oo11-20020a17090b1c8b00b001ca1ff6607bmr30302423pjb.244.1649576660604;
        Sun, 10 Apr 2022 00:44:20 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
        by smtp.gmail.com with ESMTPSA id z13-20020a17090a468d00b001c7db8e6ac7sm16977306pjf.40.2022.04.10.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 00:44:20 -0700 (PDT)
From:   Zheyu Ma <zheyuma97@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH] media: cx25821: Fix the warning when removing the module
Date:   Sun, 10 Apr 2022 15:44:09 +0800
Message-Id: <20220410074409.136289-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When removing the module, we will get the following warning:

[   14.746697] remove_proc_entry: removing non-empty directory 'irq/21', leaking at least 'cx25821[1]'
[   14.747449] WARNING: CPU: 4 PID: 368 at fs/proc/generic.c:717 remove_proc_entry+0x389/0x3f0
[   14.751611] RIP: 0010:remove_proc_entry+0x389/0x3f0
[   14.759589] Call Trace:
[   14.759792]  <TASK>
[   14.759975]  unregister_irq_proc+0x14c/0x170
[   14.760340]  irq_free_descs+0x94/0xe0
[   14.760640]  mp_unmap_irq+0xb6/0x100
[   14.760937]  acpi_unregister_gsi_ioapic+0x27/0x40
[   14.761334]  acpi_pci_irq_disable+0x1d3/0x320
[   14.761688]  pci_disable_device+0x1ad/0x380
[   14.762027]  ? _raw_spin_unlock_irqrestore+0x2d/0x60
[   14.762442]  ? cx25821_shutdown+0x20/0x9f0 [cx25821]
[   14.762848]  cx25821_finidev+0x48/0xc0 [cx25821]
[   14.763242]  pci_device_remove+0x92/0x240

Fix this by freeing the irq before call pci_disable_device().

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/media/pci/cx25821/cx25821-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 3078a39f0b95..6627fa9166d3 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -1332,11 +1332,11 @@ static void cx25821_finidev(struct pci_dev *pci_dev)
 	struct cx25821_dev *dev = get_cx25821(v4l2_dev);
 
 	cx25821_shutdown(dev);
-	pci_disable_device(pci_dev);
 
 	/* unregister stuff */
 	if (pci_dev->irq)
 		free_irq(pci_dev->irq, dev);
+	pci_disable_device(pci_dev);
 
 	cx25821_dev_unregister(dev);
 	v4l2_device_unregister(v4l2_dev);
-- 
2.25.1

