Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F847640963
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbiLBP2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbiLBP2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:28:07 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6F05435C
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:28:02 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id n7so3766176wms.3
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfz7Nubr199pY33ajZs0mPC+wji22IeMXgdJJhI7MWk=;
        b=Ydp+JiKt60nUr15pRavvUN1aj/R7jOkd+1QRS69q6L8cO/7e64EvlU8lun8J+vRx6a
         CE3w1PzQJxt5XXBfCf8sqWDHw4RwszEOcnhN+p3fACsq8mc+G5yrMO/axJf8jQNzBNgT
         NXN9+rFGtGsMmqlCUW8Yg+zjCBJxoHOmrcQKqovwFJeEtD6YLmsee1+osa5k/w13+UsV
         RMSqT+0OZs2o/45ueBhS30v+azUaZT2UwJqE70E5ZIajyE/KQ7mS0zyc0G+g1Xz/mGki
         UaS1Dm/zpXJsGzRAl4cL200KOvsHYTHl7T0AjM0qf/OR9U2ux9bnk9w1IohqrsidmbZ4
         fp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yfz7Nubr199pY33ajZs0mPC+wji22IeMXgdJJhI7MWk=;
        b=jt6j8sKWkR5IxpQI+CK17Hwn4sMM0g8SrllCw8a/OamQxVKAHwyriTAvOyBBlNgEzD
         Jq7mxFsMZ+Kc1MFcD7Tj6ODnUhBm2rHV6YBrf6ULoMnC9+YenrglAiLMGJqovR28Afxz
         VB4QgOQFNQyo41voWFqO0vJ7pa62BOwj69OdfbPKdseWo8vj3szWhgDorb9eOQBZQ94l
         +1dbVxcIdt94HgAj6AvcZfxSoekbfjY+6iqpxE5OWUt0vYr8HiRVuBl/YCYAWmlUS2hJ
         wgY7blEiEDWrbw5ZoXTOkCKYBio7OO+bhbpkigKBjh1LjTJcSbwYSzE14La2Em4l2KEj
         CFuw==
X-Gm-Message-State: ANoB5pnh7MmJnMbUtEO+4V9PaW/0N2ZsFOkm7n3hSCTmcE0FNwlKAljS
        LDB2OodPVs+UAazEkpKyihcgBV+uS/S2XNYgUKI=
X-Google-Smtp-Source: AA0mqf5a3sLiRh7bOPFlP7/k+ee4CGBJ8iwfz0FWIb0K6Um1YKBwpw/l6npUv9b4UgVjRxvmgefuCg==
X-Received: by 2002:a05:600c:1e1a:b0:3cf:7959:d8be with SMTP id ay26-20020a05600c1e1a00b003cf7959d8bemr46004743wmb.85.1669994881029;
        Fri, 02 Dec 2022 07:28:01 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id t17-20020a05600c41d100b003cf71b1f66csm8322773wmh.0.2022.12.02.07.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:28:00 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/5] Ensure sensor drivers set V4L2_CTRL_FLAG_MODIFY_LAYOUT for flips
Date:   Fri,  2 Dec 2022 15:27:22 +0000
Message-Id: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

I was doing a basic sweep of drivers and noted that these 5 drivers change the
Bayer order based on HFLIP and VFLIP. However they don't set the
V4L2_CTRL_FLAG_MODIFY_LAYOUT flag on the controls, so userspace has no notion
that it needs to check for a changed format.

Add the flag to all the controls.

  Dave

Dave Stevenson (5):
  media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
  media: i2c: imx208: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
  media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
  media: i2c: imx355: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
  media: i2c: ov08d10: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips

 drivers/media/i2c/imx208.c  | 4 ++++
 drivers/media/i2c/imx319.c  | 4 ++++
 drivers/media/i2c/imx355.c  | 4 ++++
 drivers/media/i2c/ov08d10.c | 5 +++++
 drivers/media/i2c/ov2680.c  | 4 ++++
 5 files changed, 21 insertions(+)

-- 
2.34.1

