Return-Path: <linux-media+bounces-44988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73152BEFB27
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D487C346AE5
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C830B2DF13F;
	Mon, 20 Oct 2025 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kkm0ddok"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A81CAA7D;
	Mon, 20 Oct 2025 07:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946001; cv=none; b=f4akYagsjOmOmdaoKBM2pVdOpqV4QVQSYPobFAB4w2GMv9NQGEL436Fkk0EJxG1C8ES+AWYX9fq9SlZFCLhcewGm0Fzt2KRf2Si5ZhA7tXKVxQ2k4xHE+VfYcLsGN6d6lFA/eOMs5VXwOnBWHcMEDvkY5zmnGoJ1XjU1Uno484Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946001; c=relaxed/simple;
	bh=8AB0aRAm0ze3OaVTlrRfLVBpXJVJY1X3VC4HOg9SU5I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yw/eG9RUgV3oz/WIRL6jjGTYfyZl4UXMxXSELJxviEJM4UdrqgXR3CQaGEpDSY1XtzVpSKncuiHwaGLpkRxG0jA1NOa34ofFDkbonIurT9L0juv9//xzHhIn47KYFSp2bzQIav+sKegGSrL87NcTzJx3+dewirHElaWlc+96rHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kkm0ddok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216A6C4CEF9;
	Mon, 20 Oct 2025 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760946000;
	bh=8AB0aRAm0ze3OaVTlrRfLVBpXJVJY1X3VC4HOg9SU5I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Kkm0ddokeTX7LPGVhU2fIoS7cd/6rusOF+Rm5EmKIXYnBlzQIiDjSzSYm7r+azOIV
	 hSWbJpDHvDswIRl/kwGspYlp4vBobWIWLlpD6gXmY0HJdqR5k5mXYVNrXc3H0RnylK
	 AQmD7NBI6CCZlQN+5tp82GsuDp+ESC1j0f9rWLchIuPwSozIqUiqwsc9h+GS8Ryex6
	 Pn6Orks6mnm1ks4WY11+uE/63BM84PFTMynWe9YzGfnFyuYV2lvFQZ79PdNYc37bfg
	 Chgyzk2ih/ljQ1S6Mq5yxKmPpxPCHuNpoomhzXJ7XibVOchOj7loZMUneQ75bDyWce
	 dRMVwe54+BLeQ==
Message-ID: <1f2748a5-1955-48dd-93e4-69e032d895e0@kernel.org>
Date: Mon, 20 Oct 2025 09:39:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Hans Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org
References: <CGME20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d@eucas1p2.samsung.com>
 <20251016111154.993949-1-m.szyprowski@samsung.com>
 <36cfec0a-3717-4b0e-adc0-6887e6b58f44@collabora.com>
 <84133573-986d-4cc8-8147-246f0da34640@samsung.com>
Content-Language: en-US, nl
In-Reply-To: <84133573-986d-4cc8-8147-246f0da34640@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/10/2025 09:34, Marek Szyprowski wrote:
> On 20.10.2025 09:11, Benjamin Gaignard wrote:
>>
>> Le 16/10/2025 à 13:11, Marek Szyprowski a écrit :
>>> create_bufs and remove_bufs ioctl calls manipulate queue internal buffer
>>> list, potentially overwriting some pointers used by the legacy fileio
>>> access mode. Simply forbid those calls when fileio is active to protect
>>> internal queue state between subsequent read/write calls.
>>
>> Hi Marek,
>>
>> I may be wrong but using fileio API and create/remove API at the same 
>> time
>> sound incorrect from application point of view, right ? If that not the
>> case maybe we should also add a test in v4l2-compliance.
> 
> Definitely that's incorrect and v4l2-core must forbid such calls. The 
> standard reqbufs/qbuf/dqbuf API is also forbidden. Extending 
> v4l2-compliance tools is probably a good idea.

Yes, please! A patch is welcome.

 I also wonder if its a
> good time to add a kernel option to completely disable legacy fileio 
> access mode, as it is not really needed for most of the systems nowadays.

No, that will break applications. Using read() is very common (and convenient!)
for MPEG encoders such as the cx18 driver.

The fileio code is not blocking any new development, it's just there for those
drivers were it makes sense.

Regards,

	Hans

> 
>  > ...
> 
> Best regards


