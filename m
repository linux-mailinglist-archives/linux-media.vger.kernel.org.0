Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6E630C27F
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbhBBOvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:51:17 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39195 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234829AbhBBOuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:50:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6wzel32bSefbk6wzhlkQk7; Tue, 02 Feb 2021 15:49:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612277370; bh=AtSpRll2J3gT7r6snarldy/zK57BVk//Kh0ZfqpSZBw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=v4Ymjfx6LiUux1cBEZ3RdzbG/z5V87iX3zE0KV/WjeFkzrp3OgCG4ZY6KuHaVrgy4
         Cblc5fu6D3d4W56HRBYdx9IfbSoQG0e/5bMHmlgegSc/wsWu0xPVHZFS/KjaRmG7Jm
         i9fhfR6OsNfykU/J/peCSuB3/E6pL2wJe6WuFKpajY2n2ogf76//6o75CpQsGrpEiX
         mMKDKG1L4/O1GoJBrVRfA5jZW8IXk2Q32iZSiKYwnFN/x0qtYcKeOKl8fMVL49RJJy
         c9noU5Cs0LWsaP77CYnUYbNRk090nQksRiEzFBOsFCcHYWl/WvADfFEb2xkqCLK1m3
         ARkJPrB+jcgRw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv3 0/4] Add /sys media_dev attr for V4L/DVB devices
Date:   Tue,  2 Feb 2021 15:49:22 +0100
Message-Id: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfO6uUqsrEFiRjNa9Fmoiux1SKkZGu29xct5yio4NBYpPxUio4i0ClHkEH02a0rxTf92NXZD4hF2cH/ag9FdD1gze7AtjVHLHAB3yg+lHDjYGKwwPGDrT
 G5p2XsTB3uYWbdehCbhC+gg5nwXFt0yb2C8llWxSMJ129w3uwAd/mNigbzTJQwgpKU8KhoXIDvQk+fYtvL6m11qqm56ygYImU6cpzh5oNVHaiG4BTO58DlHe
 7jpL0uNJbN94FU/1EIEKPwFMI9RYErRNvzHgshEpzI6deV2Uj0ylJnEDI1QAQa0K
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A long standing issue is how to find the associated media device for
a V4L or DVB device node. This is primarily useful for applications
like v4l2-ctl and v4l2-compliance.

Until recently these applications relied on /sys and the fact that
the media device was accessible in /sys via:

/sys/class/video4linux/videoX/device/mediaY/

But commit ee494cf377e1 ("media: v4l2-device: Link subdevices to their
parent devices if available") broke that scheme for subdevices. That
scheme was rather a hack anyway.

Attempts to report the major/minor number of the media device via the
public API (i.e. by extending VIDIOC_QUERYCAP or VIDIOC_SUBDEV_QUERYCAP)
failed, so this patch series now just adds a media_dev attribute when a
V4L or DVB device node is created. This attribute contains the major:minor
of the media device. It is only created if the device node is actually
associated with a media controller.

The original idea for this v3 was to store the media device minor/major
at the time of the device node registration, however the media device
node is typically created last, so this information isn't known yet.

Instead a new media_device_devt() function was added that returns the
dev_t of the media device node safely.

In addition a patch was added for vim2m to ensure that the v4l2_dev.mdev
is set before video_register_device() to ensure that the media_dev
attribute is created.

This issue was reported by Sebastian Frick:

https://lore.kernel.org/linux-media/20210120183054.5ltnjdtrmumplevt@basti-TUXEDO-Book-XA1510/T/#t

Regards,

        Hans

Changes since v2: add new media_device_devt function.
        Add vim2m patch: v4l2_dev.mdev was set too late.

Changes since v1: use the is_visible callback to ensure the attribute
        is only shown if mdev is non-NULL.

Hans Verkuil (4):
  vim2m: intialize the media device earlier
  media-device: add media_device_devt function
  v4l2-dev: add /sys media_dev attr for V4L2 devices
  dvbdev: add /sys media_dev attr for DVB devices

 drivers/media/dvb-core/dvbdev.c    | 45 +++++++++++++++++++++++++++
 drivers/media/mc/mc-device.c       | 16 ++++++++++
 drivers/media/test-drivers/vim2m.c | 14 +++++----
 drivers/media/v4l2-core/v4l2-dev.c | 49 +++++++++++++++++++++++++++++-
 include/media/media-device.h       | 10 ++++++
 5 files changed, 127 insertions(+), 7 deletions(-)

-- 
2.29.2

