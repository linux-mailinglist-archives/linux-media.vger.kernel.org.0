Return-Path: <linux-media+bounces-36903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCBBAFA59E
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 15:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C40F189532C
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 13:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849942853F6;
	Sun,  6 Jul 2025 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGJKNPzA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6B1E86E;
	Sun,  6 Jul 2025 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751810158; cv=none; b=EZIZQ0pUlnV1GWhqh+SXwNfZyMh8osucmQvvVgK43Fp4er2DhL5ifZywKBptkhEHVzu28gs7T8DtLETwAUb9Yu47yQfejzV7z90J6gtua+YQwigbxBTMPIJH+BodmCrhzQGk4hJMQQrvmIeSZDqRVNZnOBdo30nhJdFqP59QRDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751810158; c=relaxed/simple;
	bh=8YXzAzdf76aCUggnnWl9sXbV+UYzm5Tgchcm9MFiYg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQKF5H/k/yiofQHh6BLLfoW1IzBI1S2IBwZrYN5SGzT5bwibtd4lt9ofWq4cb3DYfH/EVuXLOaff5XQJeAR1jfW41VMEhMQ31FidvSH81NdOeE1VtLT41cH8zUNaxexJoHrSswyA8ro4r7K3XHYAdym+lrOE/8rmUiUfT6CxjYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGJKNPzA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D661C4CEED;
	Sun,  6 Jul 2025 13:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751810157;
	bh=8YXzAzdf76aCUggnnWl9sXbV+UYzm5Tgchcm9MFiYg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eGJKNPzAmCi9i02xHPFZ3hsUHOPbPUb/w0+Yylah94fW9UgwpKy4nRxltKb64ugYN
	 wofsZxnA+tf/Dw6viT51iwrfi8RPLnYGKSqDHm34vIGAEsB6UidJ/YUy8tOpWLGR3y
	 STPeKTBAymRbqysa2Tyhiu9ftlosrMSNcwcKrOBDHMigTgGNTWDsVSEM5jbkjnfTjh
	 ADNM9g7RaOZv1NAvvd9/SFjzPxBsRQDwJ7yjt7s1+iNa9BXiT7mKjDoYZ8cAETlFgT
	 Ourq6+HSp0WjopUbYA2AZz6UoXFFJH1D+BtcXXVjh0pH/2PnqktfxdoosfCdnZ0pCN
	 DSst79SYjHzKw==
Message-ID: <673cae6b-e644-4edb-bc6b-65c14fa88a4b@kernel.org>
Date: Sun, 6 Jul 2025 15:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/23] media: Move gc0310 sensor drivers to
 drivers/media/i2c/
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <202505220651.U5WqBCdF-lkp@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <202505220651.U5WqBCdF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,
On 23-May-25 12:17 PM, Dan Carpenter wrote:
> Hi Hans,
> 
> kernel test robot noticed the following build warnings:

...

> New smatch warnings:
> drivers/media/i2c/gc0310.c:462 gc0310_enable_streams() warn: pm_runtime_get_sync() also returns 1 on success

Thank you for reporting this I've fixed this by switching to
pm_runtime_resume_and_get() as Andy suggested.

Regards,

Hans




