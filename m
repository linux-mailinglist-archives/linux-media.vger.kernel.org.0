Return-Path: <linux-media+bounces-13805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EFE910449
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DE4AB24375
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5A11AC438;
	Thu, 20 Jun 2024 12:35:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920D1A4F2B
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718886910; cv=none; b=QjrkOK6meji2qXGeUPJcUv/D8cxLBZ0d17evz2shDbZbRDBSu7uWCkAWOXL2hEfOAEJKEPPLr9boD5CKT9RciWHk2hzsnf2lCNNdTP+dr8Gik2NJg7taZagiql8mkwlxTM1/2BdiEkDLcz4W56BAIGQAGm9a23HDhxGin0RRKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718886910; c=relaxed/simple;
	bh=iUEM1dQbsFuTvu2ZO6DeZ8aZvZ1I4Hpewm6lYIA8KXA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mmNj4la5UHRk140tO0Nc/YSLbPNR5HVo+NgPca6KUWXiidNodtKpPuF5742AAaCCWSibiWcph7uY89nCJT9k9QvF35Lc/FZpkkYix4PSLE2m3SRbzrxPyz8YRyvnPAJrI6aYYweNxcjwRLA0d0fdVY3OBbLj1+Wl5p94At1m1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A871BC32786;
	Thu, 20 Jun 2024 12:35:09 +0000 (UTC)
Message-ID: <921108e1-0ae1-4e95-a161-77af991ee16c@xs4all.nl>
Date: Thu, 20 Jun 2024 14:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>, Ming Qian <ming.qian@nxp.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.11] Various fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The main change is the conversion from tasklet to BH workqueue. Allen, thank you
for your work on that and the quick turnaround time after my reviews. Nice to
get this in.

Besides that there are a few small fixes.

If there are no objections, then I plan to merge this during the weekend or on
Monday at the latest.

Regards,

	Hans

The following changes since commit 7fc65b78b465b8511a503491e7c3116d46dc6c72:

  media: platform: mtk-mdp3: Add support for MT8188 MDP3 components (2024-06-20 11:47:48 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.11d

for you to fetch changes up to 5167c3159c1b78bc9e43e7932df27cb16f518ce4:

  media: imx-jpeg: Drop initial source change event if capture has been setup (2024-06-20 14:17:10 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Allen Pais (1):
      media: Convert from tasklet to BH workqueue

Chi Zhiling (1):
      media: xc2028: avoid use-after-free in load_firmware_cb()

Christophe JAILLET (1):
      media: cx231xx: Constify struct vb2_ops

Ming Qian (2):
      media: imx-jpeg: Remove some redundant error logs
      media: imx-jpeg: Drop initial source change event if capture has been setup

 drivers/media/pci/bt8xx/bt878.c                          |  8 ++++----
 drivers/media/pci/bt8xx/bt878.h                          |  3 ++-
 drivers/media/pci/bt8xx/dvb-bt8xx.c                      |  8 ++++----
 drivers/media/pci/ddbridge/ddbridge.h                    |  2 +-
 drivers/media/pci/mantis/hopper_cards.c                  |  2 +-
 drivers/media/pci/mantis/mantis_cards.c                  |  2 +-
 drivers/media/pci/mantis/mantis_common.h                 |  2 +-
 drivers/media/pci/mantis/mantis_dma.c                    |  4 ++--
 drivers/media/pci/mantis/mantis_dma.h                    |  2 +-
 drivers/media/pci/mantis/mantis_dvb.c                    | 12 ++++++------
 drivers/media/pci/ngene/ngene-core.c                     | 22 +++++++++++-----------
 drivers/media/pci/ngene/ngene.h                          |  5 +++--
 drivers/media/pci/smipcie/smipcie-main.c                 | 18 +++++++++---------
 drivers/media/pci/smipcie/smipcie.h                      |  3 ++-
 drivers/media/pci/ttpci/budget-av.c                      |  3 ++-
 drivers/media/pci/ttpci/budget-ci.c                      | 27 ++++++++++++++-------------
 drivers/media/pci/ttpci/budget-core.c                    | 10 +++++-----
 drivers/media/pci/ttpci/budget.h                         |  5 +++--
 drivers/media/pci/tw5864/tw5864-core.c                   |  2 +-
 drivers/media/pci/tw5864/tw5864-video.c                  | 13 +++++++------
 drivers/media/pci/tw5864/tw5864.h                        |  7 ++++---
 drivers/media/platform/intel/pxa_camera.c                | 15 ++++++++-------
 drivers/media/platform/marvell/mcam-core.c               |  8 ++++----
 drivers/media/platform/marvell/mcam-core.h               |  3 ++-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c           | 14 +++-----------
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 14 +++++++-------
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h |  2 +-
 drivers/media/radio/wl128x/fmdrv.h                       |  5 +++--
 drivers/media/radio/wl128x/fmdrv_common.c                | 40 ++++++++++++++++++++--------------------
 drivers/media/rc/mceusb.c                                |  2 +-
 drivers/media/tuners/xc2028.c                            |  9 ++++++++-
 drivers/media/usb/cx231xx/cx231xx-417.c                  |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c                |  2 +-
 drivers/media/usb/ttusb-dec/ttusb_dec.c                  | 21 +++++++++++----------
 34 files changed, 154 insertions(+), 143 deletions(-)

