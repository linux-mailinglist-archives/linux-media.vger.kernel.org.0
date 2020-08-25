Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F21825151E
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 11:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgHYJPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 05:15:42 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:44537 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729036AbgHYJPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 05:15:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AV3JkXyR9uuXOAV3Kk79ou; Tue, 25 Aug 2020 11:15:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598346938; bh=vwFN1tcxuXN3Tw0ZGoyeGr6uy0EAGUxwSPFbwyDgKE0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QrCMrkn+LzmWx3a82qUnkkMXUFGIVOjw00TwU6b8e8mNi9Hxicft8YLuj2Nr77zc9
         sCNZn6MjGazMBBtzwF3wibAw+gmY1DBLK/+sDgNGXsO7T90BzU3v8KcKcFETWSvMIA
         Atekmc3zLp5g6UwxHF6nKvuKxHIEU2x6M5aYNfoaMIzBlHz2oyxnNyUafHuymPYdRp
         jfB9d4TlX72KYCoK3YXqtlvNRKpkReOGhjqMW599T6bgyVVgC7klD0QxZWM8TsdPyR
         I15s1FCdrlapXaP9uRzEyLZQhI0xaeRXZJVnEmjY2r21G8RfClzac0eEwIgtxEkVSV
         IHA7YL2FsXBrA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] H.264 API cleanup patches
Message-ID: <7e9fe6a3-fb71-c6e8-03f7-06d009739368@xs4all.nl>
Date:   Tue, 25 Aug 2020 11:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDr+qgsm+eDYCYI4USVYjI3WWgh11hBXUEqO4i5lHxniZTEQwY+AQknjSA8pDDJGGjR5PoMqopAfCGxHGjlzj5pAvqbW+fC83scn2mH5bAKWMRhlAGv8
 876cqyX1KWrSc4NQCRrhw3eLwhFGV52TIqzancWr4cBqkVSYBe6XYNaO+v8TiI4h9It6EpWFJVJT0JsfIO6xiMWhsP/gC9v5rC0yzCqfI6m5OMyinX2tpHi/
 IW/skLC/O5q/qUtjURegcxu2tTrsg1zuMJefEcfOhJrNNfeg4HeUYWhVaHaRcHIjD872oFePXOtwUxsY2rnSBg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hopefully we can move the h264 stateless codec API out of staging after
this series is merged.

As far as I am aware the only outstanding issue is to verify that possible
future MVC support is something that can be added without requiring changes
in the current h264 controls.

Many thanks to everyone who has been working on this!

Regards,

	Hans

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-h264

for you to fetch changes up to b23670ca97bab2ec501139ed6f57765fcb92d850:

  media: cedrus: Use H264_SCALING_MATRIX only when required (2020-08-25 10:41:54 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (15):
      media: uapi: h264: Further clarify scaling lists order
      media: uapi: h264: Split prediction weight parameters
      media: uapi: h264: Increase size of 'first_mb_in_slice' field
      media: uapi: h264: Clean DPB entry interface
      media: uapi: h264: Increase size of DPB entry pic_num
      media: uapi: h264: Drop SLICE_PARAMS 'size' field
      media: uapi: h264: Clarify SLICE_BASED mode
      media: uapi: h264: Clean slice invariants syntax elements
      media: uapi: h264: Rename and clarify PPS_FLAG_SCALING_MATRIX_PRESENT
      media: hantro: Don't require unneeded H264_SLICE_PARAMS
      media: rkvdec: Don't require unneeded H264_SLICE_PARAMS
      media: rkvdec: Drop unneeded per_request driver-specific control flag
      media: rkvdec: Use H264_SCALING_MATRIX only when required
      media: hantro: Use H264_SCALING_MATRIX only when required
      media: cedrus: Use H264_SCALING_MATRIX only when required

Jernej Skrabec (3):
      media: uapi: h264: Update reference lists
      media: cedrus: h264: Properly configure reference field
      media: cedrus: h264: Fix frame list construction

Philipp Zabel (1):
      media: uapi: h264: Clarify pic_order_cnt_bit_size field

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 233 +++++++++++++++++++++++++---------------------
 drivers/media/v4l2-core/v4l2-ctrls.c                      |  28 ++++++
 drivers/media/v4l2-core/v4l2-h264.c                       |  12 +--
 drivers/staging/media/hantro/hantro_drv.c                 |   5 -
 drivers/staging/media/hantro/hantro_g1_h264_dec.c         |  26 +++---
 drivers/staging/media/hantro/hantro_h264.c                |  12 +--
 drivers/staging/media/hantro/hantro_hw.h                  |   2 -
 drivers/staging/media/rkvdec/rkvdec-h264.c                |  37 ++++----
 drivers/staging/media/rkvdec/rkvdec.c                     |  14 +--
 drivers/staging/media/rkvdec/rkvdec.h                     |   1 -
 drivers/staging/media/sunxi/cedrus/cedrus.c               |   9 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h               |   1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c           |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c          |  61 ++++++------
 include/media/h264-ctrls.h                                |  87 +++++++++--------
 include/media/v4l2-ctrls.h                                |   2 +
 include/media/v4l2-h264.h                                 |   3 +-
 17 files changed, 290 insertions(+), 245 deletions(-)
