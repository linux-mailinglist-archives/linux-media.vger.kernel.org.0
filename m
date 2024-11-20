Return-Path: <linux-media+bounces-21699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5499D4433
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 00:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6F43281CCD
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 23:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F89A1CB9E9;
	Wed, 20 Nov 2024 22:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8zDN1II"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07BF1CB333;
	Wed, 20 Nov 2024 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732143372; cv=none; b=Vu6eg6NO5Iy8vKFlfITredKG0lsE4nVTveaiTqk/dEjBKCpw7UZlb2OVtMBkNbm43s/Ci81NJTxapBWKJEfGnw2vi9mPLZXJGwUxogjbr10027HOHkWfjsA82aWBivCjc1Brv0Z4f96A9i+2LvY7c+OUvFXVOoUmS/dBkNDaDAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732143372; c=relaxed/simple;
	bh=E3TMRWfWCeYMUbGv1l9u3Gc8eeKftDSrgy9K2Z3Rqdo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VsNwXDzbKqSVjzcPxowyhJsy+RTV558YX5jxVxcTUvJQ85xDvuoFsXe3Qlm+o+uj2cQZ78en30tyE2g/lIs4JIeLqN/BN8L4CGvIX481wVC/KwbvvH5OtMUF9s0GJ3UHeM2Bqe6+ygxDM5RrDRfCbrq1dtYlKlFvqFw0RpiC6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p8zDN1II; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5166C4CECD;
	Wed, 20 Nov 2024 22:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732143372;
	bh=E3TMRWfWCeYMUbGv1l9u3Gc8eeKftDSrgy9K2Z3Rqdo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p8zDN1IIV95gn1ECgyD+2tlRi3hFLrd5f/hurxVeSeZyMnRVQfkbT9fGpu4QZpFHY
	 b6dhiit/kvRFLF6MkLsH2TGK3WXE6mG1O3ImPBAhulCRdsAZebtAE517W1cS2JeXVr
	 pRAI2QxQ7NvzaUTxIyGpNpU/uygsT2D9P+fJ+h0tPL51ioUDoHu+9IGwBdY0c3nYPa
	 ACxsaEBi0nZjz14nju0jCwJk92KU+RwzbS9qmRPmlgEjM9+EHseaIjjn8+eIvtHL5c
	 11CGjA2F4vBq9Yy2XohqcE9CaXhv9IZz7DxS531guaaKu8Huzjx+YFHz1maik1sfHI
	 ULlAvmtIunkgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB963809A80;
	Wed, 20 Nov 2024 22:56:25 +0000 (UTC)
Subject: Re: [GIT PULL for v6.13-rc1] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241119094008.06a199f2@foz.lan>
References: <20241119094008.06a199f2@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241119094008.06a199f2@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.13-2
X-PR-Tracked-Commit-Id: ecf2b43018da9579842c774b7f35dbe11b5c38dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70e8ef2d6762cecfc868296fa9e0a3848b926efc
Message-Id: <173214338429.1377324.10763992930852605016.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 22:56:24 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 19 Nov 2024 09:40:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70e8ef2d6762cecfc868296fa9e0a3848b926efc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

