Return-Path: <linux-media+bounces-878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C442A7F5BA3
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019A81C20DB8
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 09:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D250C21A1D;
	Thu, 23 Nov 2023 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B0121107
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAF8C433C8;
	Thu, 23 Nov 2023 09:47:57 +0000 (UTC)
Message-ID: <d6ba106e-d829-49a0-a2df-f706469b9b06@xs4all.nl>
Date: Thu, 23 Nov 2023 10:47:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.8] Various fixes (mostly codec related)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following changes since commit 3c9202e88ffad78f57a418bace2d25f7824a7e4b:

  media: ivsc: csi: Check number of lanes on source, too (2023-11-22 10:56:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8j

for you to fetch changes up to 3a29b47019da708cb44d3883268794a6fb8faa58:

  media: amphion: Fix VPU core alias name (2023-11-23 10:46:13 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexander Stein (1):
      media: amphion: Fix VPU core alias name

Heiner Kallweit (1):
      media: exynos4-is: fimc-is-i2c: remove I2C_CLASS_SPD support

Paul Kocialkowski (4):
      media: vicodec: Disable (TRY_)DECODER_CMD for the stateless case
      media: visl: Hook the (TRY_)DECODER_CMD stateless ioctls
      media: verisilicon: Hook the (TRY_)DECODER_CMD stateless ioctls
      media: rkvdec: Hook the (TRY_)DECODER_CMD stateless ioctls

 drivers/media/platform/amphion/vpu_core.c               |  2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c |  1 -
 drivers/media/platform/verisilicon/hantro_drv.c         |  2 ++
 drivers/media/platform/verisilicon/hantro_v4l2.c        |  3 +++
 drivers/media/test-drivers/vicodec/vicodec-core.c       | 19 +++++++++++++------
 drivers/media/test-drivers/visl/visl-video.c            |  3 +++
 drivers/staging/media/rkvdec/rkvdec.c                   |  3 +++
 7 files changed, 25 insertions(+), 8 deletions(-)

