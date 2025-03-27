Return-Path: <linux-media+bounces-28802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C337A727B9
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 01:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22BB03A5E59
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 00:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823534C9F;
	Thu, 27 Mar 2025 00:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fg/NIX9f"
X-Original-To: linux-media@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE165256D;
	Thu, 27 Mar 2025 00:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743034956; cv=none; b=VZqkhnZusD3/jOY1SiImRHfbvQFHu2q9oY0Q/nJJNwQmZW9kw9H/3NhBTE4gRE3H2TL7HcrbsRxFTrD3oJ0usyCpfg5EvXtZjrI+6y+78QwAdXMPEj2pkFmw9XRAQxU+qgvNz3glTp3fWG53KWRiQhzZqHSPPQIn9Q9vhl1QedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743034956; c=relaxed/simple;
	bh=m2ou00RWSTPISt5+LGR9ErqICdduZd2KOzoJ7WVS2/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHQp6hiZKaapliwE2Zew9FF5nSe2OPEgH0D5LEN1Iv/kcEQtbqfAVF3nONRXI6lKfO7NI5jef75p7VLeqXXRjNYENvy938YbEVdBczxloADZzd6AVrosgRcCOlzN9244hVLsKZS+I/A+mXhXueyuMcZ+K7uWJkRCdIkLIBGtvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fg/NIX9f; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=04l0Ano4NKttJ//41wioFP+enerKAade9veITCjqTko=; b=fg/NIX9f2E7OJfnXH977f+rIIJ
	FOk3Ua/V5k8O9Xjl9/wVH3nXgoQI+fajg7WM9Y+5dLJV5o3RySVI7+X4qMfdNKNL/cSSfAoE1T4nf
	skdelG3FvBe88K2LwCVyWQ/g1Kc6RCeg7yQI+hNyOjYT2xlytdunGsExyZyVlFginzVby06aOxmI2
	RLSm/TnlLlKyQxM3my1OcXRLugecsbvspPVzvDtwmytlcalLGyEjNdRs/0tQLpp0bfX5+dW4HPQyM
	v4nwWM5HeT4bKfqkBG8nZWyIXfSXXSKJO2yBBxrPJTUQJWL3CNKr1ZFYWqq9IGNdX5BorVZvs1Acc
	hVhBtv5g==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txb0w-00000005sNH-0wc6;
	Thu, 27 Mar 2025 00:22:31 +0000
Message-ID: <870f6a20-7edc-4115-a700-11c886f181cf@infradead.org>
Date: Wed, 26 Mar 2025 17:22:26 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Mar 26 (drivers/media/cec/i2c/tda9950)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Russell King <rmk+kernel@armlinux.org.uk>
References: <20250326165619.58d443f8@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250326165619.58d443f8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/25/25 10:56 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250325:
> 

on x86_64, when CONFIG_I2C=m and
CONFIG_CEC_NXP_TDA9950=y:

ld: vmlinux.o: in function `tda9950_write_range':
tda9950.c:(.text+0x1225126): undefined reference to `i2c_transfer'
ld: vmlinux.o: in function `tda9950_read':
tda9950.c:(.text+0x122553f): undefined reference to `i2c_transfer'
ld: vmlinux.o: in function `tda9950_irq':
tda9950.c:(.text+0x122573e): undefined reference to `i2c_transfer'
ld: vmlinux.o: in function `tda9950_driver_init':
tda9950.c:(.init.text+0x726a3): undefined reference to `i2c_register_driver'
ld: vmlinux.o: in function `tda9950_driver_exit':
tda9950.c:(.exit.text+0x54fc): undefined reference to `i2c_del_driver'


-- 
~Randy


