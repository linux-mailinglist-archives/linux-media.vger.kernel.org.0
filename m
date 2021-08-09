Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2AE33E4F9D
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbhHIW7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236935AbhHIW7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:22 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52821C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:01 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso530896wms.1
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JFSSjbYlqWNB4qyyIhcdKV8vrcXxqSFwTVgPJEd6FCc=;
        b=XQqTfvIGHizXJuQgCq/3+/BsVg+DPvWb3xaXu40GXPQhsw3F+YvKIJZ7G9nuXeMWA+
         VSBJbDBduCiGipav141lm69mgK8GRT27dY8xq4yZHQMwvQtl3le0TeRmyqf4SXhb+V3y
         /4HNBavnmPN64jHA3v2w53SxRLBYSyt2ExV5/y67pA+dH7bRM9hBw5kkmdAibmiVUT0g
         lFJ1H5mv2KyFh42VM0jSc1R5Uuv5kfmdKhn8ML62zYNkYV0RMG8HUFLtdcZ2ylR+kSR2
         pD5qKZ9X37GRxDuqXkOFv0FPgF66hYXvxzo5w29w/NGycyG02pRD5sFJ3mmm8LtNlkGK
         d/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFSSjbYlqWNB4qyyIhcdKV8vrcXxqSFwTVgPJEd6FCc=;
        b=CkwvLAEYbdqD6fK5HRnJlRnE7NPaT+97AZmTBMxeCIeSx7p2IU/v8I+5aOn0eLSDOy
         EzprvjVolv0qZ2+rf1dsarrtqtfLT81FQcxSLj20RBoAP/VH8umE3Jh6EppzcbnWB6wM
         fz6IJKkIrsGQ15PsVQsFSNU6CCmhpgOo2ZkLdLzCt99ED0E7G2cku+jbJvEblZLDR89A
         zRN4Xe6zf0YC1fXG5L+iAE0YAtPSZuGHXVT3SQ1w/uEfgaQItOtclKdkpkcbP+SpaZPz
         u0oY9dWA5YwO94h0hrrOuJ48EzGroL6E8I2vFQUcGJIJNRugpAVJTCzEQc/+yV2orkvx
         IpJw==
X-Gm-Message-State: AOAM530h8vSf85i2raasxsZ1PoRuabJHqGvBHv2i6gHZpxz+TR5sKvxv
        5SP9URkuBtZGd6LLE0bidfQ=
X-Google-Smtp-Source: ABdhPJxrG5LzYOMdmOOrajZMFO8fwd0yW49u902vBqaN4UQsLzp4hc/NpwsIiKEqW7mTma3S1xU5xA==
X-Received: by 2002:a05:600c:4145:: with SMTP id h5mr772009wmm.7.1628549940020;
        Mon, 09 Aug 2021 15:59:00 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:58:59 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 02/12] media: i2c: Fix incorrect value in comment
Date:   Mon,  9 Aug 2021 23:58:35 +0100
Message-Id: <20210809225845.916430-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PLL configuration defined here sets 72MHz (which is correct), not
80MHz. Correct the comment.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index cf6cc55e8506..8d973117f611 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -713,7 +713,7 @@ static const struct ov8865_pll2_config ov8865_pll2_config_native = {
 /*
  * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
- * SCLK = 80 MHz
+ * SCLK = 72 MHz
  */
 
 static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
-- 
2.25.1

