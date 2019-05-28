Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE3A2CE3C
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 20:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfE1SKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 14:10:30 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50737 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726576AbfE1SKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 14:10:30 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VgYNhkPOIsDWyVgYOheXBy; Tue, 28 May 2019 20:10:28 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
Message-ID: <4d45c05b-8b24-6f35-a891-4646c8e1e1f5@xs4all.nl>
Date:   Tue, 28 May 2019 20:10:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO//DNpoEl1nWpaZPdglafhweZc8lurHzZlBzaU8gYlAaxxQeWoACUzmItzMikvjfFFuxBQXVtFP1H2Eo8vjrW4qlDoTffTvesqvZgwSVrkx6ysk4iie
 6DhbjpdfUIK+ECt1fiuanALtcSWSs+AVxnHVlejerYOb5FBThPqJ73J6H8F31Q5E0eQtRX9ZKM9itmSg/NUR2C/AdwvOvqmvFuIvqNUaa+xBQ37m2ZYLFcqy
 mvxmQ/TZTJxHDPIs2iI7ZhN7Tt10EhMl6mOpcC06FgcH460LoIZZfdMsy/HbTErxBSyf5cDAkyoT5+93vVwleg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9bec226d8c79fcbc95817b082557f72a79d182f5:

  media: v4l2-pci-skeleton.c: fix doc warning (2019-05-28 13:14:28 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3f

for you to fetch changes up to 75e52767fa3d58a783dd6862a7fb686e5de67fc6:

  allegro: add SPS/PPS nal unit writer (2019-05-28 20:00:26 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      videobuf2-v4l2: set last_buffer_dequeued in dqbuf

Michael Tretter (4):
      media: dt-bindings: media: document allegro-dvt bindings
      media: dt-bindings: media: Add vendor prefix for allegro
      allegro: add Allegro DVT video IP core driver
      allegro: add SPS/PPS nal unit writer

 Documentation/devicetree/bindings/media/allegro.txt    |   43 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml |    2 +
 MAINTAINERS                                            |    7 +
 drivers/media/common/videobuf2/videobuf2-v4l2.c        |   10 +-
 drivers/staging/media/Kconfig                          |    2 +
 drivers/staging/media/Makefile                         |    1 +
 drivers/staging/media/allegro-dvt/Kconfig              |   16 +
 drivers/staging/media/allegro-dvt/Makefile             |    6 +
 drivers/staging/media/allegro-dvt/TODO                 |    4 +
 drivers/staging/media/allegro-dvt/allegro-core.c       | 3032 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/allegro-dvt/nal-h264.c           | 1001 +++++++++++++++++++++
 drivers/staging/media/allegro-dvt/nal-h264.h           |  208 +++++
 12 files changed, 4327 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 create mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 create mode 100644 drivers/staging/media/allegro-dvt/Makefile
 create mode 100644 drivers/staging/media/allegro-dvt/TODO
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-core.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.h
