Return-Path: <linux-media+bounces-21263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB409C4153
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 15:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8456C280EDA
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 14:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FAF1A08DF;
	Mon, 11 Nov 2024 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EeFbWJcG"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037DF1E481;
	Mon, 11 Nov 2024 14:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731337075; cv=none; b=CbZ+QxIH0sFi1aNEwhaIIRxVhxsLQDWljtep/9GLzS0FO8OyLNLOkSBfHLphQ7J5DJiviVA9Yvsf20DrfmV/jnpIh6H51nYfF4qk4ztIapxfqhAdUOK6XcwETcLXEZAmaPxaVDolHL6wfRFN2zAtbFDTnnmgnKB0TFmMPdHEJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731337075; c=relaxed/simple;
	bh=Sr89Ntj8Oh4Wusz4gpla4TFLfVZzIvrFX4pvfeKcCXc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mmZt2rf6j4JSBLWSFe0cfcoUhrDDr2OseyhUndntxu0S3d7YssMgGFHHu20AukqFrPdiEbDNym5pbtZYGh/ZI0JuUeqoYV6jS/Ycf/3Q80ZfO7q0KulEADLmff2qv1BuBleopPJMx8sRpQd5Er1jiKUEPwz4yDbgGsh72SwYt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EeFbWJcG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ECC1F403F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731337073; bh=tsvrjhMT0aQcOBT2l9uiS8/IawzPz5uPe2uYttTExiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EeFbWJcGmo/wT7PHm7ENpBkX3x37IfFlDtsgqaX/0bN6IpcLs6f6zje4q7S/woY8V
	 bHq959m9Nm6+qZQlORFKy2b1H+RRZPsaVCHqb9J6wWmgUY4zQMXEUDiRcHnwS/1gCB
	 Tm9lUfdtRqOw8Rb2gYGN/W1G/WdHO2I93O0GtHCPUIYRhSTJsm9jKiFSLPRuY0u/QL
	 bXx54/I2NllCvIcYaUbgz/lmehvy0rkxR4MUnzPDrqRb0DzHR5CfK+VenPA3AFZwcP
	 HaI08y7s4yBNWksvgF7V3PCFYfvnWuMUqItVkfCd6cwk/a+L9lAqJPrO2rRxj09BBG
	 e3tnsdbdCIj8Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ECC1F403F1;
	Mon, 11 Nov 2024 14:57:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 2/2] docs: media: Debugging guide for the media subsystem
In-Reply-To: <20241111095027.m36ef62bltcjbxkc@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-2-2b1b486c223e@collabora.com>
 <87h68i22ww.fsf@trenco.lwn.net>
 <20241108101243.a6rxed2lx55hwcmj@basti-XPS-13-9310>
 <20241111095027.m36ef62bltcjbxkc@basti-XPS-13-9310>
Date: Mon, 11 Nov 2024 07:57:51 -0700
Message-ID: <87serxu8b4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

> Hey Jonathan,
>
> On 08.11.2024 11:12, Sebastian Fricke wrote:
>>Hey Jon,
>>
>>On 07.11.2024 13:40, Jonathan Corbet wrote:
>>>Sebastian Fricke <sebastian.fricke@collabora.com> writes:
>>>
>>>>Provide a guide for developers on how to debug code with a focus on the
>>>>media subsystem. This document aims to provide a rough overview over the
>>>>possibilities and a rational to help choosing the right tool for the
>>>>given circumstances.
>>>>
>>>>Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>>>>---
>>>> Documentation/process/debugging/index.rst          |   1 +
>>>> .../debugging/media_specific_debugging_guide.rst   | 178 +++++++++++++++++++++
>>>> 2 files changed, 179 insertions(+)
>>>
>>>Mostly overall comments here
>>>
>>>- much of what's here seems redundant with your other new documents; you
>>> seem to be going over the same list of tools?  Why not just talk about
>>> the ones that are unique to the media subsystem?
>>
>>I choosed the minimum duplication path because of the perspective that I
>>envisioned of the reader.
>>The reader reads that there is a debugging guide for the media
>>subsystem, which to my ears sounds like:
>>"Everything you need to know to get started debugging in this subsystem,
>>with recommendations for useful tools"
>>and not
>>"Some specific media bits that expect you to have read every other
>>debugging documentation and judge yourself which of these tools might be
>>useful for your debugging".
>>
>>I look at that specifically from a perspective that the general
>>debugging guides are probably going to be extended in the future with
>>more general debugging tools which might not be as useful for the media
>>subsystem.
>
> @Jon: Does that sound reasonable to you? Or should I rework the page? I
> think this is especially interesting for the audio debugging guide as
> well, because this determines how subsystem specific guides should be
> formatted.

I would suggest trying to minimize the amount of duplicated material;
more duplication is more work to maintain and inevitably goes out of
sync.  That said, I don't want to send you around in too many circles on
this; and would not try to require such a change.  It's a suggestion;
get the docs to where you're happy with them and we'll be glad to take
them.

Thanks,

jon

