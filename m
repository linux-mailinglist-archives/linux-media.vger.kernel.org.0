Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DB12C53E4
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 13:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387996AbgKZMWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 07:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbgKZMWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 07:22:34 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE4FC0613D4;
        Thu, 26 Nov 2020 04:22:34 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id m9so1634084pgb.4;
        Thu, 26 Nov 2020 04:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PRl5UQLIApysPdN6gQ2XrG9w+pBFNZGAKcsQ8VlHiM=;
        b=YTGVLGOc+HyeIBPiF/VwT6Q5AShcksNZ1su1DfUhJC7gc04jVQ/vqedZiuCcy4mgm7
         Yad8VoKJWb7ifNn5+GFGLjsvOtfcDWukj74/XcAkMyKa/Fxkt8uvJao2+s5oTeI993Ln
         2QqSQJrxae8Ch+0nOi64QUCr0kaN51QFs9FB/8D8brDyFk5iBtBqbg1iS66I05j6zob0
         Ug8fSaiMt4fivQR4s39DfkArv1dWVb+Q1TYLRAVs1oulYKYEXaoI5LUzBELycqjStPSR
         DTyUQZmN1ZzdvbUKpI60nhIkrQEL6PpF66akWeaaqJLqpEFJFGtODuRJw61uIpFXptmy
         DNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PRl5UQLIApysPdN6gQ2XrG9w+pBFNZGAKcsQ8VlHiM=;
        b=afVi5vX763nCkKfLSlaznlHybxi9rEFsKOaQH27z9B6MdiXDTs3Mwjc1QpZITj1m0o
         pDNP5Yl2nFNQByNenkWeE90T6fbkbPdmesD1BgPqdlty4dIucgjEwYgbQMrnWahg/Tv7
         zpgo7tTZfxbFFdcB2thVdKMDdEAMJLWaN3DMDA87jmuyxBuuAD45OWKYjSqpWV6QZxx5
         GDmgFF+xsn7k2xvKSxyW8UXpzXJZF0LCz4SOWG5H3his7PFoAixTGOmkIHb1PR59WzYP
         AWhJ3oVmil/b+1E62HV4t/JIRj/QipLx09hZcwX5+iTNLOTNckHeLO0QHFSk4DSzVOLN
         DQwA==
X-Gm-Message-State: AOAM530FFra4OdM6pmkCoRzQk0jHuDZEgy1y82ZjSJl/Vla1tSMGSFwr
        cwdu8jc+t4e6Usad6+jcIA==
X-Google-Smtp-Source: ABdhPJxW7ibKGsEWj96grTgovhmVBVs0j1mMACotqs2dhmBPdOq8jfxUhorzb2+ZDnaoCKYhxCetCA==
X-Received: by 2002:aa7:9395:0:b029:18b:bd17:2ea with SMTP id t21-20020aa793950000b029018bbd1702eamr2505597pfe.48.1606393353634;
        Thu, 26 Nov 2020 04:22:33 -0800 (PST)
Received: from localhost.localdomain ([116.92.233.28])
        by smtp.gmail.com with ESMTPSA id s26sm4663856pgv.93.2020.11.26.04.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 04:22:33 -0800 (PST)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peilin Ye <yepeilin.cs@gmail.com>
Subject: [PATCH] media: rockchip: rkisp1: Fix typos in comments and macro definitions
Date:   Thu, 26 Nov 2020 07:21:48 -0500
Message-Id: <20201126122148.9162-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix 4 typos under drivers/media/platform/rockchip/rkisp1/ found by
checkpatch, including the RKISP1_CIF_MI_{M,S}P_PINGPONG_ENABLE macro
definitions.

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Hi Helen, Dafna,

I noticed that the RKISP1_CIF_MI_{M,S}P_PINGPONG_ENABLE macros are not
being used yet, but according to page 12 of this developer guide [1] I
think they are for *enabling* the ping-pong ("double buffers") mode?

Based on linux-next 9d3e48f20e11 ("Add linux-next specific files for
20201125").

Thanks,
Peilin Ye

[1] https://dl.vamrs.com/products/rock960/docs/sw/Rockchip%C2%A0Linux%20Camera%C2%A0Developer%20Guide%20V1.1.pdf#page=12

 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index b81235afd053..94b65680c4c1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -46,7 +46,7 @@ enum rkisp1_plane {
 /*
  * @fourcc: pixel format
  * @fmt_type: helper filed for pixel format
- * @uv_swap: if cb cr swaped, for yuv
+ * @uv_swap: if cb cr swapped, for yuv
  * @write_format: defines how YCbCr self picture data is written to memory
  * @output_format: defines sp output format
  * @mbus: the mbus code on the src resizer pad that matches the pixel format
@@ -870,7 +870,7 @@ static void rkisp1_cap_stream_disable(struct rkisp1_capture *cap)
 {
 	int ret;
 
-	/* Stream should stop in interrupt. If it dosn't, stop it by force. */
+	/* Stream should stop in interrupt. If it doesn't, stop it by force. */
 	cap->is_stopping = true;
 	ret = wait_event_timeout(cap->done,
 				 !cap->is_streaming,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 049f6c3a11df..8a8d960a679c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -106,8 +106,8 @@
 #define RKISP1_CIF_MI_SP_Y_FULL_YUV2RGB			BIT(8)
 #define RKISP1_CIF_MI_SP_CBCR_FULL_YUV2RGB		BIT(9)
 #define RKISP1_CIF_MI_SP_422NONCOSITEED			BIT(10)
-#define RKISP1_CIF_MI_MP_PINGPONG_ENABEL		BIT(11)
-#define RKISP1_CIF_MI_SP_PINGPONG_ENABEL		BIT(12)
+#define RKISP1_CIF_MI_MP_PINGPONG_ENABLE		BIT(11)
+#define RKISP1_CIF_MI_SP_PINGPONG_ENABLE		BIT(12)
 #define RKISP1_CIF_MI_MP_AUTOUPDATE_ENABLE		BIT(13)
 #define RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE		BIT(14)
 #define RKISP1_CIF_MI_LAST_PIXEL_SIG_ENABLE		BIT(15)
-- 
2.25.1

