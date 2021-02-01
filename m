Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FD930A47B
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 10:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbhBAJhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 04:37:47 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58523 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232543AbhBAJhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 04:37:46 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6VdjlublEefbk6VdmlfvZN; Mon, 01 Feb 2021 10:37:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612172223; bh=CTrNeAoMCcGpFu9wWYVKPqIs2YUAC+bm3dqEH9Be+VQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Qsqse6TPJn2lHOIwdJM9gz1Ika4TNSrFedzlYJ5SVluLRAkDiJfNyyyw7A7UiabVm
         DitUe63J/RrVGR4RBYnpirnE772gFlgyKUpTQvhArW0ZzqgLwDsp0ENKxY0MKsFcXW
         bXCVMWWg6CgSsguLFd8BtjoJ2d5SMDkvTmSizoYSxYi3/Hy/Ied3wXc7dTsLAD7aHd
         3qpAwfFMlEHdRLvZf/LWSQcd6QktJXi9gHJLmYR5Qe3Yeo8FRcbyzuXx+qV52mfzJa
         15Dx5wOqiTjLPY205gYfJ7/uHcQdD3OSlnARj3dkAWKeACzYe6GpO/Sp79LQhbAo48
         LzgGEyYN/ImuQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv2 0/2] Add /sys media_dev attr for V4L/DVB devices
Date:   Mon,  1 Feb 2021 10:36:57 +0100
Message-Id: <20210201093659.2945449-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJDubjhqzPc4SJmxZIbFvxw6EAT4hJ12G3mVbbxZxJq6c14eVSZaoiFEc9KLQdj3elkTi2l9laRPE2p/IkvBPznQcJmLbgYtttNWWyhL6cYDP8/N4yWW
 kacmTi1cUmMwm1EafjxJN2o24vOP5hhzFb+lyEquUoCog64hOox2ta/87g4u27HHCr3NUPzb2p0JpUrlAqbxg4kn/3MDiWljZQv6bPfAv7S91wE8BbNM4ZiQ
 yyJ2Ucc8b3TQlJOt3HQnU3fOxHH8jzbtXTJCY5XLYIj67Qm1Hpn8O8Ogk4LexTOX
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

This issue was reported by Sebastian Frick:

https://lore.kernel.org/linux-media/20210120183054.5ltnjdtrmumplevt@basti-TUXEDO-Book-XA1510/T/#t

Regards,

	Hans

Changes since v1: use the is_visible callback to ensure the attribute
is only shown if mdev is non-NULL.

Hans Verkuil (2):
  v4l2-dev: add /sys media_dev attr for video devices
  dvbdev: add /sys media_dev attr for dvb devices

 drivers/media/dvb-core/dvbdev.c    | 46 ++++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-dev.c | 48 +++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 1 deletion(-)

-- 
2.29.2

