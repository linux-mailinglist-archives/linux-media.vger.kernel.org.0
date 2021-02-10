Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15944315DEC
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 04:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhBJDrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 22:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhBJDrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 22:47:10 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61017C061574;
        Tue,  9 Feb 2021 19:46:30 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id v206so477520qkb.3;
        Tue, 09 Feb 2021 19:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCL608888xI21CZ+Cc5Dfc0mFqx0sZ/adP+mXo0osYM=;
        b=gjichQiW9DLCgeVHOm5q57W6CmsdQ8Z7LQNp9k6kKlr+LMtVQ7PXVHlUcFGuvZpKWL
         uUY8nFpovfqU+zrdyJ+hdTTWlYmlBIdxhR4Eptfc8CPYL4PWhSRvKA50AfkRIV6no35Z
         uPhUokODsKugTcoU0pT+pV+vjAsHn9qvgkBYNPwKErISDF22ZRz6w5chvuBYZ/XJ8qQX
         djcV0Ox8DvQ6q1pfsJc6t8G8ZW978ShvjgWKzTSDBeInk/2gTu65BLtiPve3aU5XmWfO
         L4B4JNvoewasAGoaKIKijdeGgLJuH38xK8Nhf03vaigZdmX7aOHkpTLHACGoZqwTJ/W/
         Gv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCL608888xI21CZ+Cc5Dfc0mFqx0sZ/adP+mXo0osYM=;
        b=Vw4UT4yFefqZ0tndNTS+fm2jCtudHGzeiGFQuWx4SWt7UfRxw/FnCv5b8sef85PUNJ
         r9ol+oN/06z3Dxp3dz4qX15gjUmhTDxSZAOfrrR3PahnlE3COwl5jOv1tqYCjvdXIi7q
         9J8miDNgjyDLsBmPhU9B15dhEzpJ0/wxZ25FmlLN3Ob7S7SdDGkYfcGrKSXXPog0mUuF
         sjAYKmVjRmyAdIGYJZ5WRno7LudO11/Fst3ASwQKR6hYybCdSkb/gy0VKnTFnBKRKKYb
         gl5pWoZeTtr5bSkwqi7plYOwqnQQsryFD3RAWNR6oTxQe0FPkm7kh6POuOOxKxNIV57h
         u4ww==
X-Gm-Message-State: AOAM5300lwiTAHLso5MiHdLO1RrPvxlK/f/td+22dhCpneUP/t0Jkpqq
        +lVQFKtYdrZ+EVuns7WJwipCT2rINplRFA==
X-Google-Smtp-Source: ABdhPJx6kvKUN88jZOsUC1EnyXqhw/OXZTYN7Eh5iqLBAPbo3ABv6d/o7waFiEWOTLusJbvvQ0VvKA==
X-Received: by 2002:a05:620a:1442:: with SMTP id i2mr1594129qkl.290.1612928789590;
        Tue, 09 Feb 2021 19:46:29 -0800 (PST)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:7408:b5fb:1cd8:ad04])
        by smtp.googlemail.com with ESMTPSA id k187sm622254qkc.74.2021.02.09.19.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 19:46:28 -0800 (PST)
From:   Tong Zhang <ztong0001@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tong Zhang <ztong0001@gmail.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: atomisp: fix compiler warning
Date:   Tue,  9 Feb 2021 22:46:18 -0500
Message-Id: <20210210034622.1013012-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

should use %zu for size_t type, otherwise compiler will complain
drivers/staging/media/atomisp/pci/hmm/hmm.c:272:3: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 6 has type ‘size_t’ {aka ‘unsigned int’} [-Wformat=]
  272 |   "%s: pages: 0x%08x (%ld bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index e0eaff0f8a22..6a5ee4607089 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -269,7 +269,7 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		hmm_set(bo->start, 0, bytes);
 
 	dev_dbg(atomisp_dev,
-		"%s: pages: 0x%08x (%ld bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
+		"%s: pages: 0x%08x (%zu bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
 		__func__, bo->start, bytes, type, from_highmem, userptr, cached);
 
 	return bo->start;
-- 
2.25.1

