Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04A424D2F9
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgHUKnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbgHUKnU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:43:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0555C061386
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:43:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 2so643507pjx.5
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Smgq9QH6ITzHlCEaZ2WTs0u1Siiq62bIHo++TvYO2wI=;
        b=PO9xeJHQO7yLNU8dB9gYFketKbmGbaTVwy0JqZ+egtpPrGV2TEa/iMZH+q74dNy5PE
         hUrZuMl2I6rXb63S2QnflUFCtaFA2tdYb1lUsbRRngHIVVegWNcUf1Ev3lAPwP2B2+qn
         VLkTWMSL1Tx+1HkcFIuvWfIanNGOfz64jVTys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Smgq9QH6ITzHlCEaZ2WTs0u1Siiq62bIHo++TvYO2wI=;
        b=oUEVJsKIQ5PikDMfF/mD5UkQXxoGflqfJxVYnx2dUTWNDtAQXnAnnYG94QOLJSJvra
         2NzYpELm+RQyep+XDiYxWHwdrXtO/2kCJAYCuCiBYxTLdW67Ha+/14reoaJ7XitRYKqa
         jfNaEJTVJVBCEHNNQyNz5APsRGcx1R4zKS952nvsHNO2YjCOSbyhwvZ6BPodqAuqBJBr
         8xUaG9zQ94LJGxTr+CuFdL7SrMOWFeUqPD+ul199USC2ZHBZCJjPx7JBURkf+7wBkUgg
         nTkYNZ6+lTOphPvNBQbeuRNiCwKDdUHfgUSw8IU9ORkJ1Sp4fldQ+KF9ZQdMhngfWamr
         Phuw==
X-Gm-Message-State: AOAM532vqP7PGt+R1e3qe6c0YT9V5+ESwe3rC5iAGxnoCuV/eEcDaFzi
        lKZ60QroYKZPqvVKSUwmV20xorayqNJl+RtD
X-Google-Smtp-Source: ABdhPJzIRnaiX5NahGrBHc0yJTbDeE30V8e1QerUQtKubjzLl+plnuf20VRhxSPT2BLWVwvuuXipJA==
X-Received: by 2002:a17:902:8eca:: with SMTP id x10mr1898723plo.129.1598006598991;
        Fri, 21 Aug 2020 03:43:18 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id t19sm2149536pfc.5.2020.08.21.03.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:43:18 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: mtk-vcodec: fix Kconfig help text
Date:   Fri, 21 Aug 2020 19:43:05 +0900
Message-Id: <20200821104305.2315218-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Kconfig help text for VIDEO_MEDIATEK_VCODEC was referring to a
single module named mtk-vcodec, while this driver produces two modules
named mtk-vcodec-dec and mtk-vcodec-enc. Fix that.

Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c57ee78fa99d..bbf32086b607 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -261,8 +261,8 @@ config VIDEO_MEDIATEK_VCODEC
 	    encode and decode in a range of video formats
 	    This driver rely on VPU driver to communicate with VPU.
 
-	    To compile this driver as a module, choose M here: the
-	    module will be called mtk-vcodec
+	    To compile this driver as modules, choose M here: the
+	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
 
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
-- 
2.28.0.297.g1956fa8f8d-goog

