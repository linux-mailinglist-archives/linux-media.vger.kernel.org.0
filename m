Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274C823E90F
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgHGIgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbgHGIgk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:40 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D132DC061574;
        Fri,  7 Aug 2020 01:36:39 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id 6so750893qtt.0;
        Fri, 07 Aug 2020 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kW4DH93+Y6MekGQ0yTdMeF4m8RvwlbzRUgeVylN+bnc=;
        b=bhZUXgB1uwCqf6lOrT1oH1JNXf4m3Faa69ENu+2ONNo5DlaPSxwdOTTpWBRfGJxwWb
         i6Aj7T0xTyi1s5JyXAJBwPtGmSJPxg39QJ183qjPK1UnRLZEojkZTvKnfI0ioyKRCAcL
         JQXXiezaC8BWmI/WuIz6BWQyoZskQW98mkq4m0SGib4MDSYOrUHTg0Jh2vQnAEuDkGGV
         a35wT7jU/ssmXhaLFjB4e5NDyz4k94qDU1U6BhkkIEbx50HMbtKhY07n+YXUqpXhbx6L
         KmrnjWMtI+R2Pif2Pqj+6bggxl2O1D5u3vAWyaLMjyI3fjI6bJFvcsB7fP5/BHu85x/d
         2pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kW4DH93+Y6MekGQ0yTdMeF4m8RvwlbzRUgeVylN+bnc=;
        b=H+mX8FzgETesFxooEylryoR6IgAYcCUCP4zEezGr1iEW39zTTEcppMCYDl4O69H+kz
         JkAitmiWQ0ssto5bQioaQoesbBowWjR++MUl9UQThPjrYAzaIfiSALT2y4HLLmVV1Arv
         pwfeTIvG7c+CwCxHO15Ti8uVD/Vf2c/CDEVLtn4uTDnYIiFuukhg3XmPa1pN7WNTXP2K
         HywhGglAKC4QIIfiHfsEij2TyLWCbInMZ1CKRWxjlfb+t2PkuMR5dyipn48xOuq7XLNR
         g/aFImfDIS7WGezsE8AlcgZ3WAfSoWJkTh3HpvCqnbuE8AbxpVXBqS7a/MkIDoVi7yZ7
         X3hA==
X-Gm-Message-State: AOAM532h0WEP5ewtkQur3pE1yGg362tnoPsbM/es1vR0Z5jrSk+VoRmm
        6jCV2RkBUbPjjImH4eO0fax/WWKxg2o8Xg==
X-Google-Smtp-Source: ABdhPJydo5k0Ftgy4SEjTrde/dvAoiW+2dkoiBC+Tki5j6w7QIQGaHkl5LCxShXUkhWMuaH4XUOPrw==
X-Received: by 2002:ac8:1c3:: with SMTP id b3mr13102663qtg.240.1596789398872;
        Fri, 07 Aug 2020 01:36:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:38 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 09/20] media: pci: saa7164-dvb.c: replace if(cond) BUG() with BUG_ON()
Date:   Fri,  7 Aug 2020 05:35:36 -0300
Message-Id: <20200807083548.204360-9-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/pci/saa7164/saa7164-dvb.c:341:2-5:
WARNING: Use BUG_ON instead of if condition followed by BUG

drivers/media/pci/saa7164/saa7164-dvb.c:483:2-5:
WARNING: Use BUG_ON instead of if condition followed by BUG.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-dvb.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-dvb.c b/drivers/media/pci/saa7164/saa7164-dvb.c
index bf8c2bb8852e..24421c116b0b 100644
--- a/drivers/media/pci/saa7164/saa7164-dvb.c
+++ b/drivers/media/pci/saa7164/saa7164-dvb.c
@@ -337,8 +337,7 @@ static int dvb_register(struct saa7164_port *port)
 
 	dprintk(DBGLVL_DVB, "%s(port=%d)\n", __func__, port->nr);
 
-	if (port->type != SAA7164_MPEG_DVB)
-		BUG();
+	BUG_ON(port->type != SAA7164_MPEG_DVB);
 
 	/* Sanity check that the PCI configuration space is active */
 	if (port->hwcfg.BARLocation == 0) {
@@ -479,8 +478,7 @@ int saa7164_dvb_unregister(struct saa7164_port *port)
 
 	dprintk(DBGLVL_DVB, "%s()\n", __func__);
 
-	if (port->type != SAA7164_MPEG_DVB)
-		BUG();
+	BUG_ON(port->type != SAA7164_MPEG_DVB);
 
 	/* Remove any allocated buffers */
 	mutex_lock(&port->dmaqueue_lock);
@@ -740,4 +738,3 @@ int saa7164_dvb_register(struct saa7164_port *port)
 	printk(KERN_ERR "%s() Frontend/I2C initialization failed\n", __func__);
 	return -1;
 }
-
-- 
2.28.0

