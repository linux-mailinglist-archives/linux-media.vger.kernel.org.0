Return-Path: <linux-media+bounces-21081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE44D9C0FE2
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 21:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04AB81C218B4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 20:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE77321830E;
	Thu,  7 Nov 2024 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cu0iP1uJ"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F56215F58;
	Thu,  7 Nov 2024 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731012035; cv=none; b=MMvFEjkNrtzrGpqdaRQOD7f2tH74eMdn1egipIofxm88HZRTjz48V1a8uaRaFcVcnnyPjU4eSgl4RhE25lksyRye1+7wR3lA9jxBYgfRTgY9BsyT3Bc1QkDM+hIINe3+leHdy5HY6Z71UogYgsY2AaJkknZwQJ+Ynd2HwfH6Alk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731012035; c=relaxed/simple;
	bh=QmEJ/92e/5KKl0J82G9jGuO+viu8qplbsKVI8PVeB+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iJORT0JV4qCRtNTD1e6pP6ZWR9VZr6rqXzMrWG+lUsoD/1Zz/3qLKA5sPD7lWGyFuJ7Pwbb8yzuRnX3c2dHJDkrqkoUJ328Kp6TemNOrIpijb+7Gp1d7+AKfErMLewoy0TFK6BlJzgZ+dfOkq6c4KWt1gfp5eYAWKoaswa3K2vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cu0iP1uJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B0BF142C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731012032; bh=c5Q27aMxn2IHD9z7o8rbqIJymOVbS+CuSNFmDhP/KfM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cu0iP1uJQge1qEo4onfLuj7MegS/bB1e/TeedlCjky3/IBj0QFLRn8RTGmsof3FRw
	 J9y5a+0zFPvx4E2XBhNnP+roWj81iXZ0NGPpaUHgtBBDArW/7GehyezEvO1yk2/6jx
	 VTxruwsWJTUKS/s+aeX1ql4rcDXm42uhYfIHfMLxlzD6y3QOYQTI5u2w67iJjAp98b
	 AaaQ5jjVz8f9SzNBr0F/NJM4I8uv2u9XyQVNQzuWHZvryEFp2EiSCbqN6y+nKTCdCK
	 CA8qIUCbvDoys+z7ZY+AHo2L4L2T8Zm4cAyUi1QlmQ2hSTlijPkRjyd4wNhtlGlDJs
	 l+Pc2B4+BZidA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B0BF142C17;
	Thu,  7 Nov 2024 20:40:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com, Sebastian
 Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH 2/2] docs: media: Debugging guide for the media subsystem
In-Reply-To: <20241028-media_docs_improve_v3-v1-2-2b1b486c223e@collabora.com>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-2-2b1b486c223e@collabora.com>
Date: Thu, 07 Nov 2024 13:40:31 -0700
Message-ID: <87h68i22ww.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

> Provide a guide for developers on how to debug code with a focus on the
> media subsystem. This document aims to provide a rough overview over the
> possibilities and a rational to help choosing the right tool for the
> given circumstances.
>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  Documentation/process/debugging/index.rst          |   1 +
>  .../debugging/media_specific_debugging_guide.rst   | 178 +++++++++++++++++++++
>  2 files changed, 179 insertions(+)

Mostly overall comments here

- much of what's here seems redundant with your other new documents; you
  seem to be going over the same list of tools?  Why not just talk about
  the ones that are unique to the media subsystem?

- Please use the function() convention throughout.

- Back in the ancient past when I was writing V4L2 drivers, one of my
  biggest problems was figuring out why applications weren't getting
  what they expected.  The vivi driver was most useful for finding
  subtle differences...  One would use vivid now, but I suspect the
  utility remains.

Thanks,

jon

