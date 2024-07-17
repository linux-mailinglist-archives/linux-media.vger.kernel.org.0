Return-Path: <linux-media+bounces-15067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A570933830
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E834B1F22311
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 07:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AAD1CAB1;
	Wed, 17 Jul 2024 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xRM83pVb"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AC1BDD0
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721202382; cv=none; b=otKsa0zjusBkBad4I36bNx6tRfT8B/mG4+qkDlw38nqcScBQeebnZ0vKXfi7VEUP+2jB4WcWgP/QxzQPf8cs6hEf9L80Sw9fhJGSsil5+4TvIfe8kaTpCTj94FhGXAtZvwg1P9QFrXZ2a2giVnxOdt3jLUgYdKQVZSQp2eXG7yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721202382; c=relaxed/simple;
	bh=+swvF9q1oda0Xrk8V5wZsSMehXwnD2cdhmIsHSNVJA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1n1Jjg9Ru1fNAIeGH5b+VeKYRT/x5R+ihjP9MONap0G4OegC9U+6ZZ/FUF4m5tAwgtEQh7XClwlevichSvLQQCtD20ePrdzd4Je33MaaiWa5zonEv4ycRh09kzKaumJ4U7llhg+gp1e8FTzIxKEd7qvqzs5Cx/wouHxefnulm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xRM83pVb; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721202372;
	bh=+swvF9q1oda0Xrk8V5wZsSMehXwnD2cdhmIsHSNVJA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xRM83pVbCPvi2tVwx/x4yQW0zLqbwnXIPhdrFt1izeA4DM57MN3sRf3VMtHOTb+Pg
	 os04v8AF2sTXfluElmTXVezp1p3fT6BiFyIf1Zaij/k242cERrdDnfVgCeXtTLWy0d
	 R/+uDJWItsAipwAh9tEmdh98IEY/BJCm7wXcfffw+AwnnTFxl6JdrdJtCvURCfXqjB
	 odv5hWfWwvGfh9NjBnq/m4X0TOcRGCmt8eXimBMR9FXQtjd9s+nQux2urxJKKSgBxl
	 14OI96/rJlNOu+pI6TqwET5jP3kBEOXPN5D/XrWyWZnH1TRugyo0pD8OpmCimeAymL
	 f1dEVD+QsZdGA==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 99E7837806BF;
	Wed, 17 Jul 2024 07:46:12 +0000 (UTC)
Message-ID: <6e0d1086-e098-48c2-bb1b-65e7d1b5d614@collabora.com>
Date: Wed, 17 Jul 2024 09:46:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] Documentation: media: add missing V4L2_BUF_CAP_ flags
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
References: <47829e6f-4749-4259-abd3-6cb5b5713006@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <47829e6f-4749-4259-abd3-6cb5b5713006@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 16/07/2024 à 14:28, Hans Verkuil a écrit :
> The documentation for V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS and
> V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS was missing. Add this.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Thanks for the patch.
Regards,
Benjamin

>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> Changes since v1:
> - Report what the maximum is if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS is not set
> ---
>   Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index bbc22dd76032..1df3ce1fe93e 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -166,6 +166,13 @@ aborting or finishing any DMA in progress, an implicit
>           :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
>           :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
>           :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS``
> +      - 0x00000080
> +      - If set, then the ``max_num_buffers`` field in ``struct v4l2_create_buffers``
> +        is valid. If not set, then the maximum is ``VIDEO_MAX_FRAME`` buffers.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS``
> +      - 0x00000100
> +      - If set, then ``VIDIOC_REMOVE_BUFS`` is supported.
>
>   .. raw:: latex
>

