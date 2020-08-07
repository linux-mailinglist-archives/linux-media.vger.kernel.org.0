Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D62A23E910
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgHGIgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgHGIgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:43 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAA4C061574;
        Fri,  7 Aug 2020 01:36:43 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id p4so1064063qkf.0;
        Fri, 07 Aug 2020 01:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5y9qAO4DMBYJ0COKqkndO8ZCLSN9cFjuTgCIXUypzms=;
        b=VhA0ICm2JCRZJ+/FkEFW5d2Ae5dyj789jCrDuggOdm30Ku6O5Z0xUk75nleJhOX7Iq
         sVIs2mDClW8hyZ7E5MyZIdAiIdnv8AOQEKcbLwtVxc2ybnT6fcijViBeyAXUblUS8Msx
         d7HkApO907x9KFP2V9y7ZD18iXkjz1TD00m+J4+bjR+ZCH2StX9EpdjoOoLP+Vj7S3hp
         5LJaHCsRYTtue5i9szy5fHc4CbAzadRvhaZ6tFltDrBy+M46D7aYGcaGRwrmi6Tw33AJ
         CBsVfdfe/Gc7RA2JPnNeY8AeZO/JMrJAAGJmW/pExbMBjGpyA1PCPKWjYijDg/5hVJeM
         OnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5y9qAO4DMBYJ0COKqkndO8ZCLSN9cFjuTgCIXUypzms=;
        b=Ig4uKpH6daiYSCQBLkWRXQ5C9DwyU8IXw3rSEW1Z6u2WtKtgXW8EhuNqg9CJXsmWwS
         oJ0JA7F6/nh1EVBYUqSBk/8aqX451jgyQ05YWorJ+69xvfchHI1c0YMZQ4KCA4Ng3BAI
         G2CYAO4f2FOMjmwq6waSYdZiRXXMHDYgbJjdMwqwFnANYqFHPhmo41ZrjbBASMj3V7Md
         B3383WSBQAU02R9uhlzYL0oz6IVBtvYNhdWo72Vlb2yuFuf7J39uBF5DgG3+FwSJj0yk
         7HsahaXph+gTIjUskG8oRL2N+D8CMhaY/BjQAJ20Vr1XgUyepnizmtrp/S7zURsqTBx/
         HsHg==
X-Gm-Message-State: AOAM531AomiH8b+eGE78GfXK1Jd8jTk2L3hH9/+voqsWIKMFIzGIvn95
        /pYfF3Ay3XXJ4brtxs/fx8MoH0Dng8M=
X-Google-Smtp-Source: ABdhPJzl0Xq1KjrcgJoutOuGe0MUlGL0km97T5jykm5DRvq72W/Kw1PElFpLPNNIo4J16c3xoSvlHg==
X-Received: by 2002:a37:48ce:: with SMTP id v197mr12858262qka.458.1596789402041;
        Fri, 07 Aug 2020 01:36:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:41 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 10/20] media: pci: saa7164-vbi.c: replace if (cond) BUG() with BUG_ON()
Date:   Fri,  7 Aug 2020 05:35:37 -0300
Message-Id: <20200807083548.204360-10-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/pci/saa7164/saa7164-vbi.c:707:2-5:
WARNING: Use BUG_ON instead of if condition followed by BUG.

drivers/media/pci/saa7164/saa7164-vbi.c:760:2-5:
WARNING: Use BUG_ON instead of if condition followed by BUG.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-vbi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index 49d61a64c8cb..cb2e09f0841d 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -703,8 +703,7 @@ int saa7164_vbi_register(struct saa7164_port *port)
 
 	dprintk(DBGLVL_VBI, "%s()\n", __func__);
 
-	if (port->type != SAA7164_MPEG_VBI)
-		BUG();
+	BUG_ON(port->type != SAA7164_MPEG_VBI);
 
 	/* Sanity check that the PCI configuration space is active */
 	if (port->hwcfg.BARLocation == 0) {
@@ -756,8 +755,7 @@ void saa7164_vbi_unregister(struct saa7164_port *port)
 
 	dprintk(DBGLVL_VBI, "%s(port=%d)\n", __func__, port->nr);
 
-	if (port->type != SAA7164_MPEG_VBI)
-		BUG();
+	BUG_ON(port->type != SAA7164_MPEG_VBI);
 
 	if (port->v4l_device) {
 		if (port->v4l_device->minor != -1)
-- 
2.28.0

