Return-Path: <linux-media+bounces-25300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC00A1C5FA
	for <lists+linux-media@lfdr.de>; Sun, 26 Jan 2025 02:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942A4188866E
	for <lists+linux-media@lfdr.de>; Sun, 26 Jan 2025 01:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6196F154C1D;
	Sun, 26 Jan 2025 01:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pd/l1fzw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B723C25A644;
	Sun, 26 Jan 2025 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737853405; cv=none; b=LZLxlQdDj8ASJzwuuPk0MxBhBNxxFg9+YBdY0591OO7yFZxxneYAF90VTifGwhGnTNOAGon+rk9bsGFUgBNlQRcPgn/mz6mQ7B/2z6GQJ+Z9Owro8eOvlABKF/ujhazq1z8dJWRqYnsTy+0AWLOcNwzc206oS/Bri2dicwsqz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737853405; c=relaxed/simple;
	bh=+SkdcBLFfbw6h9Bb7tbuyEDn4Wb7NmtxbZ4VBXhZSvU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WLccJzxl4hjcVK+eX8L+BnC6mbh1oa8Y8xOdjTEMA34gJ9sAbTtK9iN4OVK9IrHjJ+lKxqE2iu73lDwYtywUySGPikCr45LZUVu0sSlZqXZ9J57ZWyFp6tSqanLuK1BiGk4WqIBMlX5NmHdKDjuE6c8TcuBGaPFH/zdigYpTGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pd/l1fzw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDB6C4CED6;
	Sun, 26 Jan 2025 01:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737853405;
	bh=+SkdcBLFfbw6h9Bb7tbuyEDn4Wb7NmtxbZ4VBXhZSvU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Pd/l1fzwAsbu+qoCzuFiaMIY2b5j1N9G3LOs4tuUGNU4w5PULulUjnY8pp8+fLXwh
	 Jn3rzOIVD9ksmi7TGonjUUNZItYFKGA8rXFpcqLkmO24n5buLL0p+bG93JRw5y/Grz
	 VUyr3TgkTOmUsfhjgXGzRNQbRuTppCvVIAafmXS/h+LCp7hDwM/d8rWeFyaJXz8rrm
	 TQLkL1H8QzMlsi6/v3dVOk9l0rrM7FAHMlvZaisELGokAxaOYlww2RgSw7tuWKTPr3
	 kfWil5hJLw+hiwoS9FoAeBZQ6WzsuY6L9RvTcGNPcaOzX+JqteRKcv87Pzw3LMQ4HD
	 /2QcxM6V1o43w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB20E380AA79;
	Sun, 26 Jan 2025 01:03:51 +0000 (UTC)
Subject: Re: [GIT PULL for v6.14] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250124080453.375976a7@foz.lan>
References: <20250124080453.375976a7@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250124080453.375976a7@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-1
X-PR-Tracked-Commit-Id: c4b7779abc6633677e6edb79e2809f4f61fde157
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 184a0997fb77f4a9527fc867fcd16806776c27ce
Message-Id: <173785343049.2645989.13634385025194814072.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jan 2025 01:03:50 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 24 Jan 2025 08:04:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/184a0997fb77f4a9527fc867fcd16806776c27ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

