Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441C51E3A06
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbgE0HM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729144AbgE0HMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:12:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD6FC061A0F;
        Wed, 27 May 2020 00:12:24 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p30so11348056pgl.11;
        Wed, 27 May 2020 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BtFr88iS5dYVk9M5situj/cALZfUmfJBkWJmVOPGwiA=;
        b=QpCpctZfSnLodygNVJlSPBKkfII/mNnwqTkUPiqiLyWUfdkWaLBSnzHx/wkWxck/sr
         Ea4ImcUsTN9O73vlU31Py0Lno77YlTqpgiQUGnGQoypdkLvlLAEAazyPBrVhqz1zK0YS
         a/GdQnliziiDEZ23uu0dvDu2R8CwnWG91rb0ADbH83+3FeAFOYzRU7t46KYUswvh3g1V
         bsqbHBrOJ/mb9LRdgiYOHrVETupl8qryK3Ayvh8rNES9NZooxr/ysSji89BodjEzPU5J
         bNzyPtN36GPUjguXy8xoGGru+rhEGfIryQPVI2bHohuYltYUmSsDIyeB8pKud8TlKGxI
         vgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BtFr88iS5dYVk9M5situj/cALZfUmfJBkWJmVOPGwiA=;
        b=gKW2SfVVPWqNbHNnCdYVrsBSTwvylBZncnoITXGzR0/6IOJ5/BfmM8WSUv7LmFQ0tQ
         LTBd1pRBdmLPXoN8DDwep2s5o1DK1xQvCuGP4HYV3RnhrzUA5MqqGhXTBhiFAD6GDjFt
         fIud1EofTQZuff6IctCqGnGkPs2IMCFKbAmH7zhG7QnTumSlmi9DWcE1qHfmey4BSBk4
         JG4OQchfIGhsuA8s7wPUQjZ5bJSAyKNYCg5E4W+7wAkwe6LpUln+1cfuBpvmk2hRMy1Q
         WNnLtPI3xXJzWQTFd2g2Ik1qkOvpAoKTdOiN2rdYKosOfI6AQO6nsJHy/tgJZ0hsdufD
         Crbg==
X-Gm-Message-State: AOAM531E0dX3NlXvYnNf9SlSECIozAQxt35GJDlR6t63ZPNOWtxg2EzF
        KDcC/T8updYiQeNhqWwUL5A=
X-Google-Smtp-Source: ABdhPJwrauMbNSEdWNH+N5a3rZnBfOIKgD1AmNbuhOdA/dbXFJh9XOpUE81ASBgklIFa4/rbx/Uoxg==
X-Received: by 2002:a63:ad0b:: with SMTP id g11mr2665934pgf.275.1590563544076;
        Wed, 27 May 2020 00:12:24 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 10sm1306431pfx.138.2020.05.27.00.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 00:12:23 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 7/7] media: atomisp: Remove binary_supports_input_format
Date:   Wed, 27 May 2020 00:11:50 -0700
Message-Id: <20200527071150.3381228-8-natechancellor@gmail.com>
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

drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:1707:64:
warning: implicit conversion from enumeration type 'const enum
ia_css_frame_format' to different enumeration type 'enum
atomisp_input_format' [-Wenum-conversion]
        binary_supports_input_format(xcandidate, req_in_info->format));
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ~~~~~~~~~~~~~^~~~~~

As it turns out, binary_supports_input_format only asserts that
xcandidate is not NULL and just returns true so this call is never
actually made.

There are other functions that are called that assert info is not NULL
so this function actually serves no purpose. Remove it. It can be
brought back if needed later.

Link: https://github.com/ClangBuiltLinux/linux/issues/1036
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 .../atomisp/pci/runtime/binary/src/binary.c   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 2a23b7c6aeeb..0be2331c66cd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -857,18 +857,6 @@ binary_supports_output_format(const struct ia_css_binary_xinfo *info,
 	return false;
 }
 
-#ifdef ISP2401
-static bool
-binary_supports_input_format(const struct ia_css_binary_xinfo *info,
-			     enum atomisp_input_format format)
-{
-	assert(info);
-	(void)format;
-
-	return true;
-}
-#endif
-
 static bool
 binary_supports_vf_format(const struct ia_css_binary_xinfo *info,
 			  enum ia_css_frame_format format)
@@ -1699,15 +1687,6 @@ ia_css_binary_find(struct ia_css_binary_descr *descr,
 					    binary_supports_output_format(xcandidate, req_bin_out_info->format));
 			continue;
 		}
-#ifdef ISP2401
-		if (!binary_supports_input_format(xcandidate, descr->stream_format)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d\n",
-					    __LINE__,
-					    binary_supports_input_format(xcandidate, req_in_info->format));
-			continue;
-		}
-#endif
 		if (xcandidate->num_output_pins > 1 &&
 		    /* in case we have a second output pin, */
 		    req_vf_info                   && /* and we need vf output. */
-- 
2.27.0.rc0

