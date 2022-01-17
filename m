Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627FC49103F
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 19:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242563AbiAQS1H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 13:27:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242533AbiAQS1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 13:27:04 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755C6C061401
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:04 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id k15so69067620edk.13
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eO3SarKuawfnSDlycroRnbnpPkYTlr8nD5yeqFUVHFc=;
        b=O42iWlmqZFfrZT1YQH9NZLLqWeHsjrezFg0IKlF+MbOJe+MmgTCMTBO6BLj86ZhqgZ
         Ktth5BBRygqea9NiPD3Du+Dp9tbZhmz4BgHQMpWRrgnxtjXP18bxvCJP0qh5SIp85N8t
         En/NuGe+o1wwdA2DLdNhasLj4fF3Z4BBqsEuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eO3SarKuawfnSDlycroRnbnpPkYTlr8nD5yeqFUVHFc=;
        b=JQhjUEnopMU3smWB1IVT98nhnpiRka+6tfY/N29ELFK6WXg+8xSGwp4oOLXV6NlKtA
         vYE7n26ofPsBYInNt+Etd5ZLArvdn7zAttIjs1y4lQLK/40V9/9SzI+qx/KnsqbAZxMh
         XwIsgOBfDafiZZTa89XbVWawjZsowFrcOQ5xTWTACQgAYNNE6ddzrRkDm393yjQxmiyy
         JjPJMfs5rWyRWkwnfq4W9Mhpyhzq/E5zi98kEkcWqq3ldmD1o36XyAynURarR0JZRK06
         /B8CrtQCCr02DxGZ2+zW1nuRO5eMRyjQI6kw9tUUIgwa5Yt4Xa0XNsLTFlJeTiUu7SK3
         U40g==
X-Gm-Message-State: AOAM5308u311KQKOhIcst/P6k218DN7hfanmSi2xYPhGboj+vwrdyPWL
        V70OMR+ptnN9dy6HwFnS94SSbg==
X-Google-Smtp-Source: ABdhPJznsIxpLjJR/d/R7v1Oul8vJd4+xCZf+aPIqc6VC6qHoTTYJ7sDnbKhxaNfBngrSRolsMd80Q==
X-Received: by 2002:a17:906:175b:: with SMTP id d27mr17982456eje.476.1642444023056;
        Mon, 17 Jan 2022 10:27:03 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id la10sm4657462ejc.22.2022.01.17.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 10:27:02 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 2/3] media: Documentation/driver-api: Document device name
Date:   Mon, 17 Jan 2022 19:26:57 +0100
Message-Id: <20220117182658.468993-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220117182658.468993-1-ribalda@chromium.org>
References: <20220117182658.468993-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how the name of the metadata devices is modified.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/driver-api/media/v4l2-dev.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/v4l2-dev.rst b/Documentation/driver-api/media/v4l2-dev.rst
index 99e3b5fa7444..935a46e29c5e 100644
--- a/Documentation/driver-api/media/v4l2-dev.rst
+++ b/Documentation/driver-api/media/v4l2-dev.rst
@@ -42,7 +42,9 @@ You should also set these fields of :c:type:`video_device`:
 - :c:type:`video_device`->v4l2_dev: must be set to the :c:type:`v4l2_device`
   parent device.
 
-- :c:type:`video_device`->name: set to something descriptive and unique.
+- :c:type:`video_device`->name: set to something descriptive and unique. If the
+  device has the `V4L2_CAP_META_CAPTURE` or `V4L2_CAP_META_OUTPUT` capabilities,
+  the string `Meta:` will be inserted before the original name.
 
 - :c:type:`video_device`->vfl_dir: set this to ``VFL_DIR_RX`` for capture
   devices (``VFL_DIR_RX`` has value 0, so this is normally already the
-- 
2.34.1.703.g22d0c6ccf7-goog

