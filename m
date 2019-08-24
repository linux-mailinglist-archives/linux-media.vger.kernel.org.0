Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C959BED2
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2019 18:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfHXQdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Aug 2019 12:33:44 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45698 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbfHXQdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Aug 2019 12:33:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so7703730pgp.12
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2019 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qpxEdkDtTE99r0+Kr90WVH88+l8gQz0brzUUDfwcMJM=;
        b=RaXN3hZw5v8OHEix8mRBKw3HzyctJYbyrb0Vv2v4BUFyrud8mqJiXGsCqyi+nI5MMS
         0lW0hUsW/jErIk9Ftb+3aMnTq7YyYZ8UBSNDhYJYGmUIopmM0gGsSjun1t6mRiVfcWn4
         NE3M8H1yERRZQ66cT80LC46XCwa+tjFHM+Wwdj06/6U3/gB3lVF6zQO32cf7IU+gQjf8
         gS4+Gw8SjbtuikMvUQWBVapoySzVJ1OPWKpUqncfypSZf/0HA95Ro0u4Udb496phJwSv
         ZelqFWNoLZJfvRRRqszwrpx04fWzw+T8GwNe8cdrRWYpEUwU9WQ6SkGBGeQuo6IKYZv+
         Venw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qpxEdkDtTE99r0+Kr90WVH88+l8gQz0brzUUDfwcMJM=;
        b=EqdVS4g3WWzdZzk+QP/f8t/UdFAq6bVLeDJdO0rbhVR4itR3aTmShlUHXMX+ZddW8+
         PK5cssyrXN2aIqqiMDtFXkF2bMc0dN7dpQp20XQVPYXrCvKtCLs+DT++MghB8tOJmxTB
         2O+WI6vEBJEhfCfQ/8EwouLS1ctL8ALiuNHdY06XYOKDf3noct8UAr/oFsjiRFDJZl7j
         o3BXO4qyN825tT17uIc54+iJgHYQTtxTPAaxUVRCyr7p+igKD3+u47hXZpoZpSakcTrM
         x7gYdHFOlDvg60re8PIFcDaDJE6viq+OHa1owjpHr2ZrjwhhGgUALY8Z/N/5Ho1jj5bR
         XuGw==
X-Gm-Message-State: APjAAAUd8enhqFCDWuMVs20SKo+iKc8L15JI13V6fDSUfoWBK9+iaE58
        I2lT4OVj8jNBI8kg8wnuUIKrk56B
X-Google-Smtp-Source: APXvYqxjO4aMUqF437lNL1kTqrgmiH6yGSX7fiTp10uGthpoLkMD7kt9bq3yTlinFILyOZ9SKieSwg==
X-Received: by 2002:a17:90a:c68c:: with SMTP id n12mr11129933pjt.33.1566664423162;
        Sat, 24 Aug 2019 09:33:43 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id k3sm5733018pjo.3.2019.08.24.09.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 09:33:42 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 0/2] media: imx: Fix subdev unregister/register issues
Date:   Sat, 24 Aug 2019 09:33:35 -0700
Message-Id: <20190824163337.8260-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the media device module is removed and re-probed without also removing
and re-probing the subdevice modules, .unregister() and .register() ops
are called on the subdevices without the subdevice drivers being removed
and re-probed. This creates two problems:

- the CSI and PRPENCVF subdevices attempt to register a stale video capture
  device resulting in the kobject "tried to init an initialized object"
  backtrace.

- pad graph objects are added to the media device pad list twice, resulting
  in list corruption on the pad list.

The following two patches fix those issues.

History:
v2:
- Add missing local var ic_priv in prp_registered() in first patch.

Steve Longerbeam (2):
  media: imx: Move capture device init to registered
  media: imx: Move pads init to probe

 drivers/staging/media/imx/imx-ic-prp.c        | 25 ++++-----
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 51 ++++++++++---------
 drivers/staging/media/imx/imx-media-capture.c | 15 +++---
 drivers/staging/media/imx/imx-media-csi.c     | 35 +++++++------
 drivers/staging/media/imx/imx-media-vdic.c    | 27 ++++------
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 27 +++++-----
 drivers/staging/media/imx/imx7-media-csi.c    | 38 +++++++-------
 drivers/staging/media/imx/imx7-mipi-csis.c    | 23 +++------
 8 files changed, 114 insertions(+), 127 deletions(-)

-- 
2.17.1

