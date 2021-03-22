Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBB0344997
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhCVPr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:47:26 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59621 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230053AbhCVPrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:47:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OMlelxHbZ4XAGOMlilYPSR; Mon, 22 Mar 2021 16:47:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616428022; bh=WZFzTYvoonInBM5u3kwPkOtI8L2CJyla85fZT4b4a7o=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=EML4GzJrHGycURP3iXyEm3cV5+Gr6npoNoHKXfpju+m3tMrq8bvgGmjCD0cq+twyE
         gSZIm7Dirj03BNoKs9DQxVPQQCqiik14kfaPQBq0UN5XMsQ07lFklDAa7mNJt9IHGI
         8kRZ1hXyW96dxL8Laqc2XANVg1Qvvrw7+UMeatbf+vfLBd6ZZe9R0CVnS79APOAa7F
         maSQ8Up8Cv1b/ndk/rSloR9+21udQ+cH2WtJMR3I0Oqa3nxzyWI6qPgQHIHwcsYad/
         lNeT52QbwC9DOvjlwU6W8HknqPRxWEmGzip2BTMcFsYPeJg0//SjruCREMG2ZJnLZM
         2/XdU12AuO8sA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Edgar Thier <info@edgarthier.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 0/3] Rebased 3 uvc pix_fmt patches
Date:   Mon, 22 Mar 2021 16:46:55 +0100
Message-Id: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKxNnVhm/ns9fQZY7nTtooHC/ljqR/ZbmX/1gBYkibWDC5s7UBNZ5LE+bC3WKMcOfiZlA6JvgrHssojvcEMJOplESQIw7uOn9mazApB5CuWKZWdVzQiL
 yKmAIpR9G0bBBrcVeSJkubM8+nZ8fjV90Hj2WG8JtQ5QRwZOOugTXvOSs5AZntJhIviEdIp7desQe5bgjVZ3MyGDs7i1gKEjgY/kOsRIi3hL24jZc2Bvz0tz
 IU/B8r20i79dvAJGBVu9wFaoIDGSdzmtGNxBCHKSbjjHOiFoeVrnYRL4W4D9txmw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This small series rebases three old patches that slipped through the
cracks, but are otherwise fine.

Two from Edgar:

https://patchwork.linuxtv.org/project/linux-media/list/?series=329

and one from me:

https://patchwork.linuxtv.org/project/linux-media/patch/6e8bde09-7b47-5dec-6f21-c5156fbc9b10@xs4all.nl/

Since my patch depends on the Edgar's patches I decided to just
rebase the lot and repost. Hopefully it won't take two years for
the v2 to be merged. :-)

Regards,

	Hans

Edgar Thier (2):
  v4l: Add 12-bit raw bayer linear packed formats
  uvc: Add 12-bit raw bayer linear packed formats

Hans Verkuil (1):
  uvc: don't set description in ENUM_FMT

 .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
 .../media/v4l/pixfmt-srggb12lp.rst            | 74 +++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c            | 70 ++++--------------
 drivers/media/usb/uvc/uvc_v4l2.c              |  9 ---
 drivers/media/usb/uvc/uvcvideo.h              | 15 +++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
 include/uapi/linux/videodev2.h                |  7 ++
 7 files changed, 114 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb12lp.rst

-- 
2.30.1

