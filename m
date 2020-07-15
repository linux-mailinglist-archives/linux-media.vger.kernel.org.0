Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612A72210B6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 17:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgGOPTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 11:19:16 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42347 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725831AbgGOPTO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 11:19:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vjBajicGFZ80HvjBdjSQdu; Wed, 15 Jul 2020 17:19:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594826352; bh=i+KZlrW+iWfaJ12Zue9n3KDalBj+XbSZE740uL+MlKA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QRRu875N+qgLIh+qr0NJLxZpQJAVgikWXKcN+jrS84DJ3BN044zfhqNBeMRh8iomk
         4Tn7efa+ntVbP0FTZDB1hHLAxscbLhOKKln5oGbxdCDZeqsKmSzYMVKskv9cEZh6KY
         EYejn+ODsC4J3cgttoOhD2i7I03XiMVliKfNKWjxFp4LCRdKKM2IzZwPdTqxP0vpNi
         1MB3QB4xJ7LUvCgUqpOcmTRvWYhxHTutw0gM/dleh1K8zlvnXt7k1pbZVfFKiAmEbc
         HldrPIuMI9XbtDciYdPk2uVkOkCKwOg1lrib/aLouM9bIs184S4p8/a3bKTgPlTBNH
         ZyDz6YAm6ReiA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Randy Dunlap <rdunlap@infradead.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Various fixes/enhancements
Message-ID: <aaef7806-6c33-6205-143f-641553eb4ad7@xs4all.nl>
Date:   Wed, 15 Jul 2020 17:19:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCfdZO8O+9sUsr7SfldI3CVoLK7+uvehVSp5n3H0wBtN6XlmTxKqMUed67dsGcJGyUlnuTT93jnKYfHKWnf84o7sZZhpcDPzxm7gSSDL0IAvfg5QVeo1
 DAapS5nriZ114U3AdmKqVGFMrkHl1wQawygLt+yE+cK6jS53Dq114/q3QlBKLx+jtwxZQA2C8LIruoc9WFmAbteGdPIOYKGCxUplwvU7u2hPCOjtRvwjkcbg
 ZEGEQy8Pdzl/Y97+cTj2RW9Y3Y+jeHHmUavT0AkBoQRdgS/wZ+0uZ+uWzZOGUdmnEZuv+9U/r6OEY8sib6NNAr8DWRBpdJgZC+VLAG8qsUg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


The following changes since commit 6f01dfb760c027d5dd6199d91ee9599f2676b5c6:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-07-04 12:45:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9h

for you to fetch changes up to ea50a108fc1437467618fd903c312b18201e2333:

  media: staging: rkisp1: set pads array of the resizer to size 2 (2020-07-15 17:08:31 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexander A. Klimov (6):
      cx18: Replace HTTP links with HTTPS ones
      media: imon: Replace HTTP links with HTTPS ones
      ivtv: Replace HTTP links with HTTPS ones
      media: rtl2832_sdr: Replace HTTP links with HTTPS ones
      tw5864-core: Replace HTTP links with HTTPS ones
      tw68: Replace HTTP links with HTTPS ones

Dafna Hirschfeld (7):
      media: staging: rkisp1: cap: don't set next buffer from rkisp1_vb2_buf_queue
      media: staging: rkisp1: cap: protect buf.curr and buf.next with buf.lock
      media: staging: rkisp1: cap: move code that manages the buffers to rkisp1_set_next_buf
      media: staging: rkisp1: cap: in stream start, replace calls to rkisp1_handle_buffer with rkisp1_set_next_buf
      media: staging: rkisp1: remove unused field ctrl_handler from struct rkisp1_device
      media: staging: rkisp1: remove unused field alloc_ctx from struct rkisp1_device
      media: staging: rkisp1: set pads array of the resizer to size 2

Lukas Bulwahn (1):
      MAINTAINERS: rectify CHRONTEL CH7322 CEC DRIVER section

Michael Tretter (12):
      media: allegro: rework mbox handling
      media: allegro: rework read/write to mailbox
      media: allegro: add explicit mail encoding and decoding
      media: allegro: add field for number of buffers
      media: allegro: don't pack MCU messages
      media: allegro: support handling firmware dependent values
      media: allegro: encode bit fields separately
      media: allegro: add config blob for channel
      media: allegro: set num_ref_idx using response of configured channels
      media: allegro: drop length field from message header
      media: allegro: add a version field to mcu messages
      media: allegro: add support for allegro firmware 2019.2

Randy Dunlap (5):
      media/media-device.h: drop duplicated word in comment
      media/media-devnode.h: drop duplicated word in comment
      media/dvbdev.h: fix duplicated word in comment
      media/media-entity.h: drop duplicated word in comment
      media/v4l2-subdev.h: drop duplicated word in comment

 MAINTAINERS                                      |   2 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c        |   2 +-
 drivers/media/pci/cx18/cx18-cards.c              |   2 +-
 drivers/media/pci/ivtv/ivtv-cards.c              |   2 +-
 drivers/media/pci/tw5864/tw5864-core.c           |   2 +-
 drivers/media/pci/tw68/tw68-core.c               |   2 +-
 drivers/media/rc/imon.c                          |   2 +-
 drivers/staging/media/allegro-dvt/allegro-core.c | 383 +++++++++++++++++++++++----------------
 drivers/staging/media/allegro-dvt/allegro-mail.c | 507 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/allegro-dvt/allegro-mail.h | 111 +++++++-----
 drivers/staging/media/rkisp1/rkisp1-capture.c    |  52 +++---
 drivers/staging/media/rkisp1/rkisp1-common.h     |   7 +-
 drivers/staging/media/rkisp1/rkisp1-resizer.c    |   2 +-
 include/media/dvbdev.h                           |   2 +-
 include/media/media-device.h                     |   2 +-
 include/media/media-devnode.h                    |   2 +-
 include/media/media-entity.h                     |   2 +-
 include/media/v4l2-subdev.h                      |   8 +-
 18 files changed, 839 insertions(+), 253 deletions(-)
