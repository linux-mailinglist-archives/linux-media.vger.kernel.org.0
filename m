Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEF748364E
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 18:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbiACRlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 12:41:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbiACRlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 12:41:13 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803E8C061761;
        Mon,  3 Jan 2022 09:41:13 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id o3-20020a9d4043000000b0058f31f4312fso42239994oti.1;
        Mon, 03 Jan 2022 09:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Pzkzaoed+K47iHzaJqEhqLiGfQj1VjXXbz9ZoyhQM0=;
        b=N6L2Ul7QUEenkPjRRgv/l6IEDTgLVat5tiL3JhKcO8EN6eyPC7yPPDb7ClKjbX8fL1
         TlGaFOd4Rb2+njXayCuojgatKJz1pwthpsDRtO/keYimWZUqLGmeRgC3v3IxurUrRnDY
         PUQ2VKcvLz35Kq/8CRoBJidQHfPE8xHLXMD/uJ5b30RaOSwPSWwDqG6uACd7rgcJQTHI
         NrE/Gg2Lz89JIkWScXtLslDMrKKyoiwDIeHhzO2lIFsv068fMowOl6yx6zvnTH52ES4e
         SlqOUlPRZQEoqGptgSUcrE75VwooWfQ1I6T9RMgFEC9FQfLOZJvutqj2m4n3gMx3drTY
         lULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Pzkzaoed+K47iHzaJqEhqLiGfQj1VjXXbz9ZoyhQM0=;
        b=7RV/mNOWLqOz/ypwz5PsMWHMOatvI4WrA/kQYKB4snPTAzCBv+/QtzTJkU1GIVpBJG
         4qk5zkI6fXiL3NcyAa1MXe5yxyXbMl2GUKMMmB+YmjKdS8py2wZ1rvKzvymfBGe2TqvL
         xWv1gD6G3KNDRXG6siDGvqqcRu9OXwksd5UHTiJy3E7RUOuRtJjwxanttwQDPfdhW3Dq
         BpcdNCXKwAUBSRsjLgw2v6cgcjrGXm8KQMzx8Bhc0Ub3ron20Gyq/Ge4OmLrQBscwaFY
         bMaknPo5/eYFdNaoyt8mO81TxYdDl6OLX/zukVKZujZc+fr/OgD6+grh3yi2GBGrsFv8
         bZ0w==
X-Gm-Message-State: AOAM532X3fFXgljNdpB3iOSX3Rm2BqpatE0zD+ZUR4JzER/hpZ27NYoT
        KbIC6qen4ElqMLg1gDkkse4=
X-Google-Smtp-Source: ABdhPJzzHFYQdiomeKRM6SW3QFSrviE/xKfuh0Ybmx4FgCL4JPezJHvj5LjmALlzjT8DjqAchO4GMg==
X-Received: by 2002:a05:6830:1d45:: with SMTP id p5mr33263761oth.350.1641231672859;
        Mon, 03 Jan 2022 09:41:12 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:41:12 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/5] media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date:   Mon,  3 Jan 2022 11:41:02 -0600
Message-Id: <20220103174106.907-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
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
index bd68588b2683..f3dcfa763ebc 100644
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

