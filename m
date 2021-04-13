Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EFB35D6FE
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 07:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243885AbhDMFQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 01:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhDMFQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 01:16:49 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AE8C061574;
        Mon, 12 Apr 2021 22:16:30 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so10114929pjb.0;
        Mon, 12 Apr 2021 22:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4XDX8cIaJxLhyXnc3hBMVHgdvzoZ+hyINeFmm7eH+kg=;
        b=A7Ec2k4DKxgt4iaOM4wzFNrzbGicCPfrkYDg+42NjbsV1MqVQ/0A0AVXWfO8QuxFKO
         +3SEP7Q0RNQ4f2PP18PGUf8soqkaLoacCDIva1/GKda1Wpo4Q3fIXIi3j8za8wPtAKEZ
         qW5jvfXL4zoUqvFuZuVCJvDPf1wUYVvOft6mshPzF+TzGdizx0Ye3Rd8037ZaHsXI66E
         uVmAXMJHwboaRd8GAa43J4mFXjYd0nBQOhBV4cwV0RjXABq36cr4prIuRiy4JSmS8BXT
         ybAODTDgKZWRN1+T6q4ruac9MX3m6gbvmsrvsxCRJaPm8z/HEC/xVSnUUP10uXfvURKk
         B2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4XDX8cIaJxLhyXnc3hBMVHgdvzoZ+hyINeFmm7eH+kg=;
        b=apj01z60IJVtdKjuIs3tPePyAEsL8Xw60seM3dm65LuTir13T83df/dDQn+PVmqV+b
         eYkw0wnAiX5xMcF3ai6skAr1nRXTrYtOrsCN7k9W/ktU10KbrmnB0bLzVCgfTK4gJXSK
         FsfoVp3NN0Z1xOmD3bky/8NUgeGrGxHUL4yk6TM29TrWhOa9f491C4XC9A6Q6K3tFNXo
         9HeyVeeTIU14KsgwZsft0yk4UubNNvSADMM3x4ALB8S0V9RMEj5dGz5TCTgLKRQOgukP
         nmkWxuDw5OCSrAQjcGP7RLzlR+wXNzxVFbckpyAUe+s//S4B+L8dZSSqwbsfPfKESo4H
         WX8g==
X-Gm-Message-State: AOAM532VSZbo7YkXtb34dIuD0x161h9aHEy936Cwlo3WYXigceQiULBP
        EW6JtykRPbV5dJpHdhtwG8k=
X-Google-Smtp-Source: ABdhPJxeTMs3C/SB153yC/dYzXjpgpgVgWPbur7IpKAmHgi8Abi8apVHsMqKL+2M2Cw322fMQXCSOQ==
X-Received: by 2002:a17:902:e5d0:b029:eb:2814:8619 with SMTP id u16-20020a170902e5d0b02900eb28148619mr2079964plf.30.1618290989854;
        Mon, 12 Apr 2021 22:16:29 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id u7sm957393pjx.8.2021.04.12.22.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:16:29 -0700 (PDT)
Date:   Tue, 13 Apr 2021 10:46:22 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2 4/4] staging: media: intel-ipu3: remove space before tabs
Message-ID: <a01ff63a3b2fb14704f32e83bd12c4cf36410275.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed unnecessary space before tabs to adhere to  linux kernel coding
style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 0451f8b7ba4f..340d97160bbb 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -631,7 +631,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
  * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
  * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
  *	default 6.
- * 	format: u3.2 (3 most significant bits represent whole number,
+ *	format: u3.2 (3 most significant bits represent whole number,
  *	2 least significant bits represent the fractional part
  *	with each count representing 0.25)
  *	e.g. 6 in binary format is 00110, that translates to 1.5
-- 
2.30.2

