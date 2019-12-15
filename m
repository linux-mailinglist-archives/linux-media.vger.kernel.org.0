Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E24CF11FAA9
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 20:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfLOTIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 14:08:15 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:43316 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfLOTIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 14:08:14 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 47bYp56VYSz9vY6y
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2019 19:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id o3CzeFK4IfgT for <linux-media@vger.kernel.org>;
        Sun, 15 Dec 2019 13:08:13 -0600 (CST)
Received: from mail-yw1-f72.google.com (mail-yw1-f72.google.com [209.85.161.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 47bYp55Glxz9vKZ4
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2019 13:08:13 -0600 (CST)
Received: by mail-yw1-f72.google.com with SMTP id q130so4069125ywh.11
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2019 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XQnSrcIIhJOTGUqMDg5EsVAaGnICzliwh0/ya8aApOI=;
        b=jQXFosFMYG5ogxi9afIkg2szA9l2hw/Ld13nDJzJqUz6MWbvgwglXP4jR9e0aqEdQj
         nhMmiTV2WkcEYEV6EPJVqb8YNZ0r4nPGwDK1u1ioj5KWXyazzRCCruU9c6Nvkz5UAa7b
         eScUHTLSmr9w+r3r+e9egWb6f7Wu9xg7ZYdGI2Xe1tWatZ7E7JfICTg7xiYfT7MtutDw
         zmTyfHVw3Nrcb7XHpteGlwgC2LA8jdwcq0r1wIwXk0zj4t3Ep/Et0hYn/lPZzksFFTaG
         6YmKSzewTKFWmRt0ajpkrz+x3ogEgYTbjhCVQNfik/+Z+q1FVbBuMov44EoT+82tQFzj
         2hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XQnSrcIIhJOTGUqMDg5EsVAaGnICzliwh0/ya8aApOI=;
        b=NNXPsKo+MhYAtiXhQnd4st6eJZHeSjTyKoHmadlHDvNqA3ZABAYK6IMloVAKUz5Ejt
         JVtBZRJzbbd5Z0eT2H8IobjaofKmEr/326gCe/ntpxIF5+fdLO+8pabORCxbFDWJtL0r
         oBEee4elLEdya4mpqy1k+TDRCSl6YeDFOnEkWE2SGxYzEHARrA3oOwjqiMFCbMdJQ4tN
         QlOhXHcI7mSS0eg4Y2p8mm/iHsqh9gDwDN2xiKbORmwYhdVhxREejKLHH3C35cWGtNJn
         BbFf4hQpbVwZ+0/M3PruJ8vE19okwx6Sv9fHRWliGTDaFD3Sm1qYGEw+ZmRvZDJ4V7Kc
         jwCQ==
X-Gm-Message-State: APjAAAXjlIAh8ml29q7x0Q94bBQclsubgphqRLQiXejnl0En1CHUv99Y
        4pDCHOdmb7XvQ8RidtPo6LOFdnATKqrs5A2/3M+GOY2aD5VoD7/JaYQGlu3NRLnTX/jJsbd9hIb
        zr7RJ6RRzQbXK/O6fYV0rM/mInWs=
X-Received: by 2002:a81:33d0:: with SMTP id z199mr17486732ywz.53.1576436893160;
        Sun, 15 Dec 2019 11:08:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqycQO48OjpM4mR/9GWjlgauBo5Oeu5/tRO3liMoyZRwIC1Isy2D1RIxHEzxEet7GDtGr0MvfQ==
X-Received: by 2002:a81:33d0:: with SMTP id z199mr17486710ywz.53.1576436892942;
        Sun, 15 Dec 2019 11:08:12 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id l200sm7079409ywl.106.2019.12.15.11.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 11:08:12 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Richard Fontana <rfontana@redhat.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx231xx: replace BUG_ON with recovery code
Date:   Sun, 15 Dec 2019 13:08:04 -0600
Message-Id: <20191215190805.2491-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cx231xx_i2c_register, if dev->cx231xx_send_usb_command is NULL,
the code crashes. However, the callers in cx231xx-core are able to
handle the error without crashing. This patch fixes this issue.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index f33b6a077d57..c6659253c6fb 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -515,7 +515,8 @@ int cx231xx_i2c_register(struct cx231xx_i2c *bus)
 {
 	struct cx231xx *dev = bus->dev;
 
-	BUG_ON(!dev->cx231xx_send_usb_command);
+	if (!dev->cx231xx_send_usb_command)
+		return -EINVAL;
 
 	bus->i2c_adap = cx231xx_adap_template;
 	bus->i2c_adap.dev.parent = dev->dev;
-- 
2.20.1

