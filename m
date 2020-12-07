Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFA42D0D5D
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 10:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgLGJtf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 04:49:35 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57253 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbgLGJtf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 04:49:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mD8TkF28FarN7mD8Wkz0Vr; Mon, 07 Dec 2020 10:48:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607334533; bh=qjVe3c70pGyTCA/ReOAOmOvLLmBuawMnV6ApSaMNo8g=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y2HeaXDoIHyXgpw/FGrpFYl41nyWfLBz21c7fg39yZcQ7BqsTighwu4fWQyR+sShV
         HCHb+SXnlvcEox2pveYlkaAttBE676W6IZv9tl2/b9h7Lkf5BwtgEpnPUGmIWZ9ALR
         qfNLqcLf2SMFss2T0YaK3mgZ6pELrU2q/zEN3SIChnhl1HbNYQw9lJ0+/Ne3z0Ftjp
         bvB0CzrecLt2iSkoWF++4Qr6riLgFG+Iy3XCwHXdp5SGqMR0LQUB/9sHGOuZ+Q8KMo
         XREbghN80Cmyb7VZ5xtNXh+7Xs8Fuc+28KXRMcTtKmSBNTYpxa0cZSvMMdUQa/Di7V
         rpgUGJlri7jbA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11 or v5.12] Rework RGB and YUV pixel formats
 documentation
Message-ID: <203c4f5f-8d4c-caad-9384-9f55d037ff9e@xs4all.nl>
Date:   Mon, 7 Dec 2020 10:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE/GHYx+7o6C04CcMRaC/cJxHhWMZ2xEUtqRBPXlmDam/nQm+fiJOlGN6kb95MIX20Hs5qjh8eOoduWbR72maYjU1mplboRFy/WLCyTvdui6rFzNKj3a
 w94NX6M396QO4o+zniHE7RfXAHizb/lUbV4nlR62LwWlIlYAhFs1LAlUGKt9E0zsBTHwFmTkhwPVFQv9mJKTFoi/v5HRa49m7J4EvPtMSsnRjcX8oEzQe99f
 iIkOwpWgscTKS6z17okgZQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See the cover letter for all the details:

https://patchwork.linuxtv.org/project/linux-media/cover/20201206230316.1221-1-laurent.pinchart@ideasonboard.com/

This is really nice work, so I hope it can still make the cut for v5.11.

No code was changed, only videodev.h was modified but that only removed a comment
and moved two pixfmt definitions around.

Regards,

	Hans

The following changes since commit 63288c829b1a5991d8f8c15cab596108ed206ba6:

  media: pixfmt-compressed.rst: fix 'bullet' formatting (2020-12-03 12:27:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11f

for you to fetch changes up to 07a3faa17031f878927b41e551bb9eee9684f590:

  media: doc: pixfmt-yuv: Move all planar YUV formats to common file (2020-12-07 10:12:01 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (16):
      media: videodev2.h: Remove unneeded comment about 4CC value
      media: videodev2.h: Move HI240 format to vendor-specific section
      media: videodev2.h: Move HM12 format to YUV semi-planar section
      media: doc: pixfmt-rgb: Remove layout table for packed RGB formats
      media: doc: pixfmt-rgb: Add title for deprecated formats
      media: doc: pixfmt-rgb: Clarify naming scheme for RGB formats
      media: doc: pixfmt-rgb: Make 8 bits per component table more compact
      media: doc: pixfmt-rgb: Replace '-' with 'X' to denote padding
      media: doc: pixfmt-yuv: Document subsampling in more details
      media: doc: pixfmt-yuv: Move all packed YUV formats to common file
      media: doc: pixfmt-packed-yuv: Fill padding bits with 'X'
      media: doc: pixfmt-packed-yuv: Express 4:4:4 formats in a more compact way
      media: doc: pixfmt-packed-yuv: Clarify naming scheme for 4:4:4 formats
      media: doc: pixfmt-yuv: Move all luma-only YUV formats to common file
      media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common file
      media: doc: pixfmt-yuv: Move all planar YUV formats to common file

 Documentation/userspace-api/media/v4l/pixfmt-grey.rst       |  44 ---
 Documentation/userspace-api/media/v4l/pixfmt-m420.rst       |  59 +---
 Documentation/userspace-api/media/v4l/pixfmt-nv12.rst       | 129 --------
 Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst      | 144 ---------
 Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst     |  60 ----
 Documentation/userspace-api/media/v4l/pixfmt-nv16.rst       | 153 ---------
 Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst      | 157 ----------
 Documentation/userspace-api/media/v4l/pixfmt-nv24.rst       |  95 ------
 Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst | 412 ++++++++++++------------
 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst        | 671 +++++++++++----------------------------
 Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst       | 110 -------
 Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst       | 108 -------
 Documentation/userspace-api/media/v4l/pixfmt-y10.rst        |  65 ----
 Documentation/userspace-api/media/v4l/pixfmt-y10b.rst       |  33 --
 Documentation/userspace-api/media/v4l/pixfmt-y10p.rst       |  43 ---
 Documentation/userspace-api/media/v4l/pixfmt-y12.rst        |  65 ----
 Documentation/userspace-api/media/v4l/pixfmt-y14.rst        |  65 ----
 Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst     |  69 ----
 Documentation/userspace-api/media/v4l/pixfmt-y16.rst        |  69 ----
 Documentation/userspace-api/media/v4l/pixfmt-y41p.rst       | 151 ---------
 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst   | 126 ++++++++
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 950 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst     | 127 --------
 Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst    | 115 -------
 Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst     | 143 ---------
 Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst    | 152 ---------
 Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst    | 141 ---------
 Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst    | 129 --------
 Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst    | 141 ---------
 Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst       | 118 -------
 Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst       | 108 -------
 Documentation/userspace-api/media/v4l/yuv-formats.rst       | 278 +++++++++++++++--
 include/uapi/linux/videodev2.h                              |  14 +-
 33 files changed, 1714 insertions(+), 3530 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-grey.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
