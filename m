Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FE2225CA6
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 12:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgGTKdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 06:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGTKdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 06:33:03 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37651C061794;
        Mon, 20 Jul 2020 03:33:03 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so10116363pgf.0;
        Mon, 20 Jul 2020 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6hevPUmGQ66hCXkNyonbVBGz6ryQo6snqDBjlm4ZlRA=;
        b=t/koDa4817hL+YgrfCUpkhYDx+MSqZ2FHSvZqWNL4e4jbaiSvM6lqOIjTh4hOoq6tU
         hxCAbeO+8GzyqDRrObVMRjQjnBQ9rY/sDK0dPCwYejFBqHa6Cino5/+ZyOEJCt6MDPBO
         YOFnb6HAeuaH/ez5bTvJJ78vQYAPTBxcjq164TcScI8Sutqe6Lb55yrO8oK3e6Osb+r7
         jnr0bohhBoGN+9X7al1guRNdfuNXLQjFHWs+VQEcJ/NaXc4QrVoWbwcTCKth29Rkj6j9
         CvDO79MJoe/LCUjcccJUjK1wNBRprB6WbQjTndS1lvxWtmOch1RyyMP5+PrwEtgGmXmu
         DLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6hevPUmGQ66hCXkNyonbVBGz6ryQo6snqDBjlm4ZlRA=;
        b=QkZGw2/sxcKg97uTamA9Fvwrl+f19yS28h9t39TYagjEKP9+Eo+PTrSDmrNCNDwILz
         lPXEp/2f1wm8wDlkJfmkXfBdWZpcU4fTm0cZaqG5EXlRuAAQexiMjdQgR5dACUpWYz0I
         s5ny6sB8EKFdMSkKhMTlYbDWuX0AQXBjr39DIiA4krYbE3E93axqUX3yH+mLIzNi6KY8
         Qb6OoWHYqcPPqIstCLAKbnt+/fQDNtxbfkYdDJJzmsLUCqc0jEdJ2gJ6s6DWT34xEr7S
         xm48EJJqBrh0ZdglrVM64HOeT0h8S/hgDJC0enYov7O28LkQIU/5+FJewGTCmn7Xnmgj
         bWYQ==
X-Gm-Message-State: AOAM532N5UF0BoMv6NImuVp3FYh3tCGG3KMqyvUDvGgYgmR0fmM617Ew
        WUIepfbPfp1FBPeSKmHOy5s=
X-Google-Smtp-Source: ABdhPJzLwORkHMw6BCcQKdOeZ30UkE01yU0r5rdC/F8LYunnbY0f9/dtf3kjjljQEMwv5WzOcMJPMQ==
X-Received: by 2002:a63:7b15:: with SMTP id w21mr18971517pgc.386.1595241182623;
        Mon, 20 Jul 2020 03:33:02 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id e18sm16412186pff.37.2020.07.20.03.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 03:33:02 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2] [media] saa7164: use generic power management
Date:   Mon, 20 Jul 2020 15:57:01 +0530
Message-Id: <20200720102700.191371-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .suspend() and .resume() callbacks are not defined for this driver.
Still, their power management structure follows the legacy framework. To
bring it under the generic framework, simply remove the binding of
callbacks from struct "pci_driver".

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 126d085be9a7..4b637891b79a 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1539,9 +1539,6 @@ static struct pci_driver saa7164_pci_driver = {
 	.id_table = saa7164_pci_tbl,
 	.probe    = saa7164_initdev,
 	.remove   = saa7164_finidev,
-	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 static int __init saa7164_init(void)
-- 
2.27.0

