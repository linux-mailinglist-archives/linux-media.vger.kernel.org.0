Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA1D41EBC8
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353729AbhJAL1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352896AbhJAL1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:10 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E71C06177B
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t8so14987803wri.1
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fTtmLfOCpdg82rj8w493AIJsfz7Tq3NPSgiPIVGMf6E=;
        b=NCTTS38igTJB41//wXYbmIuXM+fveqgmEn8LmfvwamXlen7LVOZrQSVECdcO59BJ2t
         HOrX+LnojyL7b094Pw5K9+W1CU47y4e28ug3ROJOLXCsUxnrm+MypGsjS5G2nUt831p4
         QFESnkZFcZqKkCieAFaqwlm534QRFqWBJG1As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fTtmLfOCpdg82rj8w493AIJsfz7Tq3NPSgiPIVGMf6E=;
        b=JM1nyhMb2mR+Xczf56v2Qd8XfLBUGkoKSxDnc3tt850nUm5+xspdThtZbInZgbRfTU
         TKvdGQngKxTkjiJDkZqMpmW1xdUjgoxL8mEuhu2n3nAZ3mkN9zgM0vIC4DvT1I5IY4U1
         z2yW0tOuYkbi2mhQxg7xRj8/59mcFhRoXMHIAsPU3zSw/87F9iRRPOg2GJrncmgEPlZI
         4wVLNF+gFiV//q4lOI9yMTE9JtVbuOC2wkQXjBKOW177mZFDhltmSSR4cH2rz+WqGJ/W
         B+Ol3Yd09HJ6T3LeOGUn5UMiS9GQBKAIrSTdNubBN6JgNEYJ9+6J8HrkL04ySj3btQqQ
         cfxQ==
X-Gm-Message-State: AOAM533idd89lhdNL7RPfFfIT/Ae4zGSYH9PezacL/y0g7gvAyvFq7XJ
        jKVcYApHQNGbL/YQaUwFZ+VsVg==
X-Google-Smtp-Source: ABdhPJyh2znq94x4U+ELpfWxo82SA4SOXRaXcXprbccbHxcYcek2ugFP7fZlSo+kebJUfWlhJYDFCQ==
X-Received: by 2002:adf:ab50:: with SMTP id r16mr7356858wrc.402.1633087524945;
        Fri, 01 Oct 2021 04:25:24 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:24 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/8] media: ipu3 + i2c: Fix v4l2-compliance issues
Date:   Fri,  1 Oct 2021 11:25:14 +0000
Message-Id: <20211001112522.2839602-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix some issues found with v4l2-compliance. Tested in Soraka which also
has some subdevices that had some issues with v4l2-compliance.

v1->v3: Changelog

- Rename cio2 to imgu
- Refactor bytesperline calculation

Ricardo Ribalda (8):
  media: ipu3-cio2 Check num_planes and sizes in queue_setup
  media: ipu3-imgu: Refactor bytesperpixel calculation
  media: ipu3-imgu: Set valid initial format
  media: ipu3-imgu: imgu_fmt: Handle properly try
  media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
  media: dw9714: Add implementation for events
  media: ov13858: Add implementation for events
  media: ov5670: Add implementation for events

 drivers/media/i2c/dw9714.c                    | 14 ++++++++++++--
 drivers/media/i2c/ov13858.c                   | 11 ++++++++++-
 drivers/media/i2c/ov5670.c                    | 11 ++++++++++-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  8 ++++++--
 drivers/staging/media/ipu3/ipu3-css.c         | 19 +++----------------
 drivers/staging/media/ipu3/ipu3-css.h         |  1 -
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 11 +++++++----
 drivers/staging/media/ipu3/ipu3.h             | 12 ++++++++++++
 8 files changed, 60 insertions(+), 27 deletions(-)

-- 
2.33.0.800.g4c38ced690-goog

