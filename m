Return-Path: <linux-media+bounces-35503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065FAE2062
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 18:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC019189D160
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 16:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB372E6136;
	Fri, 20 Jun 2025 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="B8eoMTo7"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA46136988
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438289; cv=none; b=fp8TfYzfUTWQqlELH2kZLZ4P+5BBTpd8HFQ3OecXEtQACL/iyCy/rS6k3t69x/BAIwh66+OTdGYg4ttGqZIU8YifCgl35xBU0scqlcapNFMp7yFkyC+5VM6Tnl1hXgimZhOpHyzYDem7rVachm9758yt7pmeIgUxtVRTWjeHhjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438289; c=relaxed/simple;
	bh=MsvgK3MxLra4OxsysFSmIA+an/hcclMfZzhPyShu60I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slp5y/FS9IbQ4jb1XRw2Qj1YOzLNT1c3oQkBshf4fwtkXpWPp0mKJFgrVRxR3luOOnZhGYJ46VMnvU+G9AhsE06xM9W4AaXsxWn+AHs9lMhoGC2QL0Kcpt/UbWCPxsK4UsXVCLCdGGQe84qdRCQiq3k/sPL9qVlHMKqPiRAVt3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=B8eoMTo7; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1750437813; bh=MsvgK3MxLra4OxsysFSmIA+an/hcclMfZzhPyShu60I=;
	h=Date:From:To:Cc:Subject:From;
	b=B8eoMTo7YNsQYRruV+Z7qOokoLihDcBt2YxgReqKyRx0r6+qsd6hmKlZoZVyEqYwz
	 OBwa//dz3nzfNDB6rDcO1uN1Cu6WNF8MkvW3DGJVKZ6v1Cf3Tw4PUj5uHOfkcSZP5a
	 ZCDlc9USorNhEIuii5Wf7TPznwb8RpwKKsqQcmT/Sc+MvYxtXvuKjlHy13XFH5ajzX
	 ofvL/EdFLCjznE7FfPVsAoyL5maoAS95tOXRJUohQM8m92+r4ZnB9Qd+EjCTtWDH3X
	 /qj/6558ZDPNWUqM/7f9Rt5EJ+7P2DYnfAdUpXMOv2Te6TntJIP2Ggn3NQbz6MrObI
	 jCN8a3ingeD4A==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 27D2F100740; Fri, 20 Jun 2025 17:43:33 +0100 (BST)
Date: Fri, 20 Jun 2025 17:43:33 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Cosmin Tanislav <demonsingur@gmail.com>
Subject: [GIT PULL FOR v6.17] ir-spi fixes
Message-ID: <aFWPtUtfTDHCFfyO@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 803b9eabc649c778986449eb0596e5ffeb7a8aed:

  media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check (2025-06-20 13:20:17 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung tags/v6.17a

for you to fetch changes up to bc864b287498135cafc29bc6250f41d88a41a0ea:

  media: rc: ir-spi: avoid overflow in multiplication (2025-06-20 15:23:01 +0100)

----------------------------------------------------------------
v6.17a

----------------------------------------------------------------
Cosmin Tanislav (3):
      media: rc: ir-spi: allocate buffer dynamically
      media: rc: ir-spi: constrain carrier frequency
      media: rc: ir-spi: avoid overflow in multiplication

 drivers/media/rc/ir-spi.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

