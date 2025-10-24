Return-Path: <linux-media+bounces-45521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5829FC066C3
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 15:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8620F4E262E
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677BE31B80E;
	Fri, 24 Oct 2025 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dd7+s8Cv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F431B122;
	Fri, 24 Oct 2025 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311623; cv=none; b=d3CsCyv1tbQjtGr4ntvXuSTv4HxDoC/cSiPCBFjbEdg1iSjWW/66c8QxY17xLmSOIgRCCAC9kUya9ZimxUfSg4AXuzb9SE5l7E4iwUjkhzIOaPXz+/tdCkC2oZzY7YOdc96v4ojrLZa9LyMkvg4ag3PwDD7ecZNn7GflDUcdoPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311623; c=relaxed/simple;
	bh=SWAb6pqCtfM8mITOfpQz1UmNMlpz6ASkBTr/7697xSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi2kjiM7vqitxng4Qua9qg77VcaV/LlTL2x7w8Mn7RgGECM+sliRPDm5x3dosuy+zjJum+1GPdCfgkyBp4vhyPB32DeEW6aTFrmaFydWWnMVHbiExsmYKYMJuvPYjy37wg6sgKuoJ9b9PUCrIuKqeYj4/tRtAZRe1yb4rC9fzmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dd7+s8Cv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5664AC4CEF1;
	Fri, 24 Oct 2025 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761311623;
	bh=SWAb6pqCtfM8mITOfpQz1UmNMlpz6ASkBTr/7697xSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dd7+s8CvPPkqyKtNvHl6g3gkiZvEHmPdXyYjDbbWJOsRJkSy2uyNykASGhn/bp+P2
	 lcsA2QR4HT3IGE2s66R/+wlgXP+7Kmh+sAuv/S09AdMza7aSLQngTBmsCWKiZ3dwLH
	 y5KTlk92oilF6esGoFhbjlLB5IBbbKNPQecky4aLk6gQcxuuPbBSmbarIGxsC/80/e
	 zXU2RFm1BffNVBwTf358mgLwbuEleBgtBCcHyJlWgoTiWvPbrDKCQbgR7sTGP55P3x
	 zVLe21CMmJZG4VjYYeLb/U/svwJZ58cpjaX3Cl59QXHjDre7BayaCV/EoftB5zrdDe
	 54KQipHXx3oOQ==
Message-ID: <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
Date: Fri, 24 Oct 2025 15:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/25 2:40 PM, Tvrtko Ursulin wrote:
> You trim too much of the quote making it unclear if you read the whole story.

I'm well aware of the context.
> If the driver isn't detached from the signalled fence then it is vulnerable to
> use after free.
When someone just reads "detached-driver" is creates the impression that the
driver is unbound from its device, since this is what this term is usually used for.

(And this is even the case you want to protect against, i.e. the string behind
the pointer returned by get_driver_name() has been freed.)

However, the condition that has changed when you print "driver-detached" is that
the fence has been signaled, independent of whether the driver has been detached
from the device.

Now, you can argue that you mean "driver has been detached from the fence",
which means something along the lines of "the driver has no business with the
fence anymore", but this is not what people think of when they read
"detached-driver".

