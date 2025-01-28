Return-Path: <linux-media+bounces-25351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2337A20D5A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 16:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B3518821B0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 15:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719611D5ABF;
	Tue, 28 Jan 2025 15:45:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE01D5AD8;
	Tue, 28 Jan 2025 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738079103; cv=none; b=OWe2wbxWCZKtJKW+0yNxLrsgrNe8qUP+qrVFRLDbOLQEIzaNvC07cbuDXybRU22nzuq3lGREQzXaEKCjyGs5IiLm4lwZB3OuC7133CJ96bqajszdLtExqTLXZ+0bibaGfsSHco8S41OzCstf7OGsbyi2x7IwieZX9Yv2HWk9lzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738079103; c=relaxed/simple;
	bh=Yl4pTeiZ+rcwJsY4/ebROdRqi3WjnxVZ5inlRFdaZQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzQdqFzjmWdFTvub1jcBtz+MBIrNDOk17s7PggMdMFAiNUpSZ2cGlnmnNULfYcb0vl/UXDHyGSuNckqpi11pn1pzcAeFT9leTBpe1KEeREmd8RaAXET2VYscFfPGhJBi6IO8nhaHW3tp0xGPqvhKsJ8YK18aVYHfJKRlboMzExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD5EC4CEDF;
	Tue, 28 Jan 2025 15:45:01 +0000 (UTC)
Message-ID: <0c8c26e3-f806-4238-80e7-14ec0a288589@xs4all.nl>
Date: Tue, 28 Jan 2025 16:45:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.12.10: Regression in Hans' commit 613f2150 leading to excessive
 sysfs entry recreation?
To: Jens Schmidt <jens.schmidt140@arcor.de>, stable@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: regressions@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <6555309b-830d-449b-800c-55306c19c659@vodafonemail.de>
 <D69CB9C3-AF3E-4E60-B35B-FBBE1D363207@arcor.de>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <D69CB9C3-AF3E-4E60-B35B-FBBE1D363207@arcor.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/01/2025 09:57, Jens Schmidt wrote:
> This is on Debian testing with the following kernel, built from
> the tarball on kernel.org:
> 
>   Linux sappc1 6.12.10 #4 SMP PREEMPT_DYNAMIC Fri Jan 17 22:17:45 CET 2025 x86_64 GNU/Linux
> 
> More by chance than anything else I noticed this sysfs entry:
> 
>   /devices/pci0000:00/0000:00:02.0/rc/rc0/input33
>                                                ^^
> immediately after a reboot.  After letting the system run for
> a while the file name counter may well be in the thousands.
> 
> I instrumented function drm_dp_cec_attach to dump the values
> of the expressions involved in the following test:
> 
>   if (aux->cec.adap->capabilities == cec_caps &&
>       aux->cec.adap->available_log_addrs == num_las) {
> 
> The result was that on every call I have
> 
>   aux->cec.adap->capabilities == 0b1101111110
>   cec_caps                    == 0b0101111110
>   aux->cec.adap->available_log_addrs == 4
>   num_las                            == 4
> 
> which triggers recreation of the sysfs entry.
> 
> So the capabilities differ in CEC_CAP_REPLY_VENDOR_ID.  If I
> clear that bit in above test, I am back to normal, getting only
> 
>   /devices/pci0000:00/0000:00:02.0/rc/rc0/input1
> 
> and keeping that throughout the runtime of the system.
> 
> Could this be related to commit
> 613f21505b25a4f43f33de00f11afc059bedde2b?

Well spotted! Yes, it is related to that commit.

I'll take a closer look at this tomorrow since this test against
cec_caps needs work.

Regards,

	Hans

