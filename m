Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB4349855A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243953AbiAXQzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243945AbiAXQzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:55:35 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEA8C06173B;
        Mon, 24 Jan 2022 08:55:35 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q186so26410235oih.8;
        Mon, 24 Jan 2022 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
        b=h+hswY34tTiBQRdRfR4z/MnDvgEdaNnaMK4+vS0/lTHghIOINgj6mwrPYUtBp0cOI+
         0ho/H+IesDBp9kv+M26m0nCRdKEPaoKURBadjIKegIKIK2R/yzZzpWS2WUVs4AM6QW3j
         hHvBzA8qke8fqodEShvMa5G8yv0IUNCeMrC3Wf2QFJ5qQPfwmGbeM5lKfddAyHttU2nm
         X5OoQ2ry826EZNCMPH103uZ0vJ3K2T3JM+d/e/DQw2heKA1IbbEygmtyIGtvbJKgZx57
         OcMHm7q1wmn3516nKDRoWUDiKUbJrVT3CGakvbcBt1ng2UvXdH4ZOmOEif9qzfaBC4nR
         O1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nWielQwKUjaGCDPYpC0qlz0e3JwhdCLUGqShkGf0aHY=;
        b=iQlpRdqcODuY0M7OtUokIBzX6HP0QZDc6kLU1EMB94kEGoAQ/YXwP7M16w4/8dMJMk
         3j3tRMAqcCWjVPr5ozsWZ4zo1Djb+JQbCIumB1ewgsmAujQHmDFgQaRofAWWW55BlTxP
         2KdP+Yu2omss8Jk54W31UHUaVjMMI3gJZX5PEW+jzxjc6BtY8P8ovTBg9pjOnYqj3PfE
         cCOj0Hn+v52MosRSTuLvNlYNlDxq0d7pRxdQcS5PDHsa7HEbfpqEpRzsP7ebfUswpymi
         EIIU+jaZPoFMaUbQ2TBKHL/YVqicyj8v9Dvj33k44CILRl+wlaA51zK5ZvcNZulpWy5k
         iqfw==
X-Gm-Message-State: AOAM530ZkjCVTtjCWqbn00K7wyOEu5N3dQAgCT3q3Hv9Zf4mTA4vJruo
        p++6s6emNTrGEVz4xDH3slM=
X-Google-Smtp-Source: ABdhPJy/1yAGdMKJKSdjdUxUW9xJlLSFlDoY1QhGMleFmeJlbWzWMbDHIQsTsKlDKhJGW/gI2WqcvA==
X-Received: by 2002:a05:6808:1a19:: with SMTP id bk25mr2154728oib.26.1643043334776;
        Mon, 24 Jan 2022 08:55:34 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:55:34 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/6 v2] media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date:   Mon, 24 Jan 2022 10:55:22 -0600
Message-Id: <20220124165526.1104-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for MEDIA_BUS_FMT_RGB565_1X24_CPADHI. This format is used
by the Geekworm MZP280 panel which interfaces with the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 0cbc045d5..e43e07634 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -624,6 +624,43 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
+    * .. _MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+
+      - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
+      - 0x101e
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - 0
+      - 0
+      - 0
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
     * .. _MEDIA-BUS-FMT-BGR565-2X8-BE:
 
       - MEDIA_BUS_FMT_BGR565_2X8_BE
-- 
2.25.1

