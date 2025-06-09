Return-Path: <linux-media+bounces-34334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71560AD1AF6
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592233ACF68
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 09:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8958222AE75;
	Mon,  9 Jun 2025 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="tK0ZTmIC"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFE21A314D;
	Mon,  9 Jun 2025 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462565; cv=none; b=XUVC+x7e4OABdxBuBxXsmp8YH0prWW/QHLfA8jryerNjm9mNK/7c2Ho1p+0YEfrPA2MeMj3ZRqyr64mOyfCVOqDAlcZnCXr3u1DAHA66nwV69tr2KXUqgJntDVYZ0/H3V/65csT8uoCDuNES0YeRwdTYsIhvYwpui7KA4uK+8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462565; c=relaxed/simple;
	bh=xeoqtO29dYPDJoZwM/M/M2SRqRGtQkO4SfG9al4Xy4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vg1LTgk82wYjy/HlPJMDHmpQzrcBUUerqqWV8MQ5vTzznx+S3RendoTPAnrwy/SvlJnKrAIBiVtmJbmg0naj++SjAgWb+Y6icrL+BPw+ujTxpPM6loFTuwbl95H2iLpCCpITD7y6POdutJHb5gY+TjhmGP1L2dWZpqL+aNi4TVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=tK0ZTmIC; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bG6ZY4mzbz1PxQ;
	Mon,  9 Jun 2025 09:49:09 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bG6ZX5Qrcz7T;
	Mon,  9 Jun 2025 09:49:08 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=tK0ZTmIC;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1749462549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kGSTCvir3yITm8KzBPa1e7r9+ZrZgHkYcRBdCR9WUx8=;
	b=tK0ZTmICKWRZTiMu34QFNUBMz7i4O7ubahnxWLj3TmSPrtIXW5DIfh+58OsqLutln0LbUG
	b0YB4QpKg10mqxadw8nmLZeWaGjHLJ6+qQL4NYQLMimgjk8KfEVc/0vFwpw3hDG1Y/rnQM
	qgu8jWoPdvRdK2bYh0QR+C3CAAU2V2zuEC1C7RhMB0rwa3UsnfQqNfk8KNdrHGvZewLtwJ
	Srk19Cp7ebAthYMZ9oGjW1arVXwv8hhAcZxstxQarp9n045Iiiv8mZHDoVPqZU9RHzj11H
	MFdtxbcF1FlVNB76FkjdxwMMFRssoxWVd13l5P4uAv4Pw9SifNPmUnTQ+GKX+A==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=6846ae15 a=IkcTkHD0fZMA:10 a=0deYd5exgp-1WSfvuSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
Message-ID: <2e4ef756-a8cf-415c-99ba-a3d72f3288e1@jjverkuil.nl>
Date: Mon, 9 Jun 2025 11:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
 <aEC05991kEIIifDB@kekkonen.localdomain>
 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
 <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
 <aEFoCvPe4zE48UG7@kekkonen.localdomain>
 <608f95249ff3a39efb063ab9c6a543259a7b0ac9.camel@collabora.com>
 <aEasmfi3VBkuFU3g@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <aEasmfi3VBkuFU3g@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

On 09/06/2025 11:42, Sakari Ailus wrote:
> Hi,
> 
> On Thu, Jun 05, 2025 at 08:41:45AM -0400, Nicolas Dufresne wrote:
>> Hi Hans, Sakari,
>>
>> Le jeudi 05 juin 2025 à 09:48 +0000, Sakari Ailus a écrit :
>>>> It's not user-triggerable, if this happens, then it is a driver bug.
>>>
>>> If there is a driver bug, it could well be user-triggerable, wouldn't it?
>>> Testing may not uncover all such cases.
>>
>> You are both right, if the driver is not used, the warning will never
>> trigger. I was worried of the hit of a thread safe ONCE implementation,
>> but WARN_ONCE is simply not, it can warn few time before it stops if
>> called from multiple CPUs at the same time. In that specific function,
>> I can move all the checks inside the lock to make it truly once.
>>
>> Now its up to you, I don't have strong preference. These are driver errors,
>> and usually quite critical. They are not bug_on simply because we have a
>> crash free resolution, but its probably not functional anymore.
> 
> I'd prefer _ONCE variants, I wonder what Hans thinks.
> 

I have no particular preference.

Regards,

	Hans

