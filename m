Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407B923AFB4
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 23:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgHCVjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 17:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgHCVjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 17:39:32 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33FEC06174A
        for <linux-media@vger.kernel.org>; Mon,  3 Aug 2020 14:39:32 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id bh1so8583559plb.12
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2020 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Idnk/4GEQXsP3LM6LzeeKBFll8PuJ7Mz1mR+T4OPl3M=;
        b=i3wIuKm6SCSCJD0un3ULscA7VVUdHB6ppMvfmr2/QusGAts3bkMBE4goxevo2vdoml
         gMOClwx8zqylIUVrJXzMGuHkd785R4m1X4+P8qe6vQ/9qZV0mzmDYj+8qlXa2YTKL7uR
         /Azk3HSZA871nEGvgc5Ph+nos0/lfH2QWrhxCR/aNfj5qyhUcBjxTRvSqzSmkhEbSfkq
         G9PNIxGqddviMI+IvVl5cW1uVGE5TfYzgP6agnrCENeVRO+Nd+pAmkZJ5yaM7r+9G6BY
         /jdgTE4ZTPCwMbWEht5nIYMf4A7DDiF6Ru6OMsp08BY2Xy2DIKCOdb6Meu5ZXkhEJheb
         b25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Idnk/4GEQXsP3LM6LzeeKBFll8PuJ7Mz1mR+T4OPl3M=;
        b=ahRMbKtO1Zo+Ur41e1UaV0e75r21FyH+H8BeSvgU2CClCOP1YsHBxVfjq1o7DEGNpb
         NPFriLQgJ635jj0Ud/yZClFBMICpACxDrpFWqPkiLEcEyl6DMQ7YD/1SR69imukdVahB
         uQnjdgtuTMcwfuEGdn9KSToRj6Zhw/hiuJxaBfwThAphsAyLM3gsPdjGXye2H8dFKXp6
         ISxoNMKG4M3MY+cT0P+eoh1CkxS2oMVPAmk9NvmKpbMvm1n3CcJyN69R5dIP/yh3Qak9
         Eel7NywWq+lxo33wtDTE+73C3Y8wZooXpm2AWZW6cQG0fr06L06tpIH7aGZo1eCxTfom
         AxJQ==
X-Gm-Message-State: AOAM533SK0lR+VmgSDMg62tiTY3ZutQ+9ONS8cDL/mwVKHdEcOKumbZv
        7lhOhCJQIFQEJ+z6MD/GrFYSO0nnNCc=
X-Google-Smtp-Source: ABdhPJxASPRQSGhi97YhdMghIrvCndiHu7aX8KuXAOfOc2Dtlb/qjzSLk1IpOkMHoCEwlWLsi4xNvw==
X-Received: by 2002:a17:902:b686:: with SMTP id c6mr3389687pls.133.1596490771790;
        Mon, 03 Aug 2020 14:39:31 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id j5sm21285854pfg.80.2020.08.03.14.39.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 14:39:30 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCHv2] fix GCC enum warning
Date:   Mon,  3 Aug 2020 14:39:29 -0700
Message-Id: <20200803213929.34616-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wenum-compare

../utils/common/v4l-helpers.h:880:36: warning: enumerated and
non-enumerated type in conditional expression [-Wextra]
  880 |  return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: Added warning message.
 utils/common/v4l-helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index e093e717..edd21c16 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -877,7 +877,7 @@ v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
 {
 	unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);
 
-	return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
+	return hsv_enc < V4L2_HSV_ENC_180 ? unsigned(V4L2_HSV_ENC_180) : hsv_enc;
 }
 
 static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
-- 
2.26.2

