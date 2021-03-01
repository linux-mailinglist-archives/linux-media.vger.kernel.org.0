Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C6C32A829
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244796AbhCBRNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239630AbhCBAGE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 19:06:04 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55B2C061788
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 15:55:18 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id t9so658833pjl.5
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 15:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ml54oXLIB5Mp9Ylqx0Fhn+McHeW+ZcUXEybqqU9Jjw=;
        b=Aa+tkRjV9izM9VtQwM6MC1sB3qdyNqD0pN3HzoMMk5G23bfGCGVFf9x+Klfj3w8TaX
         tbpwkOKzfMB+FBNfD97kxyAejLcwGO6HLAqDoUBAl6EcrGcI2pCHCzOSSt53Gj4xgtmN
         L52cYE1YRCgDv+ib2c2bdBSwsgdmjhSV4t2YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ml54oXLIB5Mp9Ylqx0Fhn+McHeW+ZcUXEybqqU9Jjw=;
        b=pDSw0KQu8md2lKaYN0LemXfyRkkz4PwfkxKhbA3dxePnLmc8JAo9+IKXw7xpnsHVsE
         x4uBcXa//nyvqDd1YMBjid0mkVuovmttVpjRo3eD5c1b0kySMSzZ9o/fuqrsMYbDV0Dm
         YLYnCb3ZNZK4Cs2Ovqj234pU2it8vh8zjeGY3TwJ89Wkc7q0v6oi7g0FD0O+/gs9MKtg
         Vo6f4u8oHLQtP4Dy9/UFmMulkZJK3Z/Fg0cL368Md9UQvVCw/sAIJolVyx3HBOy4uCMZ
         X1GebgRo2DKniDeljDFDc7oyi4cCzRO3EhibS8aQCiky0h6v7GNO8mXYDZ9cvcoLv93v
         +94w==
X-Gm-Message-State: AOAM5339V+99Y1e1CZkXwk3+k6D2NZR+OZUlUknLjE1vDPzwGtOROwvb
        InZTVM3k2TuuKcd6Bj3/uJUTY+qtIgv9fA==
X-Google-Smtp-Source: ABdhPJxggwAq8wUf+PP2CndsGT20aoTm0pLLoho94XqMp80Er1oRvjoNf4a2fR3dj3t4nV6wPFYhRg==
X-Received: by 2002:a17:902:ea01:b029:e4:1caa:d200 with SMTP id s1-20020a170902ea01b02900e41caad200mr930235plg.73.1614642917874;
        Mon, 01 Mar 2021 15:55:17 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id d16sm12821434pfq.203.2021.03.01.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:55:17 -0800 (PST)
From:   Wren Turkal <wt@penguintechs.org>
To:     linux-media@vger.kernel.org
Cc:     Wren Turkal <wt@penguintechs.org>
Subject: [PATCH] Make V4L2_MEM2MEM_DEV manually selectable.
Date:   Mon,  1 Mar 2021 15:52:16 -0800
Message-Id: <20210301235216.81150-1-wt@penguintechs.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_MEM2MEM_DEV config item enables the mem2mem framework
in the v4l2 core code. This framework is used by mem2mem drivers.
I would like to be able to turn this feature on in order to
expose the related symbols so that I can work on a module that
is not yet ready to be submitted for inclusion itself.

Signed-off-by: Wren Turkal <wt@penguintechs.org>
---
 drivers/media/v4l2-core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index bf49f83cb86f..25004137a982 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -54,7 +54,7 @@ config V4L2_H264
 
 # Used by drivers that need v4l2-mem2mem.ko
 config V4L2_MEM2MEM_DEV
-	tristate
+	tristate "V4L2 mem2mem framework support"
 	depends on VIDEOBUF2_CORE
 
 # Used by LED subsystem flash drivers
-- 
2.30.1

