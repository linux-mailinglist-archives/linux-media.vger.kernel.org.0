Return-Path: <linux-media+bounces-21114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D20249C17DC
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E4AB22569
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E711DE899;
	Fri,  8 Nov 2024 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="TtT3Cwxa"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BD1F5FA;
	Fri,  8 Nov 2024 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054278; cv=pass; b=mM2CBfZBBZEk2rW60iNbjY1zUUXdTx2IdRTH3269mjyqOKF9nptA0XJ30VAn+vGBUoQ0mmqC/Ordc6A87yzS29tcPet3aW0XRoVTCj7fbEL/i7rS3z4e18b1XN1vt6ylcaL/NxZtIMcUTgozLP6DUDNlwNJvskO6miBfAMcx1DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054278; c=relaxed/simple;
	bh=KvidRfAANg8XA3VnFXSr2Ww/cgt0MlyBxmzBVjBZF2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obwHKar9jLWf3ix8NIJZpMg2FbMVIrmcPoeRsDqcW2cNUEnphHddRxWzzgn0j211jDLkVWyastYm9OUbIMW+hKiO466rlkSsK0l+xh2xAskSqdOVjDtQdqUX8tXasYE3kJg5VH1bKeMEFZme2MRVXlfGRHd2hd/sMkpyy9IyVq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=TtT3Cwxa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731054263; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n5gYkGTkWbD8ZuiphiqOkZYPJc5OsPtVrkVaAXf/lPlrNAtZJRusYnPgatCPoNVUbiV7Qy/ppBWTXTchKjddPLBOhDhRG0C9xQmzLFaNFu7Oin2vtFrmeDgWMcXlDIuFC7bBJVGWyW/CHEIyeqFuJ0v9pf/NOGkUIJ53mL3an20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731054263; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gtp6A3hGxlQfV2x0Wy5hZhakNlkzGjb+GlkiFRLOsWE=; 
	b=SkUJEy248pWeGhhPcJytVgQgJkclB4euXuM5eysXw/p/RZYh2xfAN3K+10PxCjL3bHuP4+t74iG1LO7hHbFcog8qXtf89siExIIg/oQjyhUTYUi6UInKn/yY+mwGBLoi0HVgLhhZqOsVoxLOuA2G89LVh4zzxVq2uo+ev1u6Fpo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731054263;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Gtp6A3hGxlQfV2x0Wy5hZhakNlkzGjb+GlkiFRLOsWE=;
	b=TtT3CwxaU8hyiYI4MZKzeQWoqSCurbkf7uJffSs9F0UdSP03h1209F5RddLQyEmr
	+A9JKlWbU0Ld3WuvtnRcZdWzgRHuKGpnNpPpT7j3ZGU7NJ270CKyP15m84BJ1/GiJ5V
	ZW78HRZq3yH2aQONzWBKOZSsc2nZRR5sTV5DVVeE=
Received: by mx.zohomail.com with SMTPS id 1731054260823258.94058542690425;
	Fri, 8 Nov 2024 00:24:20 -0800 (PST)
Date: Fri, 8 Nov 2024 09:24:16 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	mauro.chehab@linux.intel.com, kernel@collabora.com,
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 0/2] Documentation: Debugging guide
Message-ID: <20241108082416.u6vvdmmhadfqtiau@basti-XPS-13-9310>
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

Hmmm my Google-Fu is not strong enough, I can't find a docs-next
anywhere neither in https://git.kernel.org/ nor in the Linux Kernel
documentation, can you point me to the tree?

>
>Thanks,
>
>jon
>

Regards,
Sebastian Fricke

