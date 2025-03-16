Return-Path: <linux-media+bounces-28314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19DA634B3
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 09:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4808118904A8
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 08:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172BA45C18;
	Sun, 16 Mar 2025 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fceun9cW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405C2F3B;
	Sun, 16 Mar 2025 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742113815; cv=none; b=iEp43gb1gFFPR6Uxm8mptUlqV4fYWvZA9njbGVJ1a4QFHppaY4b3eJN1epcNiyncqVt2EEVF7yPKGI0PXjkzcmNoeRIlin8AR0zm7GEnU6gJzQFUL0sYCJRvPD0oAb7dSFaTV8rcP9dJczU5S+P6/M0q/ApXjXiRTUgeGTswn3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742113815; c=relaxed/simple;
	bh=rU9EX07TH6F7VV+p070uGvpTzA/qLQIOlQbd/i/3aFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lzjtpgtfanAsXe8822CW4PVo8XYJ4KfPxfiMOKgz4kBrWcJwXIdPgKWGLvk9oF75qU8ni8qNvVQZMn6g/JZ8fkUPvN0wYIuGj2ijabt1AZ69t+Ye5qJEpnU2Y0ScSW3sBKud25V4IRymMhn0q9rFWWd15d2qOV+eNPJuNW5MTac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fceun9cW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AC1C4CEDD;
	Sun, 16 Mar 2025 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742113814;
	bh=rU9EX07TH6F7VV+p070uGvpTzA/qLQIOlQbd/i/3aFQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Fceun9cW1C2FBT+pjRWoe3H/oHeCqnqKmAnUxXRpUPXSZT6dkIg4ZDM6kkDf322ql
	 UHMhpcPIbqQVpgcwDkWtUnDUDmJJssFYKNjUPjbNNerwi1BH0LFGBDQrbfx/t6tNRT
	 HO3FjB6zZqZQCda5TTAHQgfCaLxpVvq1Bu2/lL4YubizXHaz94sHfI9Bc85UYZXekv
	 dg9a/HBoFY9VlaDkzyw8k9Oi0mDUjhDLMv9fLEHZAdMAIlRaK4B8RWjWHZtXlrgxCm
	 A5jK5v+PTCnr+a2zsxG1IiCBJLLa/IuZULXFUxnbFwJ7Xe5QfMcpRKdjICRIE1xyz7
	 mK9D9VpDA3e1g==
Date: Sun, 16 Mar 2025 09:30:09 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.14-rc7] media fixes
Message-ID: <20250316093009.6e1f303c@foz.lan>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-3

For a regression fix at rtl2832 driver.

Regards,
Mauro

---

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.14-3

for you to fetch changes up to d9e7c172a7f247f7ef0b151fa8c8f044b6a2a070:

  media: rtl2832_sdr: assign vb2 lock before vb2_queue_init (2025-03-12 16:43:51 +0100)

----------------------------------------------------------------
[GIT PULL for v6.14-rc7] media fixes

----------------------------------------------------------------
Hans Verkuil (1):
      media: rtl2832_sdr: assign vb2 lock before vb2_queue_init

 drivers/media/dvb-frontends/rtl2832_sdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

