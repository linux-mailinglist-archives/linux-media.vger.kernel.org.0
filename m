Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E2187D64
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 17:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407200AbfHIPAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 11:00:12 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55887 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726140AbfHIPAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 11:00:11 -0400
Received: from [IPv6:2001:983:e9a7:1:a042:9da:6cf5:9cb5] ([IPv6:2001:983:e9a7:1:a042:9da:6cf5:9cb5])
        by smtp-cloud7.xs4all.net with ESMTPA
        id w6NEh4gxKur8Tw6NFhcF7s; Fri, 09 Aug 2019 17:00:10 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Various fixes.enhancements
Message-ID: <d1d8c63c-c346-9a4b-fea9-27c46a648667@xs4all.nl>
Date:   Fri, 9 Aug 2019 17:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHAbAHJwmORgKst/5ojUlCGhtdPC0OJg+rkxlRYH4gSuJNGHN2QguWfJZBIHbAc8fNzpt28MLWVkYShz+uwLXMl6PXkeDvc6MkCYd5xIR7h0yKSRiApw
 5G/LKUK/TWo1wLE4xCatkMRO94PbbU0NlslD7dlne3qDtdmudqtWfNO2UlbEfApFybO2TlxpAcsNyQGVfjRtsAjxRhIBC+PYCwh4aOSlU1kRl7v5B5SH8+pz
 wbHrWkO9it2ZFoodQNXk1Eh8mAeCnquFZ3t+gFPnCNo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A small rcar fix, two patches to convert omap_vout to vb2 and have it pass
the compliance test, and two patches for vimc that revert earlier changes
that didn't work out (they didn't introduce bugs, but it was the wrong
approach and it blocked future improvements).

Regards,

	Hans

The following changes since commit 97299a3035328d7ae2f4fccaf6e549974df6e118:

  media: Remove dev_err() usage after platform_get_irq() (2019-08-07 17:08:33 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4i

for you to fetch changes up to 1b25ee0b028558e141702a6eeb6354d7f7e55e9d:

  Revert "media: vimc: propagate pixel format in the stream" (2019-08-09 10:08:51 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      omap_vout: fix various v4l2-compliance failures
      omap_vout: convert to vb2

Helen Koike (2):
      media: Revert "media: vimc: Remove or modify stream checks"
      Revert "media: vimc: propagate pixel format in the stream"

Niklas Söderlund (1):
      rcar-vin: Report correct image stride

 drivers/media/platform/omap/Kconfig          |    3 +-
 drivers/media/platform/omap/omap_vout.c      | 1011 ++++++++++++++++------------------------------------------
 drivers/media/platform/omap/omap_vout_vrfb.c |   26 +-
 drivers/media/platform/omap/omap_vout_vrfb.h |    4 +-
 drivers/media/platform/omap/omap_voutdef.h   |   45 ++-
 drivers/media/platform/omap/omap_voutlib.c   |    6 +-
 drivers/media/platform/rcar-vin/rcar-dma.c   |   10 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c  |    5 +-
 drivers/media/platform/vimc/vimc-capture.c   |   76 ++---
 drivers/media/platform/vimc/vimc-common.c    |  309 ++++++++++--------
 drivers/media/platform/vimc/vimc-common.h    |   58 ++--
 drivers/media/platform/vimc/vimc-debayer.c   |   88 ++---
 drivers/media/platform/vimc/vimc-scaler.c    |   68 ++--
 drivers/media/platform/vimc/vimc-sensor.c    |   57 +++-
 drivers/media/platform/vimc/vimc-streamer.c  |    2 -
 drivers/media/platform/vimc/vimc-streamer.h  |    8 -
 16 files changed, 672 insertions(+), 1104 deletions(-)
