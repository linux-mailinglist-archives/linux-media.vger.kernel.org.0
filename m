Return-Path: <linux-media+bounces-20433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84D9B3500
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56BEF1F215F9
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28E31DE2B9;
	Mon, 28 Oct 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="KYaWi5Uh"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C191712F585
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730129672; cv=none; b=f/2bKAtreaAy/7Hb+IxIpuo0+KFUZyMW1D/jsihu1zFW1K5DcisGK+gV2v8hLI9xKP2Mk3VwWC2sIFkd84BDf6aK/dK8y15XhiHcVCoezq8Ur8r6Mt+/rUcpYocm3jj/EkM3XDrqOgHrnXaAHa/gHIsr9idgH3V4zGS3ZANSwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730129672; c=relaxed/simple;
	bh=I6dfp/Ii0ypMRRl+vUNb9bOEGD7Z82DAb1q9eiHlOI0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbeEvL1E+U49I3zdiNo9FAhLsL6EqGh6/C0ZCfWgBfTnSYIPp0J4XFddqcOVoHBLtScUQ3U8V5o+ULSJ4biNXliVAagN5Ejy7MuD8PGWkL8Wps8wgEEAd1oEF6tiTSl+XWVde8z6WvNYIKqeeChBTXnqV+L51VQchJ8A3k6orzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=KYaWi5Uh; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730129661; bh=I6dfp/Ii0ypMRRl+vUNb9bOEGD7Z82DAb1q9eiHlOI0=;
	h=Date:From:To:Subject:From;
	b=KYaWi5UhOlBsr6CIRTOyASKl8JhAW42v8RdiVUneWSgtm4b0y2eiJ4TVrLKPlYa9A
	 ggIXLI8HNxYfbQIAcJGcJ3QF50JGbHY0hDfb+ZrGjHswQMdbPCyS1OA+42deglqUWV
	 Y9yDP5MLV8WDaZbt+mLtMP4srgme/ST4ZzxAYDBul7+mpGWuSuYufgn1X/tilSTVpw
	 6LwCRPVpr7wjjj/N1NsvCLCsFGsYIdscbXOyf+Z+1z45kW6SZccaZe/au70yQq++M2
	 /9hk6V9LSgUcNCM254IlF5PEJo7pHkTlkGKVe/6Hz+gIUtxEiHi7jwlpGZxnQOkcmd
	 yzDehWiZqj9Bg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 00A591000C4; Mon, 28 Oct 2024 15:34:20 +0000 (GMT)
Date: Mon, 28 Oct 2024 15:34:20 +0000
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.13] Tiny rc core change
Message-ID: <Zx-u_AaY36dM1EPT@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro, Hans,

The tiniest PR here :)

The following changes since commit d020ca11a816a99f87f2d186e137a9fb2341adb3:

  media: samples: v4l2-pci-skeleton.c: drop vb2_ops_wait_prepare/finish (2024-10-28 09:20:10 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.13a

for you to fetch changes up to 4247f472cc4df1433832ec707c479080879a79af:

  media: ati_remote: don't push static constants on stack for %*ph (2024-10-28 15:19:08 +0000)

----------------------------------------------------------------
v6.13a

----------------------------------------------------------------
Andy Shevchenko (1):
      media: ati_remote: don't push static constants on stack for %*ph

 drivers/media/rc/ati_remote.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

