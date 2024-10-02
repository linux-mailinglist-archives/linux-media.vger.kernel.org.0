Return-Path: <linux-media+bounces-18957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54398CBBF
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 05:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D30591F25416
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 03:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E047E17996;
	Wed,  2 Oct 2024 03:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U7Gut7Ip"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692C18039;
	Wed,  2 Oct 2024 03:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727841235; cv=none; b=ojIyCP3BBOvsm2jlJryeoY+W8GouS4106Wg3xMbUTmhg+gPErefShWmn3DptP07gQYvU2NCVYDMD2snKH7taQBp1CY/p8X0sJSu4kl5VJQ5cK7j72DUU3GbWIPQ2TxGn/6c8ciu8TJTgBRDEnceKU1TPb6grHNtyPbzjV0ROvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727841235; c=relaxed/simple;
	bh=c723xCJwYwzUPaFKF2NSuCK0UT1uyVPEV/c+UsmC0JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAykhcoL5wbrH3EbgsuOxz65j1hqyMYybc8cWonPIqvY4L8TLS9zxFXWTiK0wpFDgr3Jfa7/g/PpGbpJofoQGUPLP4ZVLQtiAL5fICqfdGZo0fOj0ayUq/WdaF3qpoqOJseGrnrBQMkSVwoybhRisSogSnldObwGMImAXvSKAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U7Gut7Ip; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FA495A5;
	Wed,  2 Oct 2024 05:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727841133;
	bh=c723xCJwYwzUPaFKF2NSuCK0UT1uyVPEV/c+UsmC0JM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U7Gut7IpSHuudR30tfGx8upghFzRJQD0cuy6pMi4jQXJUabTJUeUGX4XwyENLFIAe
	 xmg76AcE4kJeGLYO8fDa6w62w6xK6gVHdJaF5FO8qxS607B/BHlK+X3NxJX3u3lYfu
	 ahSx0jrFJZcKh75QpnMc/D0wMo+zgk5EAxAfHXtI=
Message-ID: <8411984d-2475-4d65-a66f-dc7076fa0ca0@ideasonboard.com>
Date: Wed, 2 Oct 2024 09:23:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: imx335: Support vertical flip
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240830062639.72947-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240830062639.72947-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

Can this be collected ?

Thank you!

On 30/08/24 11:56 am, Umang Jain wrote:
> Hi all,
>
> This work intends to supprt vertical flipping for IMX335 driver.
> 1/2 contains a small drive by fix, to rename the mode struct name
> 2/2 introduces the support for vertical flip for the mode.
>
> changes in v2:
> - None, just a resend over latest media-stage
>
> Umang Jain (2):
>    media: imx335: Rectify name of mode struct
>    media: imx335: Support vertical flip
>
>   drivers/media/i2c/imx335.c | 77 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 72 insertions(+), 5 deletions(-)
>


