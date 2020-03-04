Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AABF178FF5
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 12:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387968AbgCDL6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 06:58:20 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37201 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387398AbgCDL6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 06:58:19 -0500
Received: from [IPv6:2001:983:e9a7:1:7c2d:3b2e:4be4:20a2]
 ([IPv6:2001:983:e9a7:1:7c2d:3b2e:4be4:20a2])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 9SfHjaba19Im29SfIj2kOZ; Wed, 04 Mar 2020 12:58:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583323097; bh=sjyemaYZsQErJJctKLKCc5ag5Zbs8Ru3nEzcz9/tuZs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AcvJ8yl6yTawSPr7w9Lk/7FmVcY8YlH8Miy03xBb4ut6TT6oGftf8fxFnwFU4LMOC
         G7N50jW8QnYS9TOQYofvpaVrygP7AjORcGS3irn3CrEmQhWarRPAzsdIQs+BgjHHkA
         mulgkK5Ame1I5OlERGugc7Bl3jp2Q1IYejQaQbZUyyZFuBadkLsJyCswQ26UX7ZvcX
         5Vl9jqLywLont95yAacPLdSRVL0dEG+Xqb6tWcR5rYy7YkanssboWZqRFvqcILT4J5
         5y9KfCdXrHcdk8aPdJ4Af2QyRfGoB+eWVZcA5xu89A5EUc0XuBJIOvMznyRsIfi3/+
         JMfInpSsciAJQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] meson: vdec fixes/improvements
Message-ID: <ab89c537-3a54-11ba-1816-431dad550b37@xs4all.nl>
Date:   Wed, 4 Mar 2020 12:58:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD31Cw06BTKIscek0iWpjqarRB7DF7gfkLAgNe9gEEioiFqD+8neUTZqpGscE9x0GTn4AOFQQwwQXm3odl4n+VzcoOQaVuPGm5zDjXZB1+7jCdoGM3nI
 +y5btKB4fq5urBuxoR8IIIlxTPAhcOGdzxaIEfbFG/bxfLFNGvVC8iqFdxEDsbb7kS4Oifml8BB6IviKYLmpWERhuRWSlITsD1uoi+JIZb+97P9ggfVSWXeO
 2+rvYkpxV6vAEMFg30/hmAFlP54YwrUgdG+c+mDw5Cm5DQoLFwVPFhUTZphLvlxSFE5IsR45ZKKsYKBoxIQVcQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch adds codec helpers to v4l2-mem2mem. There are some fairly
complicated corner cases that need to be handled correctly, and this
should simplify codec drivers.

Regards,

	Hans

The following changes since commit 8bc8c9ba03c4d4966c2503e189801fbc9130b747:

  media: Documentation:media:v4l-drivers: Update vivid documentation. (2020-03-02 16:10:39 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-meson

for you to fetch changes up to f0aac3214aae3eb0e3f2e01f46d4da67746d577e:

  media: meson: vdec: add VP9 decoder support (2020-03-04 11:58:40 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Maxime Jourdan (6):
      media: meson: vdec: bring up to compliance
      media: meson: vdec: add H.264 decoding support
      media: meson: vdec: add helpers for lossless framebuffer compression buffers
      media: meson: vdec: add common HEVC decoder support
      media: meson: vdec: add VP9 input support
      media: meson: vdec: add VP9 decoder support

Neil Armstrong (3):
      media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last states
      media: vicodec: use v4l2-mem2mem draining, stopped and next-buf-is-last states handling
      media: meson: vdec: align stride on 32 bytes

 drivers/media/platform/vicodec/vicodec-core.c        |  162 ++--
 drivers/media/v4l2-core/v4l2-mem2mem.c               |  221 +++++-
 drivers/staging/media/meson/vdec/Makefile            |    4 +-
 drivers/staging/media/meson/vdec/codec_h264.c        |  485 ++++++++++++
 drivers/staging/media/meson/vdec/codec_h264.h        |   14 +
 drivers/staging/media/meson/vdec/codec_hevc_common.c |  297 +++++++
 drivers/staging/media/meson/vdec/codec_hevc_common.h |   71 ++
 drivers/staging/media/meson/vdec/codec_vp9.c         | 2141 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/meson/vdec/codec_vp9.h         |   13 +
 drivers/staging/media/meson/vdec/esparser.c          |  200 ++++-
 drivers/staging/media/meson/vdec/hevc_regs.h         |  218 +++++
 drivers/staging/media/meson/vdec/vdec.c              |  105 ++-
 drivers/staging/media/meson/vdec/vdec.h              |   14 +-
 drivers/staging/media/meson/vdec/vdec_helpers.c      |  123 +--
 drivers/staging/media/meson/vdec/vdec_helpers.h      |   10 +-
 drivers/staging/media/meson/vdec/vdec_hevc.c         |  231 ++++++
 drivers/staging/media/meson/vdec/vdec_hevc.h         |   13 +
 drivers/staging/media/meson/vdec/vdec_platform.c     |  109 +++
 include/media/v4l2-mem2mem.h                         |  133 ++++
 19 files changed, 4326 insertions(+), 238 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
 create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h
