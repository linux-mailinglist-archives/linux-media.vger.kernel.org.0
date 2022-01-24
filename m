Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48624985CE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241382AbiAXRGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:06:20 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:45002 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241340AbiAXRGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:06:19 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4JjGbb1VRgz9vFHy
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 17:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id i15BF7ZXNDcD for <linux-media@vger.kernel.org>;
        Mon, 24 Jan 2022 11:06:19 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4JjGbZ6YwHz9vFJ7
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:06:18 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4JjGbZ6YwHz9vFJ7
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4JjGbZ6YwHz9vFJ7
Received: by mail-pg1-f199.google.com with SMTP id p6-20020a63ab06000000b0033fcc84d4f6so10255577pgf.5
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D23ajDKPfP8QvM0YyxuxxxoHL0XAqyQacaTbHEKBa1U=;
        b=MmTL/cIojmZDn33VxiqZAJP6Nensh1IfyZjvD8gUhgT4jen9mvPfliWE5ilCkxYRhR
         Zdf/gGZ0sbPinbGLHoAZKsdtaRAETLUMnP10tLyKqMQDmQxqQ3tNPUn9QoxmL7mpeJKB
         BCZeDosFWW9qiZ7UXad8ceFZ/ApuNGdcn0y/Mc+e1PQZzAHDMrXrHumLEG7y8g7PTIjD
         gbvDhgQUJEAa0EYVlUTDvXX3MVzH8f55U4Kn91Rx9tkZQgpv225mhqiQJ2RH6p7FURdf
         kXqkcFj9oSveEaMwnQ3kTy7wvOx8i3JQQvSCskmPEmDhZXYkn8jlavnLLbmN+hKqUubQ
         OkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D23ajDKPfP8QvM0YyxuxxxoHL0XAqyQacaTbHEKBa1U=;
        b=IPlfam81p89cuFnmIzHD6bE0pZYFBGpzqvzJ91GFD3zG/0WzU+WKzsx0nBtA4JSFIC
         e/Gw2oplQGSTijW5Be9g1J+wTYY7VKqPZC3abiHyYg+lzWsrGdzzV+EKaeiZlYqXxu7Z
         Zyf8U8NNwlvxgDT6ptInXwZ+Sdb0ct63h6S8blAcKjdNuQPbAmPoYZoQFfRU+Lv0rVmS
         qQimRxtu3cPvhRrS41hDL4C2etVkhmlWCApu8RAMrWFdsGsf+X5am4Eu2FVUgVLKqpm7
         KiBuMJyWSLTGtwbpsR2Q0wdlBKunPUqhadZGHpCLp4DEd8DWJr8KF4Uy3ruE57qozLDA
         mMfg==
X-Gm-Message-State: AOAM531p4Kjas4rPNpt4Fsfij/DKFsNphJ0gMryazGkXnbTrdFzQvg90
        YSlJ12j9WxkfWKyckfBucw3Ehk7qelLNzO78TGFg0TEt9BzLLwfKrectVVr4aFCbIwsHio5bA3H
        sP2USRNCRytBlZPtremgGPUr80aw=
X-Received: by 2002:a63:7f4d:: with SMTP id p13mr12133880pgn.29.1643043977984;
        Mon, 24 Jan 2022 09:06:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOz2vcm0FEUwbM7DjKGdskMrltoPSKvgeIgvjuXanLkMLB9W6kspX6OqX01eblMse7WXzwQw==
X-Received: by 2002:a63:7f4d:: with SMTP id p13mr12133863pgn.29.1643043977708;
        Mon, 24 Jan 2022 09:06:17 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id pi1sm6001094pjb.10.2022.01.24.09.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:06:17 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: media/pci: Fix a NULL pointer dereference in cx23885_417_register()
Date:   Tue, 25 Jan 2022 01:06:10 +0800
Message-Id: <20220124170611.58864-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cx23885_417_register(), the return value of cx23885_video_dev_alloc() 
is assigned to dev->v4l_device() and there is a dereference of it after
that. the return value of cx23885_video_dev_alloc() could be NULL on 
failure of allocation, which could lead to a NULL pointer dereference.

Fix this bug by adding a NULL check of dev->v4l_device.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 453afdd9ce33 ("[media] cx23885: convert to vb2")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/pci/cx23885/cx23885-417.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index 434677bd4ad1..fcc9c1117ed1 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1521,6 +1521,8 @@ int cx23885_417_register(struct cx23885_dev *dev)
 	/* Allocate and initialize V4L video device */
 	dev->v4l_device = cx23885_video_dev_alloc(tsport,
 		dev->pci, &cx23885_mpeg_template, "mpeg");
+	if (!dev->v4l_device)
+		return -ENOMEM;
 	q = &dev->vb2_mpegq;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ;
-- 
2.25.1

