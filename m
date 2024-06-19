Return-Path: <linux-media+bounces-13708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6990F066
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 16:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1248F1C217DD
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21BE18029;
	Wed, 19 Jun 2024 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="W+5U/ABe"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678B11723
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718807237; cv=none; b=jI4o1FdLYUgfVK2xG/dhBFw1X+Z79Nww+UHd4VX5/xRenlpQ1xsIrMEFRjjXmr7Us0OlvtTxKNgE9O1gbs9JLzjdzXIDgVIDHI2vjVZ6MOb/SY3NiB77S4uOOICTo9lheUBnJ58+m4mZratcjcwzvzvTV1iPnV8aDxHqk+o5vAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718807237; c=relaxed/simple;
	bh=VkeW1jf2VYoy7mcFcjxI+35MVpGUCdRLKjvc6ncs+fY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFG9Z0+9rCh8LCpp8QC/qpIOJN0OQkBbMJ7SyIKfUNSEi/taWIV2vvFvgfKKpQ9vT0VA6x1oTVC3uTSbsFq/LYVU64NEM0rIbwbyy3qJD87bYFFb0N4omKSwmpcCF2iSyOfWk3s5hSt/9uhWFRHzFywZYgQd5Xq38wDvqRnm9cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=W+5U/ABe; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1718807226; bh=VkeW1jf2VYoy7mcFcjxI+35MVpGUCdRLKjvc6ncs+fY=;
	h=Date:From:To:Subject:From;
	b=W+5U/ABeX83QHg1FByRI7B4sTxFcDdKZ4gx7fSadQ+mSk+A4qSXbl0uYePrNBVION
	 7WwFPuS7sypAdT29+InqC9wlLBUqPx2NUt0oVs2K9Dh7f+INQ0AlCXbbnKTzVXQP6s
	 Xq+o2Xr2o9LxQ81eMRMF8m7GF0Iiy0+mx2B6p7JRL4tlcVIVHnr7mfttktJaWKcWW7
	 gjJ8Pt8yrVEqQA5UlLR3M+evZTCuFJ/FZ91KOkLbjLVVGDFsAl2MVEJl50UomMH0v9
	 L8v5NQ57N++/dSQ7uT1Zrx/fDqQT332dnfCHNsBw8Q0d1lgkzofj9j7lLF8yamqfGU
	 lAtNhnXilnLAQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id A6CBD10073E; Wed, 19 Jun 2024 15:27:06 +0100 (BST)
Date: Wed, 19 Jun 2024 15:27:06 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.11] Trival rc fix
Message-ID: <ZnLquuL7ki8H_cvK@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Just a trival change. Sending out now so it doesn't get forgotten.

Thanks,

Sean

The following changes since commit 91798162245991e26949ef62851719bb2177a9c2:

  media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-15 11:16:40 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.11c

for you to fetch changes up to 8454f80272ad52e95e5dee5d224e434d99347263:

  media: rc: add missing MODULE_DESCRIPTION() macro (2024-06-19 15:20:30 +0100)

----------------------------------------------------------------
v6.11c

----------------------------------------------------------------
Jeff Johnson (1):
      media: rc: add missing MODULE_DESCRIPTION() macro

 drivers/media/rc/rc-main.c | 1 +
 1 file changed, 1 insertion(+)

