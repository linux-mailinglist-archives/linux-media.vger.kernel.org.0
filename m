Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A4F260E44
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 11:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgIHJDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 05:03:08 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55555 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728137AbgIHJDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 05:03:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FZWqkWUrTMeQuFZWrkfJT5; Tue, 08 Sep 2020 11:03:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599555785; bh=NaCJMyt/cs+yWjM3gIBL4xJchJ2A1P8TRzbiFOvqa6I=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hAd/OwaWHtRHWVO5wLhsPyKi8LNnlxeznEd0LiNT1x80Bc7tGq3C2su2cJkKYksLs
         Go4xrhnSi4PWA1HIeiTVKLBExdDy6afhoh2optFhaw5ah5Icxth4lGwYa2d+fH+ocr
         /0GqI1xCpvmXKFs24GoV4SzKe8POvvoVjEhUekkwtoUttrdQYtg63lG5qYmZw2ljwE
         ZwvlHiyaeGEvXSsLwUd6AgQVR5A+Bm2hvnGdZpyOdtOzt0/0fJmnxDLSI5zt47Fsnc
         UfFUqwBK3d06THaCEVdOnMJdAuv9oP+gaFWG77WYwT+dyy+OFeBbLK4GU7Yf5PrFXa
         /4IGrw2Vue1Kw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vivid: fix compile warning/error
Message-ID: <231b3439-4128-311b-f265-25987cfb3955@xs4all.nl>
Date:   Tue, 8 Sep 2020 11:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGxyysnlWa4alVSF7GCp94lZl0NuZUk0w6XPHDYqk3sSzLso751cBr4/fD1DeseBGh3l03BlskDzALJcATfhVQeYZB5dQOaLWBROGbL0JrtEZam9Tpy+
 yBXnki1kRg32aReIv4vcmeu078SrNk8+7wrq6hGcpib/iXisqFXeHd5HdxmxJbtp7jZOlENQ3YNi60/0MQp4OYEbgxaQ/ulvAO1z2K+yRhMxWS5M6CzkbXgG
 3PkVTLYPv7sA1nmt+jNr9FsRG9dDTr31PLwWE3XI4Eg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this warning:

vivid-core.c: In function 'vivid_create_devnodes':
vivid-core.c:1318:11: warning: unused variable 'i' [-Wunused-variable]
 1318 |  int ret, i;
      |           ^

and this error:

vivid-core.c: In function 'vivid_create_instance':
vivid-core.c:1885:47: error: 'cec_tx_bus_cnt' undeclared (first use in this function)
 1885 |  ret = vivid_create_devnodes(pdev, dev, inst, cec_tx_bus_cnt,
      |                                               ^~~~~~~~~~~~~~
vivid-core.c:1885:47: note: each undeclared identifier is reported only once for each function it appears in

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 48809991f037..aa8d350fd682 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1315,7 +1315,7 @@ static int vivid_create_devnodes(struct platform_device *pdev,
 				 unsigned out_type_counter[4])
 {
 	struct video_device *vfd;
-	int ret, i;
+	int ret;

 	if (dev->has_vid_cap) {
 		vfd = &dev->vid_cap_dev;
@@ -1365,6 +1365,9 @@ static int vivid_create_devnodes(struct platform_device *pdev,
 	}

 	if (dev->has_vid_out) {
+#ifdef CONFIG_VIDEO_VIVID_CEC
+		int i;
+#endif
 		vfd = &dev->vid_out_dev;
 		snprintf(vfd->name, sizeof(vfd->name),
 			 "vivid-%03d-vid-out", inst);
@@ -1659,11 +1662,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	struct vivid_dev *dev;
 	unsigned node_type = node_types[inst];
 	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
+	unsigned int cec_tx_bus_cnt = 0;
 	int ret;
 	int i;
-#ifdef CONFIG_VIDEO_VIVID_CEC
-	unsigned int cec_tx_bus_cnt = 0;
-#endif

 	/* allocate main vivid state structure */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);

