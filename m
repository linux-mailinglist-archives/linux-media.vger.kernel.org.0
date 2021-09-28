Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B650B41B8FE
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 23:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242838AbhI1VMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 17:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242797AbhI1VMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 17:12:16 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3484DC06161C
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:36 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d21so579514wra.12
        for <linux-media@vger.kernel.org>; Tue, 28 Sep 2021 14:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/527VUTmqAtENSVUrdjYi+zZpuZQaH+ikhSUSsw/8Q=;
        b=MzPIro6oqNDdndENu3R4jscUAO/SKKNMg4D1rGBPEu8LXDZUdysA3mBVYXq+dYOR/8
         IS5wSgRkNhV2TXto/USKdCqVT1yiorCh+gX/McGVqmuM3aWUmowyJUcDuoyG2aKluIoZ
         euFL4oudON9uquaNTcV39xFyYiowHl8wR65OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/527VUTmqAtENSVUrdjYi+zZpuZQaH+ikhSUSsw/8Q=;
        b=2B6c0YQiU6/EdGhs45fPCWmr0IaExBHB8IP4jJO2CAVlKsRIedAKS/CVoc+KDd2cKi
         3PEM648XF5U4lctFmEHmD1EgV6Zqh1VcEp5LG//e7L8MXbB0kCoWMWnCsK9zDvQP/vwt
         tsWX/rS1BwPftE4bJSZQwI6OOjUMINODp7ncHPGkDpJc9rkVWusMSvBJIAsDUff5+rB5
         inB6nQK0n2GmDWYlIuq8j0DaTRXq/JJ4dwRmXgXgXucyW0Nc21xNTuN15ZOjg0MYgTZX
         K8ktmN5xQs1X43JFaWG1p/Efv2GrJkupWBlTtYino3+pQCod+U4ymJReOl990WWamskE
         ptMQ==
X-Gm-Message-State: AOAM530jqZvlKaxMJlaLhsFs1YOXEu4WJNA0e/cZvumD3605Ylt8qmYe
        I2V0q+q/u9QWZjMV9Jz9pmq75Q==
X-Google-Smtp-Source: ABdhPJygIeEq0XQcTZszD/f8Pw8GadQI9iAu+pSbE76cR1fnWH7aX8MMtOjlkXMCzIf9H/9udEKMAA==
X-Received: by 2002:adf:e485:: with SMTP id i5mr2662750wrm.22.1632863434832;
        Tue, 28 Sep 2021 14:10:34 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id n68sm3885773wmn.13.2021.09.28.14.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 14:10:34 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/7] media: ipu3 i2c: Fix v4l2-compliance issues
Date:   Tue, 28 Sep 2021 21:10:26 +0000
Message-Id: <20210928211033.2415162-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix some issues found with v4l2-compliance. Tested in Soraka which also
has some subdevices that had some issues with v4l2-compliance.

Ricardo Ribalda (7):
  media: ipu3-cio2: Check num_planes and sizes in queue_setup
  media: ipu3-cio2: Set valid initial format
  media: ipu3-cio2: imgu_fmt: Handle properly try
  media: ipu3-cio2: VIDIOC_QUERYCAP: Fix bus_info
  media: dw9714: Add implementation for events
  media: ov13858: Add implementation for events
  media: ov5670: Add implementation for events

 drivers/media/i2c/dw9714.c                    | 14 ++++++++++++--
 drivers/media/i2c/ov13858.c                   | 11 ++++++++++-
 drivers/media/i2c/ov5670.c                    | 11 ++++++++++-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  8 ++++++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  9 +++++----
 5 files changed, 43 insertions(+), 10 deletions(-)

-- 
2.33.0.685.g46640cef36-goog

