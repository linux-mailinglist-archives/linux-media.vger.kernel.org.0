Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E33E47B4
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 11:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438872AbfJYJrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 05:47:11 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35314 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438836AbfJYJrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 05:47:11 -0400
Received: by mail-lf1-f66.google.com with SMTP id y6so1206889lfj.2;
        Fri, 25 Oct 2019 02:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6eirW4NBi16Kvo5Dh5yyQapiDDYkl5K/PGUWrysKXq0=;
        b=Pu2V5WOtgvnwTDPCt1/n3ii0Y6nVoZ6H3ugc70sbV2tKC4G0JJHNb5Sx8f5pWApMnp
         Eu4FbEyJKmLC+aSsS9Dd260N/6vaUXK9wlx2faa3TxV5uK8jUmkHRlXgsLA89AVS8Je9
         bNpMwysi1Vvhw9+1CpqaYynsvTTUCr3bC3F53S1mfDj1wXNdVwX0YHddSj4kDIkjVIhw
         NVSn2o2DMZFxLnz7zTpIAXEVZxPY78mQPD4pDnIxslLQPjZ06bDPvEShBDg1fugjgrGa
         kxcQT7WZPGtvnxnH80R14wied9GYWt/BVOS3/rQ3Qvg/2vZuYjo0A4HjRZlUp7pGKTEj
         CzJQ==
X-Gm-Message-State: APjAAAWqanEG5mJNq3JivSyCAmE7WUSVcoWjRs2LqBoCR/dqQFlVtubS
        qmVzNWzjBcsjryNvkq65uEM=
X-Google-Smtp-Source: APXvYqygr8TZ9oIml7y17u/lHTi2jbAY+LwT+Q2s+sgmZ3TaMDnluE1o1RqVDkDDKjll4Fx0SBX9Ig==
X-Received: by 2002:ac2:5deb:: with SMTP id z11mr938373lfq.35.1571996829137;
        Fri, 25 Oct 2019 02:47:09 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o196sm573858lff.59.2019.10.25.02.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 02:47:08 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v4] Documentation: media: *_DEFAULT targets for subdevs
Date:   Fri, 25 Oct 2019 11:47:06 +0200
Message-Id: <20191025094706.6490-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some sensors have optical blanking areas, this is, pixels that are
painted and do not account for light, only noise.

These special pixels are very useful for calibrating the sensor, but
should not be displayed on a DEFAULT target.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/uapi/v4l/v4l2-selection-targets.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
index f74f239b0510..aae0c0013eb1 100644
--- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
+++ b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
@@ -38,8 +38,10 @@ of the two interfaces they are used.
     * - ``V4L2_SEL_TGT_CROP_DEFAULT``
       - 0x0001
       - Suggested cropping rectangle that covers the "whole picture".
+        This includes only active pixels and excludes other non-active
+        pixels such as black pixels.
+      - Yes
       - Yes
-      - No
     * - ``V4L2_SEL_TGT_CROP_BOUNDS``
       - 0x0002
       - Bounds of the crop rectangle. All valid crop rectangles fit inside
-- 
2.23.0

