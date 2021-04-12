Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5586835C7DD
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 15:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241513AbhDLNni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 09:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237043AbhDLNni (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 09:43:38 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0341CC061574;
        Mon, 12 Apr 2021 06:43:20 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so8748501wmk.4;
        Mon, 12 Apr 2021 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NycMU0cz3kJfBn80ZlCBYweE/JLtLsmBXUcJn2/DB0g=;
        b=ZSNuqAESESzRNHrvcezSyPa8BAQkVixnafp2tzGO0dkZJ1EEUb8Wl/KCJX7e6j4jCG
         cKHd+NpbLjIZNNPbMqA7rW0fd4C+Ojc7tUQiSjdY3aB6WaklUf5Lvjxvp33rObgYMZfo
         KH33N3HrMQ1jwSbupofwA1/GhJdtsFAQpK17Psf3rNAM482IAXLbwwmBWeIsC7auKjBN
         VWa4ltBhdfq6cEpNWW4v282jdZlgnyU/tjK2oiebHrnRHnIomET3eSPKFhk+3bPo56rc
         aqai6Mo7EK7wJYm7qRijOAPLm36+oHlOSMvur3bltweo72qIP2meJR+HvR8IHI/GrMjC
         sqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NycMU0cz3kJfBn80ZlCBYweE/JLtLsmBXUcJn2/DB0g=;
        b=MsbhDWBGcp31DBvDhM3mfYgiMtJcdrvfdhWnTHKCqr99DNIXudCBQnIFtCEXgRFViE
         mmo2k+W6jkjDpEwmaBPfQJYXH4KLlidmnQpiR1y+UTBWne9TZXUc9DhM9JDmC28w/wsP
         SboWH7Wc8tY9PX6ROi/04O9Pv0H4ghIXXTR6IacA1ve68/B9/4EVvUXxfIrQyKDkgFIi
         y1cBUatvFBI3+PnOQn2T0iXHgJTtOCqtoneWfKdRDNWum/8/CxhgQmV+Zim0p8xNLWQV
         YuMZpYuPoweJgLBvVeKgAQhwG6pGebzgDJdveuzGJRzRchfFAb9qCnIuYKaNu7nnk4ET
         fFqA==
X-Gm-Message-State: AOAM531tPEGOn2LuDgfOExro5gltUTSL/Pgdh1lL79rRhLa21nvFZznB
        YFObYiOch1/xcQ1uHi/rnsZXeA8lPRS/3g==
X-Google-Smtp-Source: ABdhPJwcSkVXUE7+Gw9X9xA2TbXb4xDJcYCcBeUJDeOR+rci23+7/1ux6sGk/mjaEAZajumf+kFwVg==
X-Received: by 2002:a05:600c:4f13:: with SMTP id l19mr25592568wmq.89.1618234998788;
        Mon, 12 Apr 2021 06:43:18 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:813f:b20e:675a:834d])
        by smtp.gmail.com with ESMTPSA id f6sm9313922wmf.28.2021.04.12.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:43:18 -0700 (PDT)
From:   Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To:     hverkuil@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Cc:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: [PATCH] staging: media: atomisp: i2c: align line break to match with open parenthesis
Date:   Mon, 12 Apr 2021 14:43:01 +0100
Message-Id: <20210412134301.11587-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligns line break with the remaining function arguments
to the open parenthesis.
Issue found by checkpatch in file atomisp-gc2235.c

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 78147ffb6099..6ba4a8adff7c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc2235_write_ctrl *ctrl,
-	const struct gc2235_reg *next)
+					     struct gc2235_write_ctrl *ctrl,
+					     const struct gc2235_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
-- 
2.25.1

