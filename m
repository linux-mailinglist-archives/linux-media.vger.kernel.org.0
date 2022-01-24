Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CC749863A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241499AbiAXRQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:16:35 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:38756 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiAXRQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:16:34 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4JjGqP4h3Bz9vCCS
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 17:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id d1KK_fl_TYVx for <linux-media@vger.kernel.org>;
        Mon, 24 Jan 2022 11:16:33 -0600 (CST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4JjGqP2cgZz9vCD6
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:16:33 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4JjGqP2cgZz9vCD6
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4JjGqP2cgZz9vCD6
Received: by mail-pf1-f197.google.com with SMTP id o187-20020a625ac4000000b004c8fc6b9707so1685395pfb.8
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZbD4Cm/3Vffm0HL+lKO3+0FIUSFq/dKHU9Ud+lQuNnU=;
        b=OVepBF7n9FOnQOfzWCH4yWVhHf3qOf5lFf3MkeinE6ALECdgZjTHJEuVYZqgTtJkmo
         XXQVbOjRSbe6YkPVR7qrrSPlVSOnXihzD2ioDcd/8JZWKSzivdB6AoGmKAAsqeIhZbtO
         u/ffPsiXgak4owPYTtk5IDkUln+lhYru919YU14PeqL4sA8cNjuHxFjf35T2+/N2i3su
         iUHGOW8TCzcotiKL7kVcRmRBr0Kue1DOhe25iEBdRh2J7lCxSpKKgvWS/g6jXUDhlrfg
         +eMwdBbQZYKg6z1RlsVltqUnInSdq170jk1/RzdB8MtvmcOpxXIgRiovCyaO535rQ7Qg
         LK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZbD4Cm/3Vffm0HL+lKO3+0FIUSFq/dKHU9Ud+lQuNnU=;
        b=onbih/TPk0In3awsQ0YOb9+HC0JkYA/AvUB823xgzwuCcB7zpuUB+eatPGxodJrpv6
         RMAQHhB5c1BbiXuUWNlutu1Xg9nxPw5t1kM2xd1uSgcDpmXxu4JG5WCtRzYaJlDKoRAD
         xTqLN2Cjpxb7e+XrOWQ/6p6E7as+dPYaODcc3VbT7DSNPEVFjpbzM+Dla+UgQvARJ8UF
         7UEa/YlUHYzDPLy+5PoDjjZkNm+E750l4ara7dVQMOnQcITGpgc5UJF0lm4S+lo8IiIS
         CCQh8XCGMwWiJ8x9559TPS+s6NT6pPHppNlEs5l0D0dvEJF1srVB6tKVg4vWfizZnhRW
         NKhg==
X-Gm-Message-State: AOAM5311IlFzraOAYfunb1900WBcIPgw3Tb6YQ6ud6idu0+1tpymsUKv
        /GqoXeMuleXGQvsI5eJwFuQVPJZKU5g/5xPvb5OkyFZRXf6seRcBWbiv2BmAEM02djwf89/Itbc
        fXx6rMX0gAMU7cWtB97WNM6r/SnM=
X-Received: by 2002:a17:902:8498:b0:14a:1b37:9f2b with SMTP id c24-20020a170902849800b0014a1b379f2bmr15862256plo.85.1643044590804;
        Mon, 24 Jan 2022 09:16:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmzkfmTgOVWbH61bb5d63j3WPu+JGnTE+TZUZcNzLSobKKUqFKCwRRttlfynOChBm0zoLXhg==
X-Received: by 2002:a17:902:8498:b0:14a:1b37:9f2b with SMTP id c24-20020a170902849800b0014a1b379f2bmr15862240plo.85.1643044590590;
        Mon, 24 Jan 2022 09:16:30 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id l4sm1013112pfu.90.2022.01.24.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:16:30 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: pci: cx23855-video.c: Fix a NULL pointer dereference in cx23885_video_register()
Date:   Tue, 25 Jan 2022 01:16:18 +0800
Message-Id: <20220124171620.61466-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cx23885_video_register(), the return value of cx23885_vdev_init() is
assigned to dev->video_dev and there is a dereference of it after that.
the return value of cx23885_vdev_init() could be NULL on failure of
allocation, which could lead to a NULL pointer dereference.

the same as dev->vbi_dev.

Fix this bug by adding a NULL check of dev->video_dev and dev->vbi_dev.

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

 drivers/media/pci/cx23885/cx23885-video.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index a380e0920a21..1b95109eff8c 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -1353,6 +1353,11 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	/* register Video device */
 	dev->video_dev = cx23885_vdev_init(dev, dev->pci,
 		&cx23885_video_template, "video");
+	if (!dev->video_dev) {
+		err = -ENOMEM;
+		goto fail_unreg;
+	}
+
 	dev->video_dev->queue = &dev->vb2_vidq;
 	dev->video_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				      V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
@@ -1381,6 +1386,11 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	/* register VBI device */
 	dev->vbi_dev = cx23885_vdev_init(dev, dev->pci,
 		&cx23885_vbi_template, "vbi");
+	if (!dev->vbi_dev) {
+		err = -ENOMEM;
+		goto fail_unreg;
+	}
+
 	dev->vbi_dev->queue = &dev->vb2_vbiq;
 	dev->vbi_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE;
-- 
2.25.1

