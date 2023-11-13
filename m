Return-Path: <linux-media+bounces-259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A96D97E9F75
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED8E1F217C6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1338C21341;
	Mon, 13 Nov 2023 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FFF21114
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 15:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A92CC433C8;
	Mon, 13 Nov 2023 15:02:47 +0000 (UTC)
Message-ID: <ae6d2ad3-0b2a-462a-a9eb-9ce01e7a7f5e@xs4all.nl>
Date: Mon, 13 Nov 2023 16:02:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.8] Add Wave5 codec driver
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This adds the new wave5 codec driver.

Regards,

	Hans

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8d

for you to fetch changes up to b17289d8fcd5c5fe59118586256682ffc5d2fbaf:

  media: chips-media: wave5: Add wave5 driver to maintainers file (2023-11-13 13:16:16 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Nas Chung (2):
      media: chips-media: wave5: Add vpuapi layer
      media: chips-media: wave5: Add the v4l2 layer

Robert Beckett (2):
      dt-bindings: media: wave5: add yaml devicetree bindings
      media: chips-media: wave5: Add wave5 driver to maintainers file

Sebastian Fricke (3):
      media: v4l2: Add ignore_streaming flag
      media: v4l2: Allow M2M job queuing w/o streaming CAP queue
      media: platform: chips-media: Move Coda to separate folder

 Documentation/devicetree/bindings/media/cnm,wave521c.yaml   |   61 ++
 MAINTAINERS                                                 |   10 +-
 drivers/media/platform/chips-media/Kconfig                  |   18 +-
 drivers/media/platform/chips-media/Makefile                 |    6 +-
 drivers/media/platform/chips-media/coda/Kconfig             |   18 +
 drivers/media/platform/chips-media/coda/Makefile            |    6 +
 drivers/media/platform/chips-media/{ => coda}/coda-bit.c    |    0
 drivers/media/platform/chips-media/{ => coda}/coda-common.c |    0
 drivers/media/platform/chips-media/{ => coda}/coda-gdi.c    |    0
 drivers/media/platform/chips-media/{ => coda}/coda-h264.c   |    0
 drivers/media/platform/chips-media/{ => coda}/coda-jpeg.c   |    0
 drivers/media/platform/chips-media/{ => coda}/coda-mpeg2.c  |    0
 drivers/media/platform/chips-media/{ => coda}/coda-mpeg4.c  |    0
 drivers/media/platform/chips-media/{ => coda}/coda.h        |    0
 drivers/media/platform/chips-media/{ => coda}/coda_regs.h   |    0
 drivers/media/platform/chips-media/{ => coda}/imx-vdoa.c    |    0
 drivers/media/platform/chips-media/{ => coda}/imx-vdoa.h    |    0
 drivers/media/platform/chips-media/{ => coda}/trace.h       |    2 +-
 drivers/media/platform/chips-media/wave5/Kconfig            |   12 +
 drivers/media/platform/chips-media/wave5/Makefile           |   10 +
 drivers/media/platform/chips-media/wave5/wave5-helper.c     |  213 +++++
 drivers/media/platform/chips-media/wave5/wave5-helper.h     |   31 +
 drivers/media/platform/chips-media/wave5/wave5-hw.c         | 2554 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/chips-media/wave5/wave5-regdefine.h  |  732 +++++++++++++++
 drivers/media/platform/chips-media/wave5/wave5-vdi.c        |  205 ++++
 drivers/media/platform/chips-media/wave5/wave5-vdi.h        |   35 +
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c    | 1932 ++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c    | 1794 +++++++++++++++++++++++++++++++++++
 drivers/media/platform/chips-media/wave5/wave5-vpu.c        |  291 ++++++
 drivers/media/platform/chips-media/wave5/wave5-vpu.h        |   83 ++
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c     |  960 +++++++++++++++++++
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.h     |  870 +++++++++++++++++
 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h  |   77 ++
 drivers/media/platform/chips-media/wave5/wave5-vpuerror.h   |  292 ++++++
 drivers/media/platform/chips-media/wave5/wave5.h            |  114 +++
 drivers/media/v4l2-core/v4l2-mem2mem.c                      |    9 +-
 include/media/v4l2-mem2mem.h                                |    7 +
 37 files changed, 10317 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 create mode 100644 drivers/media/platform/chips-media/coda/Kconfig
 create mode 100644 drivers/media/platform/chips-media/coda/Makefile
 rename drivers/media/platform/chips-media/{ => coda}/coda-bit.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda-common.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda-gdi.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda-h264.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda-jpeg.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda-mpeg2.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda-mpeg4.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda.h (100%)
 rename drivers/media/platform/chips-media/{ => coda}/coda_regs.h (100%)
 rename drivers/media/platform/chips-media/{ => coda}/imx-vdoa.c (100%)
 rename drivers/media/platform/chips-media/{ => coda}/imx-vdoa.h (100%)
 rename drivers/media/platform/chips-media/{ => coda}/trace.h (99%)
 create mode 100644 drivers/media/platform/chips-media/wave5/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave5/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-helper.c
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-helper.h
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vdi.c
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5-vpuerror.h
 create mode 100644 drivers/media/platform/chips-media/wave5/wave5.h

