Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE6D3A66A
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 16:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbfFIOi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 10:38:26 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56130 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbfFIOi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 10:38:26 -0400
Received: by mail-wm1-f68.google.com with SMTP id a15so6169460wmj.5
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CE1rzNxQnjE+caruaG8A/jvqyGBc4r1TmXQ6RF+W7r8=;
        b=OZGpNkuY28eTyFO+q6PIXrKFPCtobyAO7hNR6Or7mW2syFjmAhOrxbJnX6jbRyFt5h
         820TN+hqeqLwfrU/K8I5V1xrKeAGMY22CngaIdVAbkhmtMK6kb4fgJNruicHvhb+FGBK
         BaJVevsB0JnvCag6G3BeaEYhQEtdR5URbzXXz5HFEujzmRgVcAz8Fk1ksbQPY4BB9UR1
         BMHAv3Hq+R6UtRPQXhdCD4bS6qdaxkfU3ZTzegnfaw1jLexZM5/lNjiFknfMdh++lf49
         Fily4NF6PC1cTDU+EHcm7fV1B+6pMiE/tLEGPepyOmrHOP6OMKv2I/ZiN0HZ1YWffKNj
         Q1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CE1rzNxQnjE+caruaG8A/jvqyGBc4r1TmXQ6RF+W7r8=;
        b=obzE9KuZBbHPsECxF3XtxFJkK8OZnj6vts3PjzdegrqIX8O5Q+H6pfvwcqQlURPoVd
         GM/ajrf6CTAQU4UACdhGr6lY6dp+9rbFTFKjiF5Cicq4V57oRHb9CtDGNH9h53qRYLdn
         QUHu7HI9GIcDljTvsmC+Qqo6vvxbS3S5BGxv4PAEn4+qhmx0qyioISUJl+xiiXMBh0PC
         QCyXbRjrKC8p16vMjiN2BHaOcBQmhHktP68NmpmCxkuX8bu+LPBl5i+r5LPv6eKRoHHt
         ZMq/29TEfcdZYl3He6+OXTx9T+LNrIj982gGS1EQbZ0PFK9EAUes9G/fJOv05UOJ2wih
         hmOw==
X-Gm-Message-State: APjAAAWifgZlKc22/QIwvclJ9Oa/IrkEtVPw6xBryo5fBasIJNCd7/Ld
        NXxWN8s/2VpjOoERGkWZBSZUpQ==
X-Google-Smtp-Source: APXvYqy+zfvEtsLMh96gQYo+Pb7hhNdiyMNv8bfwtVaWYX7tX/V9mj8B0+cEXWzbK6zSuEWjOQeg+A==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr10084349wmb.13.1560091104528;
        Sun, 09 Jun 2019 07:38:24 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c17sm6047713wrv.82.2019.06.09.07.38.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 07:38:24 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 1/5] media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Sun,  9 Jun 2019 16:38:16 +0200
Message-Id: <20190609143820.4662-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609143820.4662-1-mjourdan@baylibre.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a enum_fmt format flag to specifically tag coded formats where
dynamic resolution switching is supported by the device.

This is useful for some codec drivers that can't support dynamic
resolution switching for all their listed coded formats. It allows
userspace to know whether it should extract the video parameters itself,
or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE when
such changes are detected.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 7 +++++++
 include/uapi/linux/videodev2.h                   | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
index 822d6730e7d2..92ddd4ddbce2 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
@@ -127,6 +127,13 @@ one until ``EINVAL`` is returned.
       - This format is not native to the device but emulated through
 	software (usually libv4l2), where possible try to use a native
 	format instead for better performance.
+    * - ``V4L2_FMT_FLAG_DYN_RESOLUTION``
+      - 0x0004
+      - Dynamic resolution switching is supported by the device for this
+	coded format. It will notify the user via the event
+	``V4L2_EVENT_SOURCE_CHANGE`` when changes in the video parameters
+	are detected.
+
 
 
 Return Value
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..834550e20ee7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -768,8 +768,9 @@ struct v4l2_fmtdesc {
 	__u32		    reserved[4];
 };
 
-#define V4L2_FMT_FLAG_COMPRESSED 0x0001
-#define V4L2_FMT_FLAG_EMULATED   0x0002
+#define V4L2_FMT_FLAG_COMPRESSED	0x0001
+#define V4L2_FMT_FLAG_EMULATED		0x0002
+#define V4L2_FMT_FLAG_DYN_RESOLUTION	0x0004
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.21.0

