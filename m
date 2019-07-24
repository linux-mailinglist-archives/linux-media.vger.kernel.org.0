Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3287D72EC1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 14:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfGXMW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 08:22:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38644 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbfGXMWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 08:22:25 -0400
Received: by mail-pl1-f195.google.com with SMTP id az7so21936368plb.5;
        Wed, 24 Jul 2019 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5jrwtXhDn76+HM9IkbwGS/CKq0jMFrFQjkEarlm8bFk=;
        b=Sh65L6GRouY4RWQZxm0373RhPmBoosFsf/ky4GwW4NkoEFrBWvuZj6fywmjfFP1+Ue
         Vza84142tLDFo0Px+zbERZ/IEwCMY62n2NfSBHTIu8dC2t2QYCqAVsV7CX/xCv9FgzoY
         /3Z/FwcjS5jIpbbcUFMi9cNBd5j9WNIzqlWmEmDsm7lxVfOaMFOXzPL6qj5fBlkzHSWS
         WmSNyOuT/hLfT2kkxB7tylJj5QAjYdNaDk13zYiOm4tAk5b9r+l2bJlZoE8uHipOMdbu
         gF20voD3H14QMu1WiNJqzulpdAbNdnAUhHc+sJzne59SrQL2REyUPpf5sHmHJtCvjwNj
         yyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5jrwtXhDn76+HM9IkbwGS/CKq0jMFrFQjkEarlm8bFk=;
        b=Q598KcVLtr+GiooZxuml8ql2C0YJqGiaEbuIS5FxqCxKULUjIYXUwesBN0/SL4xwVp
         4lBV+WNpnzP92GbVs2qBNdKO9oC5EwMtXiAkD0ztx1ocxmRxPiVTx6f4qMKZ3IkDUllZ
         xqFVeSipHBmDa0CwFWlO6qcK1WfAk+m3cjuyStW2hNvyJGm28xkCJdHDrfSTD7SEKDoM
         sagfDxsi26y1wmet8fESJqwsfX5W3eoi/a2DoGA99HVlFYctFr+TxXi8UtiJyYkX07hO
         ipLkmfK8CvBLutirtIeHgPCQfNS4HlsJB+lcpYac31mM+hKKctcmE9/crpRq3AZWkGuN
         /QEg==
X-Gm-Message-State: APjAAAWWdLDhWjnbmr1miSGzU0wer+y5QT9MYrt5NDP41WaQCW0mp/pY
        likcc07TRS5cXvOvvYAJIFk=
X-Google-Smtp-Source: APXvYqw7EGwaVn+2Xe3yHbqacvsrEv4uLnD/7vtYonYkfFEGm46/7ycU87HN/MTxth/Jxf81WDDe9w==
X-Received: by 2002:a17:902:6a88:: with SMTP id n8mr85844173plk.70.1563970945265;
        Wed, 24 Jul 2019 05:22:25 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id b16sm74205678pfo.54.2019.07.24.05.22.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 05:22:24 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: staging/intel-ipu3: Use dev_get_drvdata where possible
Date:   Wed, 24 Jul 2019 20:22:19 +0800
Message-Id: <20190724122219.21585-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using to_pci_dev + pci_get_drvdata,
use dev_get_drvdata to make code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index a7372395a101..06a61f31ca50 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -778,8 +778,7 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 
 static int __maybe_unused imgu_resume(struct device *dev)
 {
-	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct imgu_device *imgu = pci_get_drvdata(pci_dev);
+	struct imgu_device *imgu = dev_get_drvdata(dev);
 	int r = 0;
 	unsigned int pipe;
 
-- 
2.20.1

