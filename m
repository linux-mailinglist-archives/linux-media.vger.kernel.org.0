Return-Path: <linux-media+bounces-35950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00701AE9CC0
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA533AEACA
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD80A275847;
	Thu, 26 Jun 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBpORTkh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41D17BA5
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938154; cv=none; b=IFp2tBJ2dE2TY4tD36yP9FOIa4JaoZV8WqWxIzIX34oTzOGzpdrU2TywHsi+x1jOkfG3ukEzIdVAgz17DHdZNb8p9xXblLh4FD2WfTr0W96UVvLC33WZ2sLM+ojs0zwGaMsaHFJGZAMjPR3uTnWIpydMblNSMrKBINq0uV7yCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938154; c=relaxed/simple;
	bh=pvd//JMCapziPMyeNfek1uMHgA2BREUk1y0N0f/o6kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNkk8BM6EgDWcn/CzKmm2o+7sNRqUruzLyLC7ZqZk3Pn8u3ljGzc99JvHuRjrEw0c4PbKs2d7uHqMCOnlPoCRzCX9XNya0xYkRIXBgkMhLr6gk2oSGyZcWQpv9LJMI1AT+w2sVKVh8ab2XpudO3bsrMaTAt+CUfid1Lvpw20W+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBpORTkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFC2C4CEEB;
	Thu, 26 Jun 2025 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750938154;
	bh=pvd//JMCapziPMyeNfek1uMHgA2BREUk1y0N0f/o6kI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QBpORTkhaU6245lrN5sQZiegbYmcmz3bgi28DycOB33ANr7unA2xRS7c9JQbR93SK
	 lzDxRduxTD4jF10kRb2QKEX+Ql5kWZeiWWecmAoa1uSZyraXISWJvUxSyYaET+U7RS
	 3sMCPqds4c0/F53jdRgSsmbSlaJVVlK5gr3KEPHclod54iuPHF0773pAo7sl5KU9n7
	 4sYymbYNfpKUhLbhVBlMlkiisju8JB3eiCehnIZvlShMismVd95XJaqF+heRSpV10A
	 ENyNTr8ykW2Pc2h7jhAZTLrPjdhCH5cgR5XPGJsv09Nu3ced+c4QVQcfHxH3L+wIOH
	 ZzHZa1TCQ7bSA==
Message-ID: <75b2787e-1a07-4878-b101-8bc8cd9f0363@kernel.org>
Date: Thu, 26 Jun 2025 13:42:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: hi556: Fixes for x86 support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250531190534.94684-1-hansg@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250531190534.94684-1-hansg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 31-May-25 21:05, Hans de Goede wrote:
> Hi All,
> 
> Here are 2 hi556 fixes which together fix hi556 camera sensors not working
> on various x86 laptop models. This has been tested and confirmed to fix
> the camera not working on a Dell Latitude 7450:
> https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> 
> It would be nice if these can be queued up as fixes for 6.16-rc#.

What is the status if this series, you had one review-remark
on patch 2/2 which I've answered, so from my pov this is still
ready and it would be good to get this upstream since it fixes
the cameras on some HP laptops.

Regards,
 
Hans








> Hans de Goede (2):
>   media: hi556: Fix reset GPIO timings
>   media: hi556: Support full range of power rails
> 
>  drivers/media/i2c/hi556.c | 47 +++++++++++++++++++++++----------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
> 
> 
> base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae


