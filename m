Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA65108F14
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 14:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfKYNlU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 08:41:20 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46289 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727682AbfKYNlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 08:41:20 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZEc7iLiG3LwWdZEcAiVX7O; Mon, 25 Nov 2019 14:41:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574689278; bh=JBTZUrI5rbqeoqWzoU+SAj6zPhCeXuggOHp/frbeVQ4=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=t8azJAmgzYh3DonwTHX8TsG9gxub8PTKUF0XVEMmKWCf5e+vqWjRAcBRDIzAx3wNw
         dRz/TdVBbY13UcYDMb8D24kRaDtG0595QSM6iTop/Uj+Wuj+TztvDUsNi/mj29khSM
         OvS2CBXM9vgAs3CYGhp+e85akD6YuUPWI4JxQJTQnT3f7Y6TyPCgufB6rvpAOX7htr
         lNfudfVq0RqJEyJFen6Bt6ArdFg+cgpS8Fp/N/bw3x0p6RqXSStwQAVd6RDNOH9ZNQ
         9QM1qGm520sw69uZMxkGqIVHJeWwb+WvVObLlImIjjlFPgzk+cmwIcvBU6TMGkLERD
         5t3I+NiFEtUfA==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] ti-vpe: cal: maintenance
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benoit Parrot <bparrot@ti.com>
Message-ID: <0bb5cc88-e7a3-498e-0e00-2e63bbb74054@xs4all.nl>
Date:   Mon, 25 Nov 2019 14:41:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDfR8QpC3+ANwJpyIbAVgody1kHaTz+0Iq1cP3172xrifqZeSHeOKYWhZ54nmyXBO6CiC+nv0qMSxUJTsRNjGMoZt9Cm8QMEV7aRs/b1G0i+iXNuV4dJ
 6mtLraJlifF0eL2T8XMpjd2Lq28kjE/XUnAbNJ54ebL//nnsfAAndt2tBicLYigJUfQqNg5i52eBxDwAHUlNzwAVxN3x2P6WSU0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ti-vpe/cal maintenance fixes.

The following changes since commit dca6b3733a4a46e63603496f544ece8ace541fde:

  media: Revert "media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding" (2019-11-10 18:10:11 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6a

for you to fetch changes up to e477230a0e188a5ba69c53dc9e055b788d1b87d3:

  dt-bindings: media: cal: convert binding to yaml (2019-11-25 14:30:08 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (19):
      dt-bindings: media: cal: update binding to use syscon
      dt-bindings: media: cal: update binding example
      media: ti-vpe: cal: switch BIT_MASK to BIT
      media: ti-vpe: cal: Add per platform data support
      media: ti-vpe: cal: Enable DMABUF export
      dt-bindings: media: cal: update binding to add PHY LDO errata support
      media: ti-vpe: cal: add CSI2 PHY LDO errata support
      media: ti-vpe: cal: Fix ths_term/ths_settle parameters
      media: ti-vpe: cal: Fix pixel processing parameters
      media: ti-vpe: cal: Align DPHY init sequence with docs
      dt-bindings: media: cal: update binding to add DRA76x support
      media: ti-vpe: cal: Add DRA76x support
      dt-bindings: media: cal: update binding to add AM654 support
      media: ti-vpe: cal: Add AM654 support
      media: ti-vpe: cal: Add subdev s_power hooks
      media: ti-vpe: cal: Properly calculate max resolution boundary
      media: ti-vpe: cal: Fix a WARN issued when start streaming fails
      media: ti-vpe: cal: fix enum_mbus_code/frame_size subdev arguments
      dt-bindings: media: cal: convert binding to yaml

Nikhil Devshatwar (1):
      media: ti-vpe: cal: Restrict DMA to avoid memory corruption

 Documentation/devicetree/bindings/media/ti,cal.yaml | 202 +++++++++++++
 Documentation/devicetree/bindings/media/ti-cal.txt  |  72 -----
 MAINTAINERS                                         |   1 +
 drivers/media/platform/Kconfig                      |   2 +-
 drivers/media/platform/ti-vpe/cal.c                 | 773 ++++++++++++++++++++++++++++++++++++++----------
 drivers/media/platform/ti-vpe/cal_regs.h            | 221 ++++++++------
 6 files changed, 937 insertions(+), 334 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
