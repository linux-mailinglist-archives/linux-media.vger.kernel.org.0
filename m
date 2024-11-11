Return-Path: <linux-media+bounces-21249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F189C3B58
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 10:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A7511F23003
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 09:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1E4156886;
	Mon, 11 Nov 2024 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="jPqmi/ol"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7857012C54B;
	Mon, 11 Nov 2024 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318648; cv=pass; b=hBMe+5gh7gns8FglvHAhVk29KkDLJigyK3ag6iD2O5Kfcrx3f1WpVO9GvFtJXBNCOC6GfPZ2FMGgJtSkHl/zp+CyfjbdxqMgIseiH876RWgamwoB3CsMZvPpOJomylRLnSR8IC0LZxJb47f96SjZEfv10awm+4aGVjn9pugHfaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318648; c=relaxed/simple;
	bh=KHw8aASocynsGpdOMjdykW8c3ar0Kk3HVfQKKxdmquk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/86TqWXd1jUzK6+wQLKDc1xLndqCZtrtWq9riJ2w1qvJlGbvwkr1oi6GF9dEd6fu5V9XzNHehxYFOfHokqpkGxE8lmkCCLZP7x+8833TG58s+2Pl0zGdnt/0BVs8/Wvo9vlAS2vBB3cINsh8+Z+mGETSf4TFfjjvJL84hOdgZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=jPqmi/ol; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731318633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FJbLeqL/G39HXHQzyIFGOdq3j78SumA8CUhi2kwKNgF5AW7XJMh8PFP6uvYcd+d5fgRvdkoTW95J5/NEih+i/vwpkn4g2m1OOrcvczN3JFArVOiG6a2M+fb6JBofwEiN5ZobFecCUv9apWabKKo880eWEPrs3nIzTlPgUUf43Uk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731318633; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XE2jxCW3lT2gfcGcIJ55cVRHtECsFw9StdzcJc6RzQs=; 
	b=jRgfgZEoodAkd2wS7M8nd+wbV+4clKrG15K+DHKJFGpwBdIRekkacsHXdfAltVa8PVLdSqdSPE61430UcuGcfHJfGrbPGZkdSPzVX0U1ZVKjq64yWAslmNcOp19NZpzq/CTgIf7a4wwRt3c/IxakjbstYD9Y8TRR02XY5pkyjLY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731318633;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=XE2jxCW3lT2gfcGcIJ55cVRHtECsFw9StdzcJc6RzQs=;
	b=jPqmi/olbNy5iJkBOWCARHuOletkrjEqLRwHOG/eAOHP61dAJQsH9YMy7QCH8z7U
	sj1ddJJVQUggDIoh/cDJEo8DSgKig6iny8xvh758q+6pfw66lKwpurVYGJllYyNi2Is
	Z3uIu4MgBLHUx/uUr+7OBGzMD744WzrCzGiXVLnc=
Received: by mx.zohomail.com with SMTPS id 1731318631570982.4858105678952;
	Mon, 11 Nov 2024 01:50:31 -0800 (PST)
Date: Mon, 11 Nov 2024 10:50:27 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	mauro.chehab@linux.intel.com, kernel@collabora.com,
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 2/2] docs: media: Debugging guide for the media subsystem
Message-ID: <20241111095027.m36ef62bltcjbxkc@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-2-2b1b486c223e@collabora.com>
 <87h68i22ww.fsf@trenco.lwn.net>
 <20241108101243.a6rxed2lx55hwcmj@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241108101243.a6rxed2lx55hwcmj@basti-XPS-13-9310>
X-ZohoMailClient: External

Hey Jonathan,

On 08.11.2024 11:12, Sebastian Fricke wrote:
>Hey Jon,
>
>On 07.11.2024 13:40, Jonathan Corbet wrote:
>>Sebastian Fricke <sebastian.fricke@collabora.com> writes:
>>
>>>Provide a guide for developers on how to debug code with a focus on the
>>>media subsystem. This document aims to provide a rough overview over the
>>>possibilities and a rational to help choosing the right tool for the
>>>given circumstances.
>>>
>>>Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>>>---
>>> Documentation/process/debugging/index.rst          |   1 +
>>> .../debugging/media_specific_debugging_guide.rst   | 178 +++++++++++++++++++++
>>> 2 files changed, 179 insertions(+)
>>
>>Mostly overall comments here
>>
>>- much of what's here seems redundant with your other new documents; you
>> seem to be going over the same list of tools?  Why not just talk about
>> the ones that are unique to the media subsystem?
>
>I choosed the minimum duplication path because of the perspective that I
>envisioned of the reader.
>The reader reads that there is a debugging guide for the media
>subsystem, which to my ears sounds like:
>"Everything you need to know to get started debugging in this subsystem,
>with recommendations for useful tools"
>and not
>"Some specific media bits that expect you to have read every other
>debugging documentation and judge yourself which of these tools might be
>useful for your debugging".
>
>I look at that specifically from a perspective that the general
>debugging guides are probably going to be extended in the future with
>more general debugging tools which might not be as useful for the media
>subsystem.

@Jon: Does that sound reasonable to you? Or should I rework the page? I
think this is especially interesting for the audio debugging guide as
well, because this determines how subsystem specific guides should be
formatted.

Regards,
Sebastian

>
>>
>>- Please use the function() convention throughout.
>
>Ack. I assume you also mean the titles as well.
>
>>
>>- Back in the ancient past when I was writing V4L2 drivers, one of my
>> biggest problems was figuring out why applications weren't getting
>> what they expected.  The vivi driver was most useful for finding
>> subtle differences...  One would use vivid now, but I suspect the
>> utility remains.
>
>Okay I'll look into that.
>
>>
>>Thanks,
>>
>>jon
>>
>Regards,
>
>Sebastian Fricke
>

