Return-Path: <linux-media+bounces-15755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B942C946FE2
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 18:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A53A28132C
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 16:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A39E139CFC;
	Sun,  4 Aug 2024 16:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1cff4+F"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98827137C2A;
	Sun,  4 Aug 2024 16:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722790459; cv=none; b=pC1aPhA78GxSYhWVz6dEC0dXJjwxsGtyR/8c0kYGVC6FL/g7afkBtO9PCE0kdInM2TXqm6r2eOPmVLLKBBsm83EPLgrbn4qjB+hKVcIRkMJYtdyKjPHdk4SraYxswgZ6EqvHrgyYqKtUqOJGlFbIV90UrdMu9Ca8f3PCMAblA0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722790459; c=relaxed/simple;
	bh=5we2QimIKN5uVXij+3GQQrrLjGPelWigPBsNDz5S9v8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JjEU+e3s16Q6tDbB7hWja8CAhbU8qdmgB5WgP8KssjxpbocZDePqs0jlqylmHbUyF8Z/vDrrOcy5KCw+nJ47d+eowKcsm37UpGNVS3rgGmg52YFC8evPBpF88uhbOj5g+yfDEhl7Byh2petCOqfzUsVNNUGgl+Xw9ma9ckaRRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1cff4+F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 272C4C4AF0B;
	Sun,  4 Aug 2024 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722790459;
	bh=5we2QimIKN5uVXij+3GQQrrLjGPelWigPBsNDz5S9v8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k1cff4+FLx+gHrYbNPy3DEx0g5FlDMKJeDYGfp5pwhumJucnRznkEXqUIYB7hS9cQ
	 mw0ISMWGP3y11pwJbt/2I1vwChnRLF8b6TNZ+agXNurENaln2Ug4/LgDcavBX4yFWj
	 ZL5XsTmeJctekZsSHFiw0cgzX68PW7peAcac0FhymW1JxrSJlW1uV79r5RgpGS6/Zi
	 5Y0dI9CWb+DEkWgK1fChndpacSYfNk8PduwCPFQsND2CgExvqYo5FHz32a/rhzDq0r
	 TttqixHYLZ30fQ+wpr64XterHwl5t1NXNSWFpPgMZNn87L0wFlDRpZ4fhlBg+IU8yd
	 U9cBz9g1wDNog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17AC5C433F2;
	Sun,  4 Aug 2024 16:54:19 +0000 (UTC)
Subject: Re: [GIT PULL for v6.11-rc2] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240804100736.7fa85b34@foz.lan>
References: <20240804100736.7fa85b34@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240804100736.7fa85b34@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-2
X-PR-Tracked-Commit-Id: e2ed53694e5356a55fd539a4d8dc56c2fa42b2ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c41df428e9989eee79ed86d809a59ac03ac7c31
Message-Id: <172279045908.9825.9352410040853355166.pr-tracker-bot@kernel.org>
Date: Sun, 04 Aug 2024 16:54:19 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 Aug 2024 10:07:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c41df428e9989eee79ed86d809a59ac03ac7c31

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

