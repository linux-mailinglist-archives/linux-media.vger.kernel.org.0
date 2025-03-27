Return-Path: <linux-media+bounces-28819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B677FA72AF2
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 09:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D20170CA6
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEA31FFC40;
	Thu, 27 Mar 2025 07:59:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E216E2E3392;
	Thu, 27 Mar 2025 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062388; cv=none; b=sdSKzvgco+xt63Tc2qmy0UV6wfn1Z+IE17t9Her+Gb6drZ01BTU/vGew8+dyHVGcqLJ81Q4mXqIcNCVgpgOJQw6jCl0tCdyRlXVg9QXHxsTMvak6ObVE2ON/7vZqXWOc3JTZFULXFOeA4ZKcRgqw/m2T2rPClYB3t2N8XuEBlek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062388; c=relaxed/simple;
	bh=FvTSu5QT5Btws3+m6wj49T9oYnYC9JacdDsHli6s6BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4rhEruUvyAMLz6SQmqH9xiNOS7eBcvYGbbCrQ6JL1sT65lCvBucLRtvNYP/3m5MeA0Amos6LJEuZ0tI00RJvxQ81QA970HeO+LUn7q5NAaEpBHwMby9pLcWViRSnx6G4zsz+VlNoLy5dAANrPrJUo8DcPUx8m+2KRNtMPUbqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B60C4CEDD;
	Thu, 27 Mar 2025 07:59:46 +0000 (UTC)
Message-ID: <984e749e-e5d3-4985-aadc-703b803424f8@xs4all.nl>
Date: Thu, 27 Mar 2025 08:59:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Mar 26 (drivers/media/cec/i2c/tda9950)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250326165619.58d443f8@canb.auug.org.au>
 <870f6a20-7edc-4115-a700-11c886f181cf@infradead.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <870f6a20-7edc-4115-a700-11c886f181cf@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 01:22, Randy Dunlap wrote:
> 
> 
> On 3/25/25 10:56 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250325:
>>
> 
> on x86_64, when CONFIG_I2C=m and
> CONFIG_CEC_NXP_TDA9950=y:
> 
> ld: vmlinux.o: in function `tda9950_write_range':
> tda9950.c:(.text+0x1225126): undefined reference to `i2c_transfer'
> ld: vmlinux.o: in function `tda9950_read':
> tda9950.c:(.text+0x122553f): undefined reference to `i2c_transfer'
> ld: vmlinux.o: in function `tda9950_irq':
> tda9950.c:(.text+0x122573e): undefined reference to `i2c_transfer'
> ld: vmlinux.o: in function `tda9950_driver_init':
> tda9950.c:(.init.text+0x726a3): undefined reference to `i2c_register_driver'
> ld: vmlinux.o: in function `tda9950_driver_exit':
> tda9950.c:(.exit.text+0x54fc): undefined reference to `i2c_del_driver'
> 
> 

Dmitry, two patches were posted fixing this (both effectively identical):

https://patchwork.linuxtv.org/project/linux-media/patch/20250227140301.3062217-1-arnd@kernel.org/
https://patchwork.linuxtv.org/project/linux-media/patch/20250322024914.3622546-1-yuehaibing@huawei.com/

I suspect neither of these was picked up by the drm folks? Since the move of this tda9950
driver from the drm subsystem to the media subsystem went through the drm tree, I can't apply the fix.

Once rc1 is released I can take care of it myself, since then it is part of the media subsystem.

Regards,

	Hans

