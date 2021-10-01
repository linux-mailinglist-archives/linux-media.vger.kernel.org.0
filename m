Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE91D41EBD0
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353857AbhJAL11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353601AbhJAL1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:12 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2F5C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:28 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id m14-20020a05600c3b0e00b0030d4dffd04fso1202340wms.3
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m6aY0YpHcXZ+qqrCq04NObneuOCOj6Id6UG/ellzwnU=;
        b=B9X59kj+AFnqGE71dUdCYqiWLG0i4banTRVSEHKFUt8ClCeOxNjUFs6W0mwGHee9lD
         vEVy8f7NtFPYiTBFGJbtwAtvjxr3RCbS2KxNXBMLAa00YpIE7pH46tqHRZkSOY2fhhGS
         yqE5sMCPvzr9wdl/lbPwF+fYHSBQWuv0nSgbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6aY0YpHcXZ+qqrCq04NObneuOCOj6Id6UG/ellzwnU=;
        b=tSIixbgwHcihMGFA/vQLjCUNF0ue7B8unKk9nOeqgO5bjRtQ4Aujdb0rmZI7EJAk4A
         gha8z7wzey4X0bJvnZoT6qmhQlZ26+icY2q9T+5k4nLLT3CWmAFd+Q3FqdQNuTk2MFry
         tFWLAE6qZabIDQ8W1nvE2BphoLs52BHO5WGhjyf/tmbG3wYpIuNt52gD4cYBPJa2VyDa
         uHfLdiEbV7lR8S9Uzr03wFNeJoAdNTgafS5mcFTQkObVpFNp1X0s+e1k6HOQsT47Ye9K
         BKzbt7KBP/juBHjbyVoKO8sm2brP9AGSvHqelHSpAbkR+OaVU/zXXsFqNJPRKBYEOGb9
         tk6Q==
X-Gm-Message-State: AOAM533qm2+LfH/bJItjhi5+IKeBM4A/q75LOYV6dGI0p9ETbL1FVfU2
        wkf/lBRpmYlawfVE7MpESWItsw==
X-Google-Smtp-Source: ABdhPJyal5YSRiB4abcYFdFXMG8KcCztftPsm6A/A2azjSg49Nj3uwCdhtZI2jAbToUK1xeAa4YK6A==
X-Received: by 2002:a05:600c:1553:: with SMTP id f19mr4000273wmg.66.1633087526791;
        Fri, 01 Oct 2021 04:25:26 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:26 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 4/8] media: ipu3-imgu: imgu_fmt: Handle properly try
Date:   Fri,  1 Oct 2021 11:25:18 +0000
Message-Id: <20211001112522.2839602-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211001112522.2839602-1-ribalda@chromium.org>
References: <20211001112522.2839602-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For a try_fmt call, the node noes not need to be enabled.

Fixes v4l2-compliance

fail: v4l2-test-formats.cpp(717): Video Output Multiplanar is valid, but
				  no TRY_FMT was implemented
test VIDIOC_TRY_FMT: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 1813bb29e362b..bf3cd1d576280 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -696,7 +696,7 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 
 		/* CSS expects some format on OUT queue */
 		if (i != IPU3_CSS_QUEUE_OUT &&
-		    !imgu_pipe->nodes[inode].enabled) {
+		    !imgu_pipe->nodes[inode].enabled && !try) {
 			fmts[i] = NULL;
 			continue;
 		}
-- 
2.33.0.800.g4c38ced690-goog

