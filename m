Return-Path: <linux-media+bounces-38114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F3B0B1C6
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 22:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F87560236
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 20:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42551223302;
	Sat, 19 Jul 2025 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZogsDgnT"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B66E21578D
	for <linux-media@vger.kernel.org>; Sat, 19 Jul 2025 20:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752957531; cv=none; b=KnFuLEUB5q3MLBZ5d3pj1FOOVideWdfpjaFTpVMfLWRHVNZ5O/J4KoqOyxd1jfzw0F2EmDbG4BrEWfgX8hAL9yKYojncDVGCo5FW/ofeZDeNOBDsQ+17TMsVli+puUf+2WTxMBpOhXyyX2QCdVs915ZnA0ZTPX8c4iyISzu4U1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752957531; c=relaxed/simple;
	bh=VpESl7rFP+bR54VlK6dMkN22c0sH8kUW0any+GcJwhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tKFXoEOi87Ctt8m7Mhgw6qce8AbkHQBekjTq5HaeNxyJZY/9qIddbrNmqBMeugdsHOoft9dFKsHDEoFcMJzmtoKamprJ6tGA5nneY/3axu/ZveaBan4AjeAGVYQTBJgAr1Y64pBPIgr9cAANBzrgx7JbM6h+4bm7TxncGCA/UKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZogsDgnT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=VHfpdRJpcnfoEOUh/Li3fH2Jsjq7lACNrgfEx7sHmpw=; b=ZogsDgnTDL6iKhcm1+3XIOzu+u
	Jvo5bCAEg6yeNybicIVvtjU/7GGmpu3tRwv0ANOVVmc4ObDiOuQtMQQBa5jTdaz6lovGStgdFfhbq
	s4j5hjufHxnrrf2VDkOVWTbdREKTnIF2yRYm+qelHPr6iYtgiz+i90186SA9oLJGPcGNw31mAsYV9
	c+MoF4BdT/JA3X84eJscaWNZynOwigZuD3EIXzxorSfokW0oUz9smFR2dmLyWpsKVE778Qsixw0Pl
	HtpiB2PznoT8RrCKab91Vw4MUH0l9it8e9emhgjWrCsu6/DpXgzWSppTSlG6UtWt7gIstjLy+cOAx
	ah5SbdsQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udEKX-0000000EbwV-012s;
	Sat, 19 Jul 2025 20:38:49 +0000
Message-ID: <f31f468a-7708-4359-bfa2-31b16c159429@infradead.org>
Date: Sat, 19 Jul 2025 13:38:48 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: cec: extron-da-hd-4k-plus: drop external-module make
 commands
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hansg@kernel.org>
References: <20250719005942.2769713-1-rdunlap@infradead.org>
 <687afeed.050a0220.3aa8f2.1836@mx.google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <687afeed.050a0220.3aa8f2.1836@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/18/25 7:11 PM, Patchwork Integration wrote:
> Dear Randy Dunlap:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test media-patchstyle:./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch media style
> ERROR: Commit 056f2821b631df2b94d3b017fd1e1eef918ed98d found in the stable tree, but stable@vger.kernel.org not in Cc:

OK, will add that.

> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc hverkuil (Cc: Hans Verkuil <hverkuil@kernel.org>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>)
> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc mchehab (Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>)
> ERROR: ./0001-media-cec-extron-da-hd-4k-plus-drop-external-module-.patch: Don't Cc linux-media (Cc: linux-media@vger.kernel.org)

Why these complaints? In Docmentation/driver-api/media/maintainer-entry-profile.html
I see:

  Patches for the media subsystem must be sent to the media mailing list
  at linux-media@vger.kernel.org as plain text only e-mail. Emails with
  HTML will be automatically rejected by the mail server. It could be wise
  to also copy the sub-maintainer(s).

OK, so according to this, I can Cc: (or should that be To: ?)
hverkuil@kernel.org and drop the copy to hverkuil@xs4all.nl.
Is that correct? Should I send a copy to Hans or not?
It's unclear (conflicting advice).

And I can drop Mauro's email address since the delegated sub-maintainer
can take care of it.

Thanks for guidance.

> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/80828975/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 

-- 
~Randy


