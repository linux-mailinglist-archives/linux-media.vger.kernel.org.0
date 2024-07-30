Return-Path: <linux-media+bounces-15552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D9940D6E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 11:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 579891C22FDA
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60BE194C76;
	Tue, 30 Jul 2024 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="fGqedOpo"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373DB194AD1
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722331623; cv=none; b=Rgt1jkjmOVj5GnCdM1G8E7FTIFSyyWZe6t30VAGDpHuxEiQm17SxJpEl7fooI7M87DMrlMO72ouFJ8W0JhM33uncisKgVlHkOxz4me0LnyWLVaUJucHeiphsBeea26iC2phlZnkSYecrFgtUeLwsT+X5OWBS4Y7dwBmxr8lLjjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722331623; c=relaxed/simple;
	bh=NGZ3zHFhcco2hoDiJL8V6tisNu0qCriwsOSjx4t9vYE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pkrtmge5u2GBBUBJU5YneteCGS8GsiOUZh9vVgU5nX4oT6XfN3kylVsLwPX+PbPOf/+gpuYq4HkAIWlAbHcXhal7XA8K8Qm46xlVDiwCIp6zfqcCUeNGIjor70QrK+iDu1S9YHpRcnljH7X5Pl/svQ7aDREWpECSGywfaLl4EWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=fGqedOpo; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1722331065; bh=NGZ3zHFhcco2hoDiJL8V6tisNu0qCriwsOSjx4t9vYE=;
	h=Date:From:To:Subject:From;
	b=fGqedOpolBoc7ed8D5PMgfzBNbCPIicxv2uSI5bONQpuJAozfn0e3PZloWa87ULYa
	 Z8xytWlj20utYUGsQY3eT9dvpkv+yT//l1E7ibAhzAlg/O0wsmqM4EJQrdeg8wgQpK
	 VPrfgZR8y95qfnbvjkRTJSIErMpR1M6sFalsZzYhnBkL9Nils5UnR6dNvvdVrjOK7h
	 97TpfAEtaPsi8PTTAT21srnnYjwpAV7py6Hcnyntq//Pi5hBuJJn5beRk/VglJo2TG
	 c4qQBHp7A/JGSI30SK1sdjYCR1BUru0tmOWFOLMx2MkEyOMszGulbK8vsFDqC6bMVP
	 tCMNgo9uXq0Mg==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 66318100069; Tue, 30 Jul 2024 10:17:45 +0100 (BST)
Date: Tue, 30 Jul 2024 10:17:45 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.12] rc fixes
Message-ID: <ZqivuXgUtKUXdoMA@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.12a

for you to fetch changes up to 2fa4973edeba0474ddba596a0570b773075fa2af:

  media: rc: remove unused tx_resolution field (2024-07-30 10:11:16 +0100)

----------------------------------------------------------------
v6.12a

----------------------------------------------------------------
Sean Young (1):
      media: rc: remove unused tx_resolution field

Zelong Dong (1):
      media: rc: meson-ir: support PM suspend/resume

 drivers/media/rc/ene_ir.c      |  3 ---
 drivers/media/rc/ite-cir.c     |  1 -
 drivers/media/rc/meson-ir.c    | 27 +++++++++++++++++++++++++++
 drivers/media/rc/rc-loopback.c |  1 -
 include/media/rc-core.h        |  2 --
 5 files changed, 27 insertions(+), 7 deletions(-)

