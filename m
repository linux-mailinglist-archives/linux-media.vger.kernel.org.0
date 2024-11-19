Return-Path: <linux-media+bounces-21575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACD9D21C1
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 495751F22819
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578191C2420;
	Tue, 19 Nov 2024 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDI/3x8I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9668150981;
	Tue, 19 Nov 2024 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732005612; cv=none; b=lJ92yx8zD4gCutVIoZLsIcfq1WB5ef49meesX37JeVsE3nfCYyvPeRyy12Y/pZvuU908ZfshzqZ2YCT4e3JYcUQPU0b7j0uhsZzZhjkp2HhzmvQoAsO2yx8yi/oTmawC0jSTmZC2MaCbCy6/CnBep1wgwIEkRvGFeIXFopcwlaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732005612; c=relaxed/simple;
	bh=gF7L+r3CCFtvRK2brDDsawKaeTTN8ZWDKky0vRy9u3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jrxtca992WBDfMUbmqNug3+HfLSm5DbVkoGRTeNMlVzT55sxiZdQkTNQU4B/k7DY3ASm2lHy5E/THRGh8gKMSrb0n1fUu6LcAyTG9MQLHgW3kZREMIkyGUyc3k1ByNsKGkl4GomeoKzgqE5NR0jO6hurjENvrkNOIZ4nhBBZtdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDI/3x8I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4E6C4CECF;
	Tue, 19 Nov 2024 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732005612;
	bh=gF7L+r3CCFtvRK2brDDsawKaeTTN8ZWDKky0vRy9u3s=;
	h=Date:From:To:Cc:Subject:From;
	b=tDI/3x8I9TAMXPs6oO+GmPjl3YnZCuOmsTTV7+TIvOnL/gFD9rlNHo1fNOqx8+mBP
	 6RhVl9NnJJeSooRBdNwmwoQBHRlwP74rSiCsoqDbhdKef2JOXI4Do3W1YmVG0pQFtn
	 pMgJVhaIDqCgwIVTGiALSj/PtK71E7zYM3AEviuCkWESdtt2AJx0L6f1zFOZ8G2OWO
	 PCO8fit437WSUaIIddjD4U/Z7Vj3iGu6slsfp891w+mpFKVJBLHu8m209BSVWsd/8g
	 FwNI3iE7R3sxkYMXCfI5PsySQNoh/FnJPZQ9SgIwnMPDZh5rZzwvHScjmcGEv+7hJ2
	 uHSnzkmV5SK+g==
Date: Tue, 19 Nov 2024 09:40:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.13-rc1] media fixes
Message-ID: <20241119094008.06a199f2@foz.lan>
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
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.13-2


For a fix at the UVC driver:
	- uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in uvc_parse_format

Regards,
Mauro

---

The following changes since commit 702a47ce6dde72f6e247b3c3c00a0fc521f9b1c6:

  media: videobuf2-core: copy vb planes unconditionally (2024-11-07 12:55:46 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.13-2

for you to fetch changes up to ecf2b43018da9579842c774b7f35dbe11b5c38dd:

  media: uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in uvc_parse_format (2024-11-09 13:17:42 +0100)

----------------------------------------------------------------
media updates for v6.13-rc1

----------------------------------------------------------------
Benoit Sevens (1):
      media: uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in uvc_parse_format

 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


