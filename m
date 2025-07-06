Return-Path: <linux-media+bounces-36902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A0AFA59C
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 15:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55CDC3A7E58
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 13:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1119223DF1;
	Sun,  6 Jul 2025 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJ6YM0GO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164343207;
	Sun,  6 Jul 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751809881; cv=none; b=I3W9Iz/fFTFR3Q1O0k9OvpT36I8IWWLFGXkkiawQdwCgFO45ARRaP/fqEEzMjdUJZVSzkkWyxqYrroVx/8g3DQTrquE0PZEFSIVkXoU7xs7buOi4H4ZUSCVgAHDDd+N4bUnNGx9dRk0g7Cd6Fzw8VkfGAvd+Jvwy+4vRh9ADfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751809881; c=relaxed/simple;
	bh=QzhVM4+PY6Y2rVCM8Q3FSrLbhJfai+hXHkMPnNAzuLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emupFShL34Gnw/r8rTYYGe59DWeEagQPA4Dkn8LOAmWjPD9pYPvSV611hWt5mFaJ4HwND67JiWVxax9uZo3kfKykCokeOwTvcjvobA3SdpmXRUJnGDV3zNK67P7ZyJsJ2gMLK2mQkwnDnUlL1w8vdnh/wo5HDShTPKoVGU0cUkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJ6YM0GO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533ACC4CEED;
	Sun,  6 Jul 2025 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751809880;
	bh=QzhVM4+PY6Y2rVCM8Q3FSrLbhJfai+hXHkMPnNAzuLI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FJ6YM0GOphbRRb/G5RD2X5gdu9XcBTdStyE7TKNe6evLmvxkGK4V2pCNOesmVaKpm
	 EAoJttpGI7AiBdp0LEKBPP17dIPNvfJ0kTW/vhG3QnxC+vNt0UfieBgaJiW+SOIWKK
	 x3YAAoyQ1F2WcH9wra3R+gGZBpUH3qM643bQn+Pix8rQB3mRZLNhwzC3zuYZL3tjKZ
	 QGj6yn7qqMVfhVkK8+MbbqlAdJcp6qr7wK6r7v9R4KoFkpYamjU1UYOtIqyuUlVLJd
	 vZ5mxZRPc4xT3algJG5A40Ii9qMHRtzpceR18VK/A7O8mNBIjQ73tV+Jpb14eIJrap
	 TTKusVsdGVEow==
Message-ID: <5818086d-2436-4d51-b86b-bc9ae620c4e2@kernel.org>
Date: Sun, 6 Jul 2025 15:51:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/23] media: atomisp: gc0310: Switch to using the
 sub-device state lock
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-16-hdegoede@redhat.com>
 <aCsZklaaHaPvgpzq@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aCsZklaaHaPvgpzq@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-May-25 1:44 PM, Andy Shevchenko wrote:
> On Sat, May 17, 2025 at 01:40:58PM +0200, Hans de Goede wrote:
>> Switch to using the sub-device state lock and properly call
>> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
>> remove().
> 
> Ah, cool! But can this patch be put before the previous one which adds some
> locking?

Switching the order of these 2 patches up is a bit painful
(I tried) and the end result is the same so I'm going to keep
this as is.

Regards,

Hans



