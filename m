Return-Path: <linux-media+bounces-38706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE0B1775A
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 22:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBE695A54C8
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 20:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8372561D4;
	Thu, 31 Jul 2025 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rP0hv8Ln"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4821766A;
	Thu, 31 Jul 2025 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753995080; cv=none; b=NEPULH23RBzSft0fQrcs+hmdU5z2kMruBPLJ4pMPg6BUTTgzGpqPlM5Judpr/S6wwxIYeCWS1Nm5NrDuKoR49Qpk0gs23d8XFi40gULkU622jQyzHUyXtFf7XNKI3RwGdQdWb6l+OkGrKCGjYuuFsABYdYD1Diz3XJt1l2mGD/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753995080; c=relaxed/simple;
	bh=oNg7I/iAHqG9ZK1kP6ZFqe6VhL0wkWsxiQpUcwfkrFQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RVsmK9qwUKRxk6J/Y5RJgkNxNqTnYaLJukKkzp2MEpyCxZQvJWT9RxOMB5oAG6Ue6v2ljFagrDlRsWRI3wUKclakdXySHH2uGJp+BTigtA+pHYQ6bIg0ysbHcbtH1ONBvK3v5yuq8mR/9yT9xot2PpIkQXyln7EJC+NtcfGYb7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rP0hv8Ln; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D11FC4CEF4;
	Thu, 31 Jul 2025 20:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753995080;
	bh=oNg7I/iAHqG9ZK1kP6ZFqe6VhL0wkWsxiQpUcwfkrFQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rP0hv8Ln02PN38+7kOpX43ZJBbnfl4NsHsEsfeXZ5FtY/0IwnTo8mC1ASAUiV6e4G
	 zIQ3HoaTIxIg7aKWy74yJ98FpV7jhu46hYtkZVUBIlRk+KMtt0cUPSdfbBG+OsAEfp
	 TN/bz81TaN1PEGNmCBp07Y3lP3O+9phhospBrZU5H9vRjSl99QtM6T04zcja21l9VE
	 dTk6zEMSB2MMqIWt59VdUTyqxKQJmrB1jJFTJeSP6sDZFs6+Pvl9d0WPzJI3kacYvo
	 MAmFvY2Z63wcf4vzLUXL/+oxyNX/+65RFPcwDa6JPVmBbxsUPzMjweJ/dWXbr2CDwr
	 /R7L1ovW6egZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F0A1D383BF52;
	Thu, 31 Jul 2025 20:51:36 +0000 (UTC)
Subject: Re: [GIT PULL for v6.17] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250731172724.5de121a3@sal.lan>
References: <20250731172724.5de121a3@sal.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250731172724.5de121a3@sal.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.17-1
X-PR-Tracked-Commit-Id: d968e50b5c26642754492dea23cbd3592bde62d8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0cdee263bc5e7b20f657ea09f9272f50c568f35b
Message-Id: <175399509576.3294421.9829317536682189126.pr-tracker-bot@kernel.org>
Date: Thu, 31 Jul 2025 20:51:35 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 31 Jul 2025 17:27:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0cdee263bc5e7b20f657ea09f9272f50c568f35b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

