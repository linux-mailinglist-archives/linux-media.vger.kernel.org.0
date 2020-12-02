Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C163E2CBFA9
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgLBOaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:30:11 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37787 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727397AbgLBOaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 09:30:11 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kT8IkEiHAN7XgkT8LktUva; Wed, 02 Dec 2020 15:29:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606919369; bh=XIE9eN2ykJ1JMYNMs9ysM0mExPfsiZA4f9ncek48vkc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=G3ejRmt6rzy+MhuQlgyAqoqAwpo0Q1ZmeybLrXTAQsBqj8db3Agi3V2sdigEQ4VAN
         Zi+IxgLEvLy1pAQEM7Yfe2rWlI0MoOXhLbuTZn/kAQg+OgPzjjOnvNJBNBH1bn9jIb
         lgpSMd6LMrTcNZxLKdQgdM9pVzzmGRVcrIQLQ03XuOScFMXzRVrwzMMJD94ni8JIO1
         wfHrFKAGkIltFRkGU/JH1h9aJHXdK+CQ3abvolATGkICKm1gqb5TysskGiklr/qUdw
         tOtBKUUtqgSG6IYt2BTG5D/ewXCTg4Dw4qZr4GoINgFwkBv8/9uAThZ4EMCPT0SrNK
         w5QgKv3Hgnm6w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] More fixes/enhancements
Message-ID: <8cf5021f-559c-5ea8-f1f0-250c00bc119d@xs4all.nl>
Date:   Wed, 2 Dec 2020 15:29:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCmURic+XXt4ENAee0fIT5oJnOsWYALSTSOH8aAMDYLh1E6jp0f5hdxNAZbvjruxXrdhgRJzYPLhrU76jqjkHjBGmcp6lXVUmAcs9UudGDrG8Db0IN8r
 TIAYGDvreXfyHyE0RHMDhIuK7DfhhBM4G4XUhXJBDtmm1qBHnqMAP1bKRBtNrCuL9KbJwCVEJ8ELk26e8+KTMVI0+nw/JknYcFw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 67e061f044e46c9823e59ca7981786f858bfa292:

  Merge tag 'v5.10-rc6' into patchwork (2020-12-01 16:21:40 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11d

for you to fetch changes up to 1de69ea0fc8b160deef10f7590bdbdf675334274:

  media: coda: Convert the driver to DT-only (2020-12-02 15:18:44 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Daniel Lee Kruse (1):
      media: cx23885: reset DMA on AMD Family 15h (Models 30h-3fh) I/O Memory Management Unit due to RiSC engine stall

Fabio Estevam (1):
      media: coda: Convert the driver to DT-only

Martin Cerveny (3):
      media: cedrus: Register all codecs as capability
      dt-bindings: media: cedrus: Add V3s compatible
      media: cedrus: Add support for V3s

Rikard Falkeborn (1):
      media: rockchip: rkisp1: Constify static structs

Xu Wang (1):
      media: cx88: use ARRAY_SIZE

Zhang Xiaoxu (1):
      media: tvp5150: Fix wrong return value of tvp5150_parse_dt()

 .../devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml  |  1 +
 drivers/media/i2c/tvp5150.c                                          |  1 +
 drivers/media/pci/cx23885/cx23885-core.c                             |  4 ++++
 drivers/media/pci/cx88/cx88-mpeg.c                                   |  3 +--
 drivers/media/platform/Kconfig                                       |  2 +-
 drivers/media/platform/coda/coda-common.c                            | 27 ++-------------------------
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c              |  6 +++---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h               |  2 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c               |  4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus.c                          | 32 ++++++++++++++++++++++++++++++--
 drivers/staging/media/sunxi/cedrus/cedrus.h                          |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c                    |  2 ++
 include/linux/platform_data/media/coda.h                             | 14 --------------
 13 files changed, 50 insertions(+), 50 deletions(-)
 delete mode 100644 include/linux/platform_data/media/coda.h
