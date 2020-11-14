Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79852B2D53
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 14:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgKNNTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 08:19:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKNNTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 08:19:42 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B8AC0613D1;
        Sat, 14 Nov 2020 05:19:42 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id w7so1616847pjy.1;
        Sat, 14 Nov 2020 05:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Y6FWnJm7gJRWfrR7f4omOmQCJNBo3UYdNRFvpFeGUBs=;
        b=iR/CZxl+3MY+KrCVtiMDvQqUsH2JM9ol1OdlW9lLpO+9zROMk0pkNF3peJN3gmwQfn
         K6824a9l7Imkg7sytNteYkWcnqt6VXkvGAYPPWxWQZyfXKmwGTOt78dPKIdCBeIytXIr
         tS4YliLaLH2Dv3cMHTxsmOLOeH+MJhEiTxqy3dRj2UnHy6uojci2SDTc3nbdWhb7Cytu
         k7Xlci23jJgK3qaj9P2J5SDvM5iqCzwO7c7IlC87qq6+imMYBRyETKhuwSPa14kzxmPJ
         ALy5DGL7KTbcYYSVgP4jYl1Z4CQRqng9QO6YhYUnzZcHPnIiw6E6OR5SfAan1Ntyiu/M
         1IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Y6FWnJm7gJRWfrR7f4omOmQCJNBo3UYdNRFvpFeGUBs=;
        b=H5kvsqQtRZoMfZB+fxxOW1LR/tYdiWjB1Bad71PvHTgSRBrWKqfidvCgEdr666mIPF
         JY1NCMvsIMrjMRgxOK3Lv0+RLrrZeDjKeM97SJ1rZGJXxyC31TG1XRaECXE/HQ2tjT2k
         134STXfonHJqiqf9YHAQi0e4ejtuORf7mLe0mMTd0TXQvYvs3U5wLc3v2w16hm+PghG1
         F2yR8bNH9Ex6kkrwu9n0fE8jFLbA6BymQFUf+IIb7nHmAsAml2KNUHsN/+xSvA1oSSFv
         nlaogCYslVchzteJpYa6gUF36p4lsU1xf7q7EIdXsunuEcsVRarKJVzn3SSRfy/H9XvG
         HPqQ==
X-Gm-Message-State: AOAM532D4P3U341ywxYX2kY/2O2zfm4iwK/ACvX50+64ltM9lCwX0/lx
        jwfbPFFbRba+Trn0fx2faQ==
X-Google-Smtp-Source: ABdhPJxoTFP5qOdleYsKlqsNQ458Gz46u9Oc6dXd4gy6rUwiOcNPr6TD5TetvSCWWQAQ8hlMeb94WQ==
X-Received: by 2002:a17:902:56e:b029:d5:d861:6b17 with SMTP id 101-20020a170902056eb02900d5d8616b17mr6115618plf.17.1605359982322;
        Sat, 14 Nov 2020 05:19:42 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com. [67.216.221.250])
        by smtp.gmail.com with ESMTPSA id j11sm12247177pfh.143.2020.11.14.05.19.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 05:19:41 -0800 (PST)
From:   xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: [PATCH] media: atomisp: make atomisp_css_stop() void
Date:   Sat, 14 Nov 2020 21:19:36 +0800
Message-Id: <1605359976-11254-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kaixu Xia <kaixuxia@tencent.com>

The return value of atomisp_css_stop() function is always 0 and there
are no callers check the return value, so there's no reason for a return
value. Convert atomisp_css_stop() to a void function.

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat.h       | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 5 ++---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c        | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 6a2a81a3eb23..4aea6702467e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -247,8 +247,8 @@ int atomisp_css_input_configure_port(struct atomisp_sub_device *asd,
 void atomisp_create_pipes_stream(struct atomisp_sub_device *asd);
 void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd);
 
-int atomisp_css_stop(struct atomisp_sub_device *asd,
-		     enum ia_css_pipe_id pipe_id, bool in_reset);
+void atomisp_css_stop(struct atomisp_sub_device *asd,
+		      enum ia_css_pipe_id pipe_id, bool in_reset);
 
 int atomisp_css_continuous_set_num_raw_frames(
     struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index faa0935e536a..9bf3f5fa4b0d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2098,8 +2098,8 @@ int atomisp_css_input_configure_port(
 	return 0;
 }
 
-int atomisp_css_stop(struct atomisp_sub_device *asd,
-		     enum ia_css_pipe_id pipe_id, bool in_reset)
+void atomisp_css_stop(struct atomisp_sub_device *asd,
+		      enum ia_css_pipe_id pipe_id, bool in_reset)
 {
 	struct atomisp_device *isp = asd->isp;
 	struct atomisp_s3a_buf *s3a_buf;
@@ -2188,7 +2188,6 @@ int atomisp_css_stop(struct atomisp_sub_device *asd,
 	atomisp_flush_params_queue(&asd->video_out_video_capture);
 	atomisp_free_css_parameters(&asd->params.css_param);
 	memset(&asd->params.css_param, 0, sizeof(asd->params.css_param));
-	return 0;
 }
 
 int atomisp_css_continuous_set_num_raw_frames(
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 2ae50decfc8b..de398c791f28 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -2013,7 +2013,7 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	}
 	if (first_streamoff) {
 		css_pipe_id = atomisp_get_css_pipe_id(asd);
-		ret = atomisp_css_stop(asd, css_pipe_id, false);
+		atomisp_css_stop(asd, css_pipe_id, false);
 	}
 	/* cancel work queue*/
 	if (asd->video_out_capture.users) {
-- 
2.20.0

