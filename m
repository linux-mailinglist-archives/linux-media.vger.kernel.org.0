Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D7741EBCE
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353867AbhJAL1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353650AbhJAL1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:12 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32EEC06177D
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:27 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d26so14940291wrb.6
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CsIDAReufILY9VHFSQPnSoVNtKesEQVhGHmS/ZGk6bY=;
        b=m92E2iaieXtNEzgumVB8qGx9lnexFJr6/tTdH01cdjZe4OAJNypKDGGvk5oi+zPkLT
         Qhkqhp31Y5/eciGuA8fGat/X8YZURnJYGkWgbQcoD/fJNchmygovG6XMtQKOn01hAscQ
         2U+k5J9p6eGmmfeLOnYpfTEkPGpm0gqFcYcXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CsIDAReufILY9VHFSQPnSoVNtKesEQVhGHmS/ZGk6bY=;
        b=HsS8fxHCFbyTnDGztOP2eif76XGKzvY/q7ZGfLQ3E8DwJfLH2smQUb4xSk08wxboj4
         jnRZRVMoMuX26f4jYnAh9pnyYffoLiOP6ukpiZkYAMH/RQ9Yudlo8Doj13Mcz+QwmBas
         jZQAgb/cy6f1R301lHNDkrz/O1DzSaGXylZIQkHQ37+Vh0h+dTCjx2juzE1rhakHql+i
         1PdxKxw6WrNrc4FE53YIdecHHqAah3BHIFkn9IuYQyApOYaz1JBlo3iiQuRzxLbauq0S
         pGK/NsNHeGR8/7Ui6z+w2BvLg9GE+yJDP0R0LoMBkZrUOLz2x0KKn2i7+spPlvToBcy8
         DyKw==
X-Gm-Message-State: AOAM533dCce0G+CVFHMp+rZ+KZ0QXDnGO3+fSBY+0rH0SGPdnHDp142i
        aXP6DJmPgH6u/sdGRyn9ptBO6w==
X-Google-Smtp-Source: ABdhPJxExrFN3nb57yGGRQ8TCWrkgCkapqXnn1OL2XI5mlFWa2eEvqff7MdNn3sqybBfXZwYjY0baA==
X-Received: by 2002:a5d:6847:: with SMTP id o7mr11761494wrw.213.1633087526228;
        Fri, 01 Oct 2021 04:25:26 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:25 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 3/8] media: ipu3-imgu: Set valid initial format
Date:   Fri,  1 Oct 2021 11:25:17 +0000
Message-Id: <20211001112522.2839602-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211001112522.2839602-1-ribalda@chromium.org>
References: <20211001112522.2839602-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The initial format did not have a valid size.

Fixes v4l2-compliance:

fail: v4l2-test-formats.cpp(723): Video Output Multiplanar:
				  TRY_FMT(G_FMT) != G_FMT
test VIDIOC_TRY_FMT: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 38a2407645096..1813bb29e362b 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1136,7 +1136,9 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	def_pix_fmt.height = def_bus_fmt.height;
 	def_pix_fmt.field = def_bus_fmt.field;
 	def_pix_fmt.num_planes = 1;
-	def_pix_fmt.plane_fmt[0].bytesperline = def_pix_fmt.width * 2;
+	def_pix_fmt.plane_fmt[0].bytesperline =
+		imgu_bytesperline(def_pix_fmt.width,
+				  IMGU_ABI_FRAME_FORMAT_RAW_PACKED);
 	def_pix_fmt.plane_fmt[0].sizeimage =
 		def_pix_fmt.height * def_pix_fmt.plane_fmt[0].bytesperline;
 	def_pix_fmt.flags = 0;
-- 
2.33.0.800.g4c38ced690-goog

