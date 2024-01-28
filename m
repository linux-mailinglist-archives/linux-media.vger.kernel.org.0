Return-Path: <linux-media+bounces-4292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B644383F88C
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 18:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7415E28370D
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 17:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1612D05C;
	Sun, 28 Jan 2024 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bZlKrni7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382D2D044
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706463169; cv=none; b=VqkMacuEgMhxBfICXCp2xqQIJLFyxQFR+2OXvevAveqX54yJTs8tUf77apxo369+1PaLSlYdCT4QvjwePavY1LidDusizM7X5mliTO1HekB1bzazjRr/SEhgq5SDSjxK+pudtc4J/QfaE7/McrWya9cHKgXZ//66/bc/YkZsl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706463169; c=relaxed/simple;
	bh=CDzZfGcBg3jxJ0gyFHO8/qJEwIRIy0epqIcntpNn1oI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VCyIuwhusMZ2xv6r3qf6QlnplGhPouVwW0HQJ5FLxdjITHwzBIdbVTTP35BrPqUbSIWUTVKsg6IcP7LG805Qi/D6CMMhEj+yP5fffMwGk7NYMc2hIyZ8uz1WAY3Amnl2pH/tE2IoBnaxiAGd5leZ0cDoFMdnSmdpnV5QKz/YPHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bZlKrni7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2940A3D9
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 18:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706463089;
	bh=CDzZfGcBg3jxJ0gyFHO8/qJEwIRIy0epqIcntpNn1oI=;
	h=Date:From:To:Subject:From;
	b=bZlKrni7uz/M5+FYTwxL7n/Gt+IHol+bVukOeTPPptr3DiPqByefVqNp6pBHIJISt
	 wOyn84S0335bMuqBG4f5FrhNWdcqnvo1X9fRWyieZJPFEGxl1WnchwdUFkBf4Bhmib
	 WySikTYKsOamLsCUtEdR5Q7twH/0msu39xNABuZM=
Date: Sun, 28 Jan 2024 19:32:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT FIXES FOR v6.8] rkisp1 regression fix
Message-ID: <20240128173245.GE27180@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans and Mauro,

The following changes since commit b32431b753217d8d45b018443b1a7aac215921fb:

  media: vb2: refactor setting flags and caps, fix missing cap (2024-01-24 17:27:51 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-fixes-rkisp1-20240128

for you to fetch changes up to f3a16731f6c03d01198477743212198c608ac4d8:

  media: rkisp1: Fix IRQ handling due to shared interrupts (2024-01-28 19:07:39 +0200)

----------------------------------------------------------------
rkisp1 regression fix for v6.8

----------------------------------------------------------------
Tomi Valkeinen (2):
      Revert "media: rkisp1: Drop IRQF_SHARED"
      media: rkisp1: Fix IRQ handling due to shared interrupts

 .../platform/rockchip/rkisp1/rkisp1-capture.c      |  3 +++
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 ++
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  3 +++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 24 +++++++++++++++++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  3 +++
 5 files changed, 34 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

