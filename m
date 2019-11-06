Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 172F2F171F
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 14:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730551AbfKFNak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 08:30:40 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:36967 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726673AbfKFNaj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 08:30:39 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SLOMiQOJZTzKrSLOPiytWR; Wed, 06 Nov 2019 14:30:38 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Various fixes (mostly codec related)
Message-ID: <b9a3b48b-ed51-a844-2384-ec5482f0650b@xs4all.nl>
Date:   Wed, 6 Nov 2019 14:30:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKakt5hoLkjTZCOGH4RN9mfKiAT/YnL5nXEgsptvCbUj3cNuwFTxZDm06lioIWK80LKeRtlFuhft9nmStq/rbxA5v5txDXnfDuNvzVLEQrPAtYQtAHN0
 pOgk1hAWmNw10TxEEYI2QN8Rgi9Ak7fhztdMfszNmHE4+CI0tHRAqvqAxe/d9gEr/E8G0PIcE+sNM3Gbv7pEM6YCMdpT3OjTfwIZo3qx7RdygKcdAJ4VVIjJ
 b2mavS6NoznILxAYPKJ9gMtg44ZrR602zegEbpwaRYViqiM+890F99jRmZLC3MkTwbIc5d68Ywdp9nwPvLJ0HJMspaiWEiy16rWZ1HEVv6byrCyV9VJ2KjGS
 UKbgoN8NMbJeoFr/QwhF8ZMoMdPttSotsoxYzi94rLco3GZDt8L6iYyxeQLHQjNwKoE7Tog4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit d065070e009b0c0b2ab4ee09972a41b072f6ed54:

  media: hi556: Add support for Hi-556 sensor (2019-11-05 09:12:49 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5q

for you to fetch changes up to 90842e3fbaf873b0e209ac0e71883b5012d6f31c:

  media: coda: drop unused irqlock (2019-11-06 13:44:55 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: venus: remove invalid compat_ioctl32 handler

Dafna Hirschfeld (1):
      media: vimc: sen: remove unused kthread_sen field

Francois Buergisser (2):
      media: hantro: Fix motion vectors usage condition
      media: hantro: Fix picture order count table enable

Jernej Skrabec (3):
      media: cedrus: Fix decoding for some H264 videos
      media: cedrus: Use helpers to access capture queue
      media: v4l2-mem2mem: Fix hold buf flag checks

Jonas Karlman (4):
      media: uapi: h264: clarify expected scaling_list_4x4/8x8 order
      media: cedrus: Use correct H264 8x8 scaling list
      media: hantro: Do not reorder H264 scaling list
      media: hantro: Fix H264 max frmsize supported on RK3288

Mike Isely (1):
      pvrusb2: Fix oops on tear-down when radio support is not present

Neil Armstrong (1):
      MAINTAINERS: ao-cec: Update path for yaml bindings

Philipp Zabel (1):
      media: coda: drop unused irqlock

 Documentation/media/uapi/v4l/ext-ctrls-codec.rst  |  8 ++++++--
 MAINTAINERS                                       |  2 +-
 drivers/media/platform/coda/coda-common.c         |  2 --
 drivers/media/platform/coda/coda.h                |  1 -
 drivers/media/platform/qcom/venus/vdec.c          |  3 ---
 drivers/media/platform/qcom/venus/venc.c          |  3 ---
 drivers/media/platform/vimc/vimc-sensor.c         |  5 -----
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          |  9 +++++++--
 drivers/media/v4l2-core/v4l2-mem2mem.c            |  4 ++--
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 10 ++++++----
 drivers/staging/media/hantro/hantro_h264.c        | 51 ++++++++++++---------------------------------------
 drivers/staging/media/hantro/rk3288_vpu_hw.c      |  4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus.h       |  8 ++++++--
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c  | 42 +++++++++++++++++++++++++++++++++++-------
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h  |  3 +++
 15 files changed, 80 insertions(+), 75 deletions(-)
