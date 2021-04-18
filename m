Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2F33635ED
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 16:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbhDROoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 10:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhDROoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 10:44:01 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E754EC06174A;
        Sun, 18 Apr 2021 07:43:31 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j21-20020a17090ae615b02901505b998b45so3595918pjy.0;
        Sun, 18 Apr 2021 07:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8gZJU83R+0zpO/uK+jvzr7GcvwjV1r6DfaVYHOO6r/k=;
        b=V0PZ3ziM40TqnfkHywTsYlHAB2lP6vByhxyRPMxyPb0PEF8pmn7/IfkAAKO7aGC6uV
         jUK2MXSYQiEFvfj9ntoavjaIuBE9qUNBMHX44kXRJVZHCUqBynfzFDGYtOy6IoGsSpud
         HDFB33egb+KorMWtTdyw8On5nOIH52J3GfujMrZj61ZEDJtZHRq1ZS5rZkG6sP97qkBz
         mjwGiluiSASKscyjNj+yHTgU8D65XHzneaXDKXsQeKpjn8e9p6WxO3mwhHnlrv3yoFN7
         zvkGkeXv6bIZGAcI10M0dkcR2FBLeDz70CL6Cy4+CQmT1HX1ZBTh6dy1BqBN5F0n/TSS
         cZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8gZJU83R+0zpO/uK+jvzr7GcvwjV1r6DfaVYHOO6r/k=;
        b=hUXkfE149jhjBLaOy8VWxOX6nt2jNByBT0RqAtQkiNK+XQwDT/PLKDCGMBY8Kv2s1J
         sS5nXUte7huy+kLySkwb/L8JLc8W6a9/3HbHpQf+Xk6sF6upOGdUp4NCvrrVI+O2eeMY
         akwhOlhDfn5rFcx3rPYzLYSvT/PksI2HRf6LfoU/pBnWv6rC861FPCZutg7iNcZnvX6B
         2cX9mevypdvX3I7+dUP3WxmjECEkIREChFUrJpqR/CTgmT3qOF7PyUxerUULSKXMw7nH
         HI8UhpvaS+HhnblljlHf4MexRf54DfKy4vVRP9gWrqSzF7oGwH/kmEVd0N9MzKkA5+3C
         s4gA==
X-Gm-Message-State: AOAM533rdiRaVH0ACoHCJ8fIUaCz3QTCtjugAuhtnzDgJRDgheInwWLx
        sTUvf3LAYSHYWTIvUCJ+DS4=
X-Google-Smtp-Source: ABdhPJwcRiX6atPSTp6oK46nmHcq6XLahpMm3uwJNEtpm6saTPPsKxtzNEF4T4Ki7ZZsbE8G863OVw==
X-Received: by 2002:a17:90a:fe11:: with SMTP id ck17mr19996518pjb.49.1618757011349;
        Sun, 18 Apr 2021 07:43:31 -0700 (PDT)
Received: from user ([2001:4490:4409:d07c:b4ac:39e7:e05c:f39b])
        by smtp.gmail.com with ESMTPSA id t19sm10495667pfg.38.2021.04.18.07.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 07:43:30 -0700 (PDT)
From:   Saurav Girepunje <saurav.girepunje@gmail.com>
X-Google-Original-From: Saurav Girepunje <saurav.girepunje@google.com>
Date:   Sun, 18 Apr 2021 20:13:23 +0530
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, saurav.girepunje@google.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     saurav.girepunje@hotmail.com
Subject: [PATCH] media: atomisp: pci: remove unneeded variable 'err'
Message-ID: <20210418144323.GA54920@user>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following coccicheck warning:

drivers/staging/media/atomisp/pci/sh_css_mipi.c:39:5-8:
Unneeded variable: "err". Return "0" on line 44

Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index d5ae7f0b5864..708903a31b08 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -36,12 +36,11 @@ ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
 int
 ia_css_mipi_frame_specify(const unsigned int size_mem_words,
 			  const bool contiguous) {
-	int err = 0;
 
 	my_css.size_mem_words = size_mem_words;
 	(void)contiguous;
 
-	return err;
+	return 0;
 }
 
 /*
-- 
2.25.1

