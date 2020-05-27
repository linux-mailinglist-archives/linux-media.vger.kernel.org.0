Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617DE1E3A04
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgE0HMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbgE0HMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:22 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F10C061A0F;
        Wed, 27 May 2020 00:12:22 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d10so11370231pgn.4;
        Wed, 27 May 2020 00:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tbgdqd+TXdAk8QNQkvpAeStL9yrt3nZfFNT/1PFaGls=;
        b=k1qgL0z6SiL5RJ1jy1ddTv2tly55L3zXvSGIJ+d1Q8l14IIWnU8jdo/ew4J/MGZ1a1
         ghhp01Z2ro6ZZW20+RGtLXPi4dzOcPrC5WNO8MTcS3Bgp+gvUyu/hj2LrSIZjOZ0Trc3
         IqDmuUKZZtuZ6g73xrRk3FBEWp6nqRS7HyxoMZFLM5w+X/RQoi6fPntepT9EBWnM6Jig
         doZXNjAdevq31/+HN5f/EnFXd/8pj6dfnCNgGsSmeuBxuiopt7x2NIrxPpGnLz+2CtiS
         j810vjU2dvanzhLIukM3tlZDPZSv+/KOeBVqFZTQtzfYghYrcWM1AseG/12XCcrjs2Yn
         i87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tbgdqd+TXdAk8QNQkvpAeStL9yrt3nZfFNT/1PFaGls=;
        b=pH1wonvy7KciVwNuT1GW2BzOxNlBmV/FAct2avVovkWyAgLgohtQ23ID+5aYV9SCnE
         uH9bqlFPxFGYjqMufPVbKTf6Edi9JbHzcqXwkcwJvGQ4J6BSsrvWTmQBKTMsJtY2mkQQ
         D9HV12HC01sSGSvpHxhi5tsQgCuVq+1se+Mj6QPgfnthqkULLbMCgq2g7U0EwWjeFM4v
         p1Ew+t9Ln+Zs+wfrfP7KXFvYT4n2N6VOEafsCj21nRF6LP0jmMLIQExkWArKyIMRQpQs
         mZuEXYIWs+hhb3fhuGSkLuBMlq6rAkLukngidBSz4YSPhqv+KZP99cunYjwwlkW5zziG
         SHQg==
X-Gm-Message-State: AOAM531OfpjLsi0DYmxd9YxidZy5uLMzFAk55562q/Pbbbne1JeIOuEY
        3VTAzQK20ymRPIGMK3E/y1w=
X-Google-Smtp-Source: ABdhPJw6D1VZU/JVVsKGh8KLCigxn0+ldfpgARKsTpPYazxQ5VDfKfusD5Y37w56dI+8FS7LCXPvtw==
X-Received: by 2002:a63:78b:: with SMTP id 133mr2796179pgh.161.1590563541617;
        Wed, 27 May 2020 00:12:21 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:21 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 6/7] media: atomisp: Avoid overflow in compute_blending
Date:   Wed, 27 May 2020 00:11:49 -0700
Message-Id: <20200527071150.3381228-7-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200527071150.3381228-1-natechancellor@gmail.com>
References: <20200527071150.3381228-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clang warns:

drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c:129:35:
warning: implicit conversion from 'unsigned long' to 'int32_t' (aka
'int') changes value from 18446744073709543424 to -8192
[-Wconstant-conversion]
        return MAX(MIN(isp_strength, 0), -XNR_BLENDING_SCALE_FACTOR);
        ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

XNR_BLENDING_SCALE_FACTOR is BIT(13), or 8192, which will easily fit
into a signed 32-bit integer. However, it is an unsigned long, which
means that negating it is the same as subtracting that value from
ULONG_MAX + 1, which causes it to be larger than a signed 32-bit
integer so it gets implicitly converted.

We can avoid this by using the variable isp_scale, which holds the value
of XNR_BLENDING_SCALE_FACTOR already, where the implicit conversion from
unsigned long to s32 already happened. If that were to ever overflow,
clang would warn: https://godbolt.org/z/EeSxLG

Link: https://github.com/ClangBuiltLinux/linux/issues/1036
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 .../atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index a9db6366d20b..629f07faf20a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -126,7 +126,7 @@ compute_blending(int strength)
 	 * exactly as s0.11 fixed point, but -1.0 can.
 	 */
 	isp_strength = -(((strength * isp_scale) + offset) / host_scale);
-	return MAX(MIN(isp_strength, 0), -XNR_BLENDING_SCALE_FACTOR);
+	return MAX(MIN(isp_strength, 0), -isp_scale);
 }
 
 void
-- 
2.27.0.rc0

