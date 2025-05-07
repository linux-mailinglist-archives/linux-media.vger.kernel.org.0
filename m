Return-Path: <linux-media+bounces-31942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B4AADAA9
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379EF1C01C63
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4572227E93;
	Wed,  7 May 2025 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSu8i7rI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B25F226D17;
	Wed,  7 May 2025 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608571; cv=none; b=ev5c3tSOSNfKBjvQCwZoxkU0wSg1HWUKRxA2nhpSAIGL9zRSD6Blk8EZvesunKqbSF3kc+WUF7IeC9quwp3oGXqMKgUzQFFAvSkF/4y+rRImFTlPdq0HXAIi/8ArX8WV9VMzlfoSZ+KxcxSOj9AqO5551/cUWoVLrU19RjECMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608571; c=relaxed/simple;
	bh=9evelyzemb7rjMQX6V3OGoWtB8G+2AH1xUY5PluwKvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gUhtjiohTuBCaqpEuFJqjqJt8G3goLZwThJFM1nWwZNRQAfjQjFQdmZC2f/v5FwurEv5bbGK05GXDsd0ufpwv6FfQDfJi7TlFSNQjuei5GhbymDCHn9Qe0S5jhnsG8/pLBQGQCb7fO+LjP08wTM/ui3hG4m2+u+mKYFRri6Jof8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSu8i7rI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97021C4CEE7;
	Wed,  7 May 2025 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746608570;
	bh=9evelyzemb7rjMQX6V3OGoWtB8G+2AH1xUY5PluwKvE=;
	h=Date:From:To:Cc:Subject:From;
	b=ZSu8i7rIpCwNVAbzzLtSQyQB5h7L+g/cE/TZ1jlygTQQpANXhVsjcY9rE7bDjEyJa
	 silYEwz4zebwbCWtVpa8tLKRR4dXwYh/R+tbntUi8jwu3SZykfKt819X1w/WaP341y
	 9oF8X0wchKRWWIsX0daOYb3FzFUBql48d1FTxIgp5UnONBiLtdwaryvPRTprCRHfrM
	 WfX1kWFzb4vEUtUxy8apSkC9Ce89VSYu8BHxRjI1arEzvm2r8ylSHUD9ofDNFHAkgL
	 WnB8wBklKKacxB/M7vWt2KFmX98PP/wXLhZebksTsLD9iCmmgQ43IoQaT4xXZ4+Q1d
	 Mugb0qBo2ZiSQ==
Date: Wed, 7 May 2025 11:02:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.15-rc6] media fixes
Message-ID: <20250507110246.1cf54e65@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.15-2

For some Kconfig dependency fixes.

Regards,
Mauro

---

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.15-2

for you to fetch changes up to d51adf038ebe59b592005166209b70218b1da849:

  media: cec: tda9950: add back i2c dependency (2025-04-07 08:12:12 +0200)

----------------------------------------------------------------
[GIT PULL for v6.15-rc6] media fixes

----------------------------------------------------------------
Arnd Bergmann (3):
      media: vivid: fix FB dependency
      media: i2c: lt6911uxe: Fix Kconfig dependencies:
      media: cec: tda9950: add back i2c dependency

Geert Uytterhoeven (1):
      media: platform: synopsys: VIDEO_SYNOPSYS_HDMIRX should depend on ARCH_ROCKCHIP

Hans Verkuil (1):
      media: i2c: lt6911uxe: add two selects to Kconfig

 drivers/media/cec/i2c/Kconfig                  | 1 +
 drivers/media/i2c/Kconfig                      | 5 ++++-
 drivers/media/platform/synopsys/hdmirx/Kconfig | 1 +
 drivers/media/test-drivers/vivid/Kconfig       | 3 ++-
 4 files changed, 8 insertions(+), 2 deletions(-)

