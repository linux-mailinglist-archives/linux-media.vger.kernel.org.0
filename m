Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064C235E2DB
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244919AbhDMP3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238443AbhDMP3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:29:09 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6FEC061574;
        Tue, 13 Apr 2021 08:28:49 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id m18so6202371plc.13;
        Tue, 13 Apr 2021 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DMFAeenJ3GJ+5amHPUt1V5Y4xL6+ih6uNBQOPdmIYsg=;
        b=Gfkv9H97ywR0e8+JktIS1lDOavqudu48crr8IGSjJbYInXDhgnAM5u4/PL8WyD+ujT
         7CKNooUstm/+3/wsG6PmF7FlvG3rUU9kkEwm3HcZNXLwPWkRaJusS/K8U9biX86xBjQO
         1VR09KCvDeC17reiaz4DEzaLCIdTbSOmw0wZau+UsYArwNUg1WOG4dw/WDafSgOvdj93
         tTIWI3WYn9EM73kSbLYmt5tzzmapPIUjYgr9r6wr89opIq5cDSiiWMX6OBU0n+3kNGx1
         uQ7S7Bh/NOuxqmnn60s93qJQEu6nn2S/GFT6Tr8jTwL7DkgX2HzuopAcUxJ6chmFdPEx
         pxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DMFAeenJ3GJ+5amHPUt1V5Y4xL6+ih6uNBQOPdmIYsg=;
        b=PacPmBLq+uU9Pbjuj9egRkFoI9GJrDMS1bD2XJA+o80E0zI8Gp0JWx5lx6LC2JGH24
         C/q2Wi77GSu+RAbEyvWXiWSVYqqhLR7l+Gy17u6VCTbmvGIxI7bfVjbzrj2OCo9zgD77
         xdwxazXq3rKNq5t8vlVJ4ZajmIlbAThb3N1XN2/GNol88U/r0hmXgw1b018FF1dibrcX
         mmIT0oA7FfRHOAf0Ir8DafS1PIeVvbfaC8MdV7IJ01HCJ+baAJU7dlptZyd43WksND7q
         1aPSHwRdCYZB2z3J71vKGK0Y5geEaPF+vog7/92/mlBNh7MX3Qz9jCCUdYjlGy16UWB4
         H6QQ==
X-Gm-Message-State: AOAM531CBUlMs6tAIQbqY1Rt0gvjI/63AAbA/ppJa4Rba8LX1AfgyNZj
        OfbpAnzjF0u+KEf56q5y910=
X-Google-Smtp-Source: ABdhPJx3o94YoWme6YyVTOpvbjkkCt/MmDEmmSKzgtL/jjiK62HXJj2Jp+0GLXbVgQe8ht2L7IEr2Q==
X-Received: by 2002:a17:90a:5413:: with SMTP id z19mr558107pjh.137.1618327729168;
        Tue, 13 Apr 2021 08:28:49 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id a3sm2492213pjq.36.2021.04.13.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:28:48 -0700 (PDT)
Date:   Tue, 13 Apr 2021 20:58:39 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3 1/4] staging: media: intel-ipu3: remove unnecessary blank
 line
Message-ID: <352ce300cfb744262bd30aa78e77b99bb28065dc.1618326535.git.mitaliborkar810@gmail.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed an unnecessary blank line to meet linux kernel coding style.
Reported by checkpatch.pl

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- No changes.
Changes from v1:- NO changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index edd8edda0647..438ec3ed7b6b 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -74,7 +74,6 @@ struct ipu3_uapi_grid_config {
 	(IPU3_UAPI_AWB_MAX_SETS * \
 	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
 
-
 /**
  * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
  *
-- 
2.30.2

