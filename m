Return-Path: <linux-media+bounces-27487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1CA4DFBD
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 14:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 811337ABE2C
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 13:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0922046BF;
	Tue,  4 Mar 2025 13:51:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFAB201267
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096317; cv=none; b=H7KUJu3JJRLxSQy3edqRO9ZgB1ssyp8adpAAA20m1bw/Ypnm4IhTDnu0rcWPF02bnVcp10ruASPEAJWS8sQNjKiTP/n6ivpIHKO+3+WdQvVQf+s2ZKWZydvVNSO5XjbQwTa1j2YbF9UGPttOSHILM6zpb3u9fysGeQ+oY3c5v1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096317; c=relaxed/simple;
	bh=c+5TVVrnpieeUq/Rk/leBCZnM5JwhgM/CZUodqOx4I4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Il0hFnqn9WkhDCQZCpyAS30KBmmLZtmnjJEyrL2oRgnEghRVqmz0b9ZEi0TgnLfPeYgg8o3dA4+lByI25dMCeR7vdWh3Ps7TjbxuGBbIjwZj15a7cX95eUxZEWDCT0BXt54r5jgwLF46qqeiquNH6mUmkmBS6yyi5zPrUit+8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127DEC4CEE7;
	Tue,  4 Mar 2025 13:51:55 +0000 (UTC)
Message-ID: <ea145d2e-f045-4540-9268-86295cefbf92@xs4all.nl>
Date: Tue, 4 Mar 2025 14:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR v6.15] cec/printk fixes and the removal of the
 vidioc_g/s_ctrl and vidioc_queryctrl callbacks
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This PR contains one CEC core patch, two core rectangle logging fixes,
one cx231xx fix that I discovered while testing Ricardo's patch series,
and Ricardo's patch series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=14558

Note that the uvc patch from that series was modified due to a trivial
conflict with the UVC PR that was merged earlier.

This PR passed the CI:

https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1377347

Since this series contains core changes it is best if you review and process this PR.

Regards,

	Hans

Changes since v1:
- rebase
- added two core rectangle formatting patches

The following changes since commit fd4f68174d8647c4108731a2b8ad95c1c33ecaf7:

  media: uvcvideo: Drop the uvc_driver structure (2025-03-03 18:23:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.15l

for you to fetch changes up to 232f8f5d489bc20ec0034e7683e1169219a1b33c:

  media: v4l2-core: use (t,l)/wxh format for rectangle (2025-03-04 12:50:31 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (4):
      media: cec: core: allow raw msg transmit while configuring
      media: cx231xx: set device_caps for 417
      media: v4l2-tpg: use (t,l)/wxh format for rectangle
      media: v4l2-core: use (t,l)/wxh format for rectangle

Ricardo Ribalda (12):
      media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
      media: pvrusb2: Convert queryctrl to query_ext_ctrl
      media: pvrusb2: Remove g/s_ctrl callbacks
      media: uvcvideo: Remove vidioc_queryctrl
      media: atomisp: Replace queryctrl with query_ext_ctrl
      media: atomisp: Remove vidioc_g/s callback
      media: v4l2: Remove vidioc_queryctrl callback
      media: v4l2: Remove vidioc_g_ctrl callback
      media: cx231xx: Remove vidioc_s_ctrl callback
      media: v4l2: Remove vidioc_s_ctrl callback
      media: v4l2-core: Introduce v4l2_query_ext_ctrl_to_v4l2_queryctrl
      media: radio-wl1273: Rename wl1273_fm_vidioc_s_ctrl

 drivers/media/cec/core/cec-api.c                  |  2 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c     |  8 ++++----
 drivers/media/radio/radio-wl1273.c                |  4 ++--
 drivers/media/usb/cx231xx/cx231xx-417.c           | 17 ++---------------
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 ++++++++--------------------------------
 drivers/media/usb/uvc/uvc_v4l2.c                  | 25 -------------------------
 drivers/media/v4l2-core/v4l2-ctrls-api.c          | 55 ++++++++++++++++++++++++++++++++-----------------------
 drivers/media/v4l2-core/v4l2-ctrls-core.c         |  6 +++---
 drivers/media/v4l2-core/v4l2-dev.c                |  6 +++---
 drivers/media/v4l2-core/v4l2-ioctl.c              | 39 ++++++++++++++++++++++-----------------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 35 ++++++++++++++++++-----------------
 include/media/v4l2-ctrls.h                        | 12 ++++++++++++
 include/media/v4l2-ioctl.h                        | 12 ------------
 13 files changed, 107 insertions(+), 154 deletions(-)

