Return-Path: <linux-media+bounces-24079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7CC9FC5DF
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 16:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210201635E2
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 15:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88715823DE;
	Wed, 25 Dec 2024 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TljpQ9I1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8E323D
	for <linux-media@vger.kernel.org>; Wed, 25 Dec 2024 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735140668; cv=none; b=k9rGl496pUJbKrAFHQuzdBhZ7BRU9JS2uDws1TbGgjEJr6VMcnB/gmTwd3NKgo2jyuqYcRrX2OLZRP2feC1dEGufMmV4rsagBv1OqmuCbt9rBqT3Tp0vUxPXuLKeFrFDECI4Fb50NMwDjL2KLbuJwdELB0I8Rp9zI0U2FKMqBa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735140668; c=relaxed/simple;
	bh=XPprf/LnUo1gIngVT2PfZiJ/xQVgWG2glGIwGN2mJtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aU8JNm7vZnFbZ0LfjpNkU6noSF1rRd5gb8u5yXvMsDrzNnq3njt5mKPMkAP9gWGdF7GPo32OYLMR0yjSWL3uerXKXOmgAgcRLALUwiJ7gDWT3lWmTKxEu9uh8zIXMBO/ulRWJArr/G/JtYt5fJKWAyNXnVXccc5ncdh9K4+mVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TljpQ9I1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D0F66EC;
	Wed, 25 Dec 2024 16:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735140615;
	bh=XPprf/LnUo1gIngVT2PfZiJ/xQVgWG2glGIwGN2mJtM=;
	h=Date:From:To:Cc:Subject:From;
	b=TljpQ9I1BKj/VH8UomQ+DDSM8QCSr3t7P7R/FqcM6yk0PIcqdLmf4R1pSEOAC0Jgm
	 CCiNsmle1Bpbgg/Svhupk1CDo1CTblWFdxqVSWsFWXw689yHJShjVTwe8pxBiFD5ju
	 HC/qepMtx4GdTrIuiBbNy2/NC0hgxkEWt9PtXZZI=
Date: Wed, 25 Dec 2024 17:30:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.14] uvcvideo changes
Message-ID: <20241225153056.GA3523@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 40ed9e9b2808beeb835bd0ed971fb364c285d39c:

  media: uvcvideo: Announce the user our deprecation intentions (2024-12-19 14:44:43 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-uvc-20241225

for you to fetch changes up to 602cb4ec107b094564a75270d8696ec2c951ece6:

  media: uvcvideo: Add Kurokesu C1 PRO camera (2024-12-20 20:20:12 +0200)

The series passes CI:
https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1335657.
As it is based on top of the latest fdo next branch, there's no need to
rebase.

----------------------------------------------------------------
uvcvideo: Quirk for dual-stream devices affected by packet loss

----------------------------------------------------------------
Isaac Scott (3):
      media: uvcvideo: Implement dual stream quirk to fix loss of usb packets
      media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
      media: uvcvideo: Add Kurokesu C1 PRO camera

 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 27 ++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

