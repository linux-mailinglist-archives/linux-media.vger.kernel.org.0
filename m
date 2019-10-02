Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8B8C4AC7
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 11:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfJBJsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 05:48:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43817 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfJBJsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 05:48:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id q17so18853544wrx.10
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=rFUo0wL7r9rOV0bdfOWH9wO7Z+8/KHqte+nYimGmjnA=;
        b=yA+z2vS+DAyEINXIQoI9hvtVrmYzhxJSf/+pi6KcZ/spJtDxzKpqOaDs+CsI9KO6ce
         jL1Rw3bt/WE2vWrfRpPQ7xujn5smKXw+HDnefWwr4fZ9SeH5NIO1xovlIFVXFzGnGf1w
         Q64tH9LYiG88TCZPC9U7KwN2dxJbDWEbK60dRpdxpBXsn8ybmZIALBGj5IwvKq2BVl/B
         XoZdjuFngcgOBMxZCddKAGlkwYAEFbLbUVRjs4RxhvGN1J7v+RwgZO3EYTDMSb4jn5E9
         YVhUAKTKMcHvrpUaBHmntfOSKWnj1paHkpeqgR3sr7qtwP2vxaB8yepYeXWldB63bFF1
         iIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=rFUo0wL7r9rOV0bdfOWH9wO7Z+8/KHqte+nYimGmjnA=;
        b=NMA4A0/Mxx0k5xFGjl9PexwL1qkbT0UD63V5ZD49lNjabRhnlPsxEw0qNCbfUHZQmJ
         rDD15zBMvruEZt+NIvxELrsF4/1HDCnsgahcXDcGazSi/lOlvRpjq+AUMdl1oxWiFO0a
         T+B6CA34nhL50qulf82MA2UXX7iQ9qiQJiBlGOfS37Nhkg5d6l4rhUSTH7AQLnje3sGS
         8jYhsN2XyuMzfpV4gXo0k30v08ELLPwDdAKNsXOi4WXLrWC2fvArhxDTwXl0HbvRoJar
         EgAWigwLLRe07wBxylkHbAiAZCfEVZ4BxRkYaFP1Y8wwU8m8Y5ZBjADA2Qs/f5jICwF8
         At2g==
X-Gm-Message-State: APjAAAUPGa2cmZqyKK1e6LWOFrvZpkjZ5YlUIeIYPCtG6wyVmc8ZNLrI
        DAd8UtzAzV1uD9W7fnWpR8lVkYZr7gY=
X-Google-Smtp-Source: APXvYqyLYwnZHoc47rojVOzkTC+eyYZgWoSVQsdr2ayOFbFYZYKpPiLHmmhyTNsy2CNT9V2INK1dXQ==
X-Received: by 2002:adf:b3d2:: with SMTP id x18mr2072713wrd.264.1570009693343;
        Wed, 02 Oct 2019 02:48:13 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id g24sm17118865wrb.35.2019.10.02.02.48.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:48:12 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.5] Venus updates
Date:   Wed,  2 Oct 2019 12:47:43 +0300
Message-Id: <20191002094743.28589-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The Venus driver updates include:

* three fixes: fail to suspend, enum frameinterval issue with encoder
and frequency table modifications for v3 to handle performance issues.
* two new features: interconnect bandwidth support on v4 and more precise
clock-scaling on v4.

Please pull.

regards,
Stan

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.5

for you to fetch changes up to 122742a5edf5a5dff7526ff064ccddf627c27dcd:

  venus: Update clock scaling (2019-10-02 11:24:41 +0300)

----------------------------------------------------------------
Venus updates for v5.5

----------------------------------------------------------------
Aniket Masule (2):
      venus: Add codec data table
      venus: Update clock scaling

Loic Poulain (1):
      venus: core: Fix msm8996 frequency table

Stanimir Varbanov (3):
      venus: Use on-chip interconnect API
      venus: venc: Fix enum frameintervals
      venus: Fix occasionally failures to suspend

 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/qcom/venus/core.c      |  56 +++++-
 drivers/media/platform/qcom/venus/core.h      |  30 ++++
 drivers/media/platform/qcom/venus/helpers.c   | 246 ++++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h   |   3 +-
 drivers/media/platform/qcom/venus/hfi_venus.c |   6 +
 drivers/media/platform/qcom/venus/vdec.c      |   8 +-
 drivers/media/platform/qcom/venus/venc.c      |  27 ++-
 8 files changed, 346 insertions(+), 31 deletions(-)
