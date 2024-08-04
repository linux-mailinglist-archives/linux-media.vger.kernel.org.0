Return-Path: <linux-media+bounces-15751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C63946D5D
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 10:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7033C1C2144F
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63A31CD06;
	Sun,  4 Aug 2024 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9f8WXCY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A106FC7;
	Sun,  4 Aug 2024 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722758861; cv=none; b=H6OmAGm8r/qMb/FYsFI3GR1o5cwm1T4lz/8yotELcDspAaq/RkxbjqB60QksQ5pjnhktM+9XHMUT+ds+tNIlj6dEB7y8ZHfFwhSkFuzWiqs/jw4ATwV53bQlvLRRMIXqzyXE9u3I9YnCvPoQfVZUE+Pn0kEMCxXcFXn88B545T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722758861; c=relaxed/simple;
	bh=1kfWGFShfHsHnpgzpsFlHNjLwYlqbL1QurqwJ0PzOWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a3VX18xP5z9EU1FJzomzcf0/s1dxsMUsc0GhE5hqP0/yxqVykP3FhvcHVXb8TQWWp2CTZiZA6o16WdD3l+U/rN8OX1jeRJXIEqJuRxKMpWv7XdZN6+zey0Um3CHk5Wy3etvlP+wv4N82Pb2nz9qk2u+mn6S5eRyY0O2UvIm9cAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9f8WXCY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5730FC32786;
	Sun,  4 Aug 2024 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722758860;
	bh=1kfWGFShfHsHnpgzpsFlHNjLwYlqbL1QurqwJ0PzOWA=;
	h=Date:From:To:Cc:Subject:From;
	b=e9f8WXCYQJBrCMMVaJVPpZJadw+4u+B+9qMfvkBC8qhK2bnIlujPhrHKVB/dOOESw
	 0X4K5YITZWu/t62+QBRp1zNz4HFnlbcRo6OPxu7L7BnNBYFF5ohdm9b43Y9091QvFY
	 l1kQoWN7bmmq5DuSOSl1ki/ZZWewsOw9I4yFUoiqkhaKF9QrtCi/A8Uoqj5GwzEHVX
	 d5+Rc8rJOU64qt738n73OtvDJb+w3qUkfHTytid/7h2bYkreXM0+NzuGHyG1DcaXui
	 QF792kH/YqwPDx48Htp7MJOC8ICcxhP48x+uPoEwpu4mrgAoq+iCX9sduVOdhKh1/U
	 yKNo+3ZYw/Kng==
Date: Sun, 4 Aug 2024 10:07:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.11-rc2] media fixes
Message-ID: <20240804100736.7fa85b34@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-2

For:
  - two Kconfig fixes;
  - one fix at UVC driver addressing probing time detection of a UVC custom 
    controls;
  - one fix related to PDF generation.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-2

for you to fetch changes up to e2ed53694e5356a55fd539a4d8dc56c2fa42b2ff:

  Merge tag 'tags/fixes-media-uvc-20230722' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-03 11:01:04 +0200)

----------------------------------------------------------------
media fixes for v6.11-rc2

----------------------------------------------------------------
Arnd Bergmann (1):
      media: ipu-bridge: fix ipu6 Kconfig dependencies

Bingbu Cao (1):
      media: intel/ipu6: select AUXILIARY_BUS in Kconfig

Hans Verkuil (1):
      Merge tag 'tags/fixes-media-uvc-20230722' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git

Jean-Michel Hautbois (1):
      media: v4l: Fix missing tabular column hint for Y14P format

Ricardo Ribalda (1):
      media: uvcvideo: Fix custom control mapping probing

 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++--
 drivers/media/pci/intel/ipu6/Kconfig                      | 3 ++-
 drivers/media/usb/uvc/uvc_ctrl.c                          | 8 +++++---
 3 files changed, 9 insertions(+), 6 deletions(-)


