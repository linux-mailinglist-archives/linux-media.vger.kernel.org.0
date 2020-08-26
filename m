Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C91252B80
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 12:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgHZKi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 06:38:57 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33469 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728529AbgHZKi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 06:38:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AspQkiMgPuuXOAspSkD1Xj; Wed, 26 Aug 2020 12:38:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598438334; bh=XtGkgUoLVCPWx3PXuq+lfKVoXfsrGQlVwwqUiTM8Ih0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rwwH7ITuwKKLvuhVjcoyQy0J0ZstL6u7TmckPjZB6eQoW8S10rvcdU6iK7ThOQNkH
         SXyrPDad5qPLbPIhKypt6Cx1f0cCP77YUNC9rSDSwQyiDNbva0iPwH8uIksdMi+q6q
         +EANo84Gs8ydYlyQhsRtFs+d9e6dHQp/pPIxbtjymMmOMuouex8VDq59d3NqnIGdcj
         ZtmHJau0wyhWGatjIXaXCwjHFcJu0+qxvYdzqrtrN26NNni6f6UIXC9+jiM85ZRKM/
         RtaXIMkAh3xJjNmH5p7jT6u1k2USdUUU0eO0AYgt3dIJa4idcrZDOpGh4JYFGXT+ig
         HfGRw9EuoxvwA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Various fixes
Message-ID: <21d6760d-1ed4-303b-2436-b3c004275d69@xs4all.nl>
Date:   Wed, 26 Aug 2020 12:38:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBtfndxGxWZuseNusjkEVgR7p2uHdpREcWLmxp/9JAmxc7jFJpofDuchIzBo/w5XUe8owiaBxamXAMk8KGCbsEdVIwy4e+rDZ4U7X6XGkIVMeMEB9LHD
 HN50IBvrbAb9l3Q690Oli0+BeeN5eLTGJESbMgRAYuXhU0pCpZ4dX8mQXsWYxmabg7tkflhpWio3AwUpfvWs8DdDUmyJfARCL1whS19DbgiyiFWiLHWfp5vu
 WP2rfFmVt5Y4Co8TFrbFDI26XnJYB9ngEE991UabOAo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10c

for you to fetch changes up to 696c69d9cd00ef9b2b4101c727b1d4580347b56c:

  MAINTAINERS: add Dafna Hirschfeld for rkisp1 (2020-08-26 10:57:43 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (1):
      media: mtk-vcodec: fix Kconfig help text

Christopher Snowhill (1):
      Implements support for the MyGica iGrabber

Hans Verkuil (2):
      dev-sliced-vbi.rst: fix wrong type
      videodev2.h: RGB BT2020 and HSV are always full range

Helen Koike (1):
      MAINTAINERS: add Dafna Hirschfeld for rkisp1

Hsin-Yi Wang (1):
      media: mtk-vcodec: set dma max segment size

Peilin Ye (2):
      vivid: Fix global-out-of-bounds read in precalculate_color()
      v4l2-tpg: Clamp hue in tpg_s_hue()

Tom Rix (1):
      media: tuner-simple: fix regression in simple_set_radio_freq

Tomasz Figa (3):
      MAINTAINERS: Make Tomasz the main maintainer of videobuf2
      MAINTAINERS: Remove Kyungmin from the maintainers list of videobuf2
      MAINTAINERS: Remove Pawel from the maintainers list of videobuf2

Tong Zhang (1):
      media: pvrusb2: fix parsing error

 Documentation/userspace-api/media/v4l/colorspaces-defs.rst    |  9 ++++-----
 Documentation/userspace-api/media/v4l/colorspaces-details.rst |  5 ++---
 Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst      |  2 +-
 MAINTAINERS                                                   |  5 ++---
 drivers/media/platform/Kconfig                                |  4 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c        |  8 ++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c        |  8 ++++++++
 drivers/media/test-drivers/vivid/vivid-meta-out.c             |  9 +++++----
 drivers/media/tuners/tuner-simple.c                           |  5 +++--
 drivers/media/usb/em28xx/em28xx-cards.c                       | 22 ++++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h                             |  1 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                       |  5 ++---
 include/media/tpg/v4l2-tpg.h                                  |  1 +
 include/uapi/linux/videodev2.h                                | 17 ++++++++---------
 14 files changed, 69 insertions(+), 32 deletions(-)
