Return-Path: <linux-media+bounces-18864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47398A489
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 15:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 608E91C2314D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B608C19006A;
	Mon, 30 Sep 2024 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5245x7c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC311E4AE;
	Mon, 30 Sep 2024 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702091; cv=none; b=gSQo5dSAF1ni+iwnDycWD+ZfCFy0YkzPSUIZjfblEdr4W55vjhu4ZOmw9//+fY3FGR+cbrxvYTEoH3E7xYuXhtsXnMycsQXBkNDfrWGqR6Ie3ERbvURAlTJuYbJ6uT3jvBZyREhQ0wZ6Kp2Sb7h1tqmTrTbMPfj+FFyeIqR9LtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702091; c=relaxed/simple;
	bh=P+hHwsbJan/OmL230vi+I8pc3qjQ3x7suvCIDyFKLRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8XJzF2RNmyigr5qEliJ57NgTDlX7dFJrNlBzUbtpcNx4RO8dUYVX8GxEhX6vIFxGS1/YAKY038nw2yjeB4MmAYmlSsy34n+YcL1rHgMf9wz5ORItrqlkejeWhNmQOp8YnY6zRY4QqGBr5dJLcDf205P6h+4u6Ia4XICbDaksuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5245x7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E8BC4CEC7;
	Mon, 30 Sep 2024 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727702090;
	bh=P+hHwsbJan/OmL230vi+I8pc3qjQ3x7suvCIDyFKLRQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m5245x7crezQChoH8Ssp/PFjgL4sxZyziH6vo6gykN6GN/vm5oBHrJhv9JavpUWKn
	 NyvnpFAkUp/C0i+U0YXLoPgkvEb3lUfIQ8Y2DkufPO7zA5BladoeX1H8apepiPWEUl
	 dT/YnYp8T3g9As9rM9KTvau0eBITTRMvdd0rT6LMxpq0ACymeEwyzV/89t9VPQTYH8
	 /tOo1mHlylAkn76ooCSX5fK/2rJLhnixIF/GwQLWRncNsdunYJKT9sYRpG4wP5poN5
	 /NLSvNWNAImENY/R6DobnFWWZL/iypAX5o0JggQrLTk14nDn43B17U0J8sxVPfzLuO
	 x0C9/F3UrC/Ag==
Date: Mon, 30 Sep 2024 15:14:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rohan Barar <rohan.barar@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, hverkuil@xs4all.nl,
 gregkh@linuxfoundation.org, hdegoede@redhat.com, andy@kernel.org,
 olli.salonen@iki.fi, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Added ID 1d19:6108 Dexatek Technology Ltd. Video
 Grabber
Message-ID: <20240930151440.632561cb@foz.lan>
In-Reply-To: <20240930130510.1492313-2-rohan.barar@gmail.com>
References: <20240926235048.283608-2-rohan.barar@gmail.com>
	<20240930130510.1492313-2-rohan.barar@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 30 Sep 2024 23:05:11 +1000
Rohan Barar <rohan.barar@gmail.com> escreveu:

> Dear all,
> 
> I am following up on my patch submission for the `cx231xx` driver, which adds support for the Dexatek Technology Ltd Video Grabber (USB Device ID: 1d19:6108).
> 
> The patch is a straightforward two-line addition and has been thoroughly tested.
> 
> For evidence of the device functioning correctly after applying the patch, please refer to: https://github.com/KernelGhost/TapeShift
> 
> I would greatly appreciate any feedback or review at your earliest convenience. Thank you!

Your patch is tracked here:

https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=rohan+barar&state=&q=&archive=&delegate=

And media CI detected some troubles on it:

https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1279069/test_report?job_name=media-patchstyle

It detected problems with your SoB and with the e-mail subject.

The e-mail subject should be something similar to:

	media: cx231xx: Add support for a new Dexatek device

Please check the process about how to submit a patch at the Linux
documentation and, in particular, how we handle stuff on media at:

	https://www.kernel.org/doc/html/latest/driver-api/media/maintainer-entry-profile.html

Please fix the patch and submit a new version. 

Please notice that this is a busy subsystem. We may take some time to
review your work, but, provided that it is tracked on patchwork,
we'll get there ;-)

Regards,
Mauro


Thanks,
Mauro

