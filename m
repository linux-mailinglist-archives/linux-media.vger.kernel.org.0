Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19DD3C071F
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfI0OPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:15:47 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41593 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726540AbfI0OPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:15:47 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Dr25iY1oBKKNGDr29iECKo; Fri, 27 Sep 2019 16:15:45 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.5] vimc: Collapse component structure into a single
 monolithic driver
Message-ID: <6618e8ee-7ea8-6172-ac96-5228a769a3b3@xs4all.nl>
Date:   Fri, 27 Sep 2019 16:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH7MpzN3Kb/0u+J3Cnvt6u7FJBRtXdNl5NbP0aJ6fUaxvSAbwA6geGyY3jm8qzQJkr0lLL52RTUxKn8pElT7XQWnKV/Cew42DbaK4h91V/FIhYfdNkVG
 mVtUsPc2yGJH90NSKvc0Zd2f4RaJyo5Gx7Geqqy7wnpndHwRpC7NVGd9p/xAUeXSF819Mv4APxpg9EkIF57o0x1pa2elhLQTtTySfrj0dWiB8IDr334mjimc
 HrIrXODOKRsO5rVFnfNypQqN8bxP6tHyIdSHAD6wSlwzUegsiB2RlrZmijbvXSNaALGzXUXbo5y489N7L9mmQHfHF8D/nNCk0GGEh5+rktNLRaMuerGNcCWe
 M2zXs2m5ifnQ7CXtq2tFNqAZvAS8bQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Speaks for itself. This will require a change to the v4l-utils test-media script.
A patch is ready for that to apply once this is merged.

Various other upcoming vimc patches all depend on this going in first.

Regards,

	Hans

The following changes since commit 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:

  media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 06:26:57 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5b

for you to fetch changes up to 79d94c0816a617f40bc43ee7e7da14d73346a078:

  MAINTAINERS: Add reviewer to vimc driver (2019-09-20 11:06:36 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Shuah Khan (5):
      media: vimc: Collapse component structure into a single monolithic driver
      media: vimc: Fix gpf in rmmod path when stream is active
      vimc: move duplicated IS_SRC and IS_SINK to common header
      doc: media: vimc: Update module parameter usage information
      MAINTAINERS: Add reviewer to vimc driver

 Documentation/media/v4l-drivers/vimc.rst    |  12 ++--
 MAINTAINERS                                 |   1 +
 drivers/media/platform/vimc/Makefile        |   7 ++-
 drivers/media/platform/vimc/vimc-capture.c  |  81 +++++-------------------
 drivers/media/platform/vimc/vimc-common.c   |   3 +-
 drivers/media/platform/vimc/vimc-common.h   |  58 +++++++++++++++++
 drivers/media/platform/vimc/vimc-core.c     | 216 ++++++++++++++++++++++++++--------------------------------------
 drivers/media/platform/vimc/vimc-debayer.c  |  85 +++++--------------------
 drivers/media/platform/vimc/vimc-scaler.c   |  84 +++++--------------------
 drivers/media/platform/vimc/vimc-sensor.c   |  74 ++++------------------
 drivers/media/platform/vimc/vimc-streamer.c |   1 -
 11 files changed, 217 insertions(+), 405 deletions(-)
