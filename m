Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFDA1E8EA5
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbgE3G6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728849AbgE3G4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B303021841;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=vCqUxjS5GFf0op3eK/T034P63eSiE4MDBhEFwa8b1ek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MtSz2yHt8OQOetSIxwkgrIEkhC/75DwevXv5REYKqXkGzHMemVrUSzoG4eExiAVAv
         dp45ixNl/TyoKT6b4Fle3oao6OaRYgJyOOsbgGaLO9fp1LIv/NjVW6HdRcPonHHh9E
         Cbcw6QIgZeoS9wqhSPcdCBtCfa9KEa80voqnvHdU=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hq7-Je; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 26/41] media: atomisp: Remove binary_supports_input_format
Date:   Sat, 30 May 2020 08:55:43 +0200
Message-Id: <2e4b1cb050370ba37eb58be8ec7ea8b31705f847.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

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
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../atomisp/pci/runtime/binary/src/binary.c   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index fd4ecd697868..85e8b45d5416 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -859,18 +859,6 @@ binary_supports_output_format(const struct ia_css_binary_xinfo *info,
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
@@ -1701,15 +1689,6 @@ ia_css_binary_find(struct ia_css_binary_descr *descr,
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
2.26.2

