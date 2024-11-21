Return-Path: <linux-media+bounces-21720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF59D4832
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 08:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20BBF1F21DB5
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 07:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD151BD509;
	Thu, 21 Nov 2024 07:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXYfhU0y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F914207A
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732174056; cv=none; b=CIAghSa8VXwcUlqcyw+BvlPgtGKoYnIZkwJEI59iOEeVc/kmjQx8Zn1IoXtOMZjuExHLZbd1NMvyfi5B9ksXeSDBTi7gV+08GV94o3/FgU/H9BB/cFvHZvXbDPU0LvVaCikM7B4vrvUu3EFSgwxGD6JCoTVgch3UsRfYXvDh28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732174056; c=relaxed/simple;
	bh=rsjKG9XnhJHv0cJsDlThhffyD92MhR2K3om27Wtj+iY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u4o48bPYUilF373a3TCbqVc1p+ztrJAs9bBcV9ljc4/58JzYnPeZTF1er8lY4jTA+DenDF8u7YasyALqN7COpzXtPyfY4eIi+Ld/5Kb3gD80Ua+4lN6fCy+7mLpg5CsE9PooYm09j61cx0RJC6kfRPmPldS1Z0tYCzWyYoQ9zJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXYfhU0y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F27BC4CECC;
	Thu, 21 Nov 2024 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732174056;
	bh=rsjKG9XnhJHv0cJsDlThhffyD92MhR2K3om27Wtj+iY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hXYfhU0yuN0fPyr0Dc9rOge0bcp49XHYla5citIDxCfZaZZuZLf2+3LoVDsMDTg9H
	 6WtyzzHJrWwXEevGH5mwai1eaeA0jH/d2E+dXj90Xu/EtIRzpJn6UdYQuVoGey+rj4
	 nY079D6WSwSJ56ZWQoCvtszxAbhuWFdtJCI0vQNBFz2VAFc6X7HPkqGe4N7jt2xrOi
	 yrfkuEN+A4aO9h5W2BvsstbtjkWK2wy5xYwiqee9N+czSIrVxrYzuMBxtadlTBkd5K
	 7uQ9MUZ3XBvsmFDbY74unE61LAgScP5nCdLQXf/RwEnhTwryZdk/IRIVvPFSE4yQF7
	 1LBgzw3cTdiQw==
Date: Thu, 21 Nov 2024 08:27:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [linuxtv-media-stage:master] BUILD SUCCESS
 72ad4ff638047bbbdf3232178fea4bec1f429319
Message-ID: <20241121082726.3fd8b09a@foz.lan>
In-Reply-To: <202411211100.qa2lhjOi-lkp@intel.com>
References: <202411211100.qa2lhjOi-lkp@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Em Thu, 21 Nov 2024 11:32:07 +0800
kernel test robot <lkp@intel.com> escreveu:

> tree/branch: https://git.linuxtv.org/media_stage.git master
> branch HEAD: 72ad4ff638047bbbdf3232178fea4bec1f429319  docs: media: update location of the media patches

Recently, we changed our development trees at linuxtv.org. In the past, we
had https://git.linuxtv.org/media_stage.git and https://git.linuxtv.org/media_tree.git.

Now, we're using:

	https://git.linuxtv.org/media-ci/media-pending.git/ 

For patches that will go to -next (can be rebased as needed), and:

	https://git.linuxtv.org/media.git

meant to be the stable tree.

On both trees, we have two branches:

	fixes
	next

Right now, we're keeping media.git mirrored at media_stage/media_tree,
but we're planning to drop such trees during this kernel cycle.

So, could you please update LKP to use the new trees?

Thank you!
Mauro


Thanks,
Mauro

