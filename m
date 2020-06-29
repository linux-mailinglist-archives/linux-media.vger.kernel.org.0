Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C34620E153
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731599AbgF2Uyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731274AbgF2TNS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19E8C0A8935;
        Mon, 29 Jun 2020 00:37:29 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id u8so7398778pje.4;
        Mon, 29 Jun 2020 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wNBasksRn6HqqFy9YNin3k0xj1oUFrdl5Lr5u3FSELQ=;
        b=M1hIH6mFmORSCGE86XorMiBP7P08Gf4iZf58OyrKtzhu/cv2OISPl0WAHowytkfrXb
         Dxtp9KEV+JThYTPWvaCa029Z+U7sItPFnlKrjYO+P7uwh/rTbA4R4HTUSv5AlaBsq51O
         k8PDB3rzBRmgXTeZ8DdA/U/csAwKlTqGKtV4Y4qJkujlyGSF63nQAmcrkA61IBbPlvXI
         leqBFDNv9s7LvFlq4dGOdA+uUpzsrcRl36VOzX57aTt6Smf7gdRwvxKPLW1qT9TnG3Ds
         WZuuLNR/i/9WGDTcE6PYFhdE5tX2xgAWxR53fnb1MLYIY9J+qFyGGcOgglFfMOV/dy2n
         aiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wNBasksRn6HqqFy9YNin3k0xj1oUFrdl5Lr5u3FSELQ=;
        b=uLmZM2xmd8pI7EBLW6+W6OYYbW5pUqH8SuWUT6rwp8dn/Lb/XwIyJXqIcubYh0o0ve
         SPA7GwntPsPDTHG99myZnFH3XYhkwebeY0Jxx8mQprWpLYeDe3x7TfeEibB+9FGgiari
         Fcw/uu1NsqqF3jXN3enC5+SNA9DPhaTtTtJVoac2tjWOTWn9oGzv25ghrIj266yjUxwM
         t+fVKwieAnWUWLeVNrrNS9xtatpOZyPrKt5nN9ImIrJf1GPtUTg6t9S9P1j2+QhGIzg0
         MOpgUdO33Z9y1JFm6lB+BLOfFCkgHjSvW5aP+/B9a8iOGtAdxvm9XO1dhW4cW1RPgg4k
         B1Jw==
X-Gm-Message-State: AOAM5311QgMKiE28XauWmZ3uZw4mbsdJsK5c4JrIffcs7kUBIlyBDHv/
        P8ZMe6dRRfsRoPhMHKTJmmk=
X-Google-Smtp-Source: ABdhPJw5JV6v034J4F08OVzJgY5QNT872fYtNd1w2ulu2+H64M023gpnMHfQNOtSd3meU2msqry31Q==
X-Received: by 2002:a17:902:54f:: with SMTP id 73mr12020846plf.76.1593416249351;
        Mon, 29 Jun 2020 00:37:29 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
        by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 00:37:28 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: [PATCH v1 2/6] [media] cx23885: use generic power management
Date:   Mon, 29 Jun 2020 13:06:00 +0530
Message-Id: <20200629073604.205478-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .suspend() and .resume() callbacks are not defined for this driver.
Still, their power managemgement stucture can be easily upgraded to
gemeric, without affecting its normal behaviour.

Hence, define them NULL and use struct dev_pm_ops type to bind them.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 7e0b0b7cc2a3..da9ee7270dfd 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2230,14 +2230,18 @@ static const struct pci_device_id cx23885_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cx23885_pci_tbl);
 
+#define cx23885_suspend NULL
+#define cx23885_resume NULL
+
+static SIMPLE_DEV_PM_OPS(cx23885_pm_ops, cx23885_suspend, cx23885_resume);
+
 static struct pci_driver cx23885_pci_driver = {
-	.name     = "cx23885",
-	.id_table = cx23885_pci_tbl,
-	.probe    = cx23885_initdev,
-	.remove   = cx23885_finidev,
+	.name      = "cx23885",
+	.id_table  = cx23885_pci_tbl,
+	.probe     = cx23885_initdev,
+	.remove    = cx23885_finidev,
 	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
+	.driver.pm = &cx23885_pm_ops,
 };
 
 static int __init cx23885_init(void)
-- 
2.27.0

