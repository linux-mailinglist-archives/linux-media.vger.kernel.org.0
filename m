Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662C935D6F9
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 07:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243404AbhDMFQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 01:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhDMFQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 01:16:14 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8E6C061574;
        Mon, 12 Apr 2021 22:15:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso3071446pjg.2;
        Mon, 12 Apr 2021 22:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2G4Sv3LtujgUMx6LivaQKJ/nSswqoSp68oTOL36KfQ0=;
        b=SbpjChqFW20CKXahZ4POV1UtDvN7EZHMcmjhnHloxYsyR9lJ3s8QXqewGgXPFGTcKg
         +0B9v1kXbFTIae1pT4fHRcvXs4MS4eujiUV4EsTbVtmvbsGQ65OWuvgr9FtahOrEJnbC
         yzp41Uclbm1fFxCh1sZov1+durPRBitaXYMna7CSlenHsftbO1k/vU6AqULm3VyOIBi4
         esUBbj91i9MiaGAxcsdtI1K+a/5LbAEbD2PI0E4Vaem062urKOYMjevZY2RXrJ8skcjl
         5r///uzZvmhm5aunneiZHzMHljieZWEe2/mvkKN1RUC1h+vX7dsl4C/9U6yUl2G8s9m3
         7MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2G4Sv3LtujgUMx6LivaQKJ/nSswqoSp68oTOL36KfQ0=;
        b=lfjaCnA8HkzTL66ru77QWjIfo1c2ucIQmPckdbSqsrB5pB5AWoNkoVWY+PR8Bd1zYS
         AM7ueB4+30lby6/nIbmijjatcdrk9SvAOIh6o9IeZTd63ZDPU9irHfJFVVmtYAmL0J/Z
         U2XVNpHPZDd2YyqMXjnrxSz6S8SOf7mioBluQHhoeMteSoS5T7V9s34aY4MdoDIz1PtN
         TNFu540ZyA8Yr5f5UjJQl2tiarV1HQPxnmS5Mli5zvWibDJsb52eniqnaDVBgXW/dUCb
         m8UbPrcK8yArMWT89lqsb94MjuQNXvU38CBS9Fu9vAFmn4dg9BfO/elE3qpTr9TOz1t3
         XR+g==
X-Gm-Message-State: AOAM532otbVgi3NIZuAvve3tVAoan1iqyNISt+5L7mv8nwrMPxSBvyyW
        rkp938SEGZRQ75LJWBoHw7c=
X-Google-Smtp-Source: ABdhPJwoufieI9ztKXZhb4CBfUZbEHz9dA2hQ2t84hQOzdQtm3BMRBsq/rlzV34tIcmsBgEBPXjdFQ==
X-Received: by 2002:a17:90b:a0c:: with SMTP id gg12mr2889193pjb.184.1618290955215;
        Mon, 12 Apr 2021 22:15:55 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id 19sm1833627pfy.77.2021.04.12.22.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:15:54 -0700 (PDT)
Date:   Tue, 13 Apr 2021 10:45:46 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2 2/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <a374da6b8cce637dea5a2f2677b70abbd9a87118.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduced length of line as it was exceeding 100 characters by removing
comments from same line and adding it to previous line. This makes code
neater, and meets linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 335522e7fc08..53f8e5dec8f5 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -10,8 +10,10 @@
 /* from /drivers/staging/media/ipu3/include/videodev2.h */
 
 /* Vendor specific - used for IPU3 camera sub-system */
-#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p') /* IPU3 processing parameters */
-#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's') /* IPU3 3A statistics */
+/* IPU3 processing parameters */
+#define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p')
+/* IPU3 3A statistics */
+#define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's')
 
 /* from include/uapi/linux/v4l2-controls.h */
 #define V4L2_CID_INTEL_IPU3_BASE	(V4L2_CID_USER_BASE + 0x10c0)
-- 
2.30.2

