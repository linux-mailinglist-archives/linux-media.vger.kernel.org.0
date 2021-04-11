Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF53135B761
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 01:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbhDKXKZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 19:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhDKXKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 19:10:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9F9C061574;
        Sun, 11 Apr 2021 16:10:07 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id b17so7944598pgh.7;
        Sun, 11 Apr 2021 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uNZYWgEVoAuUntavroH02XS3fbZ6zaZUx6Qay4mZmPA=;
        b=bm075u2/6bp5bVTyE82skZrkF1AOKjM+JqwEDKDedP5L33qOMv0ZLYxIGzTQoBjblx
         pF2Ps7cEWAsuWuambPeMut8Ntx8AoPeqMNLZB57bTQibajGanlXSchky9OuZOecRHFv+
         bWRl/aT5qhXk72bOVNoPvO421tr/Nxo+4qRkTInOZEUQX4tTceaNXnrmMJdKruFBTEVv
         mUjeIoN7zFBLDgKNq7danLE0aD1rRSONXNieWzjTh4bzyeLrpQCD14YOKQC4jwN1q43F
         4/Z8zy15zokhw+SSrgIIbO3wh7LS2XKkP2p4Fqf/lm7d007K7CBmrVT88GxSlNfQcV+x
         wfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uNZYWgEVoAuUntavroH02XS3fbZ6zaZUx6Qay4mZmPA=;
        b=OYZSscwzpYNfW72DLZsBzz/cgtjRLMzGAwvk6hdNLQy7mxFX5FwahjQIBlz+UpEKHQ
         ukhN0LGVZmsEgIHgzyfbZmfmR7pR7mWNdPB7tot+lQ9KlAbOtMcOL4vpyjkpwut/dy5B
         PRG9EtYB0yaR/DKjpCRavOyVahzhYQeUgkszORBT1Be5bcUxctqIU6Pw+Bknv6diEy6I
         MepXBdlkE8yfnifl4na/SizrZOIm9YSq/qbUya3ivvfoJXpK2nP/i2s9Pn/BAaxqTjks
         /qOnFX5c01E1+evNYpx5YNo6OIKnLxvxIZGSZ23jl0Qf8Jto0pbff5Qs3S/BYIDXbIII
         3SPA==
X-Gm-Message-State: AOAM530K9L0/7tgN8NCtPoYTcUEYHt1LjIr047les7NlFGaalVcS7JOC
        933ctChJ7LVLJOwh51HgTdU=
X-Google-Smtp-Source: ABdhPJywa3sKuTUwqu9f1bZGYbNYxlQ1tZ7AJDcS5PT2vWiwYTUDUlxxKPh04pcn7LipL9fHPEGf2Q==
X-Received: by 2002:a63:5004:: with SMTP id e4mr23507889pgb.61.1618182607156;
        Sun, 11 Apr 2021 16:10:07 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id q5sm7696619pfj.131.2021.04.11.16.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:10:06 -0700 (PDT)
Date:   Mon, 12 Apr 2021 04:39:58 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 5/6] staging: media: intel-ipu3: line should not end with '['
Message-ID: <7514b0a9f6b0ce736de3c9d13ae2629d9e67f04c.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixed the issue of line should not end with '[' by moving arguments
from next line to line ending with '['
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 53f8e5dec8f5..0451f8b7ba4f 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -246,8 +246,7 @@ struct ipu3_uapi_ae_ccm {
  */
 struct ipu3_uapi_ae_config {
 	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
-	struct ipu3_uapi_ae_weight_elem weights[
-			IPU3_UAPI_AE_WEIGHTS] __aligned(32);
+	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
 	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
 } __packed;
 
-- 
2.30.2

