Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4876C1F85D0
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 01:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgFMXIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 19:08:54 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:54376 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMXIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 19:08:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49ktZD0L4yz9vbsd
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 23:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xOlTWyBxaeMw for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 18:08:51 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49ktZC5kLNz9vbsf
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 18:08:51 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49ktZC5kLNz9vbsf
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49ktZC5kLNz9vbsf
Received: by mail-io1-f70.google.com with SMTP id m11so8750069ioj.14
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 16:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bqeKwkOk6XZo5v2wD5bUoMhkkwGMTZ2YIiOp5s0J3EI=;
        b=blYeLB6ruy/BG0h+sr5PZC8DoM0/i2T2Yvh9NEaV9hzbNZD1SDp9DY8c6cGGW/AAT/
         39f7Fd2g7xUEK781SumumsDR8PTGMWjNkPMgb8rsDjymEeiJO+9lbMyZJn1wG9UjuiMb
         /QXZN998+U3zxGn1RCQGoxuNoYt+KjginABbTtg/Sj4aFeSW0C1XTY7YH0O6ThyPhE2E
         KTCIqxnZf8fr/NFJimQ06vaP/Vq/HJxx1HEiBl0WS0OYT0FBQTojqzpingYrxbBOOaWr
         ktfhq9wtBiQAw9gz3W7hGuQRUieM5kIlPjn3HaDvJrMU+bJ1swi6J+dcnxFdIf4lSuFT
         8q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bqeKwkOk6XZo5v2wD5bUoMhkkwGMTZ2YIiOp5s0J3EI=;
        b=XHy0vV7o34R+7vAv/hK3dsNPRzUcUjMm+RYR4K+Mtg88H+4ztIKKlPxE6k9DDEq5dh
         pdJ8rTwmTFb/MFokRUX6v76OeArpUVmNON7nTsKRfEieTnTIKpOlkCizFarm7Wz4chYt
         j7vzXgL+HFXA9K/F4d+jUWyYvnT0XN3NdlaXYvTK5CkS1N564GXNOnMNBL+9m+KdgRgG
         dll0mbiuScU77ILI/+EecbWssrWGs6EHNwN5guWKgV431M3OSIPDe3e4AhX/DRc6sNNQ
         NSbYOpinzn6JwqLG7n1lpID3xKTCcrkTJL7ZfwJ1+GGLYT37nW48rkERBB8d8CuMTO2O
         MRqA==
X-Gm-Message-State: AOAM530Ec6PXZegrdgkVTOFltncW1KFNhT6mmw23/Cum/ynDmq2U4Neh
        iXpD31psUgrNXMDockk1VDVIFONCJzM14/5kPfI9ip94WwltmzLkFgKT9o7/Whx4lwcjxySYOtF
        qTqo2sOhth0yKiYhV7QzKtWv8Bn8=
X-Received: by 2002:a92:b00e:: with SMTP id x14mr18850423ilh.219.1592089731319;
        Sat, 13 Jun 2020 16:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmVCe/qnocqMDuI+rUSn33JC0xwAkRz8hA8NtZAbzgXhzeCZTSmGkdB8UI2YxFK+JAFiuFRQ==
X-Received: by 2002:a92:b00e:: with SMTP id x14mr18850406ilh.219.1592089731061;
        Sat, 13 Jun 2020 16:08:51 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id y5sm5668155iov.3.2020.06.13.16.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:08:50 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ricky Liang <jcliang@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:08:43 -0500
Message-Id: <20200613230843.14109-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index f82a81a3bdee..097f0b050f67 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -710,8 +710,10 @@ static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 	int ret = 0;
 
 	ret = pm_runtime_get_sync(ctx->jpeg->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(ctx->jpeg->dev);
 		goto err;
+	}
 
 	return 0;
 err:
-- 
2.17.1

