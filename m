Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697A84530AE
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbhKPLcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:35170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234995AbhKPLcY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 762D261B60;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=zpQY7juBexiXSWxCm3fVIy2Cj+UKtwRGhsoo1azEha0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MUaeF7mMiLQ98bdpXSsk5UGEyGfwflBId1FxaljRyU31VdEAaJMI5Pb+74PMaa71R
         c9s48go//0mmcOEmLHOOcJ8oTeMPcoPUIYJWWilEOlVPXRsWB5m79NQ/neGzHDfknF
         VNIYsaDC5E9yH7fv4Tv/e9Q1YRiXjXmVNqhbYpZR+6B+FmVlIBnt6UAblKOvKhWJQK
         Xwl5v5m56T4Ouw9Wj4zH309ZihTV5mFDWmDDPrHwQ/wXYehLcP4ZMryL2pk6W1JAIs
         KBDJeQPPvBkzaV7rhwFz5bUgU2PtcWd3XFw2dTP2LBMvSiEXoXt0KVTf2g3ZW7yF8I
         aRZ35Frs2Tj4Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfy-Lf; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 18/23] media: atomisp: drop a dead code
Date:   Tue, 16 Nov 2021 11:28:59 +0000
Message-Id: <d1fb52a308bf0559bd00f62162e7cbe22fe606c9.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a commented dead code related to some future thing
to be implemented. As this won't happen, as it would require
a newer firmware, just drop the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 766d92a4c2eb..5d022bb373a6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3833,38 +3833,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	}
 
 	buf_type = buffer->type;
-	/* following code will be enabled when IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME
-	   is removed */
-#if 0
-	if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) {
-		bool found_pipe = false;
 
-		for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
-			if ((buffer->data.frame->info.res.width == pipe->output_info[i].res.width) &&
-			    (buffer->data.frame->info.res.height == pipe->output_info[i].res.height)) {
-				buf_type += i;
-				found_pipe = true;
-				break;
-			}
-		}
-		if (!found_pipe)
-			return -EINVAL;
-	}
-	if (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) {
-		bool found_pipe = false;
-
-		for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
-			if ((buffer->data.frame->info.res.width == pipe->vf_output_info[i].res.width) &&
-			    (buffer->data.frame->info.res.height == pipe->vf_output_info[i].res.height)) {
-				buf_type += i;
-				found_pipe = true;
-				break;
-			}
-		}
-		if (!found_pipe)
-			return -EINVAL;
-	}
-#endif
 	pipe_id = pipe->mode;
 
 	IA_CSS_LOG("pipe_id=%d, buf_type=%d", pipe_id, buf_type);
-- 
2.33.1

