Return-Path: <linux-media+bounces-36904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49201AFA5A7
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 16:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27CDE3A5F10
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F017E792;
	Sun,  6 Jul 2025 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRnF/Sl0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740EFF4E2;
	Sun,  6 Jul 2025 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751810500; cv=none; b=JBw0dvo9DkRd+Xwy3oEddBWy4wNs4fxj9BloNzTSRPzORvXqSIi6v6XsBeDxXG3mWHcNZcD4LxIkuPSswGo7GcfTkwSKLZCtLoz5DFI9BRD9Oi79SOmMwdnzkcoMNW55yB9rIn7iUkJjNoT/i6JWwhacMbBSQxD5UVv80xpH3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751810500; c=relaxed/simple;
	bh=oU0p7/uusCnBDLTH8n9jdpXPeYtafqks49FeOZ5BVBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuuk4fhM/XwQS5XPN/Q0HhnQGvy8iocpZdWjmeZdMaZGF+8oR3DtqmdZ/aACCq2huZZiOqJ+FRna/hfyZHWsLjC0vQS+bq/aawttmngw7/kqRkj/ZjDHj23vVLw1ppCaGpvBBXLh5l9jtHvaUk/OsUMSWfOsvplWYQYvkb5ThBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRnF/Sl0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7619AC4CEED;
	Sun,  6 Jul 2025 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751810498;
	bh=oU0p7/uusCnBDLTH8n9jdpXPeYtafqks49FeOZ5BVBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PRnF/Sl02Sz9TOrqQf9UhvBiuJUiEE3jZWF3Pnnc65cm0AugL5mxIdoX8abW9fuiX
	 fYSYh8Mnz+Y+BGVjMHHSk8ute+JonqWH8y274LbSDDrjnTxfmmrn6LS9OeKojdIjYh
	 nx/2cTxPcGxFpNKb/481voO+wXSwJG1vOksqsVv4gAlkym3R7pEIGYKVZ1K1ppOo/n
	 X1I5NRQ3ms+czFND0Kk/dr3mY0+6jtLVKNT5DtjKjh+xmTKw0DTt/8J/b0NVWg2qur
	 G7XB7HDJpx0ui8r2F46BM3HaO73iVVl718h/mZmJ2lgrvgrlYolhbTp00SawdO+Of/
	 DadCiTkGTR76Q==
Message-ID: <fceaafa4-d570-40e7-a7e6-b924f6234bf1@kernel.org>
Date: Sun, 6 Jul 2025 16:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/23] media: atomisp: gc0310: Move and rename
 suspend/resume functions
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-20-hdegoede@redhat.com>
 <aCsbGihMDCzkzRua@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aCsbGihMDCzkzRua@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 19-May-25 1:50 PM, Andy Shevchenko wrote:
> On Sat, May 17, 2025 at 01:41:02PM +0200, Hans de Goede wrote:
>> Move the suspend()/resume() functions to above gc0310_detect() and rename
>> the functions to power_off()/power_on().
>>
>> No functional changes, this is a preparation patch for reworking
>> the runtime-pm handling in probe() and remove().
> 
> ...
> 
>> +static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_power_off,
>> +				 gc0310_power_on, NULL);
> 
> I prefer logical split
> 
> static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops,
> 				 gc0310_power_off, gc0310_power_on, NULL);

Ack, fixed while merging.

Regards,

Hans




