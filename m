Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197B323E929
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgHGIgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727911AbgHGIgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:46 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5149EC061574;
        Fri,  7 Aug 2020 01:36:46 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id l13so388731qvt.10;
        Fri, 07 Aug 2020 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7yN8/UE3bmxOW+3sD/+cxzuqhvnsobCII+RkxMM1Yg=;
        b=bZw7nImC6/ipXeOhcJmSKB+4cpDo0r3NGPtVqM6dihgN1UrZe08HuYbwuRsnME/d8o
         sDPTUTjJkKERPTgCarXGozrCtd0if81vn94ZMSaFSB8UjvAX4cOuD/er1P0bijA14ynw
         jg8qHynJwbiERmU9NyJ9hmvN/BLRy+mYEDP0FgY61ihN1uhA6+orGMrTpoyPF0XzCwel
         9W6y8Hp7nLp11+Cx9Hme9PoHydhAq4mfb2jX09IOr3gAYlEdufWV9nCgCrRkfVeIcam3
         GUT2pRaEG9UMPefZVWU0LiCdd+syTHovyMjuLIxSCLRS9SeakHnaazncPGYhE4RkMaOn
         CJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p7yN8/UE3bmxOW+3sD/+cxzuqhvnsobCII+RkxMM1Yg=;
        b=iMqFSd/303uit+hAQaC9EaCW/rueBERuDBWNXZrs3ST7QYScHc/aX/OHRVQarTD1Fa
         ByIRrXDk6u4MkDeLAx5aRiPkJKYpNYQm/AnQXGKM1V6+z8Ia0nxbIrlW2eXfw28m+dkQ
         C9uWYb5rS18ocec8aPbCbRF1RcY3+aqM27z8qrKSOvEztM7aqEG997Y3d/2Agq/3+7Jo
         r2qtjt/Yr2fYZYZWBd0HUxNwlYI58sQkhpMwPUCGfuonM9RjPkNWPRragj8z69WwCY0p
         C7O4L8193PkQlgvGkY3LMOgpr+0Z/yWrPLsEc+Gv9FZeBPUnS7QqfFsdw9AWpSf39RXm
         f8ew==
X-Gm-Message-State: AOAM532A1IF+RD/94GUXc2Lolxd2U2pX0zyJFwEc+YPwDat7duXt4yQj
        e69zLFYDXzA16LtxwlymWzAOpTOn2Bg=
X-Google-Smtp-Source: ABdhPJxONuOawZin2ouaz4dvQaXyVGtBCE461GSTu3Z9ZipJKIbgKfblnk7vxOYvYc5cb7KDyx7Lxg==
X-Received: by 2002:ad4:4c0a:: with SMTP id bz10mr12947607qvb.78.1596789405238;
        Fri, 07 Aug 2020 01:36:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:44 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 11/20] media: pci: saa7164-core.c: replace if (cond) BUG() with BUG_ON()
Date:   Fri,  7 Aug 2020 05:35:38 -0300
Message-Id: <20200807083548.204360-11-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/pci/saa7164/saa7164-core.c:579:2-5:
WARNING: Use BUG_ON instead of if condition followed by BUG.

drivers/media/pci/saa7164/saa7164-core.c:592:3-6:
WARNING: Use BUG_ON instead of if condition followed by BUG.

drivers/media/pci/saa7164/saa7164-core.c:898:2-5:
WARNING: Use BUG_ON instead of if condition followed by BUG.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 50293396658c..1d6f6667951c 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -575,8 +575,8 @@ static irqreturn_t saa7164_irq_ts(struct saa7164_port *port)
 
 	/* Find the current write point from the hardware */
 	wp = saa7164_readl(port->bufcounter);
-	if (wp > (port->hwcfg.buffercount - 1))
-		BUG();
+
+	BUG_ON(wp > (port->hwcfg.buffercount - 1));
 
 	/* Find the previous buffer to the current write point */
 	if (wp == 0)
@@ -588,8 +588,8 @@ static irqreturn_t saa7164_irq_ts(struct saa7164_port *port)
 	/* TODO: turn this into a worker thread */
 	list_for_each_safe(c, n, &port->dmaqueue.list) {
 		buf = list_entry(c, struct saa7164_buffer, list);
-		if (i++ > port->hwcfg.buffercount)
-			BUG();
+		BUG_ON(i > port->hwcfg.buffercount);
+		i++;
 
 		if (buf->idx == rp) {
 			/* Found the buffer, deal with it */
@@ -894,8 +894,7 @@ static int saa7164_port_init(struct saa7164_dev *dev, int portnr)
 {
 	struct saa7164_port *port = NULL;
 
-	if ((portnr < 0) || (portnr >= SAA7164_MAX_PORTS))
-		BUG();
+	BUG_ON((portnr < 0) || (portnr >= SAA7164_MAX_PORTS));
 
 	port = &dev->ports[portnr];
 
@@ -1566,4 +1565,3 @@ static void __exit saa7164_fini(void)
 
 module_init(saa7164_init);
 module_exit(saa7164_fini);
-
-- 
2.28.0

