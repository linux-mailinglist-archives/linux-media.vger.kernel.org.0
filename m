Return-Path: <linux-media+bounces-34922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C58CFADB1EA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C7F1735D2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CAD2BF01F;
	Mon, 16 Jun 2025 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2ZRb/uu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C522BF006;
	Mon, 16 Jun 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080411; cv=none; b=hYSx7WXyLnC9/ZD60LctDa1hGtJUif4KDM6eV+CWm2cgJoQ0xhA0pBJILMlTH9j1Rjm004yAYyawAWCarLDA1ux4WsNvUDA2vXCzhvpiMrC7rBDIYBwL9xoXXJXd9E8w2pv/9gcEucLxapLDOmVRgz/ZGpAuMLzGwxuwM4/hLuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080411; c=relaxed/simple;
	bh=no/e12UJZJ4vfbneoOUNMfsxK3jADp41dinlBmrIQOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1ARjctxXnI1UKfL6XOYDdOSHmGDIyes32aPXmElj7yVk1jteIIyEqtCWoN+GrIfN37XR94zbu8qKYcYTcnQncz1N2tyIE6djpSNjD6SN7HwZ5k5iI1EImB/bjbCmyJzTeWkM3s2x+2q3FA6/A0zmuUwLH02lgEDtgJCe8EjkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2ZRb/uu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF76DC4CEEA;
	Mon, 16 Jun 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750080411;
	bh=no/e12UJZJ4vfbneoOUNMfsxK3jADp41dinlBmrIQOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p2ZRb/uu2PKsWaIXkA9pAHB0PJe55WaROeNn1xkLd0N0/p7Jf+IBaX9cqhongk9Jh
	 sAEh2uv9kD8WSd2pMMtjEBFAthK5GNItipwkVdDyjFvYTZx53IP2YOlZCfFlH5eHPg
	 cb0Ju912sCH3Aho9q0tdR7gZArRYUWnjoIO8FJvC9BOKoe559ClVLUJfzIwn9eq+Xn
	 MSw5OpmRMq70frYKY1d1nPpGU8zI9nOG+dMqZ3qki8cc9d55p4hNfdIxsOZnFpUGO/
	 34Am76k3N3s00KGS5HlybD+GIFlge+z2PGx4eaJQR9LbLdq50G2kDCvwar3DnUYgWe
	 iCrYzaBpaCiPw==
Message-ID: <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
Date: Mon, 16 Jun 2025 15:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
 <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 16-Jun-25 15:22, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi Ricardo,
>>
>> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
>>> When committers contribute quirks to the uvc driver, they usually add
>>> them out of order.
>>>
>>> We can automatically validate that their follow our guidelines with the
>>> use of keep-sorted.
>>>
>>> This patchset adds support for keep-sorted in the uvc driver. The two
>>> patches can be squashed if needed.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>
>> I've no objections against these 2 patches, but these need to be
>> rebased on top of the latest uvc/for-next. Can you send out a new
>> version please ?
> 
> I was waiting for HansV to say that keep-sorted was useful and then
> add it to the CI.

Ok, so should we drop this series from patchwork then ?

> 
> Right now it is probably just useful for the Makefiles and uvc.
> 
>>
>> Also for patch 2/2 can we not just add the 2 keep-sorted headers
>> and then actually run keep-sorted to auto-fix things ?
> 
> Do you mean removing the annotation after running keep-sorted?
> 
> We can do that, but we will be unsorted again in the future after N
> patches unless we add it to CI.
> 
> If we do not handle this automatically I do not think that there is
> much point on this series.

What I meant is only add the annotations and then run something
like:

keepsorted --auto-fix drivers/media/usb/uvc/uvc_driver.c

and submit the result as a separate commit. Assuming that there is such
a thing as --auto-fix. The reason for this is that if the sorting is done
by a tool there is last chance for it to accidentally break things.

Regards,

Hans



