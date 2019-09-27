Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 366B9C0769
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfI0O1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:27:05 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50307 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727959AbfI0O1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:27:05 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DrD2iY6OEKKNGDrD5iEFat; Fri, 27 Sep 2019 16:27:03 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.5] am437x-vpfe: overdue maintenance
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benoit Parrot <bparrot@ti.com>
Message-ID: <95a1c6a9-636f-66f4-0360-66105f22af57@xs4all.nl>
Date:   Fri, 27 Sep 2019 16:27:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM7/8j+2vtEJbCtyQds1Hf++wjVRLvHshVosDy4sTK/VhLOz+IQsOqvRqKY2K6M+KG33ilOJ8Wsr/ny8oNJs4GhYA04eOOmhpViFDjAeKSZKqoGERrt5
 1KqBpMULvokJmaNyFevrbyMAvyJf7jtgxCFYlzKV05mpEFPigwFFEyAKxyvZRl6HOmp+ddEcYHdhJYe5LK/U36ZNUf2bUBQhSsReVVVUUbA9FE0jZp1G2GkV
 XaZXC2iyRV6GhNECCmdwT7r0JMNUyyNAxy5IHYxZsX36K6mahtNYBHKPfvL/e8NzbVPsgEVpISvL8kwNqzUcfw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various fixes for am437x-vpfe.

One special note: the last three patches adds new macros to be able to
print a V4L2 fourcc in a standard way, both for kernel and userspace,
and uses them in v4l2-ioctl.c and am437x.

If you have concerns about this and do not want to merge those patches
without discussing this some more, then please just drop these last three
patches.

Regards,

	Hans

The following changes since commit 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:

  media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 06:26:57 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5c2

for you to fetch changes up to 743d13880c0749ca61a40ec4c57ebeb60d06f9c6:

  media: am437x-vpfe: Remove print_fourcc helper (2019-09-27 16:24:49 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (12):
      media: am437x-vpfe: Fix missing first line
      media: am437x-vpfe: Rework ISR routine for clarity
      media: am437x-vpfe: Wait for end of frame before tear-down
      media: am437x-vpfe: fix start streaming error path
      media: am437x-vpfe: Streamlined vb2 buffer cleanup
      media: am437x-vpfe: Setting STD to current value is not an error
      media: am437x-vpfe: Use a per instance format array instead of a static one
      media: am437x-vpfe: fix function trace debug log
      media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
      media: am437x-vpfe: Remove per bus width static data
      media: am437x-vpfe: Switch to SPDX Licensing
      media: am437x-vpfe: Remove print_fourcc helper

Dave Gerlach (1):
      media: am437x-vpfe: Fix suspend path to always handle pinctrl config

Hans Verkuil (1):
      v4l2-ioctl.c: use new v4l2_fourcc_conv/args macros

Sakari Ailus (1):
      v4l: Add macros for printing V4L fourcc values

 Documentation/media/videodev2.h.rst.exceptions   |   2 +
 drivers/media/platform/am437x/am437x-vpfe.c      | 880 +++++++++++++++++++++++++----------------------------------
 drivers/media/platform/am437x/am437x-vpfe.h      |  43 ++-
 drivers/media/platform/am437x/am437x-vpfe_regs.h |  10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c             |  58 ++--
 include/uapi/linux/videodev2.h                   |  27 ++
 6 files changed, 453 insertions(+), 567 deletions(-)
