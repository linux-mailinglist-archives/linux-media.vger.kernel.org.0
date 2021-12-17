Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9A3478C1D
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 14:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236626AbhLQNVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 08:21:24 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.186]:53641 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236627AbhLQNVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 08:21:24 -0500
X-KPN-MessageId: 2a51c3ec-5f3c-11ec-922e-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 2a51c3ec-5f3c-11ec-922e-00505699b430;
        Fri, 17 Dec 2021 14:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=54l3MUuY8jOtwJd5myVJkPA895mcWEmnwp1iJNqwWxE=;
        b=RaHKZg1biN7SLd3MMeoB+IGLF7DetRhpMUtQsUJvted6XsnE5gAHcdU0FNC5MhOM4gn4btz4m3G9O
         uTdizf0ifGrADoLfMXX10hv9S9lGVdjTI1dJqZvoVTERgkGJcN/ubUojYwQWibrFu9fBYgi8xmUCrP
         GNjUFMih1SB7eJqcGw1QS+1cUu6eLJ7BkEjcngJQCSJYKn2LYii/WqRawdVhshFzQojGsy9ltU1SA3
         ITDAQ8xIZFNlOfUqKHFpMnwWA8YKGqR5VQ60bfwu2NxFQqiiPIAacqMPijT25hrnCKiV61z/JEtHE7
         GeHedVevENfaqX6wsrU4c7lg2OhZKfw==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|wZicJ3ig7GjF2T+24zKfP4tlB5cOYg7PYGNSbrsf4pCUpwtK22PAoe9NoTAxgyR
 hm8s6YB2trPhH6yp9I1h1Yw==
X-Originating-IP: 80.101.105.217
Received: from [192.168.1.10] (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 49f7e9b7-5f3c-11ec-a83c-00505699d6e5;
        Fri, 17 Dec 2021 14:21:48 +0100 (CET)
Message-ID: <73e71dca-fc28-6bb8-09b0-dcdd0f4974cf@xs4all.nl>
Date:   Fri, 17 Dec 2021 14:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Corentin Labbe <clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] zoran: merge into one module, many fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corentin,

This is a great improvement over v3: all issues I saw before are now resolved,
and it passed the compliance tests with flying colors.

Thank you for your work on this!

While the PR is for 5.17, there is a good chance that it will slip to 5.18
due to vacation.

Regards,

	Hans

The following changes since commit 3a956f0b123c1c2b165314a3173755aa3404036c:

  Merge tag 'platform-drivers-x86-int3472-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 into media_tree (2021-12-16 20:54:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17i

for you to fetch changes up to 3461867e58209ef84c3e4c17a18913da5f6126ae:

  staging: media: zoran: drop read/write support (2021-12-17 13:50:43 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Corentin Labbe (14):
      staging: media: zoran: move module parameter checks to zoran_probe
      staging: media: zoran: use module_pci_driver
      staging: media: zoran: rename debug module parameter
      staging: media: zoran: add debugfs
      staging: media: zoran: videocode: remove procfs
      staging: media: zoran: merge all modules
      staging: media: zoran: remove vidmem
      staging: media: zoran: move videodev alloc
      staging: media: zoran: move config select on primary kconfig
      staging: media: zoran: introduce zoran_i2c_init
      staging: media: zoran: fix usage of vb2_dma_contig_set_max_seg_size
      staging: media: zoran: clean unused code
      staging: media: zoran: fix counting buffer in reserve
      staging: media: zoran: calculate the right buffer number for zoran_reap_stat_com

Hans Verkuil (4):
      staging: media: zoran: fix various V4L2 compliance errors
      staging: media: zoran: fix TRY_FMT handling
      staging: media: zoran: drop kernel log spam
      staging: media: zoran: drop read/write support

 drivers/staging/media/zoran/Kconfig        |  38 ++++----
 drivers/staging/media/zoran/Makefile       |   8 +-
 drivers/staging/media/zoran/videocodec.c   |  68 ++-----------
 drivers/staging/media/zoran/videocodec.h   |   4 +-
 drivers/staging/media/zoran/zoran.h        |  18 +---
 drivers/staging/media/zoran/zoran_card.c   | 398 ++++++++++++++++++++++++++++++++++++++++++++++++----------------------------
 drivers/staging/media/zoran/zoran_device.c |  15 ++-
 drivers/staging/media/zoran/zoran_device.h |   2 -
 drivers/staging/media/zoran/zoran_driver.c |  56 +++++------
 drivers/staging/media/zoran/zr36016.c      |  25 ++---
 drivers/staging/media/zoran/zr36016.h      |   2 +
 drivers/staging/media/zoran/zr36050.c      |  24 ++---
 drivers/staging/media/zoran/zr36050.h      |   2 +
 drivers/staging/media/zoran/zr36060.c      |  23 ++---
 drivers/staging/media/zoran/zr36060.h      |   2 +
 15 files changed, 349 insertions(+), 336 deletions(-)
