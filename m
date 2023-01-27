Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D467DB0D
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 02:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbjA0BHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 20:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjA0BHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 20:07:49 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904772106
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 17:07:46 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so3485777pjl.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 17:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvj+5KD60/xWWmptX2YeC+XzwgywUiYeKFqRGWLvTZs=;
        b=cc3CgBWc9ggqiGl11I0SuAS9CCMJEsOVPirQqF+mpwLbmK6cHnG320Ytv5isTooV3E
         Dx+wtsDVTk1crCDBn2CIyJEA1GWTc3cJArWzEllnFFAbR+dlh7Y2XaKWwE1D0bWOk9dF
         b4IQ/Gx3oPnfJ8RKhL5oFTJa+xyHJFDhp4Uc5GrYYxgboQZ1W4a8ssDGY3A+itvEO0HT
         gt7g2emr+7yU5jsbUCt9m8lYVisU8ykYrWbQaicatGB/VuvZNoRdr+LtIT+05zbo8YQ7
         kpd58OxHmRYu8NbIKLx0YNOsga31qbbYVmREYyy4mSakMtBfp+Om5TRGBIytWUxoasKx
         C3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wvj+5KD60/xWWmptX2YeC+XzwgywUiYeKFqRGWLvTZs=;
        b=IJZCfJTYFM+BOsngZQscHXP+mW3S6gRw+IPWVpVlz3QI+Q0DlW28xqJnrMvbTFVBEZ
         rmYfkakpHs0pgEc6sWY05PVvnWbXSy1uF9SrbLAj4jPvQ0KmZi+M+gPHJ19tKNj3lCpM
         mIOxJNSYrFMN+pVCnQaE/APZdvPUmp1PypvKRe5+fTfEMZs+dBWDkGl7QCEOSV6w56aA
         TmcMTYgu4wDsiNUCmdDX90JfLAXrZYr5F2u/SRn3wnaRDWR5JChT5/i6f6ir3oVqpVhl
         A6Yu0ATR2qN6sPNtBC276ubQAOfOeNgij9jaYdTsBDq2OJ1dnNQef9wsLlUvb/HQx0rB
         QnyA==
X-Gm-Message-State: AO0yUKVeAjpdphEMyfref9hz9sIlQsxZyKM4M464QkkvxJYapO2M8Qvy
        N033sVMxqNxaz3GMVtQbZ2t66Z0vLd54TQ==
X-Google-Smtp-Source: AK7set9zSySJv0v2rtaew7JPs+qTurgstgUD+hgM1lBYkb+mFeaK9l1d+EcWf5MG2zFRv8h/uHkHvw==
X-Received: by 2002:a17:90b:388e:b0:22c:2f80:9b8b with SMTP id mu14-20020a17090b388e00b0022c2f809b8bmr3705698pjb.20.1674781665655;
        Thu, 26 Jan 2023 17:07:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ep22-20020a17090ae65600b0022c08445e97sm1603398pjb.38.2023.01.26.17.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 17:07:45 -0800 (PST)
From:   Khem Raj <raj.khem@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] media-info: Include missing <cstdint> for uintptr_t
Date:   Thu, 26 Jan 2023 17:07:41 -0800
Message-Id: <20230127010741.3883339-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
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

gcc 13 moved some includes around and as a result <cstdint> is no longer
transitively included [1]. Explicitly include it.

[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 utils/common/media-info.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 53e132f5..1a25a4b6 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -3,6 +3,7 @@
  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <cstdint>
 #include <cstring>
 #include <fstream>
 #include <iostream>
-- 
2.39.1

