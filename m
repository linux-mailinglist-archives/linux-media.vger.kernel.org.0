Return-Path: <linux-media+bounces-48302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2007CA76B2
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 12:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F026231FF30B
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 08:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A2A34A79A;
	Fri,  5 Dec 2025 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbLqeqvF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D181301481;
	Fri,  5 Dec 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764921963; cv=none; b=T0hQ8Pc1dYJyuQ5CSYZUsFsBQpzHZeuI40M5aya3MmX3JyZBuSUfwYDUkFhmDVKWTEMGQrsYPZ1NLOgg8gOLXPRmvUdIZ29dXTTp431qe3vckMIXJ1TOIyeKnT1Giq9G/jz5948u94Av4fwvTM+S3o+3qMFzprG79lBPF3b+Qv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764921963; c=relaxed/simple;
	bh=uznHo1BmZQDyQaTWAfPJmbJLIXnZOYiZY4GRvKJ+96I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T2J0sntM36Q3Qbd15SGIRsIq5Xh2+1y5HJmEdLwR/Z3lxa2x5Nunhkj2TRrxeMDk3TlXzosymPg/Egwkrkz8HsOv0OgmgUSlu+CYWrcgMX05qiIpMleJaIuajk0AvmaaR21ipQQM7UkrmcKT9PaHC1L7Z152lsF0K+OzzoNp9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbLqeqvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AC0C4CEF1;
	Fri,  5 Dec 2025 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764921961;
	bh=uznHo1BmZQDyQaTWAfPJmbJLIXnZOYiZY4GRvKJ+96I=;
	h=Date:From:To:Cc:Subject:From;
	b=UbLqeqvFYhq3tsD96ttuvDhqrsvDohpki+4AKkIKozykHWRocNqkIPk9ds+5Jh5U+
	 Mbjh0doqkd6UDG/OfKe5qumRSJ7Upuea2fbtZiMPo2PY8F4sS8piAXPKSdXJM4Vwrv
	 PtzIfRGelkb8mHCATVakohte+bYDG1HNgf6E2rjRnw/2+OTQjGejwuFdn5wI8b+ah8
	 To+WuPbMm+NsfElHyQ1ro6kZC2Cwmn7PgTvICIyHAXoZcmnc3AuOu/4wLqZVnLfMZP
	 JLhArutwC1zoy70chh1j6GN59n7TcXAcVq5k7mI6P/0sACZGv+mvGi4HeJyfAHMrnv
	 AXviJsR9+aN7g==
Date: Fri, 5 Dec 2025 09:05:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.19] media kernel-doc fix
Message-ID: <20251205090549.33ed4a9b@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.19-2

For a fix to shut up a kernel-doc warning on c3-isp driver.

Regards,
Mauro

---

The following changes since commit 1f2353f5a1af995efbf7bea44341aa0d03460b28:

  media: rockchip: rkcif: add support for rk3568 vicap mipi capture (2025-11-15 12:40:33 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.19-2

for you to fetch changes up to f7231cff1f3ff8259bef02dc4999bc132abf29cf:

  media: uapi: c3-isp: Fix documentation warning (2025-12-03 10:07:37 +0100)

----------------------------------------------------------------
[GIT PULL for v6.19] media updates

----------------------------------------------------------------
Jacopo Mondi (1):
      media: uapi: c3-isp: Fix documentation warning

 include/uapi/linux/media/amlogic/c3-isp-config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

