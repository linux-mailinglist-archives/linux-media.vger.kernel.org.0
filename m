Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 105DD914F1
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2019 07:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHRFkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 01:40:25 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:39007 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbfHRFkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 01:40:25 -0400
Received: by mail-yb1-f194.google.com with SMTP id s142so3299173ybc.6;
        Sat, 17 Aug 2019 22:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8KNmPAyZv2I1Th1hHKIYw/8aVgXMRn127vv6L099Klw=;
        b=iGvimq+kuvZxaHLY5eAAe1b8J1/MPSzSfozef/GcYfEBIHTtXUyv9P9pD3rLz528uw
         KAHGrjr4YZZGNWbmu5lr9EtgY/AVgITth27jVvRWxO4jSObb3q+NprUGNH3mFnMcgcOv
         H5xhVGS8FLV02jwvJ0TYllCeJpKvccoHSGeJZjePw7fyCaXFCSFPnavKXsU6Q50FTCTo
         5UiTMV70YBXUKcooLCY5mNwpllYekwbrMC7mUehxWWMmT4ymfbi9pmZa2PJMIw0TUDd/
         8pn7xZlPkry0JdJLDlNm6WsHXI8eqC1Jk8Ha7PkNggrZirfxM1SuEmFMXox+V3OoJAxZ
         zJAQ==
X-Gm-Message-State: APjAAAWB1UD64Dd/fXEGW8JtygMT0jDIeLhC+sqkddFAJvFIeOktvQiE
        C9VooFMFv0da/i0y0wxLb8iV9O76bnc=
X-Google-Smtp-Source: APXvYqz/T9bYsWJggRaZAZQzhprmYKolYypeDbqQi3BpE9KMlg8c1hfhvfdMtDfjZJa9x0rjiC2h5A==
X-Received: by 2002:a25:84d0:: with SMTP id x16mr11948162ybm.481.1566106824834;
        Sat, 17 Aug 2019 22:40:24 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id g3sm1932974ywk.15.2019.08.17.22.40.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 17 Aug 2019 22:40:24 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:SAA7146 VIDEO4LINUX-2 DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] media: saa7146: add cleanup in hexium_attach()
Date:   Sun, 18 Aug 2019 00:40:14 -0500
Message-Id: <1566106814-2911-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If saa7146_register_device() fails, no cleanup is executed, leading to
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

