Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D680E6639C7
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 08:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjAJHQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 02:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjAJHQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 02:16:47 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F392BED
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 23:16:46 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bs20so10727637wrb.3
        for <linux-media@vger.kernel.org>; Mon, 09 Jan 2023 23:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsXmfr1ifUQ41UhHdE4UcJ0WdZy3qnKZ5B3a5yc77No=;
        b=ga9CCvY8s6Nd961yw8lBKQgVueNmsjpU5nKynseCHxor6xtvY1Unk8BOHk4YPMecYy
         KbtMZ/r7UH445546TfVZJ+AqAS6uv1o0rUQRjp0/hJDPBP8DDsh4OQeRO+/n7AE8PdMC
         lU296h597pX3E9NA4zOAIT/nh91AApgpJ8PZ7WVqUARi3fNxuFdFSBzmZaIf7uUQzMjG
         KyeQpfkY6BBQAJBAYFscSv1H1L2TtwzMy5MYvp3gbYH8ICzt3mCgVVAHe423xQWzFAOy
         /ZF50t0q9ScFQuwJydnZ/QkWJmnRuDyeaV86sAuIuvSdkQ1DsNnHpRtkPFgregcAyLtV
         YPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsXmfr1ifUQ41UhHdE4UcJ0WdZy3qnKZ5B3a5yc77No=;
        b=MCUXUsXKEc42qexwlQjxVYuxyFAPx+OrGcNl+06vcxQy2t/vn/kPk+KA7EFVnC0kgz
         BEHYB3LzS04krneTN06q/x+VBMeZyKGWLx/1YkJUNagAAFPTBkXcR9KotaK7j+Ncu/m6
         LELGC+hkgvewANA8jS9f4a+GvAZhZ8tyTWxUd1RDrT78g4xWioZvwOigr63btWxK9Mzo
         hYq8JU2cfLLoPtnEGVC5JV/ZB7es/hnGmuJOeKlu78KgSlXyIM7ONG6QoiX01XjmWZCA
         EAsXrkN+le99Bq5H7n8XXFMSFAfsoE2OwTrWoEKXg4FgZ4fWdZhrBg0SQfv8sPOOzlNg
         7ygg==
X-Gm-Message-State: AFqh2krbzbXFPk1E1j0fHiNLIkGb8u7+F6eS3Ckupyh8m+FXm1Y8YuDg
        obhE9tlQNH97BpUvR1unlfb8BsshnRbFyEg=
X-Google-Smtp-Source: AMrXdXvP1E24J8whqwOIF9HNjZyNh5JvnIjvtTaAn9TMYCM6g1W5fNv9K43sMnQg30YtBIt8WpkaAw==
X-Received: by 2002:a5d:6411:0:b0:286:3b1b:a620 with SMTP id z17-20020a5d6411000000b002863b1ba620mr26107886wru.3.1673335004382;
        Mon, 09 Jan 2023 23:16:44 -0800 (PST)
Received: from images.net ([2001:41d0:2:c72a::])
        by smtp.gmail.com with ESMTPSA id b2-20020a056000054200b0022584c82c80sm10421823wrf.19.2023.01.09.23.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 23:16:43 -0800 (PST)
From:   Athanasios Oikonomou <athoik@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Athanasios Oikonomou <athoik@gmail.com>,
        Robert Schlabbach <robert_s@gmx.net>
Subject: [PATCH] media: dvb: bump DVB API version
Date:   Tue, 10 Jan 2023 09:14:21 +0200
Message-Id: <20230110071421.31498-1-athoik@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bump the DVB API version in order userspace to be aware of the changes
recently implemented in enumerations for DVB-S2(X) and DVB-C2.

Related commit: 6508a50fe84f9858e8b59b53dce3847aaeeab744
media: dvb: add DVB-C2 and DVB-S2X parameter values

Cc: Robert Schlabbach <robert_s@gmx.net>
Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 include/uapi/linux/dvb/version.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/dvb/version.h b/include/uapi/linux/dvb/version.h
index 1a8cd038aa0b..20bc874de321 100644
--- a/include/uapi/linux/dvb/version.h
+++ b/include/uapi/linux/dvb/version.h
@@ -10,6 +10,6 @@
 #define _DVBVERSION_H_
 
 #define DVB_API_VERSION 5
-#define DVB_API_VERSION_MINOR 11
+#define DVB_API_VERSION_MINOR 12
 
 #endif /*_DVBVERSION_H_*/
-- 
2.20.1

