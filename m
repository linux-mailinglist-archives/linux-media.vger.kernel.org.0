Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DE8252356
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 00:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHYWH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 18:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHYWH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 18:07:27 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0033BC061574;
        Tue, 25 Aug 2020 15:07:26 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id kx11so195227pjb.5;
        Tue, 25 Aug 2020 15:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DDfuEeZvkhmoX/XBxHBvhw10a3kF5GozAC7FQVyl31M=;
        b=hiiW82z64jhCNt3G6O1Gbo3lHrfE3KuGanUIOpwd7pOWjJpHoX3aRXOeP9MNvppOW1
         ITGK+p9JecHZWNR9soJZo5gBGMqr+t89qRspTlgSzrrAq8UmjWe9yVGqKeX/XxtHgVcm
         gmtHfqPiTnHsiOXgCfi66YA4pkQ6BUpquoldIbo/I8JM+J9nZQLpHj9prsZt4GZsWcTp
         3bqxh9L/a/c/aq6FM6sibf0VOkcuKhQ552JqeNaMlBR+vuMESJ7qYjhnwQeheap2xYND
         kLokaSIlXPQZlRIGk8gRbJFCimmNXa7VwwD/tlK/DSgcZamTMydsnG7q3GIyfx720KwY
         PumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DDfuEeZvkhmoX/XBxHBvhw10a3kF5GozAC7FQVyl31M=;
        b=Y3i6BwT0zlzRey+1l14OdiXjNDm6nDxyfhBZVJo7S0s2QR7ftea83hzZfeBvbi2UYm
         Yv8Yy4KYMFJ415poOnccBFIR0vJFO7MGJ5GDmHxsVswE0kdrbZZeZcqce4sqWY7ukd5T
         z3uPgUDTggsQl18CveDwSoQMHFksRog8EJut3shVrb5ufH9FxEmt0he/bu8yKfXl8DBc
         3DMcnEwlYY8n484FBUdRXivbnlP+G1zM4sSuwxl79KgImlJPdrCURJXDI23l/IDxtDcG
         Jx3xzqJibXRJxOUDEL8Z+FVTfVGNI7nFx8BWimICflRd71+lqFM+wPHBUwkjjIMyye8g
         SASQ==
X-Gm-Message-State: AOAM532aUI9J5NXSxxRcsCQMpsOY1WceXbtZ9prvc4xm84oXD0wBRL2g
        A+45uhAOJG0Gl65oN5GNsbs=
X-Google-Smtp-Source: ABdhPJzdVxSjyNH/rkjA1cfgXm37K+6qmC4ppHxC38w/8WOIGBgXvKCET8wbHnHpdKSj2ecCn8tUvg==
X-Received: by 2002:a17:90b:100e:: with SMTP id gm14mr3216566pjb.39.1598393246279;
        Tue, 25 Aug 2020 15:07:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.215.131])
        by smtp.gmail.com with ESMTPSA id k5sm100368pgk.78.2020.08.25.15.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 15:07:25 -0700 (PDT)
From:   Anant Thazhemadam <anant.thazhemadam@gmail.com>
To:     anant.thazhemadam@gmail.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media-atomisp : fix "dubious: !x | !y" sparse warning
Date:   Wed, 26 Aug 2020 03:34:26 +0530
Message-Id: <20200825220437.11214-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Upon running sparse, "warning: dubious: !x | !y" is brought to notice
for this file. This patch fixes that warning.

If there's a specific reason that this change is considered undesirable, 
please do let me know why.
Thanks.

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
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

