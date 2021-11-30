Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D32463BB6
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 17:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243382AbhK3Q3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 11:29:16 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:60592 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbhK3Q3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 11:29:15 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3SJN0p8gz9vZ88
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 16:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YIjHdBh_dQLV for <linux-media@vger.kernel.org>;
        Tue, 30 Nov 2021 10:25:56 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3SJM5rJ6z9vZ8N
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 10:25:55 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3SJM5rJ6z9vZ8N
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3SJM5rJ6z9vZ8N
Received: by mail-pg1-f199.google.com with SMTP id n22-20020a6563d6000000b0029261ffde9bso10540356pgv.22
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 08:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uM88bj2UBMZbe6S/aX6D8+Tjp/X3SNWyuQ1hnqyhePs=;
        b=II12pNJHDikjjPvtlomfIg8s7uKr49/xshneCdqsJAGGhzJ1GgfzGUYrarB1Y8QbaP
         QOCQCszOijgaA8dazvsxqLZXnzutaf1RnXrtG7xfah6k8J6rEez771VHgb/rQSUg+9TB
         8m+Yy5fUe2xwUp7c8LuS9/Tfc1kWU+Ccl+M0Zwg4YMPRFDV3cgOualWkPd3217x7PO3S
         xD9ZH1eMiBkl2FXRYmW693xtFr0n+SjLil1oW7UbCB8Z/b5JEZOLDgGvluXBFPm/POP9
         dDngcgd+SJjqPKJXxE6ng1B+wZIWr8KurE7WIdEA0q5qRR59nh69aEGzQMn4JL0Yb20+
         7LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uM88bj2UBMZbe6S/aX6D8+Tjp/X3SNWyuQ1hnqyhePs=;
        b=ZhNtYZfMD0R75aNzsvhDU3Hg3j91arQJCsBWetWsZc5slhj0vtOtQSxmZunjl6kECr
         iNGeuOWaLJqFupDZT3zzxgPZP06qp7XWkQS8eJRKFv2I1QuExLAMusLW+MWTzzVWKKoU
         KP8TYJL/imxNq/wVXIE7XqYFn61adIdkb7VJ2XPh1h3w7H2e+xIihbx3Ei78ul24iPiJ
         c4ffrF5ibztmj3H6vYg6PGzJv4nZykGXTxViCYnUCgLCQvjRm5Ka8ydKV9pxszjUHCw4
         IZu0V0eCdeztHrhn3wFk/HXOaHD3z7/zl8MynjvQo7UKbzbbT2fn2uEHILLS5oQmuFPI
         Nucw==
X-Gm-Message-State: AOAM531VevzMfGpPoEpKRrid6w/V+2pklkjURjUqCX+fKy0X1O8Uye1i
        8bcp756eDsrSgFXdvBAnKIe+29fcykaq4QTT9nbhuD0nxwWVotwqwti8nWSO0ZXed7LSI2IWB0r
        YB6uYhLdt20eO9XjMb15fXk6dOZQ=
X-Received: by 2002:a63:1c52:: with SMTP id c18mr166045pgm.182.1638289555035;
        Tue, 30 Nov 2021 08:25:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHtFZCHc7JaWxrpnB1Nz2yTm94o6pQDRJaJYfl+EFARyROHSDmUq96eLemSlRqCvbEAxuHqA==
X-Received: by 2002:a63:1c52:: with SMTP id c18mr166019pgm.182.1638289554776;
        Tue, 30 Nov 2021 08:25:54 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id g9sm23054271pfc.182.2021.11.30.08.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 08:25:54 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7146: hexium_orion: Fix a NULL pointer dereference in hexium_attach()
Date:   Wed,  1 Dec 2021 00:25:49 +0800
Message-Id: <20211130162550.185139-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In hexium_attach(dev, info), saa7146_vv_init() is called to allocate
a new memory for dev->vv_data. In hexium_detach(), saa7146_vv_release()
will be called and there is a dereference of dev->vv_data in
saa7146_vv_release(), which could lead to a NULL pointer dereference
on failure of saa7146_vv_init() according to the following logic.

Both hexium_attach() and hexium_detach() are callback functions of
the variable 'extension', so there exists a possible call chain directly
from hexium_attach() to hexium_detach():

hexium_attach(dev, info) -- fail to alloc memory to dev->vv_data
	|		    		in saa7146_vv_init().
	|
	|
hexium_detach() -- a dereference of dev->vv_data in saa7146_vv_release()

Fix this bug by adding a check of saa7146_vv_init().

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_VIDEO_HEXIUM_ORION=m show no new warnings,
and our static analyzer no longer warns about this code.

Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/media/pci/saa7146/hexium_orion.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index 39d14c179d22..2eb4bee16b71 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -355,10 +355,16 @@ static struct saa7146_ext_vv vv_data;
 static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_data *info)
 {
 	struct hexium *hexium = (struct hexium *) dev->ext_priv;
+	int ret;
 
 	DEB_EE("\n");
 
-	saa7146_vv_init(dev, &vv_data);
+	ret = saa7146_vv_init(dev, &vv_data);
+	if (ret) {
+		pr_err("Error in saa7146_vv_init()\n");
+		return ret;
+	}
+
 	vv_data.vid_ops.vidioc_enum_input = vidioc_enum_input;
 	vv_data.vid_ops.vidioc_g_input = vidioc_g_input;
 	vv_data.vid_ops.vidioc_s_input = vidioc_s_input;
-- 
2.25.1

