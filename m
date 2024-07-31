Return-Path: <linux-media+bounces-15615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B894279D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C82721F2550E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB61C1A6198;
	Wed, 31 Jul 2024 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VhuvNot+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24941A4F3B;
	Wed, 31 Jul 2024 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722410090; cv=none; b=dC3wyERzUhHpsScDqh2ZBYnfgZMPNyay3CnzaJn13NNHmgZnigJri9l/XZNEFazAHsBCNn2fayvrlbBBjdwcjh8EdvWD+WFOYT1SoKMtAb5mqb/SYgrkqmp2F4njAQq6qBRAlDSZ1ET7ztacc2iVsWQH0A82msuUaEG76fQUF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722410090; c=relaxed/simple;
	bh=5/mte6CyAyshwnEEpmhRwBe8k1+zKLkBUzU34rGWZ6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cV5IbwLKnbT+BwDlboq9WyFzmOQfD572ql+9AzAzLLqD2GMt+GrDELdUsB3YKjhih++7aJ6m2R9yw9mccJoK5bvcllDXZbOHl5W9jSkGF7d908Tpd/RghR5kJm9jihr2mUyM+hRoEmT88fjF9ya9Cm8cVpR2dQcqUUMF1GEuets=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VhuvNot+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:9278:2c85:fd02:c5f5] (unknown [IPv6:2405:201:2015:f873:9278:2c85:fd02:c5f5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE5C5842;
	Wed, 31 Jul 2024 09:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722410039;
	bh=5/mte6CyAyshwnEEpmhRwBe8k1+zKLkBUzU34rGWZ6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VhuvNot+Nf72HAxsq3LbjwC/PrAhMrUYiav6NKQ80Mu1XvxbYTMbMK+Tj54h1iCfi
	 nqebW6M217O5Px79hkZ9di3Dy1F8lkzRCwjDAnyn2UrDzg8xORhwWHm3V2NA72UPxl
	 F56lRvDSwNATL91dkTsq3QLd2D9w6BZeQVqjwLHE=
Message-ID: <9bdb6598-8ca2-4fb9-bbab-d04c2c2f7032@ideasonboard.com>
Date: Wed, 31 Jul 2024 12:44:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: imx335: Support vertical flip
To: linux-media@vger.kernel.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240710044633.81372-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240710044633.81372-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello

Can this be collected please ?

On 10/07/24 10:16 am, Umang Jain wrote:
> Hi all,
>
> This work intends to supprt vertical flipping for IMX335 driver.
> 1/2 contains a small drive by fix, to rename the mode struct name
> 2/2 introduces the support for vertical flip for the mode.
>
> Umang Jain (2):
>    media: imx335: Rectify name of mode struct
>    media: imx335: Support vertical flip
>
>   drivers/media/i2c/imx335.c | 77 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 72 insertions(+), 5 deletions(-)
>


