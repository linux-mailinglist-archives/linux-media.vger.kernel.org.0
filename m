Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AD72F5042
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 17:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbhAMQnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 11:43:24 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42915 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbhAMQnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 11:43:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zjECkKK0fAiIczjEFkeILe; Wed, 13 Jan 2021 17:42:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610556159; bh=QjptJiNz86mdClYrClXx1IRfzUIRd4GB9Y2otxlFmJQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cMoFURYpxos2C17ws4LnmpfZBhDsNyTUXm9Xkv5gbknXIGByUoKqvpwo/PKFoHoWW
         gdCJKi+wB15LkGSmW+51iTv6DdQFZwLl1WaEiuBdEo4q7nFzCvYfH1udwV+xDnhaFe
         ttMd/sLsMCccLMj7tlNKpSG/eNGxrITeZsX1gh8aBpDpH4vcywx9l9+LFuEsnPbWZ/
         eRR2lfBMi6en8+xxjVZSNVbfNzdwz748VLCe8yuGBChDTctgnppLHtW2iD6kZhfwT2
         vAxRRr8+Qbdm+3R9r8RQTxKDBNbHnfOt5N0MzicIgM0NDwdzaB5KHKyeDv1dfrYE6P
         fGT6Y5Rg1Y4vA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] Various fixes/enhancements
Message-ID: <38f99047-2ecf-ab1b-630e-6cf1853f548f@xs4all.nl>
Date:   Wed, 13 Jan 2021 17:42:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH3o1j0pLZEBDHvppLm4Gm3uGa5Rn1bn6rzcJe55plpbMSwnqmEWG+iakT0a9Q5lYXBqPnfX2gT2k3NC9nfyf1JsyI0nAUHXlaYb/CXG5ACaDQYnomF6
 RFlCyJcK5K+MUjkdbtrYpUOF/99fbYexb+ZIVZZDPjWXk0tQG0I+DanK8A6RSHwUr66s/4P+e3yu3geaYs0SOYQRT/OhUkyrZi3WV9fFdl3wIBrw30lMG+9K
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 7371093f983d35d60a7fac3a6f082de7fefe3648:

  media: venus: helpers: Wire up hfi platform buffer requirements (2021-01-13 09:20:55 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12b

for you to fetch changes up to 7ea861cead04c80a27f41f0aeab65541b682d378:

  media: atomisp: convert comma to semicolon (2021-01-13 17:14:32 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dikshita Agarwal (5):
      media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
      media: v4l2-ctrl: Add layer wise bitrate controls for h264
      venus: venc: Add support for frame-specific min/max qp controls
      media: v4l2-ctrl: Add base layer priority id control.
      venus: venc : Add support for priority ID control.

Fabio Estevam (1):
      media: imx7: csi: Fix regression for parallel cameras on i.MX6UL

Rui Miguel Silva (1):
      media: imx7: csi: Fix pad link validation

Sakari Ailus (1):
      ccs: Make (non-)use of uninitialised variables more robust

Tomi Valkeinen (1):
      media: ti-vpe: cal: fix write to unallocated memory

Zheng Yongjun (2):
      media: zoran: convert comma to semicolon
      media: atomisp: convert comma to semicolon

Zou Wei (1):
      media: ti-vpe: cal: Mark cal_camerarx_media_ops with static keyword

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst |  81 +++++++++++++++++++++++++++-
 drivers/media/i2c/ccs/ccs-data.c                          |  24 +++++++--
 drivers/media/platform/qcom/venus/core.h                  |  20 +++++++
 drivers/media/platform/qcom/venus/venc.c                  |  21 ++++++--
 drivers/media/platform/qcom/venus/venc_ctrls.c            | 121 +++++++++++++++++++++++++++++++++++++++---
 drivers/media/platform/ti-vpe/cal-camerarx.c              |   2 +-
 drivers/media/platform/ti-vpe/cal.c                       |   4 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                      |  16 ++++++
 drivers/staging/media/atomisp/pci/sh_css_params.c         |   6 +--
 drivers/staging/media/imx/imx7-media-csi.c                |  27 +++++++---
 drivers/staging/media/zoran/zoran_driver.c                |   2 +-
 include/uapi/linux/v4l2-controls.h                        |  17 ++++++
 12 files changed, 309 insertions(+), 32 deletions(-)
