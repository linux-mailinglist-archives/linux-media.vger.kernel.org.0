Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB5011E24B
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 11:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfLMKtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 05:49:50 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41557 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725928AbfLMKtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 05:49:50 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fiW3il4DoapzpfiW4idvX4; Fri, 13 Dec 2019 11:49:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576234188; bh=2UlMWZHoPHcK8XZXSg38vbhHauhnz7+dw35kMpPmqAE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oOjsDZ6ORxX4CosClBZYSk4ubA1qjbRNR5LdmmbrfDK6qVfoe4uqNU/e9iTJ35QEw
         LBy9ixrPwVmZVIap5VOPhJ5bnjTA1kWlvzLhxDZKB4D6FQqk8w7PXDVkqMEnEiUlOE
         JhMpWIU66chiVDsVKTL4+u7lkOVSaR6aPDTup0M3tNFHC/yzVMQPAsjJhkOITX8gbN
         9YKyHEykb1SXJx4D+omWJYjFrouJg9F14wdMxu1kjolDoIrEOaRh+/+KMLpsEryniE
         HLHLH9r/SLga2Qt+0Pd9vzgvWleEFjYi2DRO0u8/kpAWl5rx30JJaCOS/BMffUGDQ2
         ELWToqyhAdX3A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] Fixes and add hantro csc postproc
Message-ID: <ffd3da67-83c4-bb65-c286-6d33a3d5100c@xs4all.nl>
Date:   Fri, 13 Dec 2019 11:49:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOqmVr1nfRCEechMNZmeOO6aUK4jCQZtbc5adGYgTsUAwyrF8SmfOXTumVkbyZQa5gwEcvmE264uCGsagGnD+nxo74CyUG4LdcRqCI5vx0Oi2C8RMBe2
 Fcvw8TONg4sLUXG341HbowB5GO4sfmwpEaF+2drJg2ylN0Z9E5fcAGkSAtp5subG/TrU01ogC8VrJg/e71ZJwAHj1wa1PxZ4PLUJJhPYc0St/o+gE63L1jbX
 ZDo32532LcTCYSJuN4uHVhE0a80sa29/njHPRJTh2wS59JqO0E+if3/IKVzw5SJjrJAFyccBdAaVj831/5pymA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit da090bf60370c9ad6ede4e76adbf37ce79b84791:

  media: Drop superfluous ioctl PCM ops (2019-12-13 09:33:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6e

for you to fetch changes up to 466c9caa509745a170b337194675c2a191c91934:

  media: v4l2-device.h: Explicitly compare grp{id,mask} to zero in v4l2_device macros (2019-12-13 11:22:18 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dragos Bogdan (1):
      media: adv7604: extend deep color mode to ADV7611

Ezequiel Garcia (4):
      media: vidioc-enum-fmt.rst: clarify format preference
      media: hantro: Cleanup format negotiation helpers
      hantro: Rename {prepare,finish}_run to {start,end}_prepare_run
      media: hantro: Support color conversion via post-processing

Nathan Chancellor (1):
      media: v4l2-device.h: Explicitly compare grp{id,mask} to zero in v4l2_device macros

 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst       |   4 +-
 drivers/media/i2c/adv7604.c                            |  32 +++++++----
 drivers/staging/media/hantro/Makefile                  |   1 +
 drivers/staging/media/hantro/hantro.h                  |  66 ++++++++++++++++++++--
 drivers/staging/media/hantro/hantro_drv.c              |  11 +++-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c      |   4 +-
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c     |   6 +-
 drivers/staging/media/hantro/hantro_g1_regs.h          |  53 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c       |   6 +-
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c      |   4 +-
 drivers/staging/media/hantro/hantro_h264.c             |   2 +-
 drivers/staging/media/hantro/hantro_hw.h               |  17 +++++-
 drivers/staging/media/hantro/hantro_postproc.c         | 142 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_v4l2.c             | 109 +++++++++++++++++++++++++------------
 drivers/staging/media/hantro/rk3288_vpu_hw.c           |  10 ++++
 drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c  |   4 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c |   4 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c   |   4 +-
 include/media/v4l2-device.h                            |  12 ++--
 19 files changed, 411 insertions(+), 80 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_postproc.c
