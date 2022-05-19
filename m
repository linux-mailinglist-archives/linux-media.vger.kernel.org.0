Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F67252DA45
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 18:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242058AbiESQaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 12:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242028AbiESQ34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 12:29:56 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C884D809B;
        Thu, 19 May 2022 09:29:55 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id v65so7057121oig.10;
        Thu, 19 May 2022 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
        b=TnW9KOItijvRkPW8zIQNgsLbUoppuc5z0udA2UQl1e4Of5rBSUBLWK9r8if4LgCM/G
         uH1mfldzCezGhWfjyZxiyJxOo2/t8hL5RwJfkZTJ+EsspUYhPa/WmcbALC7x32D1VEsY
         zEUXvvbBE9DGgBTCsifdHCY4ZSFSVLZbVrb7zy/MABAaD53d9eoWzws21MvKmYD7BAs/
         NV/VLEduZuP7yL6Q/cBYquie1/iDy3NoqDnBs3NiFx51qjYwasz2Rk5rp3FeX7bk3bt4
         RKuT7+iIIeoLKhZrWI9xHbDnmXTy2VKOV0HRYrKmKlBTygcDTYqBz1lUcosY9VF63Syh
         kqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BWDg9SYEC+Mkg9KQnlntZ124XiWBKPicMuFquWJ2wyc=;
        b=BYLyblHTJ8ddCVGTv4U5T9W3t+pdxkfsp7wQVw3w2ER1IS2U15kEYAJdZdD3Eg62cs
         DumgeqbZJtbtKoub8kVXJPf8gPGAAT85Um2yoyzDoTKu7+GOz401teKNn7y2Tdm4Kygv
         FiJwRc7AYd/R14LblAfOa7wR+FKIXd4N0N3pvEpy/ZDmdVBfCAu0H9brNjR/0KEuln8w
         pL4J4VpIsn63GEf+DVfCntevOkn6CqVfErIsOzKSevLTUpYu82CAStjaUdOBYNJrYrSh
         QNa+Ot03txtF/XpcCh88npG2bC9vLmvBS+IGyFxYI+SI2u9yvmKc+QdIRTLl4/vPYxDd
         0Y7g==
X-Gm-Message-State: AOAM531kEtCkSDDSEnpuPPvkI3A9LEsY+yxUCmijXLtUE3pDSjVu2iku
        6mdAkgz4bh+CxU1scj0xXMQ=
X-Google-Smtp-Source: ABdhPJyGJUhU0e2OH+bkv9xAh0j0WZ/OUKDCSttYlF+cQ98VH3au6L7Ttsra47TeN1Zq/IJqqyLwag==
X-Received: by 2002:a05:6808:e89:b0:2f7:34db:6915 with SMTP id k9-20020a0568080e8900b002f734db6915mr3052967oil.284.1652977793212;
        Thu, 19 May 2022 09:29:53 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 09:29:52 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [RESEND 3/6 v2] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date:   Thu, 19 May 2022 11:29:32 -0500
Message-Id: <20220519162935.1585-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

