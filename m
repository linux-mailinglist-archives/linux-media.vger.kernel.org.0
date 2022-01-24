Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC594498654
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244311AbiAXRTk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:19:40 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:45248 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244267AbiAXRTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:19:39 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4JjGty5wgyz9vjJP
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 17:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LI0_wn-WDuMZ for <linux-media@vger.kernel.org>;
        Mon, 24 Jan 2022 11:19:38 -0600 (CST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4JjGty3rk4z9vjJR
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:19:38 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4JjGty3rk4z9vjJR
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4JjGty3rk4z9vjJR
Received: by mail-pf1-f197.google.com with SMTP id j21-20020aa78d15000000b004c82d9c2977so2653518pfe.21
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3N6wJzEY0KplvljaHwRHG8hIgjKSfmZz4U+e3o8/n4=;
        b=kKgtzRoGQXzwgA6FcvxruW7ZL5r1jYaSsrGQeDWqMyjTOcKY2YTMvWotzDugTbVPCL
         1rbbjgBabA9JJi7REFGlLi4WS0EynAZLgCmsfjww+3oxjSsrhkJkRfKCGxUOd4GWjY00
         dB9ciyd86LzmS+ELkBLhxAqQ4ApQvUXp17GYFwzATQoSENdM3FAxMTfE71z2xc1ikvvC
         DoDtTcvkBzUqTJBGcKgic4pVVculsdEVmnYJRALs0jlhwHVZT9fl+CMzW0ZDSnSfiF8V
         oOJlBEYIKlP1PLrm1sSVODqZGv82g3OH8Jnd55uvUsAeTqfcPLjiKQJ2y5FzcLdn29SF
         iYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3N6wJzEY0KplvljaHwRHG8hIgjKSfmZz4U+e3o8/n4=;
        b=zp3p0PeSHhLbLlxJMZnV/Eidm+sZdK8yTjrzMPs+E/3lA8BIgyVFx9iv5cdjjO+JCy
         xzWx/lJzuvpkXiESD3ru9uF3PYX0uJ6mDh5SHiNJUwpzR/wE5179/xT+bknSNLycJ23T
         CUXwTgwjlkf9u0uNbTkNLD7zTpjaNiBiRONcPMA59lsN8D/MALNGav+KloU0jSnNuMSQ
         QZbb/6ciAFRzKaNbPZ70Bvuu7C4GXUwvbwAwA9VIQxSS3YlJSUunkIfAXdHJFhj8iyO3
         8ahbV86uv1y8idWNdnCtRVYkrHA5SlUf4eAA41BlSv63uMjZiF8b3fMcKXLwD1GM1fjr
         MZOw==
X-Gm-Message-State: AOAM533ceQGi0XqRETf+zpDIiYQZn7F2s2bSfFTMDpSEaKXLDv8tLU9E
        nl3jdaQR/hKAMfXQKXF7Sbfo6Y8LX51G+o9UzdbabLRzyLMSCgrxIHp5URqtMPM1w2XGo3lEab6
        CgvcVhTfSHprOub0JGNZL3ecZWxs=
X-Received: by 2002:a63:41c6:: with SMTP id o189mr4269711pga.613.1643044777751;
        Mon, 24 Jan 2022 09:19:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBC7Yc8Jww7/CWdf2GQDqTT+vDsmi1youjQPMHW0084ltnZDJHX/mfaU0N99eHc/nHOQpt8w==
X-Received: by 2002:a63:41c6:: with SMTP id o189mr4269697pga.613.1643044777539;
        Mon, 24 Jan 2022 09:19:37 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id nv13sm7703946pjb.17.2022.01.24.09.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:19:37 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tasos Sahanidis <tasos@tasossah.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7134: Fix a NULL pointer dereference in saa7134_initdev()
Date:   Tue, 25 Jan 2022 01:19:30 +0800
Message-Id: <20220124171931.62174-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In saa7134_initdev(), the return value of vdev_init() is assigned to
dev->video_dev and there is a dereference of it after that. The return
value of vdev_init() will be NULL on the failure allocation, which could
lead to NULL pointer dereference.

The same as dev->vbi_dev.

Fix this bug by adding a NULL check of dev->video_dev and dev->vbi_dev.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: a9622391acb ("V4L/DVB (6792): Fix VBI support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/pci/saa7134/saa7134-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 96328b0af164..0de0b00540b6 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1202,6 +1202,11 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 		pr_info("%s: Overlay support disabled.\n", dev->name);
 
 	dev->video_dev = vdev_init(dev,&saa7134_video_template,"video");
+	if (!dev->video_dev) {
+		err = -ENOMEM;
+		goto err_unregister_video;
+	}
+
 	dev->video_dev->ctrl_handler = &dev->ctrl_handler;
 	dev->video_dev->lock = &dev->lock;
 	dev->video_dev->queue = &dev->video_vbq;
@@ -1224,6 +1229,11 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	       dev->name, video_device_node_name(dev->video_dev));
 
 	dev->vbi_dev = vdev_init(dev, &saa7134_video_template, "vbi");
+	if (!dev->vbi_dev) {
+		err = -ENOMEM;
+		goto err_unregister_video;
+	}
+
 	dev->vbi_dev->ctrl_handler = &dev->ctrl_handler;
 	dev->vbi_dev->lock = &dev->lock;
 	dev->vbi_dev->queue = &dev->vbi_vbq;
-- 
2.25.1

