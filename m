Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BF01C9567
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 17:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgEGPtZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 11:49:25 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42513 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725914AbgEGPtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 11:49:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Wilzjvibl8hmdWim3jG1q5; Thu, 07 May 2020 17:49:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588866563; bh=BErk7/73tzUU+i623liGF0G4u9DBnWsUB9b2EV45ZUA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aHQ+D9YOApTsQ9vAMh5ihODKeFLCT6u9Xi+tgl/hOedhAIgk/57Ir6Rt+Y2nrsI00
         ETWLehZAGri4LKI98v7rZR6zoAw2BQrfDt9TrC50ETTJ9GBBG4FsRa/mavyLk6/eqQ
         mAEwmvfO1y8Nicr7DY5qBUlyyM66uUU4h3TTIY8Ej/SJogDUFmh1339QBQvHMPtRTS
         3eZ5T26g20U5myqg8Fl0UiclPhPSqyRG9MibxSOhU+gdEs2WwFEN4LvpEDuzaQXkf/
         VVZ/DjZJ6o7/1gG01x+HpBgVtKCgHxVHpZVGeM7cAD/b0z/OUT7kCeXE1jVL355I65
         wqi3QqR4eKw1A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Register read-only sub-dev devnode
Message-ID: <25d49102-10f1-b8fa-b9fa-42f2b0a17197@xs4all.nl>
Date:   Thu, 7 May 2020 17:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAojep7adG2RC797ZURYxXiItsiYa87sba0y4Qc12n5Zs0QJhOL850hHQtyL018vfXGskAj0HSH12/D33ZVmQEDz4iWLR7AfxBK12wnnLh7ubHjFgdFS
 wEKasvRezKqJrZmFMgQi/2A0L4TV4kZnpHVFnhPeV6vkrg3l63vIl6Y8UQ3JdVQ2FBpXpEjgmaIC/TlzKfAr24ENQ1ZyA3T29AQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes a lot of sense for libcamera and this is required for the
"Drivers for the BCM283x CSI-2/CCP2 receiver and ISP" patch series.

Regards,

	Hans

The following changes since commit 5b9f8e4ac9473962fa0e824fd1f04138600d459d:

  media: ipu3.rst: fix a build warning (2020-05-06 14:49:41 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8i

for you to fetch changes up to a9c3d98a76dbe3b32e29ebab056daa2fad653d7e:

  v4l: document VIDIOC_SUBDEV_QUERYCAP (2020-05-07 17:37:22 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
      v4l: document VIDIOC_SUBDEV_QUERYCAP

Jacopo Mondi (4):
      Documentation: media: Update sub-device API intro
      Documentation: media: Document read-only subdevice
      media: v4l2-dev: Add v4l2_device_register_ro_subdev_node()
      media: v4l2-subdev: Guard whole fops and ioctl hdlr

 Documentation/driver-api/media/v4l2-subdev.rst                           |  53 +++++++++++++++-
 Documentation/userspace-api/media/v4l/dev-subdev.rst                     |   5 ++
 Documentation/userspace-api/media/v4l/user-func.rst                      |   1 +
 Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst            |   6 ++
 Documentation/userspace-api/media/v4l/vidioc-g-std.rst                   |   6 ++
 Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst           |   9 +++
 Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst            |   8 +++
 Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst |   8 +++
 Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst      |   8 +++
 Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst         | 112 ++++++++++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-device.c                                    |   7 ++-
 drivers/media/v4l2-core/v4l2-subdev.c                                    |  69 ++++++++++++++++++---
 include/media/v4l2-dev.h                                                 |   7 +++
 include/media/v4l2-device.h                                              |  50 +++++++++++++--
 include/uapi/linux/v4l2-subdev.h                                         |  16 +++++
 15 files changed, 349 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
