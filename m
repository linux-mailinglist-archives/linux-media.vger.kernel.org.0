Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4166846E27A
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 07:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbhLIGdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 01:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbhLIGdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 01:33:15 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C065C061746
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 22:29:42 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id u17so3139520plg.9
        for <linux-media@vger.kernel.org>; Wed, 08 Dec 2021 22:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l70yrT2MnFH7bNPw1mTKeaVZEUJsCzdp2hTTSYAY8Ho=;
        b=G9PjGpIwWFcaeZ9f8ADTb/FlHKQkjX6igYz6ah6WZAInRXZD+vkwfQ1LOFhycuoA5c
         2QW5FPVY5C+vOPq/aJkB2+DeRiB6DZw2W/hpITZBWUc4NCoMv27ACwhwu4hW475e5JkT
         IwsLGkFZ6KmRXqwoPIh7S5iZ+DHKsleobUh5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l70yrT2MnFH7bNPw1mTKeaVZEUJsCzdp2hTTSYAY8Ho=;
        b=KWPY+3YKfDWQU0hiEmVE18Jv/SL1zhPGC7CdpeT/MJNRgbHBJoFmn2MO4Bx6FWIGSB
         bhF7KCuQw2X5PJBl79kGymTWCc1pFE/mhQhX9rZ76OewprhLQHhcguOeWaJAz57Geqgx
         lZHUcDofcWSruKhpl0gwYbZhDWHghkWMliyQ2F9uoNa+ifrMOps8hzP7UOafS/j/b2Zo
         7lAQvEr3nSIaSJvd0pSjZZVY4R0DcJBX0MF6srpI4a5NIXcK1LTh8mlv9UmLrOcTxEdc
         Kmdiu/f3X00M/ZSd0lvOzDz+AgFKuNIVuC2KtoV48IEwagjWlqYEhghpHWVU/xE4ZA+7
         CtPw==
X-Gm-Message-State: AOAM532EH5hvDz8NkiyZqzmJS71LDIUXNcyPDlM3npu7mKlpGPFC1HAF
        QTH318jOOJwDIylRMLJd7y8tRSeFZGAPfQ==
X-Google-Smtp-Source: ABdhPJzUq9ICMOJkOd3j4HnkBJOY1s8yXIXSMq2SXIN0DuDNBSRr7qKyOZ1Svq/OniclaWGRN+PRJQ==
X-Received: by 2002:a17:902:8214:b0:142:61cf:7be with SMTP id x20-20020a170902821400b0014261cf07bemr65238289pln.0.1639031381883;
        Wed, 08 Dec 2021 22:29:41 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:edb5:3ef8:a855:9380])
        by smtp.gmail.com with ESMTPSA id h20sm4158955pgh.13.2021.12.08.22.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 22:29:41 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: docs: vidioc-dqbuf: State all remaining fields are filled by driver
Date:   Thu,  9 Dec 2021 14:29:25 +0800
Message-Id: <20211209062926.991516-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The specification for VIDIOC_DQBUF is slightly ambiguous on what fields
of |struct v4l2_buffer| is filled by the driver.

Reword it so things are clear: the driver fills in all remaining fields
not specified to be filled in by userspace applications.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/userspace-api/media/v4l/vidioc-qbuf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
index 77e0747a6d28..e4b3d9beb9ab 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
@@ -125,7 +125,7 @@ Applications call the ``VIDIOC_DQBUF`` ioctl to dequeue a filled
 queue. They just set the ``type``, ``memory`` and ``reserved`` fields of
 a struct :c:type:`v4l2_buffer` as above, when
 ``VIDIOC_DQBUF`` is called with a pointer to this structure the driver
-fills the remaining fields or returns an error code. The driver may also
+fills all remaining fields or returns an error code. The driver may also
 set ``V4L2_BUF_FLAG_ERROR`` in the ``flags`` field. It indicates a
 non-critical (recoverable) streaming error. In such case the application
 may continue as normal, but should be aware that data in the dequeued
-- 
2.34.1.400.ga245620fadb-goog

