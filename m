Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6EF359D8D
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhDILka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhDILka (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 07:40:30 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74D2C061760;
        Fri,  9 Apr 2021 04:40:17 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y16so4049497pfc.5;
        Fri, 09 Apr 2021 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NZw4NFmYLCrGc5aV3J0vJb8Lp57C7Yd+gPIf9yWrJX0=;
        b=eHmec72RD9J7Z1L5wZrwKZs3r+i0WFgJUIpnEX2+tnXsZOV/reXykSNlnDAGFb/eAP
         LEq/nBwdvZ6iwVZ5iqRnRLGYRIWPDREUUL5ZvTnc9PpYQyPGH3IRbzls8lvr4W2X0DCw
         ncSxPrAfTnvwVW4Oa1nJeFZPiSnuyM+0qLH2+GH9Cxvk5zxdZAZhJEAP1+OAoWJoSv3T
         PSt6LFTi3+lZYKTjbo4Zn1AmZFGvQpUMDcu/dl2f9HbAJk+TTDn0Jb9qMxKTatLQTx+3
         VCMX+QMh0v3GBTisnuZX4K37zbD00vz9AUoD/3UdxAT35Ze4RQfV1Qv5W6PdASsc0Jcx
         /C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NZw4NFmYLCrGc5aV3J0vJb8Lp57C7Yd+gPIf9yWrJX0=;
        b=dTIwf39s9RyVlIvDMVT89YRhoAzl7XXDgxPxkCpy1ZrXmaHlM42wLaDQCKLwhtA9UD
         I3Teak2F8OwsyPrc4NpvwS0DcSpEt1Qvrr+oT/iDlX0+zfyHDX1CxWTzsgPFpf482CUo
         FkeVpPHugEO9xoAWroLXEG3hqa+IjUK1RDd/kUqpmXTGL+5y4I989qlX16bNSqhfQ2iN
         Y+V0naFfeYm8ljE31ByjSMmniLeSOgdg6sVRsdYSlB/hWjQPAC6Zm5NOfvU+ZXzKeC8E
         n3/kVL9PFoPHFi6CfeyDSkvOuV+DFvkZUl6TKMrASFkDQzGx9BUUdNw77PTUqag3NsCG
         cgeQ==
X-Gm-Message-State: AOAM530LjhPstsF5omSScJeDUbVf+LlUN6He3GFQrQg4Oo+lkal+7peA
        zly5912Za26pO/xymklv4m8=
X-Google-Smtp-Source: ABdhPJx5qyws6Y/1T974jp6ZSCO3rIFu8BMgmrh5UdAUROkXUumKDO2jM64MR6idWYX1iN8STLCP/A==
X-Received: by 2002:a63:30c1:: with SMTP id w184mr12534931pgw.230.1617968417154;
        Fri, 09 Apr 2021 04:40:17 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id e6sm2573864pgh.17.2021.04.09.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:40:16 -0700 (PDT)
Date:   Fri, 9 Apr 2021 17:10:10 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2] staging: media: zoran: moved statement to next line with
 '*'
Message-ID: <YHA9Gsc2pmmtmlNA@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moved the statement to next line and added '*' before it to meet
linux kernel coding style for long(multi-line) comments.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- made style changes according to linux kernel coding style
for long comments.

drivers/staging/media/zoran/zr36060.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 035634fc1c6d..8c6f4d792a9d 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -249,7 +249,8 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* SOF (start of frame) segment depends on width,
+/*
+ * SOF (start of frame) segment depends on width,
  * height and sampling ratio of each color component
  */
 static int zr36060_set_sof(struct zr36060 *ptr)
-- 
2.30.2

