Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A58232FA6F
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 13:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhCFMLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 07:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCFMLL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 07:11:11 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE67C06174A;
        Sat,  6 Mar 2021 04:11:11 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id o38so3194070pgm.9;
        Sat, 06 Mar 2021 04:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BVyrDkDYNfdYuIzuJBagkTAPrMEkMX8z2zUgIheSJaU=;
        b=ASAXRCI+vRWIwdq9xkZXcMsd99MrrgfVm4z+J5v8l6sF87zpwZB019+nwVXr53ewgt
         eX2fm/lft4j7MxtjfjEZOTmdJDfLPOgphMZu/bDs0NLEYgaZnxqO98QA1sizq3ucwUEi
         bNXwuZf0DgkxXN0Gb6XpQq6LWikcJvT7MwsT9tdAddNITrPEFb6UWz3Y4fjCSkBbVMYT
         yh31V7MMgBzz9jYnDkjhwNWsgarWra3ehNufqdDVFZztKExeWQPBdPSyclhyow+qLmpr
         Jum8yEmL8TYfG/xcUfdqjNTcM5s+/I62LMbqjkOE/9LD7T64/0+xmBMAMPFDAenK/22y
         hyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BVyrDkDYNfdYuIzuJBagkTAPrMEkMX8z2zUgIheSJaU=;
        b=JkZOT5zdDpiwuyQXyvb1Y1bZ1W6sA6nOIfG1Mhp1flH+X6kV8YrZHeR/V3fuWqtQkz
         3BJke8XtPuiM+JNJ4TTsawesgJWtpUoxmxLcb62j5c+wbwGMunW0WD7Kk9YY7PBwNE05
         fTXervWWMN2rGJR92U+tOcrEmvb8ufV/VIFgmO2Dfhb/QSe1FbVFG38JFf4Sq/+hNWs0
         9hFspAk4xZ6mAH3XGKUJ5lWgFmiTasRbrqFDygAkScX9jeEe4D7JnJcVlPCHIhm1MCbF
         JiSEBBqxyoGL6/jqaM6X8CIm8sAzoPTrbD8jGvlEtWdsvAPSci9jlz9tIahqzM8smQll
         OAdg==
X-Gm-Message-State: AOAM531skk78mOswmeRib78tiizKUw6FC7OQrd+d7gZHb0MJKa/Lnvvh
        GwhKLkq5AZ/TQZscUnPrfps=
X-Google-Smtp-Source: ABdhPJyAt3pUMHH9D43EtcoFrV+BCXDQyqG82hlYEpMq4QSieYKHqZ+tNyuLiHwIjNTS5dnnE4XM8A==
X-Received: by 2002:a63:c702:: with SMTP id n2mr12426084pgg.382.1615032671174;
        Sat, 06 Mar 2021 04:11:11 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
        by smtp.gmail.com with ESMTPSA id b14sm5209799pji.14.2021.03.06.04.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 04:11:10 -0800 (PST)
From:   menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>
Subject: [PATCH] media:atomisp: remove duplicate include in sh_css
Date:   Sat,  6 Mar 2021 04:11:04 -0800
Message-Id: <20210306121104.218696-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'ia_css_isys.h' included in 'sh_css.c' is duplicated.
It is also included in the 30th line.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ddee04c8248d..afddc54094e9 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -49,9 +49,6 @@
 #include "ia_css_pipe_util.h"
 #include "ia_css_pipe_binarydesc.h"
 #include "ia_css_pipe_stagedesc.h"
-#ifndef ISP2401
-#include "ia_css_isys.h"
-#endif
 
 #include "tag.h"
 #include "assert_support.h"
-- 
2.25.1

