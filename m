Return-Path: <linux-media+bounces-21310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E669C5994
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 14:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 571C9B3E29A
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC52F14F12F;
	Tue, 12 Nov 2024 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uv/X+znt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C695314B97E
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415600; cv=none; b=JFnAQqMhWRGD4X5ibUoW4j/BJRhjJqoFzald7S8GpNr770jJqZd//jymz9aqt8v639Fb03wZDDbL2zEVCFXIoiGFOuJqI7K5yNGLAooeY/uQ0g/Kw0BwmMWB/brR4YU0BSc31+MJkUEbLP1QunGLP/P1hVFjSPasFhHDFJQqktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415600; c=relaxed/simple;
	bh=7TwaqOuPOYFsxVKL7mfPHE624AkAVMVrsXCxZMG4X5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jMbBB65CnQkSYxHGEbffOedfopWRDUL8X7Zo6eGXL7pkvs/jrhDCCfq0JaxONO2/dRpw5TZjhHo+QOLx9wyUouYkiu6mahmfmpEvJmXWNRMGIYVlElol54P0QCctcH6zdYnsOpDzitV4cENaW/1jP3bB3jLuG1sSay2aq3yqImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uv/X+znt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8148512;
	Tue, 12 Nov 2024 13:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731415582;
	bh=7TwaqOuPOYFsxVKL7mfPHE624AkAVMVrsXCxZMG4X5k=;
	h=From:To:Cc:Subject:Date:From;
	b=uv/X+znt+ceknU6R7npizxd08wBtkxJGdITXID06hdVqnOtZ0ct9D1ILh3HslOM3h
	 uogwUT9L1OmURk+RxYeVxpVYYPxS63ktdWKKbCBnId3w4pYhmWFUse0gdvYev2vM8c
	 XPUcE/5pZVDr250lU2ZIEQJZAXCCKpJLNO4TvvF0=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/4] Extend RAW format support for rzg2l-cru driver
Date: Tue, 12 Nov 2024 12:46:10 +0000
Message-Id: <20241112124614.646281-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All

This series adds new pixel formats representing the 64-bit packed format that's
used by the Camera Receiver Unit in RZ/G2L and V2H SoCs. Support for capturing
those formats is then added to the rzg2l-cru driver itself.

The series is based on top of the v2 of Prabhakar's recent set titled
"media: platform: rzg2l-cru: CSI-2 and CRU enhancements"

Thanks
Dan

v1: https://lore.kernel.org/all/20240927232729.GR12322@pendragon.ideasonboard.com/T/

Daniel Scally (4):
  media: v4l2: Add Renesas Camera Receiver Unit pixel formats
  media: platform: rzg2l-cru: Use v4l2_get_link_freq()
  media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
  media: platform: rzg2l-cru: Add support for RAW10/12/14 data

 .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
 .../media/v4l/pixfmt-srggbnn-cru.rst          | 168 ++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   2 -
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  37 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  89 +++++++++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |   3 +-
 drivers/media/v4l2-core/v4l2-common.c         |  16 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  16 ++
 include/uapi/linux/videodev2.h                |  21 +++
 9 files changed, 329 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst

-- 
2.34.1


