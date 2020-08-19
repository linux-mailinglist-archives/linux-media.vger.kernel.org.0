Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31C7249BE4
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 13:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgHSLfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 07:35:20 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40863 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727930AbgHSLfR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 07:35:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8MN7kc4wxuuXO8MN8kgiZ1; Wed, 19 Aug 2020 13:35:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597836914; bh=twZQlQcHWUXd75zBSMqsxL2CluhCV6tqH3LHDNaXS+Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e6QbjYMFa3Ip2KutMRLDEiXd/xrUh70K4Cn9wF95qeaPraXbdOfAmq8bwdqFER0pz
         CNgOZoZJnPLzOs7huij+WZVHZ9aFQ0qC3qC3SbSnm5Vzg7xmxqTOThyiQ5ampNlfyP
         jX6oMO6uuJRXVOlsSt0x+TidO+LAnMn+i39zYPUR/9Mcn0+5QLBEtuj/2YYNTlSzJT
         GT2qYdG7B4jRWsY9WPoKXoJgSKYliyMfJTP8+aNFECnUZQ71B2K4i2ZwrenaODlTm/
         +/j3Cy+lG1f7W83bbcOjX8gXpRkXle7XKy4gQXg6rsRKvb3vshJ179ey/vdyCtj9Sq
         62hAlOp+iQFfA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Xia Jiang <xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Add support for mt2701 JPEG ENC support
Message-ID: <e568cde0-ebaf-d649-4c99-b99e15542b36@xs4all.nl>
Date:   Wed, 19 Aug 2020 13:35:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAM0oYV1Dtbj+tbttdZJSLPd3VapIYJT2r/vKpJQ8CHqI3gTOpAKLNE/1I5zSYDOeUJMBumu3EwV5ERk4TdPdhP3NbUSnmQq3uxRZimULhI2+0xlmu5m
 /tK2ajEQplo3ehk6DYiR7ASA+s/FTnvLJI35yc/VWSF5uNQ2O+3vhJddKzc43gKfog6t3ML3N0MiLXF8Utm8NlOD4vWss+wCTDGo2HlPTO4J43vtGxotrRYh
 oITQPXVJigbmwqv8cNjncIkbLu8UYtDEQYRI4mQQQZ6B4I6fgMzwvYn3eMR9P2Vl4kSgrOzGPnzbddszrONHi+A7Kj1xs7RdfYVsU2XanjE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-mtk-jpeg

for you to fetch changes up to 3142a903c2299f362e48125615d116bdd37eb68b:

  media: platform: Add jpeg enc feature (2020-08-19 13:21:23 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Pi-Hsun Shih (1):
      media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume

Xia Jiang (27):
      media: platform: Improve subscribe event flow for bug fixing
      media: platform: Improve queue set up flow for bug fixing
      media: platform: Improve getting and requesting irq flow for bug fixing
      media: platform: Change the fixed device node number to unfixed value
      media: platform: Improve power on and power off flow
      media: platform: Delete the resetting hardware flow in the system PM ops
      media: platform: Improve the implementation of the system PM ops
      media: platform: Add mechanism to handle jpeg hardware's locking up
      media: platform: Cancel the last frame handling flow
      media: platform: Delete zeroing the reserved fields
      media: platform: Stylistic changes for improving code quality
      media: platform: Use generic rounding helpers
      media: platform: Change MTK_JPEG_COMP_MAX macro definition location
      media: platform: Delete redundant code and add annotation for an enum
      media: platform: Delete vidioc_s_selection ioctl of jpeg dec
      media: platform: Change the maximum width and height supported by JPEG dec
      media: platform: Refactor mtk_jpeg_try_fmt_mplane()
      media: platform: Refactor mtk_jpeg_find_format()
      media: platform: Redefinition of mtk_jpeg_q_data structure
      media: platform: Change the colorspace of jpeg to the fixed value
      media: platform: Refactor mtk_jpeg_set_default_params()
      media: platform: Change the call functions of getting/enable/disable the jpeg's clock
      media: dt-bindings: Add jpeg enc device tree node document
      media: platform: Rename jpeg dec file name
      media: platform: Rename existing functions/defines/variables
      media: platform: Using the variant structure to contain the varability between dec and enc
      media: platform: Add jpeg enc feature

 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt      |  35 ++
 drivers/media/platform/mtk-jpeg/Makefile                               |   5 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c                        | 930 +++++++++++++++++++++------------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h                        | 106 ++--
 drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}   |  10 +-
 drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}   |  12 +-
 .../media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} |   2 +-
 .../media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} |   2 +-
 drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} |  19 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c                      | 154 ++++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h                      |  91 ++++
 drivers/media/v4l2-core/v4l2-mem2mem.c                                 |  41 ++
 include/media/v4l2-mem2mem.h                                           |  22 +
 13 files changed, 1046 insertions(+), 383 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (91%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (77%)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
