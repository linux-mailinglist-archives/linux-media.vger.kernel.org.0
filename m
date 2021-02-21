Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8DE320A38
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 13:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhBUMNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 07:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBUMND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 07:13:03 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56061C061786;
        Sun, 21 Feb 2021 04:12:21 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id q14so47239508ljp.4;
        Sun, 21 Feb 2021 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AFrIx7saRiKChL+GBKdte021u7jJCLE/loYJ5cq9bic=;
        b=ZWL2i2nTyP0l2+87Cd3+Y0f+F6MyhfAP/+jneHxIiV2Ncpx9ByFaZmSva4XylP6YG2
         ufL4/UKrSc4hP8ZE+BHJG4mPyLV8BUyFzlG5cyaUlDKM21SKndnSFG38HY4lrCxXpTLX
         Vn14JpB8fSEM/HDHk92Ytb/0QQwmxiGmkL8EPYOAeNe/e4qF/cG0Ae0ObtmTbEE4zLgV
         dSWhL0fbNV4GyaZjDdANI/31/o+V8eM1PHiQHbD3Nr5Wrb3Dzy/0zVk+JeyH8RQRXNce
         aA3yfAxu8cuX5QZFm94qizlR8Jy8ys78az0URuXvrObtfuhNMKb7EVYXbZQSwnQ6KxlS
         CG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AFrIx7saRiKChL+GBKdte021u7jJCLE/loYJ5cq9bic=;
        b=VQPGA1aKDuNBZNsPKERBP4nCOHoPRAmKRgCVMoB1PWBt8bZzcC6vc3OgPkb6pTxUSQ
         JQHpRNXyXjMoeXBxc9ZtKnKAPH7t04Ut866fRHQAUoc8G0IPGmfsQkB9iS8gKOB1xpJp
         3ZqzQPyJfaZYvUcb2mfGVwrt39L10bvz8OH8izKJni//PFALUF12r/R9CYp2/FslNsX6
         m7cbdR0O6GwTjmipR5/8OiyWm1BuNpUuxlcJaJQGwEmtCguSX5HVSAuuzOO79EOSBclD
         shvO9dPVNEVD8aFPSZHSJCBm7Wbjk1OQiadQ3TFdyIVBQC83VfSMuVbJrGOqQrn502YF
         k75A==
X-Gm-Message-State: AOAM530bbtx5SV16Lyhz5XOnvSVC4/jqSoXnYBbF53RuatSSJybsvJ89
        tKbmMjgoYqEYZhRzp8GEhnM=
X-Google-Smtp-Source: ABdhPJyTJpgyQhyPQfHTG4obq4iNGUrC4g3+srKXwR1EwCNqwUKC8Bf5uJayFjX93bT9OskUeLrUqg==
X-Received: by 2002:a19:3c4:: with SMTP id 187mr11444074lfd.458.1613909539918;
        Sun, 21 Feb 2021 04:12:19 -0800 (PST)
Received: from msi.localdomain (vmpool.ut.mephi.ru. [85.143.112.90])
        by smtp.gmail.com with ESMTPSA id 12sm668214lfq.229.2021.02.21.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 04:12:19 -0800 (PST)
From:   Nikolay Kyx <knv418@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nikolay Kyx <knv418@gmail.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: ipu3: code style fix - avoid multiple line dereference
Date:   Sun, 21 Feb 2021 15:10:20 +0300
Message-Id: <20210221121020.1501-1-knv418@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <YDIX3Q0U8/PcVWgN@kroah.com>
References: <YDIX3Q0U8/PcVWgN@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the following checkpatch.pl warning:

WARNING: Avoid multiple line dereference

in file ipu3-css.c

Signed-off-by: Nikolay Kyx <knv418@gmail.com>
---

Additionally some style warnings remain valid here and could be fixed by
another patch.

v2: Removed second part of patch which fixes non-existent problem

 drivers/staging/media/ipu3/ipu3-css.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 608dcacf12b2..29894ee566c1 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1206,14 +1206,14 @@ static int imgu_css_binary_preallocate(struct imgu_css *css, unsigned int pipe)
 
 	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
 		if (!imgu_dmamap_alloc(imgu,
-				       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].
-				       mem[i], CSS_BDS_SIZE))
+				       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_REF].mem[i],
+				       CSS_BDS_SIZE))
 			goto out_of_memory;
 
 	for (i = 0; i < IPU3_CSS_AUX_FRAMES; i++)
 		if (!imgu_dmamap_alloc(imgu,
-				       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].
-				       mem[i], CSS_GDC_SIZE))
+				       &css_pipe->aux_frames[IPU3_CSS_AUX_FRAME_TNR].mem[i],
+				       CSS_GDC_SIZE))
 			goto out_of_memory;
 
 	return 0;
@@ -1441,13 +1441,11 @@ static int imgu_css_map_init(struct imgu_css *css, unsigned int pipe)
 	for (p = 0; p < IPU3_CSS_PIPE_ID_NUM; p++)
 		for (i = 0; i < IMGU_ABI_MAX_STAGES; i++) {
 			if (!imgu_dmamap_alloc(imgu,
-					       &css_pipe->
-					       xmem_sp_stage_ptrs[p][i],
+					       &css_pipe->xmem_sp_stage_ptrs[p][i],
 					       sizeof(struct imgu_abi_sp_stage)))
 				return -ENOMEM;
 			if (!imgu_dmamap_alloc(imgu,
-					       &css_pipe->
-					       xmem_isp_stage_ptrs[p][i],
+					       &css_pipe->xmem_isp_stage_ptrs[p][i],
 					       sizeof(struct imgu_abi_isp_stage)))
 				return -ENOMEM;
 		}
-- 
2.30.1

