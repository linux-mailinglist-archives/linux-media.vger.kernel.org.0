Return-Path: <linux-media+bounces-21141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8449C1A39
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BB111C2107D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFBD1E2845;
	Fri,  8 Nov 2024 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="BPQwY5Gw"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C01E25E1;
	Fri,  8 Nov 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060789; cv=pass; b=Bts/TZMI+cs9nNI7p8jLzmJnX4VumECdpcMK6xAOgQGWa5u9k7FIU+uM01rGtAkVbV+r7fSD7X/1mkEpoCGecjUjuTnRK48UKL2O2SApdDjb9en1/oZsW+FKTC1Pv83PZKTikeQt0b9OshWzb1R1qwh0dy3oqfNRxzSZtxCS9NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060789; c=relaxed/simple;
	bh=URH1dV2Y67ZlZ25QwrpXrKUcR2Au3hsHHxbNoHitl5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw+DH+KXKbKWUBxeGEWpsqOCktWw8ZDeeTM9JQYOnpv4szP0ijRw0LfhL9dj275Ga+V2lA4dj8uWbQs6D89S3yefNb/Pm3QLPQ+I1enjUZgG41Ag37KWD8RCFwSzsWClNalHjJY1FgxrCtA1On9GiBeVwnrAAB6HPf+ncW8MNOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=BPQwY5Gw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731060769; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bsTNZJF2lyVfM6jm/zNhBscpTcTbxERiukwEibUzKBAlLk6AWP5EltOu87KOLnhFb6bHOBdnH67Bo/PNOFD6LZs8R8W0ADeMNYjmtQoJaP8VOA4UFqNnl+Q6sxPZ4+QKHT6tlaOypC9GuT1+JHMnECu/WO7pKMQyiNXY2kp0VwI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731060769; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AQ8tMbexbiQsHm/pOBHSP+wB02qPYz2EI2G2y4054mc=; 
	b=KkTYWDOLSe6g4fhHeszj3/B1q4N44NibjkEWr9/ti4atKoVMBO6MlXlCcjeTWe5yLOGEZ7IGWAy0Grdu/tl9jcDooJbp5cEWoe+r5agSCLSNclVI/izwAqGFL4iS/5Kx0PLrkhvTKD0+8sn/+CjDcyfxU7c7CoOoEF32uPRF8vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731060769;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=AQ8tMbexbiQsHm/pOBHSP+wB02qPYz2EI2G2y4054mc=;
	b=BPQwY5GwF52fDh9KKJmhMao0LMnWAgeEDqohE7vP/5n9fJlZiTvusiM3vKVhf6M1
	qjqX6z6aM6j34d3xZ0vRMLzySBYobzxL/G3DFM3ieVRPc+FD108sATzfBSyYjQ1VYbV
	BOXTPJzHU1WSByAJ2DkQn40PPBB2eAfVCkQeE9ms=
Received: by mx.zohomail.com with SMTPS id 1731060767699104.95062302155475;
	Fri, 8 Nov 2024 02:12:47 -0800 (PST)
Date: Fri, 8 Nov 2024 11:12:43 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	mauro.chehab@linux.intel.com, kernel@collabora.com,
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 2/2] docs: media: Debugging guide for the media subsystem
Message-ID: <20241108101243.a6rxed2lx55hwcmj@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-2-2b1b486c223e@collabora.com>
 <87h68i22ww.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <87h68i22ww.fsf@trenco.lwn.net>
X-ZohoMailClient: External

Hey Jon,

On 07.11.2024 13:40, Jonathan Corbet wrote:
>Sebastian Fricke <sebastian.fricke@collabora.com> writes:
>
>> Provide a guide for developers on how to debug code with a focus on the
>> media subsystem. This document aims to provide a rough overview over the
>> possibilities and a rational to help choosing the right tool for the
>> given circumstances.
>>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>> ---
>>  Documentation/process/debugging/index.rst          |   1 +
>>  .../debugging/media_specific_debugging_guide.rst   | 178 +++++++++++++++++++++
>>  2 files changed, 179 insertions(+)
>
>Mostly overall comments here
>
>- much of what's here seems redundant with your other new documents; you
>  seem to be going over the same list of tools?  Why not just talk about
>  the ones that are unique to the media subsystem?

I choosed the minimum duplication path because of the perspective that I
envisioned of the reader.
The reader reads that there is a debugging guide for the media
subsystem, which to my ears sounds like:
"Everything you need to know to get started debugging in this subsystem,
with recommendations for useful tools"
and not
"Some specific media bits that expect you to have read every other
debugging documentation and judge yourself which of these tools might be
useful for your debugging".

I look at that specifically from a perspective that the general
debugging guides are probably going to be extended in the future with
more general debugging tools which might not be as useful for the media
subsystem.

>
>- Please use the function() convention throughout.

Ack. I assume you also mean the titles as well.

>
>- Back in the ancient past when I was writing V4L2 drivers, one of my
>  biggest problems was figuring out why applications weren't getting
>  what they expected.  The vivi driver was most useful for finding
>  subtle differences...  One would use vivid now, but I suspect the
>  utility remains.

Okay I'll look into that.

>
>Thanks,
>
>jon
>
Regards,

Sebastian Fricke

