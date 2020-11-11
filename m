Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393602AEF0E
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 11:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgKKK7P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 05:59:15 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51091 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725830AbgKKK7O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 05:59:14 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cnprkmetpRiwVcnpyka7oT; Wed, 11 Nov 2020 11:59:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605092351; bh=y4PUPqKzdjq6/CnDP/ufpTlrdhMvKRzy8bwEmyJnUD0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=c06ArxHaYBD28Iyup3gHiS8vTd37EsgCWCtcEdyM8M+rS8p+xAcDQf6HAKzcdclGI
         QknoE2CpElK/QVDBP99q9hyutOogg+O9i5HH0Y0RgWS/JiCsR31MTJxiXw1DYGew7M
         A6MOZtfLZxPOW+RHTuz/BUJx+uAqPM2Ea+J17oWGCMW/j1kLQm3bvQPUhernNoVBjs
         f/fQqoMa4zknQIS0NHMNOm+mMjUDba420V0y0oTossmXzrFKRmMhRA4GRoaxyEeHOL
         7GPF91tE2Wk3MDJ85uGz6ZsKeXJyEYSfT3hAiXSOdNQ1HoVIntvU9ALuhHMRZFuaGg
         6RIuZeaqx9xGw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] rockchip: rkisp1: destage Rockchip ISP1 driver
Message-ID: <8ff17e72-34b8-58f8-9b3e-47453a79e6e5@xs4all.nl>
Date:   Wed, 11 Nov 2020 11:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIhzr+8g4d2UQvP8f/vJX/OQPF/zDX5BjFB1djAiXWmTt9/bcm3pTz9WJsfDij4Z2p5ULRZV//1XKXnzcYmZszS1k4nKq+OrDXCVkQMe431LhvSPp+hu
 IfDW+VDAb/lQ7hZuWE8bq6TdlQEBcwZ5nQbN/R1yb3MHGLTVFpq2oeC8Fovghiomfqy4Bfx79hIkpuXKR/6biUmcF3rOVz/CW4vCr/gUBpUA1wHVLNXrmdFk
 qpEm3i+oN/gF/HqT19u3W7AaPUuzF7t3ajIqdELTABc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0ab4f9087ea94ff92dc2ae68180faaf6bd443021:

  media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove() (2020-11-05 18:03:11 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11f

for you to fetch changes up to 64ac96b6b758dba131e9599686451edf050eee61:

  media: rockchip: rkisp1: destage Rockchip ISP1 driver (2020-11-11 11:49:25 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Helen Koike (2):
      media: staging: rkisp1: cap: fix timeout when stopping the stream
      media: rockchip: rkisp1: destage Rockchip ISP1 driver

Shunqian Zheng (1):
      media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format

 .../devicetree/bindings/media/rockchip-isp1.yaml                     |  0
 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst         |  2 +-
 MAINTAINERS                                                          |  5 +-
 drivers/media/platform/Kconfig                                       | 18 +++++++
 drivers/media/platform/Makefile                                      |  1 +
 drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile   |  0
 .../media => media/platform/rockchip}/rkisp1/rkisp1-capture.c        |  4 +-
 .../media => media/platform/rockchip}/rkisp1/rkisp1-common.c         |  0
 .../media => media/platform/rockchip}/rkisp1/rkisp1-common.h         |  2 +-
 .../{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c   |  3 +-
 .../{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c   |  1 -
 .../media => media/platform/rockchip}/rkisp1/rkisp1-params.c         | 86 ++++++++++++++++----------------
 .../{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h  |  0
 .../media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c        |  4 +-
 .../{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c |  0
 drivers/media/v4l2-core/v4l2-ioctl.c                                 |  2 +
 drivers/staging/media/Kconfig                                        |  2 -
 drivers/staging/media/Makefile                                       |  1 -
 drivers/staging/media/rkisp1/Kconfig                                 | 19 -------
 drivers/staging/media/rkisp1/TODO                                    |  8 ---
 .../staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h |  4 --
 include/uapi/linux/videodev2.h                                       |  4 ++
 22 files changed, 80 insertions(+), 86 deletions(-)
 rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-capture.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.h (99%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c (99%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c (99%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-params.c (96%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c (99%)
 rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c (100%)
 delete mode 100644 drivers/staging/media/rkisp1/Kconfig
 delete mode 100644 drivers/staging/media/rkisp1/TODO
 rename {drivers/staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h (99%)
