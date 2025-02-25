Return-Path: <linux-media+bounces-26934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B987BA43B0E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 11:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CCFA1742C7
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA73B26738A;
	Tue, 25 Feb 2025 10:08:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FE25EF9C
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478086; cv=none; b=pcRIVD9EjqGG3ZcaPNS9MOLqGN/2Vsr0kLNjkZd1BSxoyc+g1uLgjGQ9Rlujhr5XUh1QWC1x2TKvCyCH0VCROXMT50CIahxSVfKc2x55B4AVlifdgu2vJKyHtcU8RwYaO0YwPn4vRtYDlj074kE1hMMPYsIKSxZu0NRZA0dq2TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478086; c=relaxed/simple;
	bh=2WZP0FlWjwUucVyNRHVS57MVAKmrMMkGAJsTXoQG9h4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ruUSn5qK0sGxhYkg/b+WQePyQQeyfC9/xMnVZ34KxWYZhWQUgDkzgLO48yQQjdFi/wmuDpPqILYTMb7C8EmMro/DBq0ZhF6S8alNiaEmuno7pqCwNxaNAipKjXk5WGp0gjgtk2IeEo7xsXeSG1flfANOQnusiq8kJ286BTnRNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52749C4CEE2;
	Tue, 25 Feb 2025 10:08:05 +0000 (UTC)
Message-ID: <7a944294-42b7-44d8-aebd-ede7029ed5b9@xs4all.nl>
Date: Tue, 25 Feb 2025 11:08:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.15] One cec fix and the removal of the
 vidioc_g/s_ctrl and vidioc_queryctrl callbacks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This PR contains one CEC core patch, one cx231xx fix that I discovered while
testing Ricardo's patch series, followed by that same series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=14558

This PR passed the CI:

https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1372296

Since this series contains core changes (including one cec change) it is
best if you review and process this PR.

Regards,

	Hans

The following changes since commit 453d5cadab1bde8e6fdd5bd05f4200338cb21e72:

  media: nuvoton: Fix reference handling of ece_pdev (2025-02-25 09:14:06 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.15l

for you to fetch changes up to eb6a296359d837010daa70a76157a432375f48ea:

  media: radio-wl1273: Rename wl1273_fm_vidioc_s_ctrl (2025-02-25 10:37:28 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      media: cec: core: allow raw msg transmit while configuring
      media: cx231xx: set device_caps for 417

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
 drivers/media/radio/radio-wl1273.c                |  4 ++--
 drivers/media/usb/cx231xx/cx231xx-417.c           | 17 ++---------------
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 ++++++++--------------------------------
 drivers/media/usb/uvc/uvc_v4l2.c                  | 10 ----------
 drivers/media/v4l2-core/v4l2-ctrls-api.c          | 55 ++++++++++++++++++++++++++++++++-----------------------
 drivers/media/v4l2-core/v4l2-dev.c                |  6 +++---
 drivers/media/v4l2-core/v4l2-ioctl.c              | 19 ++++++++++++-------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 35 ++++++++++++++++++-----------------
 include/media/v4l2-ctrls.h                        | 12 ++++++++++++
 include/media/v4l2-ioctl.h                        | 12 ------------
 11 files changed, 90 insertions(+), 122 deletions(-)

