Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CCD35B759
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 01:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbhDKXJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 19:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhDKXJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 19:09:05 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E61C061574;
        Sun, 11 Apr 2021 16:08:48 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d8so5358580plh.11;
        Sun, 11 Apr 2021 16:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wN/TG9G/h1Rib/nM5b3cCiO0QpW84CE6hHGXQNR8cI0=;
        b=rh5pqaiUmiUpVeJmVx6En6u1S+YgKkamKuYzF1MdTixXIWLDhlRmTVtpCOIX5Q7as0
         poQUBDJlojAtg+++Tooe8Bte60VpCwP+Cq0aQuF9yilyVKcWcohNjbbhw1/eu09+JKhQ
         /CjW8PE5GV7x84QmOjDY93Z9liw2KdpQdaTW/NsXID7CGmQa5khJxEp+I6L+VwNA6AzP
         ZyNjVAIAsZc+vGKjZgY2vaDXjDpKjXQIKuCzc7NBuiKxEZLI0HyyT+6Bs9VsXmGKmuGe
         WQwO4Wwn7o43QiiX1Oo2ZeEYKGVOIfSH29lsB99BKT0k7fzDlfWpDqGgDueJf88hev2T
         qjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wN/TG9G/h1Rib/nM5b3cCiO0QpW84CE6hHGXQNR8cI0=;
        b=Lk8f/FuGRN58BAnUdZq8JpAWFiOwZQ3wbWlzI/W2T4lGOs9ZsWjy75CCLbXIMccTNJ
         CLe+xD3Vb4qu3kGH0MvO9gXk6hUVLtr6Fp6h+7fUzyrmqbggSjPUN+IODXUqVRXjrCch
         NgcT4M7VsMteN/8wkMaXtrPRxda55yuyiYuMF3j31h4DTOdOUJM6/pKFectaGDuuE+hE
         gylAUDF3erKEw6hQTM98FtVeLI4JPujmIOw9PBjBO4pwJovBPLGM8tP/GhP5e6w3Itx6
         T/DsyEfPnKti4GQh0geUBr+YLb87mo3IDlOc3IYA42EXg48G7/0uAIei+Zc172XPoLBQ
         uwww==
X-Gm-Message-State: AOAM530gRsJdudmY/wojOJUF65n9UbkRtFzCpX+igICzkS6IRYfMm8gF
        VrjihMo82lcPYibcSsrFCLU=
X-Google-Smtp-Source: ABdhPJymHis/Y9hX7OvrhmoCVjkGyW3QqZgye8+yR6XE+Rg1pXiFfxHn7aXzUpmPNwBilOwAOTea7Q==
X-Received: by 2002:a17:902:c407:b029:e7:2272:d12e with SMTP id k7-20020a170902c407b02900e72272d12emr23168759plk.52.1618182528052;
        Sun, 11 Apr 2021 16:08:48 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id v11sm9287352pgg.68.2021.04.11.16.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:08:47 -0700 (PDT)
Date:   Mon, 12 Apr 2021 04:38:39 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 1/6] staging: media: intel-ipu3: replace bit shifts with
 BIT() macro
Message-ID: <cc7b827a3264f08cedb76adddd16a34df48f935f.1618180659.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
This BIT() macro from linux/bitops.h is used to define IPU3_UAPI_GRID_Y_START_EN
and IPU3_UAPI_AWB_RGBS_THR_B_* bitmask.
Use of macro is better and neater. It maintains consistency.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index edd8edda0647..589d5ccee3a7 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -5,6 +5,7 @@
 #define __IPU3_UAPI_H
 
 #include <linux/types.h>
+#include <linux/bitops.h>
 
 /* from /drivers/staging/media/ipu3/include/videodev2.h */
 
@@ -22,11 +23,11 @@
 #define IPU3_UAPI_MAX_BUBBLE_SIZE			10
 
 #define IPU3_UAPI_GRID_START_MASK			((1 << 12) - 1)
-#define IPU3_UAPI_GRID_Y_START_EN			(1 << 15)
+#define IPU3_UAPI_GRID_Y_START_EN			BIT(15)
 
 /* controls generation of meta_data (like FF enable/disable) */
-#define IPU3_UAPI_AWB_RGBS_THR_B_EN			(1 << 14)
-#define IPU3_UAPI_AWB_RGBS_THR_B_INCL_SAT		(1 << 15)
+#define IPU3_UAPI_AWB_RGBS_THR_B_EN			BIT(14)
+#define IPU3_UAPI_AWB_RGBS_THR_B_INCL_SAT		BIT(15)
 
 /**
  * struct ipu3_uapi_grid_config - Grid plane config
-- 
2.30.2

