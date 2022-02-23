Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C8B4C0660
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 01:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbiBWAsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 19:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbiBWAsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 19:48:30 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8C83C701
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 16:48:03 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id c23so17795280ioi.4
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 16:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X/SM7ypn/we+/Ap6dezDbTAlXM+fBDX/e6eX0DPCG34=;
        b=cGSZIAUA5IBVFN9M/UvrS7Xbe78KBt0fgDb5Gha26WTQHyy46lEHZg6yquqHxrBMgl
         v27/u5Nss+ezGUUd4ZhwDccs7PW0/lungMaNGKSQquaYm63OOX10XUoQYnFycQjOQflh
         xnc/R9tVlFq5Hb6cI2eEHs05Xq+CBeitUgKAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X/SM7ypn/we+/Ap6dezDbTAlXM+fBDX/e6eX0DPCG34=;
        b=gb6n8BzVfG4Xfk4oQoa9N/p4+kWdHnTP2gFy7QqK9jvm85pHalb2DAArJ0O43FQkVT
         WRcLMof/oN9NaRiX68OTluz/Dv4HHuxmvu2Vx540ZypmVMHUXdXy6GILspuNZq2cUT58
         9qARn/aodfT/V2hJ01444YgY3ktbMpOIgREQ87YBg9dQYlTl3/iRWGrCCKI7p0bc7PEg
         0KpKovq1I0XCeeSrKw8fPR1/is8kKTO0bCm6ynRM37FuzMaSPTnZgRuuDch3JnHz71mF
         MFOgwXOITwRLIy73g/kTkrnt159pSdpg3DF+3jwXa4kqDWGIB3snrxeDJbmwMA5mEfw2
         uEqg==
X-Gm-Message-State: AOAM533grbHceOAbUuQ9iglr4jMSfd/oePh5ItUwpJ/HsPWZVJkrlXtK
        sojlXMuSZJg9Td2MfcZ8wsX3+updbutq4w==
X-Google-Smtp-Source: ABdhPJxowfrDnl+KH9foiTJL0O6eH4XdvarNv4J3ZvxeonUczPHJrAPqzKBvWsX0CujD9D6i1Y9aaQ==
X-Received: by 2002:a02:cbc8:0:b0:314:c010:e941 with SMTP id u8-20020a02cbc8000000b00314c010e941mr15376396jaq.300.1645577283210;
        Tue, 22 Feb 2022 16:48:03 -0800 (PST)
Received: from shuah-tx13.internal ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id z11sm5793152ill.3.2022.02.22.16.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 16:48:02 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     hverkuil@xs4all.nl, helen.fornazier@gmail.com,
        kieran.bingham@ideasonboard.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update media vimc driver maintainers
Date:   Tue, 22 Feb 2022 17:48:01 -0700
Message-Id: <20220223004801.66602-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Based on the dicussion with Hans Verkuil and others in the thread below,
vimc is need of a maintainer. I will start maintaining the driver with
help from Kieran Bingham as the reviewer.

Link: https://lore.kernel.org/linux-media/5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 777cd6fa2b3d..a7b9eccafeb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20383,8 +20383,8 @@ F:	drivers/media/common/videobuf2/*
 F:	include/media/videobuf2-*
 
 VIMC VIRTUAL MEDIA CONTROLLER DRIVER
-M:	Helen Koike <helen.koike@collabora.com>
-R:	Shuah Khan <skhan@linuxfoundation.org>
+M:	Shuah Khan <skhan@linuxfoundation.org>
+R:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
-- 
2.32.0

