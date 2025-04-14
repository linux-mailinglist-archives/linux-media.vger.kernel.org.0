Return-Path: <linux-media+bounces-30111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057DA87994
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D63A6188F2E9
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DEA259C9C;
	Mon, 14 Apr 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQl667/x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD237259C89;
	Mon, 14 Apr 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617395; cv=none; b=P7flZKc+XqarW3YEsAQsmyFMzBiRSyweXDxUDnBSZXghPA9Cum6hkaEp4lHJr12GAJzOjzF6yrdBvKUAFO8EF350rMkvM8j2FGpLyjok1TLzUIsZaaAv+LX6tvNRz2C6dNXHrcEzj01p5e8wHvLn45IoogZjWydphnG4ACg4STI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617395; c=relaxed/simple;
	bh=eXgCCMmZfBfjs8NNDlvfG3OaITNTxQujn2ci73MJ//o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQqHWK6/TN0B/moN8Q+w2PNfW8jINSpkWVyNcKjRPOZsLpwJBuF2O5B38f3rxG3ZBqGcrxOKKZ4o/IaXVYIQhx07LUQ9GETLYo02a9gAKw3+T3i1qQ04k3DVZV5QQpJsi2cyooN9RXVBkurGGHvcO7MajDFGxfWYKV3aneeS7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQl667/x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2C3C4CEEA;
	Mon, 14 Apr 2025 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744617395;
	bh=eXgCCMmZfBfjs8NNDlvfG3OaITNTxQujn2ci73MJ//o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQl667/xJRTT6RObw3HVwI/6vdHKM9yO1M41glrrIY1m40djd6T6ai2a5sd2+rC47
	 NUvwNrXWpjnNypbZLOJpUYA8JzDZAJtc+6swTEFKglvibg8W42mjtY9YEgcsxtCTNN
	 P8oxMU6lQnL13ayxIN/cFkpbsG9mZLI+NuT5mDMdc9iCnwA+waw/qvrGt9w6owCISZ
	 NROfrb5Dr4YBqeBAqthBoc058bTB1Sg64bDiD2HFi+P8e3PhiDAL6+EcJna5ajLZ6V
	 YHHDGSEFxr74YAGhQjpVrUCdV+5ANJVn3exui679yMZqU2tG0YMh8VehF4aLKMOmpj
	 VSL+Zm24RZx4g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4EgA-000000002JY-49it;
	Mon, 14 Apr 2025 09:56:31 +0200
Date: Mon, 14 Apr 2025 09:56:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] media: davinci: vpif: Fix memory leak in probe error path
Message-ID: <Z_y_ru_M6gBL2Mn4@hovoldconsulting.com>
References: <20250411194818.11635-1-Dm1tryNk@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411194818.11635-1-Dm1tryNk@yandex.ru>

On Fri, Apr 11, 2025 at 10:48:17PM +0300, Dmitry Nikiforov wrote:
> If an error occurs during the initialization of `pdev_display`,
> the allocated platform device `pdev_capture` is not released properly,
> leading to a memory leak.
> 
> Fix this by adding `platform_device_del(pdev_capture)` in the error path.

Good catch, but you should fix up the error path above this one
(kzalloc) as part of this patch as well.

Johan

