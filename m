Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7CFEC1AE
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 12:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730415AbfKALYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 07:24:09 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:39674 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKALYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Nov 2019 07:24:08 -0400
Received: by mail-lf1-f51.google.com with SMTP id 195so6968432lfj.6;
        Fri, 01 Nov 2019 04:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0W10DXwaVM53AXBTDklaYFrwsbXNjvFaekrr8EZmqhM=;
        b=ir2IAJbHG5dCb87e8fwkfXUeapMieg/ly+Yt90fgj9qjPT+2LyKC6/4akTi+p2fd92
         4rItAGopNwa9OU4sL+SpvditJBxPMrnEqN6PyJIkkK1xM3zDjFyOK1zRrj6Rap/bRqMj
         DtPcoLJqFrlrPpraXTiOv6QnM0l3ZZoCTZtEJk9cBEujtJfnMrj4fR+Bl23uakNkF6zA
         YQyNHX5vx9RM7RMlTZXAvwgjHsv7E4JFRjiNo3yTE59AUi4CB0Z9wXJq8936i6d358LT
         +fEiV3ZLJ58JX455bLE4/KFaiz71ifqjOO4PoqznrQ5P27jXt7f8oePI9g7WHrExBLU/
         nFeA==
X-Gm-Message-State: APjAAAUeMmx4PqVERloPuFmAPx9wQ1KUfRTv9odyifg3CEKNvNlbRu/b
        7GB8r8K1TccTv5J6R+WD92dpvB2XZbE=
X-Google-Smtp-Source: APXvYqygX5XyngPuBxzDc4P9f2Frjnsb0gejKHX4B5HZu0oaXWOOv03LT6tkeNvK0FpIU80TV5Sx9w==
X-Received: by 2002:a19:6d19:: with SMTP id i25mr6989201lfc.178.1572607446088;
        Fri, 01 Nov 2019 04:24:06 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id v1sm2313691lji.89.2019.11.01.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:24:04 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 4/5] media: v4l2_core: Add p_area to struct v4l2_ext_control
Date:   Fri,  1 Nov 2019 12:23:57 +0100
Message-Id: <20191101112358.29538-4-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191101112358.29538-1-ribalda@kernel.org>
References: <20191101112358.29538-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow accessing V4L2_CTRL_TYPE_AREA controls without any casting.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f98bbcced8ff..04481c717fee 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1684,6 +1684,7 @@ struct v4l2_ext_control {
 		__u8 __user *p_u8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
+		struct v4l2_area __user *p_area;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
-- 
2.24.0.rc1

