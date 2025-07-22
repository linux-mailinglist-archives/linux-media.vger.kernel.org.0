Return-Path: <linux-media+bounces-38198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210FB0D3DF
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 09:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16F16174E1B
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 07:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A36F2DE6FE;
	Tue, 22 Jul 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7BqNIKW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE62D97AC
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170020; cv=none; b=th5NF/HfE6ZRLMl2Vgs7C2QPFldpDLr1LutlzIPE1UuJjOnP2qd3Ed1+ES3whRbDz2FkXENQVTToscju20kBoDVTwDzy3Z6MAwrskY4pBkCgNf787XXgmgF8qiSv2Kd+F1J/45GFCwhCBJir5moC21GPqz3iK2ixEje0oLMiJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170020; c=relaxed/simple;
	bh=mN59pPZ86eD/gL0U8HqikBJnvQoIF/bEQ7ZcVz1Ethg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OO3R9QorwQYUeRapk4BGH4a2Y/Jy6511ELYu92pHZ/tbWYey9vUOeVBotX/kA5gxc/56zSWp8b7iQoKJla8sGFC5GA+zViDsH7ejb2ytYzOs9EjyJvwB7eHU9o2eq+OYhPL3XCL1GONNvojg3mRK7bD+2lHU6GN9aRB60hYXdx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7BqNIKW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6F5C4CEEB;
	Tue, 22 Jul 2025 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753170020;
	bh=mN59pPZ86eD/gL0U8HqikBJnvQoIF/bEQ7ZcVz1Ethg=;
	h=From:To:Cc:Subject:Date:From;
	b=s7BqNIKWWZkmQbd7LIj5qMNX+rhfmMTnhUWqV9H+gxn9mQwfHMBUseZZMm2q5MNkv
	 SLcpGLYPb5j6jSPdE4KEODlmMhteaiAEBCLxsA9xb785m0vBAJs7HfodNRNFqOn2gA
	 5iOVAncIB1L6UOFDbTKCCyEsJ6u5qUJFfrqn4lCh0y9EjAw6iKGvP5u4kx4Kw7SQYr
	 D2YOy/4D6nP/JTn38Ad1N0MQqqWwOYkpb+omfVeoM2vSCxuzEbe331dtuAs2PWH9XM
	 sdcnThpzq4svJ2tP1OtaYklrwK82twt1NfPyHchbU8mLBHVlP0es3MU+gGKUoA1ds3
	 OQ74ifcFUHOnQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCHv2 0/2] media: tc358743: add support for more IF/Packet types
Date: Tue, 22 Jul 2025 09:34:34 +0200
Message-ID: <cover.1753169676.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tc358743 HDMI-to-CSI2 bridge is widely available, and it has quite
flexible InfoFrame/Packet Type support, so this makes it a very nice
device to capture such data.

This patch series adds support for SPD, AUDIO, DRM and HDMI InfoFrames.

Also add support for ISRC1 and ISRC2 Packet Types and a programmable
type for both Packet and InfoFrames, which by default is programmed
for DRM InfoFrames.

These changes make the tc358743 very useful when you want to see
what InfoFrames and Packet Types are being transmitted.

Regards,

	Hans

Changes since v1:

- Added Packet Type support (ISRC1, ISRC2) and DRM and MPEG
  InfoFrame support.
- Added programmable Packet Type (defaults to DRM).

Hans Verkuil (2):
  media: v4l2-core: v4l2-dv-timings: support DRM IFs
  media: i2c: tc358743: add support for more infoframe types

 drivers/media/i2c/tc358743.c              | 109 +++++++++++++++++++---
 drivers/media/i2c/tc358743_regs.h         |  57 +++++++----
 drivers/media/v4l2-core/v4l2-dv-timings.c |   4 +
 include/media/v4l2-dv-timings.h           |   1 +
 4 files changed, 140 insertions(+), 31 deletions(-)

-- 
2.47.2


