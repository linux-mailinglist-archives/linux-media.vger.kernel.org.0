Return-Path: <linux-media+bounces-37803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEFBB0664E
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C807A7B257A
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE922BE652;
	Tue, 15 Jul 2025 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G3pYZBVm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6821C8616
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605579; cv=none; b=QURtwTAMCXoGLU/F09RFAUaV9pbPxPIu9s8dCPUxgk9Omz8FJpjosv6vB991PKF8oUZP7t8v8lzVmTRkuIU8eiesttNg50Dl4KEf1KITCXhdUoaINDD9dhxStgCRiUmZ3CmzYMP1vaFSGls0HJ53YckU550EnoYHhXJwEd7c7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605579; c=relaxed/simple;
	bh=4/uGeW3DvYXqQni9NiD6Hv4Lg/wVFn52aLZuXuL7tQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KD7L8ZACZf6pnsYg6kl81ydgoHLFeL97jqoYDXmr6NkQe/LGvX3SrbT1a2R1Wy/qCrOmMUC98AZUIVVEag3Ev4yEk6a8h6PwTKENNQpDPpry5rZTg3aEJ16O6y6qzyr2Zqdt4nAETmNxFYU/1WR2HKWqXOkT/+TaMw0jKg8fLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G3pYZBVm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 24519289;
	Tue, 15 Jul 2025 20:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752605544;
	bh=4/uGeW3DvYXqQni9NiD6Hv4Lg/wVFn52aLZuXuL7tQ0=;
	h=From:To:Cc:Subject:Date:From;
	b=G3pYZBVmNFKFR2miik9hSBf0aIgvL6vCvUTSmvXASvMVigIe+9hWg7WoGaoR9Hq8t
	 SPP1vpak9iNt9AGkyJEExchdngOhVFn+7CW4nIQWBG1lo8GzqOfc6yZosMAxCUnU/H
	 GYQ+X6yiW0c/jrpl3dK6eo4cT/OAQbTGuvIaC84c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Misc fixes
Date: Tue, 15 Jul 2025 21:52:51 +0300
Message-ID: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

A small series of assorted fixes resulting from recent reviews. Nothing
much to mention here, please see individual patches for details.

Laurent Pinchart (3):
  media: uvcvideo: Drop unneeded memset() in meta device ioctl handlers
  media: uvcvideo: Add missing curly braces
  media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header

 drivers/media/usb/uvc/uvc_metadata.c | 23 ++++++++---------------
 include/linux/usb/uvc.h              | 16 ++++++++++++++++
 2 files changed, 24 insertions(+), 15 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
prerequisite-patch-id: 0037ebb12937e902b333498ec926b7422f00c5ae
-- 
Regards,

Laurent Pinchart


