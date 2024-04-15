Return-Path: <linux-media+bounces-9345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5908A4DF6
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A049F280F10
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B31A627FC;
	Mon, 15 Apr 2024 11:46:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94AA60ED1
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713181597; cv=none; b=hpvJaclry2/5BlQqoaEKcEh64naLBCuMPlQuqdAhf0CxqTXLuFkBIORtWENSPRqx3piydoqU8o2IVvn8Rwe+S+NbhEGAuNg6spD7MOval4/LssgIkcqbLKDhAloEo7HgMhQzEVEjlgtVdyWxkYZM1nYnoHa3W2govKkwHriMzhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713181597; c=relaxed/simple;
	bh=KyX4m1x8038EP73kq5bNT8WVCGbzsA9eAh4m5POUyBM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nyodsyCwHROGui8knEL+cqGjhKdNH1gv3UrxJUezH3L8CrHUvESWWr2z4p3xQtd89cm1aq4qPPflSEr3jPUJqvrjN/5olgnrItE8WZBB1jnuzPDoFN8B3rr5yZAxeUWPkIWmnovqH6z2WhPBsC28JvrPETuj7+cZ186MsR/nJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0183BC113CC;
	Mon, 15 Apr 2024 11:46:36 +0000 (UTC)
Message-ID: <7de598ff-b5b9-4489-b1fb-4aa1f477a26c@xs4all.nl>
Date: Mon, 15 Apr 2024 13:46:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.10] Various fixes, mostly for various smatch issues
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Various fixes, mostly for smatch issues.

I plan to push this tomorrow if there are no objections.

Regards,

	Hans

The following changes since commit 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8:

  media: atomisp: Implement link_setup() op for ISP subdev MC entity (2024-04-11 15:40:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.10f

for you to fetch changes up to 5dd936c8e7a242c5600fc3b5b265a1fa993dd5ff:

  media: touchscreen: sur40: convert le16 to cpu before use (2024-04-15 12:41:19 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ricardo Ribalda (16):
      media: c8sectpfe: Do not depend on DEBUG_FS
      media: dvb: as102-fe: Fix as10x_register_addr packing
      media: dvb: Fix dtvs_stats packing.
      media: videodev2: Fix v4l2_ext_control packing.
      media: solo6x10: Use pcim functions
      media: solo6x10: Use devm functions
      media: saa7134: Use devm_request_irq
      media: c8sectpfe: Refactor load_c8sectpfe_fw
      media: tunner: xc5000: Refactor firmware load
      media: dvb-frontends: drx39xyj: Refactor firmware upload
      media: dvb-usb: dib0700_devices: Add missing release_firmware()
      media: cxd2880: Replaze kmalloc with kzalloc
      media: platform: sti: hva: clk_unprepare unconditionally
      media: v4l2-ctrls-core.c: Do not use iterator outside loop
      media: adv7180: Only request valids IRQs
      media: touchscreen: sur40: convert le16 to cpu before use

 drivers/input/touchscreen/sur40.c                           |  2 +-
 drivers/media/dvb-frontends/as102_fe_types.h                |  2 +-
 drivers/media/dvb-frontends/drx39xyj/drx_driver.h           |  2 --
 drivers/media/dvb-frontends/drx39xyj/drxj.c                 | 51 ++++++++++++++++++++++++---------------------------
 drivers/media/i2c/adv7180.c                                 |  2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c                    |  9 ++-------
 drivers/media/pci/solo6x10/solo6x10-core.c                  | 16 ++++------------
 drivers/media/platform/st/sti/c8sectpfe/Kconfig             |  1 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile            |  7 +++++--
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c    |  2 +-
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h |  5 +++++
 drivers/media/platform/st/sti/hva/hva-hw.c                  |  3 +--
 drivers/media/spi/cxd2880-spi.c                             |  2 +-
 drivers/media/tuners/xc5000.c                               | 39 +++++++++++++++++----------------------
 drivers/media/usb/dvb-usb/dib0700_devices.c                 | 18 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-api.c                    | 33 +++++++++++++++++++--------------
 include/uapi/linux/dvb/frontend.h                           |  2 +-
 include/uapi/linux/videodev2.h                              |  2 +-
 18 files changed, 99 insertions(+), 99 deletions(-)

