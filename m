Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5443D49855C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243967AbiAXQzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243965AbiAXQzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:55:37 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A387FC06173B;
        Mon, 24 Jan 2022 08:55:36 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id p203so10043942oih.10;
        Mon, 24 Jan 2022 08:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
        b=caRC2UDdoOX/PO5xoOgAt7dFqw/SBlhl733M+H3ft96s9z7jgEal2uadKNMQ5R84ju
         3DHEbsqII6apj9DO97YdnR62hOwMnuK8Rg0nMIGEn7m0Mj+XAnjdV1pFga4pPS4PkEb6
         pjeS/LTGxAldX7j5sJUjJ4ZZsgLIM5FY73YD9I6Bhy9DsJjgwTTtztK6mar4e4nNlUCh
         vvZM79Janqog4XGDvnACAn8bHhwX3uRnM+xUmXeqSGksAhTTEUO2NTWbC4fK5BKfqtks
         39T0kv2eEpO/NFQ7KqHk3S9BWLC1OldBnCVinMWY10W6PSaAD8gymsDogs+RkAvJ1v9V
         eegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
        b=hU1KU5LwGWBJngld+hAHua2AokX4buk+0FnTUZ0b86VCBiAQAL6S3m26Wr+0EzdFdf
         XH5mFnHiiLGlH//SYW1zRvwEhCIHknQppS5LW/RSHxQ7nkNw+TBap3bRFfYhTzPFiy0H
         RZCdEA6ZPvPvZ0fWxWCYdfXg+7fEQvTg5+Wv0mJTDqFqSAlFWGvQbfFOwB3vEEzFVoRV
         5g8m3rMND6SMLXwe+FtfD4l6kcp5e9ykF7OmV8Q1LI/kvHd00IEVt73pgSrGwLOgX4Sr
         5+k25Y10lMtsYEZrN03n1hzk54RKMRozTuz65sfL64hzzSTUhxJkOilP7QBLt2jhw5Rv
         s58w==
X-Gm-Message-State: AOAM532tLRnlCApNam9iqhEsf/wkvm2X9+9/azuCmbp/4uLybPIwaeCt
        mvKvNZ3aCqUcFFqwz2X+j0U=
X-Google-Smtp-Source: ABdhPJy2LVww5kIU+iO1Lc2CCWrOmfY8GKtA0JuU4h+LfajnpafkIsNrfraVDYoIYERBP1nkqqks3A==
X-Received: by 2002:aca:bc0a:: with SMTP id m10mr2277346oif.6.1643043335952;
        Mon, 24 Jan 2022 08:55:35 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:55:35 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/6 v2] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date:   Mon, 24 Jan 2022 10:55:23 -0600
Message-Id: <20220124165526.1104-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
MZP280 panel for the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/uapi/linux/media-bus-format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee2..a7b765498 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,13 +34,14 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x101f */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x101e
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
-- 
2.25.1

