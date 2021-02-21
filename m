Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A72632092A
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 09:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhBUIP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 03:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhBUIP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 03:15:26 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088B0C061574;
        Sun, 21 Feb 2021 00:14:45 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id r23so45994567ljh.1;
        Sun, 21 Feb 2021 00:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=omSK3Wv8CLTzZ0RWUacCaYkDOrrrQPEaU7VS1xwPWUs=;
        b=QodoUXZZOJUaKeQBnJIMoD/+FTjXWtbQv3ac60eXy0LS3O+9JJ01yEaiFfp9VMpMoU
         hKwkWWSaF+0vtJRvWMVfjANWxLiPDpGW2UIlLxO9rcSs/zHZsICPlQhjiFT6K4CjByl+
         tX0kQc46HOMwgL2IBvTGr6/rqH5kNWZlQWi17cqcDf+mjALU+j6vjZgl8tEAOlpK1WPi
         o1bD6YaXbQ8ssm/Ivd0V2XtE1oxpMq0QZ79G/56kwZ+dM7nautXITZfqoN12yn+Hg60n
         01FqfeoZtmA7WRhKMgATiQ6GUvAbEFinPbiiQYiXbaokcHkOgIJqMErwz6ZdWIXFeqGS
         0Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=omSK3Wv8CLTzZ0RWUacCaYkDOrrrQPEaU7VS1xwPWUs=;
        b=GQ4IDeM0bgh7M0PrrYoXnholsjUFaD81+Qv2nJCLtmrEspeMErMZX+9N4R12TwS9A2
         smsoWy7OI8sqeEaDjLOYrvahr7Zz8aPuEvnZ2RU6OZT+MYDKXR/VWuS8e0UVCzzVV8gE
         52XQK7eNupKrwAJUsUfnQfQ6R6D99KQveg+LW3ZO6eOrdO/6W4OAMYeyMrSM2pvwNBXs
         3nQfsmiEp+zITxYiFxwxo8aB9tSQcmbASgb/uC48jpk8nsBLlWPA9jHsw8c1WVOnZ/KX
         z5Fh6L2eICJL7dLy1Fhwe3hndVPgFce1BjnqRcDPiSRgraKLJ5xdm3vIzd1W3Uwj5xUo
         ewJQ==
X-Gm-Message-State: AOAM531DIdCfXxdecWr/+mj3pGeY8kvjOpR1FEMTdjfGhhjMQ0GdtTDg
        UsG4OmbV8AbvSEv0gpG1fPc=
X-Google-Smtp-Source: ABdhPJzhT4kDA9h0H9wCM8lqQCocXqkJ33Y+END+QndP1c1uy4/vgDR3jCBfYcMcdnm2UjWoEvBuwg==
X-Received: by 2002:ac2:5e3a:: with SMTP id o26mr2281207lfg.469.1613895283527;
        Sun, 21 Feb 2021 00:14:43 -0800 (PST)
Received: from msi.localdomain (vmpool.ut.mephi.ru. [85.143.112.90])
        by smtp.gmail.com with ESMTPSA id x75sm1479093lff.91.2021.02.21.00.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 00:14:43 -0800 (PST)
From:   Nikolay Kyx <knv418@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nikolay Kyx <knv418@gmail.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: media: ipu3: code style fix - avoid multiple line dereference
Date:   Sun, 21 Feb 2021 11:12:35 +0300
Message-Id: <20210221081236.9758-1-knv418@gmail.com>
X-Mailer: git-send-email 2.30.1
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

