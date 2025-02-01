Return-Path: <linux-media+bounces-25513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8EA2479D
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 08:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C90E7A270E
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 07:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B238913EFF3;
	Sat,  1 Feb 2025 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ac/3C9nI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B04A3E;
	Sat,  1 Feb 2025 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738396637; cv=none; b=fKGonOxGD8D5n68B/oAbIEExYLJogybi87jX8S7lSWvhGgVcBL+8lJhC4fEvSgXxVbRnl/MngPFP9GD9Z1CEee7l7Ox7JmBlHvbS+Ko6OcmEDAaLRS6gGo3Y2g75LfAXSR/rG9fPf8WApvF/rvJiBHGzoLhtSXnqM1OBhL1L5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738396637; c=relaxed/simple;
	bh=Z9HS9TndhxvYkkvXM980jaWYRXMVaY/X+M5vSxKiUSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dpO+BTKLo7iF180b7SF8h+bcxYtxJxzGMD28/V3c6oaInu6U98lyBrQcDvfz8iOmWq/0IzyrkqAm2J3Em5d75EcrCSmZ37mhu5/LxJ6eXJRE5ByyXMRw6PkbnU1Y2Rb1B0szfKWNCs3YKZQiZqYlDKdjyI6MS8dgTkmbqHI4EYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ac/3C9nI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D31BC4CED3;
	Sat,  1 Feb 2025 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738396635;
	bh=Z9HS9TndhxvYkkvXM980jaWYRXMVaY/X+M5vSxKiUSk=;
	h=Date:From:To:Cc:Subject:From;
	b=ac/3C9nI8DqsE2iM6ZvNphHQ49worV48sRW/GwNB8CgFWE8hs74VCQ9iZwATD3keM
	 Iaf8ObiLHbxfHMagx5gBZBkS9mkSoq8WGZoVELTHL8zm1jW2PsLAcV3YY61+CErf3V
	 F6O+8yNN8Nk1Iev0u6uyxai2ViYr7VBnAdytxyci37mNVbmudXaq+/xwmOaNZM7lEh
	 3q2NEx+iE5mV4Ac+cYD+3QiXr6wu9pPtb9lqQEv+wc9xjdD9F9WbKMXPGBN2BfzD+c
	 93WfyWeVokCDmHYqz/xiQP6oiU1i/OiQgXIkR7BV80e56cxAUZ8pq+2T+jciym1OUS
	 Wv9pJXE08K6HA==
Date: Sat, 1 Feb 2025 08:57:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.14] media updates
Message-ID: <20250201085710.6a709c01@foz.lan>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-2

For a regression fix at the uvcvideo driver.

Regards,
Mauro

---

The following changes since commit c4b7779abc6633677e6edb79e2809f4f61fde157:

  media: nuvoton: Fix an error check in npcm_video_ece_init() (2025-01-08 14:59:59 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.14-2

for you to fetch changes up to 8004d635f27bbccaa5c083c50d4d5302a6ffa00e:

  Revert "media: uvcvideo: Require entities to have a non-zero unique ID" (2025-01-31 22:07:43 +0100)

----------------------------------------------------------------
[GIT PULL for v6.14] media updates

----------------------------------------------------------------
Thadeu Lima de Souza Cascardo (1):
      Revert "media: uvcvideo: Require entities to have a non-zero unique ID"

 drivers/media/usb/uvc/uvc_driver.c | 70 +++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

