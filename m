Return-Path: <linux-media+bounces-21078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C739C0D63
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 18:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F9D9B22C11
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 17:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946B92170C0;
	Thu,  7 Nov 2024 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="PxNC7pBh"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92621315C;
	Thu,  7 Nov 2024 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731002295; cv=pass; b=gdbw+AyyvWeW0WByncjL/jHJwNqTZfR+Eu2A4aqTLJnwyQNgkm2CvNUQ89sdlhtwIvdVVkULFos+5RZkGiYh51GiY/+/zyNhlYFYn9/tmKgPoBe/zYuyY/hFWmy0aqx5pZkRd2NNSEgvhl/PJ2dTH0keKG0eJPgQjDKOpUxN7DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731002295; c=relaxed/simple;
	bh=Qi6g7F8k0JBc5E6QkTEzTkFAtQSM8yWD2ngfjTGKb4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4VuzQySr0608dBzPwnV1pooS96MnrXmPfctdRIwDvLP+n0HZpChadcUS9YhlRLTLD6ZqogOq0F1NKeL9uRniUgpbEj8mBQF+4nv+elgixAOy+rxiOEhDkYqdUusb88RVTJJK1AYV0PxkUi+aBwxP4P/bEgXsd5Sd/S+ZWwc2o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=PxNC7pBh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731002277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mgK/DLF99LJx79M7uwPPi7LSMQufualEYQ5D5DB5W784YfcgbVQgown8YgkNoAWWlX0MKIohsq1lPsH9B4YWffj1/jmu4sGiX/RSMm8eNFSd8R94GvTOw186eQ4BDQR1a5T35ql7Fvk6EIJrXE8FUQZqfIemVtLwOWW1/BY7jn8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731002277; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sls/wkVJ47W5gvv/QQf49njHmwYUvRDdW8tOQBTRFVU=; 
	b=V7TsTCJRZB6raf+IWh9yPIDcYnptqDBWXWp/cAto7q6bCxHqlUJV16uI9prvdLZ0GHFZhYDaZu5V4Lm56mUUwe+NEFH+MBD4c6j3jiDyHKNxZnuF7HzkIJ1FXMvX0FNEVfH/0x6Dy2WpxHZFD4YSxF4L09itZ36osSBQYyyxIkA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731002277;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=sls/wkVJ47W5gvv/QQf49njHmwYUvRDdW8tOQBTRFVU=;
	b=PxNC7pBhXaWRPCQadTgaTATWNIzwYWiWjVBZl6EvpjMyveu/xTKiA+Q8QYFCCNJG
	9DeQJWZYEESO8rSBxvzrlh6Tsa4ifFioPAgflgCqj4ygF2pVTKRneb1lClOdRjUWPkb
	uGEpPZNBN/tY8C3fs/aN0+orvG88tx2LcvlvlOZc=
Received: by mx.zohomail.com with SMTPS id 173100227513635.06961771683052;
	Thu, 7 Nov 2024 09:57:55 -0800 (PST)
Date: Thu, 7 Nov 2024 18:57:50 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	mauro.chehab@linux.intel.com, kernel@collabora.com,
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 0/2] Documentation: Debugging guide
Message-ID: <20241107175750.y7tuzqulfbjl5k4f@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <87ttcj0z8x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <87ttcj0z8x.fsf@trenco.lwn.net>
X-ZohoMailClient: External

Hey Jon,

On 07.11.2024 09:45, Jonathan Corbet wrote:
>Sebastian Fricke <sebastian.fricke@collabora.com> writes:
>
>> The series contains:
>> - a general debugging guide split into debugging for driver developers and
>> debugging from userspace
>> - a new summary page for all media related documentation. This is inspired by
>> other subsystems, which first of all allows a user to find the subsystem
>> under the subsystems page and secondly eases general navigation through the
>> documentation that is sprinkled onto multiple places.
>> - a guide on how to debug code in the media subsystem, which points to the
>> parts of the general documentation and adds own routines.
>
>So I am just getting into looking at this; the fact that I had a hard
>time applying the series has not helped...
>
>> base-commit: 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5
>
>That is ... 6.9?  Why are you basing your patches on such an ancient
>kernel?  If you want me to apply them for 6.12 (not guaranteed in any
>case, it's getting late) you'll need to bring them forward to current
>docs-next.

Yes sorry something must be wrong in with my master tree here, I will
rebase on docs-next and do a respin once I know whether something else
needs to be fixed.

>
>Thanks,
>
>jon
>

Regards,

Sebastian Fricke

