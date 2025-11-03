Return-Path: <linux-media+bounces-46217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A416BC2C991
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 16:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2AB044F6796
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 15:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67403218B8;
	Mon,  3 Nov 2025 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ht1E+NlL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085B8321420;
	Mon,  3 Nov 2025 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181284; cv=none; b=SC2N3S8v/UJj3rN+rV5qmwZecZteBr2zcOyKqnvVowK3bSXPZbRJGpSFpX+oOzFcLcHRUhMBcdAfupoflFaU47GZtAAbZwbfH+vBdXfPGVtwzBJf9UnhlVCYxG0pUNPpLJ5YkXrX8GvkVDJ4C4U/KKNBu1KOSRxH5EiwPRU7gQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181284; c=relaxed/simple;
	bh=s1TOHB/EaoLNcCokp3pYPltiaDX4VKk4mtf4uBUHgHw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UTMHQNlKduulaPdhst+PTOERvt9N5FNbGc37sVajzaZCwZpVks82b7iG+jigmZ0jEcjuaEHdBpgnGd+JFPmW9hYzTRBn2qOQb+1KKwnRgszkitP8dd4p4Ecv0QK7siPt8HrxcVjRP3iVPnTZDs/9JS1yyjZX5iPtDA7Cfv0IlHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ht1E+NlL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33487C4CEFD;
	Mon,  3 Nov 2025 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181283;
	bh=s1TOHB/EaoLNcCokp3pYPltiaDX4VKk4mtf4uBUHgHw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ht1E+NlLXq6lFFdNgfX9KABIzlgV4BwqhHLcSQXNplduPeUwT9NPTj0wYuNToQ9ON
	 +Qp59Sjt1Jvmvebv+tJMxFYEVLka/bU1mhMdVYAzi0HbnQ9SKMIukfAocLDJtdN1b0
	 3PFC3M6LdKTUEdVe6sYHQdx/TNzBcNQgSwnYTiYI4lcXfDnZYQqkUheuosGmOkwIbR
	 D4VHHi/7drlUC2FhHxVpqrohMyvFqhniTtxOWpDjP+ZOXB1tdc5Ot71RTZfabGa8o+
	 yCAKkgf77JElAZHkMwyW3HPlijBQ3TgfdoGV90NO+324qsFhyCkLVloT5CV6s+SwyI
	 95Wx34Tj247/w==
Message-ID: <62b0caf3-b5ca-48a9-9730-cf31e10eaa10@kernel.org>
Date: Mon, 3 Nov 2025 15:48:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RFC PATCH v1 2/2] MAINTAINERS: add entry for AVMatrix HWS driver
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
 lukas.bulwahn@redhat.com
References: <20251027195638.481129-1-hoff.benjamin.k@gmail.com>
 <20251027195638.481129-4-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20251027195638.481129-4-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2025 20:56, Ben Hoff wrote:

Missing commit log. Sorry, even for a trivial commit it is needed.

It's missing a Signed-off-by line as well.

Regards,

	Hans

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3da2c26a796b..313ac53f647d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4128,6 +4128,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
>  F:	drivers/iio/adc/hx711.c
>  
> +AVMATRIX HWS CAPTURE DRIVER
> +M:	Ben Hoff <hoff.benjamin.k@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/pci/hws/
> +
>  AX.25 NETWORK LAYER
>  L:	linux-hams@vger.kernel.org
>  S:	Orphan


