Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DB33630E5
	for <lists+linux-media@lfdr.de>; Sat, 17 Apr 2021 17:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbhDQPhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 11:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhDQPg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 11:36:59 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84515C061574;
        Sat, 17 Apr 2021 08:36:33 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id w8so16833722pfn.9;
        Sat, 17 Apr 2021 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=D/05szO78c8EJq1ym9W+r9Xm4IHEEvxwkXiJ2BgsUcI=;
        b=ok7VrOdFliNRvZPADXhbRfkawBFnWi8hF+qbhcL408j1O1CsdLTqdkaT2NunMt45B8
         N+VoBizCnqx6dc6VhWoytC/kZwga6xA3m8vr3M9ECWTT8/fTM/C8dSNMJ4h7Daf8HPV5
         E+FNBQY0vP9qd/Gb1PUaR/Iv4smpfs/UkZZOJKM5Z4Hko3l2LBNxyZEozolcC13994kO
         eNPYC7AT7zRvE4ejlzXzeNnegh2cBpiBFLgAE3YeXsayRKu7UYe6HqPPmRFRz5lSL8GU
         SwJY1wyqBcJrcE7JpEyzrhHpvSixPsKk1U2Eyq1TeRDX81u9pUvxWJVv7UM9vixbMMTn
         XHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=D/05szO78c8EJq1ym9W+r9Xm4IHEEvxwkXiJ2BgsUcI=;
        b=a/7nj62UO9/TCC4Y98dWEwiOqKVKgCiZBklvAXae9orM/iG5IVoQWvkU+hRIHc83TT
         CateWqgs0VUDv73HIzsQ2nJWwY16ysDGlj9YkLOsRHbgeg1jXHeKjtC7m3AReMj3FbZu
         Raua5GXEF5AvzNtITmh9cBAojDt3pACSqZZD0YOkABLpt0biTORfbh9uUDYJ9YRTcf/I
         mh8CPIj9RAkPGvydb6rS0oN0G00qOxGztQbQXgU+LnS6nOSbNSKTAIQbyWoR6IQP3fs0
         dz7T9RA2FUETcH5UTtfubqq8iAJW9fX3FlE1PpLPSaZMoq7ygugEdbrzzR0je5TZHpVP
         t9Zw==
X-Gm-Message-State: AOAM5323beLl3WTqaJa92nR3riomIHbI1eW4/zKSg+WnEmyBEfczjCMR
        4uSoVd4tZxDU7W8kvnPWmcA=
X-Google-Smtp-Source: ABdhPJxJJG0G9xu6o6xj+ER8AwUrznNbFdJJuUqM3mxFkioSLr8Wb31xP1m18arBGjy0mJ7c5cQe1w==
X-Received: by 2002:a63:c10a:: with SMTP id w10mr3815406pgf.353.1618673792733;
        Sat, 17 Apr 2021 08:36:32 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([122.177.44.217])
        by smtp.gmail.com with ESMTPSA id e4sm8347297pgu.89.2021.04.17.08.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 08:36:32 -0700 (PDT)
Date:   Sat, 17 Apr 2021 21:06:27 +0530
From:   Ashish Kalra <eashishkalra@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ashish Kalra <eashishkalra@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     eashishkalra@gmail.com
Subject: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
Message-ID: <20210417153627.GA50228@ashish-NUC8i5BEH>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Upon running sparse, "warning: dubious: !x | !y" is brought to notice
for this file.  Logical and bitwise OR are basically the same in this
context so it doesn't cause a runtime bug.  But let's change it to
logical OR to make it cleaner and silence the Sparse warning.

Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 358cb7d2cd4c..3b850bb2d39d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
-	if ((!out_info) | (!vf_info))
+	if ((!out_info) || (!vf_info))
 		return -EINVAL;
 
 	out_width = out_info->res.width;
-- 
2.25.1

