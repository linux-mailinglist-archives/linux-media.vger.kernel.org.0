Return-Path: <linux-media+bounces-37016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEEEAFB56C
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CE3616DAFA
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7318D2BDC0B;
	Mon,  7 Jul 2025 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAl5yMQv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C775E29B76F;
	Mon,  7 Jul 2025 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896550; cv=none; b=SerFBR3X6XFtN2bB5Ui9MBu+r4V7w+PG/LcXddvvLzI+uEcbaMyjERqFblCd0JJI4eJtE4SBMSzKijlRX5i5TyTX4Ng0851qv1G7R0AnsG9rlIpnlT0zQ+oKrx0f+NpNW0g+oUfnLeeRQQP0FvRARBEzTDIX2pjLPNBsNvKb8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896550; c=relaxed/simple;
	bh=aixYXXak44GtwbdAwB186+uvCQZE2RhlWlUEFiv+jbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pijUtSsl5jlYeavQmXT4o14yRG+hu8bUg7SJaIDrApjGAVBpE5siOYZM9tuiZ2ij1K6HBqJq0S6yFziwcXorTsI1OaQmtVdYG4rOfpMwbjNpGt7HWj5dQNHZ0aA/iCI8dvZZkGoulKE30tAabdpivSIvF1OvkVdYE/ltWB6mg8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAl5yMQv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0ACC4CEE3;
	Mon,  7 Jul 2025 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751896550;
	bh=aixYXXak44GtwbdAwB186+uvCQZE2RhlWlUEFiv+jbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CAl5yMQv1nWx0Y7+nrjBw+xSTB0aY/lVAOeThN5tCG84auPjc2gBJUCS/1cxXu8/U
	 cQLTjBT1FdA8AgRh2N772F9Om5P8rg2cMzeMVYRuJRUNpgxuvc+m+cc3pauzS1y5kh
	 9PSegJw640RiUNjGxOicgU7wj7YMvvvGHg6AZD/ju/AHxT6rF7HwRTalrBgN0usKG9
	 QJpgxwRDTSX+4mi9W94b4IymCwWkofcnc2oWlh/e+MKu4DUzSz5vBUJMYLcl4KJVRP
	 JZLXrFjMQeTHRVukBCruKHjsRj9sW/CD40BbyWN9GsvZGDihN9JuzUw3bBQEQieW0n
	 XYeUiggtBgbxA==
Message-ID: <e62996f0-d15a-4b4c-9be7-6d6bc96fdc8a@kernel.org>
Date: Mon, 7 Jul 2025 15:55:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, hdegoede@redhat.com,
 andy@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.com, dan.carpenter@linaro.org
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com>
 <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
 <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com>
 <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
 <CAGn2d8M5+5ErZd0YF_hQ75j5FWEFC60qCPX6U7G5j2HgDmz1PA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CAGn2d8M5+5ErZd0YF_hQ75j5FWEFC60qCPX6U7G5j2HgDmz1PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Abdelrhaman,

On 7-Jul-25 15:26, Abdelrahman Fekry wrote:
> Hi Hans, Andy
> 
> On Sun, Jul 6, 2025 at 9:25 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi, Abdelrahman
>>
>> On 1-Jul-25 5:45 PM, Abdelrahman Fekry wrote:
>>> Hi Hans,
>>>
>>> On Tue, Jul 1, 2025 at 4:54 PM Hans de Goede <hansg@kernel.org> wrote:
> 
>> * And maybe you'll find more possible cleanups while working on this
> 
> I was working on some cleanups and i found something that i really
> don't understand.
> how is the error checking of hmm_alloc is handled , some functions are
> checking the
> returning value of it using mmgr_NULL and other use mmgr_EXCEPTION
> while in fact, when __hm_alloc fails it doesn't return either
> mmgr_EXCEPTION or mmgr_NULL in
> most cases.

Sounds like you've found another issue to fix :)

Regards,

Hans


