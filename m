Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4505D3E01E8
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 15:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238108AbhHDN2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 09:28:20 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33815 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237961AbhHDN2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 09:28:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BGwGmKGzt4JsbBGwImocl4; Wed, 04 Aug 2021 15:28:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628083686; bh=YRR2gS0QkBDOTVo9wEOSjSRwEuc9HmfJBrGKcLdy+jM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gsixpVoC0k44fhxmCC2oGul/jdpKfamDUOIBqvj9fLB9Dt4ugvSZHd4scTAR7lUAv
         SVuI37sk8IF06/C7TUr0TrP70AJDaCfPsyeTRQy5vBuFs+yzl4FgTFX+lf1EEY6znm
         uxjRKwuZk+fjwFMz12lhCBpeGO8n/j7MyNVbOpiO3H6hZnWKZflMSVPpuMj2kjjC+x
         M5moBsQMVFce0zocPpjUCNHJ39CB41cgjmNnr92+y8h/qluovq/X7uqPnvumv1KcBB
         hqMzZCD6CVSORc6P0lB7StvdQpQ+9BW+QwFe4TB4Dw0iJeXx4ra00O4Po0cO+nPRFu
         n+BlNLAUni8mA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Heiko Stuebner <heiko@sntech.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] rkisp1 support for px30
Message-ID: <55ef358a-1173-7b4c-a238-e74ee80d5459@xs4all.nl>
Date:   Wed, 4 Aug 2021 15:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfASP2Jdc6b10WnZgpjaUBBmBWbzZcEy30nZqivriL7uvv4ss6yVG3NKh8EYa6eKVB/xBX5a5nTIi6Mg7dwU+8l7s71lO1fqD4AeZExLEdwxUNoGrbbph
 UZDJveIHsezwSMtzW2JWygKTMdhJqTzdqDM7YHdPIkS+UW+1+Yw6AhHul0HZEcQ/Fl/Y9SSqWxtAilveRjQ7MkwBRqFOzDkbo3Z+K7tY9yArqCAAWqWn3Nbq
 QRpaqvGxVBQocUyL6uMsne/ukRYxKMgQGdeXv98EprdORkDCF20ylk3hOyy8e/zTvev81lkUlgacn4Aw2Vqy8g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit bfee75f73c37a2f46a6326eaa06f5db701f76f01:

  media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control (2021-08-04 14:43:52 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15e

for you to fetch changes up to 126a6ae919a93b4c4fb980c8e92cd2e274e6ad4c:

  media: rockchip: rkisp1: add support for px30 isp version (2021-08-04 15:05:06 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Heiko Stuebner (10):
      media: rockchip: rkisp1: remove unused irq variable
      dt-bindings: media: rkisp1: fix pclk clock-name
      dt-bindings: media: rkisp1: document different irq possibilities
      media: rockchip: rkisp1: allow separate interrupts
      media: rockchip: rkisp1: make some isp-param functions variable
      media: rockchip: rkisp1: make some isp-stats functions variable
      media: rockchip: rkisp1: add prefixes for v10 specific parts
      media: rockchip: rkisp1: add support for v12 isp variants
      dt-bindings: media: rkisp1: document px30 isp compatible
      media: rockchip: rkisp1: add support for px30 isp version

 Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 114 +++++++--
 Documentation/driver-api/media/drivers/rkisp1.rst          |  43 ++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c    |   9 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h     |  44 +++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c        |  81 +++++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c        |  29 ++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c     | 557 +++++++++++++++++++++++++++++++++++---------
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h       | 406 +++++++++++++++++++++-----------
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c      | 107 +++++++--
 9 files changed, 1093 insertions(+), 297 deletions(-)
 create mode 100644 Documentation/driver-api/media/drivers/rkisp1.rst
