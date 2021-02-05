Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BDA3107C7
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 10:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhBEJZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 04:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhBEJWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 04:22:12 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106E5C061786;
        Fri,  5 Feb 2021 01:21:32 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id w11so3092677qvz.12;
        Fri, 05 Feb 2021 01:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7fgwypp4YPR553ca/WI+V8jkPwnVoWzOdVAmQVNAJ4=;
        b=SLxlenj3qh6XUadPrXruXWQHSxYcAwnujUe/KB5fbjI8+BfelE60wAvUyZpnPU9rwb
         xPIIKwhOTUlxiOACLECfkDXCP30BIhLT60oDwbx/agA9qGLfzqgac4DGEqOMUGjftIDI
         gn2gIcpFn6NWY2rKkaS2X+ookgFJ/DjogAyLTrfJDOTn3mi3Qu72sTW8iIgHHM0MfY0W
         Oq113UYQGFk/O8/g09NhOY0zHxYQesGq7QmSJDtEOS/aDJ8HMn6LzVlHTrlDsm1Tj5OK
         J1csX7TdgINEJlwxEnwK859xJVobVjCd6BGtHg0bCg8yKp9TfrOuyYDNSHU8yxKZUbHm
         RDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7fgwypp4YPR553ca/WI+V8jkPwnVoWzOdVAmQVNAJ4=;
        b=YiZWXeI3VkD1KE6FcqIqtHrWstEiB/nlSvIEG6sjoWBrxEmldxTXHC/7sYYMiiTVw5
         HNTK7v41zmCCemSCEEvNm1HyQSg0pqutPX4VEenQPltB486BNZYDXo9uXVLkMogQcczh
         NsjwdzymalTgKUHQDOb6wCjcn1KYwPMiP3zY+0h8i2vwjr3i/zo06oJr+ghavqbk/z1H
         9AsLvVkfniJZ/6F1ewQb6E07Wgol+xes9JDusm5oMJN6uYBv37DOCPbv8/v2KL5m2ijB
         rOyvSnmrjpvo3UeGwPSpfLCcusiXbp/sbiWoVGmjs4BU1G4qhB7k5foYkqst5CsbSkDF
         kodA==
X-Gm-Message-State: AOAM533imlVUFTSkVoRFO6rftR5TgqCjfDAPU4APIzBsZN/0eFzI9xRL
        o43ZWZYiqFzX0YB/0qVGZ+8=
X-Google-Smtp-Source: ABdhPJwhpIvyUYniT+6ai0YzH9d0y2S7HEGc/+kYw2hgTPFqMQc194Y8y6X06YWj1bO9cTq4AkfxZQ==
X-Received: by 2002:a0c:b66c:: with SMTP id q44mr3329930qvf.3.1612516891334;
        Fri, 05 Feb 2021 01:21:31 -0800 (PST)
Received: from localhost.localdomain ([156.146.36.157])
        by smtp.gmail.com with ESMTPSA id r4sm8309032qkf.112.2021.02.05.01.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 01:21:30 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     prabhakar.csengg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] include: media: davinci: Fixed up few trivial spellings in the file isif.h
Date:   Fri,  5 Feb 2021 14:51:17 +0530
Message-Id: <20210205092117.551317-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Several spelling fixes throughout the file.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 include/media/davinci/isif.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/media/davinci/isif.h b/include/media/davinci/isif.h
index e66589c4022d..8369acd26e7e 100644
--- a/include/media/davinci/isif.h
+++ b/include/media/davinci/isif.h
@@ -177,7 +177,7 @@ struct isif_black_clamp {
 	 * 1 - clamp value calculated separately for all colors
 	 */
 	__u8 bc_mode_color;
-	/* Vrtical start position for bc subtraction */
+	/* Vertical start position for bc subtraction */
 	__u16 vert_start_sub;
 	/* Black clamp for horizontal direction */
 	struct isif_horz_bclamp horz;
@@ -193,7 +193,7 @@ struct isif_color_space_conv {
 	/* Enable color space conversion */
 	__u8 en;
 	/*
-	 * csc coeffient table. S8Q5, M00 at index 0, M01 at index 1, and
+	 * csc coefficient table. S8Q5, M00 at index 0, M01 at index 1, and
 	 * so forth
 	 */
 	struct isif_float_8 coeff[ISIF_CSC_NUM_COEFF];
@@ -340,7 +340,7 @@ struct isif_data_formatter {
 };

 struct isif_df_csc {
-	/* Color Space Conversion confguration, 0 - csc, 1 - df */
+	/* Color Space Conversion configuration, 0 - csc, 1 - df */
 	__u8 df_or_csc;
 	/* csc configuration valid if df_or_csc is 0 */
 	struct isif_color_space_conv csc;
@@ -406,7 +406,7 @@ struct isif_config_params_raw {
 	struct isif_linearize linearize;
 	/* Data formatter or CSC */
 	struct isif_df_csc df_csc;
-	/* Defect Pixel Correction (DFC) confguration */
+	/* Defect Pixel Correction (DFC) configuration */
 	struct isif_dfc dfc;
 	/* Black/Digital Clamp configuration */
 	struct isif_black_clamp bclamp;
--
2.30.0

