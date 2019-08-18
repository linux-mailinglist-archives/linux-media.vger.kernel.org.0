Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B42914EC
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2019 07:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfHRFiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 01:38:18 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:43845 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbfHRFiS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 01:38:18 -0400
Received: by mail-yw1-f66.google.com with SMTP id n205so3102101ywb.10;
        Sat, 17 Aug 2019 22:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IKnxf42jSJpRpNJwrk3zbMrrsPTAan4wYTWj0yP0p4s=;
        b=Oyvd/4VVLQkIUFH16VaBmT7MAhX+lkS27s0/ArGxdEwxUhiaKKdPZle6hIDH6BhJv7
         x6OQdzBWqrbfMj5dN91uxVMTQG/l79IEivkZcTkydlVYhDDD2KcUM0AGvi8JP7D3sDMb
         yJOe2ponHH3mqbnHyo/XuhVRnJ8AzMkX5isL/A0jmEs5TKYGkrmaO6fPoWrjmfxWvCK8
         PNIrCVWecWps6uBE/FSvYeZaIVpqvoIgZ87+8qlslvRG45/qfkB4YLb6AZbOrPGPCyIz
         k/O4tyc6vPQWhtenJW5xnCqYC8cOEUiFhDMLL5FWFLi4GK5lh+Jd8y+l3KTnXa5XIq4w
         aIcQ==
X-Gm-Message-State: APjAAAWb7NrD1Ok6WV57XGF5D+9sOyr2+5BZWl5zuPV9SmuSL6ZEfIxm
        8rCk+kLPcRR7e0GVGFZYvxA=
X-Google-Smtp-Source: APXvYqzFzSIr9rHLQb5o9SRNXtRYBYU5gvjyVR2yyDbFwDzUtJpXabQzHNmWRbtVt2wNFkF9Q/ZVbQ==
X-Received: by 2002:a81:3b92:: with SMTP id i140mr332709ywa.220.1566106697677;
        Sat, 17 Aug 2019 22:38:17 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id x15sm2367814ywj.63.2019.08.17.22.38.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 17 Aug 2019 22:38:16 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:SAA7146 VIDEO4LINUX-2 DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: saa7146: add cleanup in hexium_attach()
Date:   Sun, 18 Aug 2019 00:38:12 -0500
Message-Id: <1566106692-2799-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If saa7146_register_device(), no cleanup is executed, leading to
memory/resource leaks. To fix this issue, perform necessary cleanup work
before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/media/pci/saa7146/hexium_gemini.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index dca20a3..f962269 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -292,6 +292,9 @@ static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_d
 	ret = saa7146_register_device(&hexium->video_dev, dev, "hexium gemini", VFL_TYPE_GRABBER);
 	if (ret < 0) {
 		pr_err("cannot register capture v4l2 device. skipping.\n");
+		saa7146_vv_release(dev);
+		i2c_del_adapter(&hexium->i2c_adapter);
+		kfree(hexium);
 		return ret;
 	}
 
-- 
2.7.4

