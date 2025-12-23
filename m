Return-Path: <linux-media+bounces-49419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62002CD9928
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 15:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70124302921A
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F200431329B;
	Tue, 23 Dec 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqOKCyQi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535301AAE13;
	Tue, 23 Dec 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499048; cv=none; b=khVhuDMVZTpLVwVzc6zm1SD1eiLOSei5wSir8rXDeJ/3sccoy86o5JPzsE/q7soYrDgQN3J/FM56cE7zuW2cU4j3QWzhk+/gArcurbEiQJRMTMA/tCxsTL/nMFq/SMhE6utTX5bbHBvEOWrnlJQ8UUCEr8HX2+vuCRPWhCWwWQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499048; c=relaxed/simple;
	bh=B72NhpQXISDQYWMXRShDtq7xHGE3mQhJtPAiBzHRDok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnRpin0ohB2SvVvOHXd0YTWsRKftpxU2wZIc4rThElMaj1W5/s63EoJ6X7Z77IoJPbLFkIg/f2GQWcqu10V9IRztfWUTmf+KSor53awSIn0gki5IWAlTCjauBrUUm0OOc3luMsyKqflihDCny9m0BUiI7HiyUKHysD4i4sOT37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqOKCyQi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E924AC113D0;
	Tue, 23 Dec 2025 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499048;
	bh=B72NhpQXISDQYWMXRShDtq7xHGE3mQhJtPAiBzHRDok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqOKCyQirQASGbhYsvtAHZIQTMCc05QxO1hQiv/UoOGpwxIvSmSQHBSqDhQBVEw99
	 PBc3W6arawP4NftXLDkh9rQCZvHVlRk9Z6Efjgbs/vMRH9YddF5blq3z8RyuQJ0D7m
	 j/tJeStpqdLpSnXRz1ds1RDVMGUr6sNJS4tdDmLC0Wd174/uCHj4O9gV03uirmICYg
	 BcyUV1i2rhhNtIZs1ycbaA5SH59x5hfDKbjesMz0RrmapWZ3TBWVjiYdGdVfcWzQl0
	 4mWJTt1WQGc3NDe2WQW0f3XKBFOJj25JnOepWhF5CchAcu/K8upoXl5y/NcB67ltZi
	 Z90QsDbAhEJ8w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vY365-000000002tK-2YGZ;
	Tue, 23 Dec 2025 15:10:45 +0100
Date: Tue, 23 Dec 2025 15:10:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: use devm_mutex_init()
Message-ID: <aUqi5frf5GzWt8cO@hovoldconsulting.com>
References: <20251223102528.14355-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223102528.14355-1-bartosz.golaszewski@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 11:25:28AM +0100, Bartosz Golaszewski wrote:
> Drop the call to mutex_destroy() in .remove() by using the managed API
> in .probe().

You commit message should explain *why* you think this should be done.

mutex_destroy() doesn't free anything and is just used for a pretty
useless debugging feature. And devres is not free and increases runtime
memory consumption.

And you're also adding more lines than you are removing.

Johan

