Return-Path: <linux-media+bounces-41383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CA9B3D185
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 11:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692AF16342C
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0747247291;
	Sun, 31 Aug 2025 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuwI0U/A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D5D2144CF;
	Sun, 31 Aug 2025 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756631202; cv=none; b=ikaSqUJznOt3+gosB0SKJaND2ta5/D8tutKkt91bK32rcZhc9ZPdFKssAVEwJIdkX58d6ZMTY988+N0HXRs8Xt0XKKigDiwlnNVAel03nWU4uz04nw2pODu0LtiaN9wtGOVluVY7ZtH2v4YHjUKotMjBtAHmCfdh5EtQHddXr1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756631202; c=relaxed/simple;
	bh=+Fo5ujLBSdZCaGgdEaVtvKmrXTVUf0+1HLZWlvWgo2E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XeopaipEmwtqavD2ZQ7NqVv2kHMXlVYPfkAhq48FpkA6stYncAf/ilKMYWqgemyKiayU2mBvNifjY+SgXe4koxbD0MLkAdjxrdqZYWOc0Z+1jSC/H2IpluxU8pu8nweM+vvGEoXiFS036UThxmauOZQLJayI1kfj+H2Cv+aeZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuwI0U/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009DAC4CEF5;
	Sun, 31 Aug 2025 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756631201;
	bh=+Fo5ujLBSdZCaGgdEaVtvKmrXTVUf0+1HLZWlvWgo2E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=VuwI0U/AYx/c34ge5M/RMQdIBSxWdxWt1ysbIfzprYZ6HlMuhGZ9DABZ0mphQTNxF
	 d6psrJRMZRMCGr+rTrETvNR0dYKkW6yZ/VfzneKMB+4acXnDE7HwmsGpwL753EKoVd
	 McKXuPhU1sn67tBiZJlt3rm8HHrDuSDpbwvGseAGagPcBV76hu4IsoDQFWpDeqsTjZ
	 6mYdZRWnUryeMOnaoJG1pN9IM1DVYiSs/xo9k+wNcnUibVucu5Fr1UaOnErbDHR7Ae
	 zfkQlRUDzkIqpcUqe7MMwHdw+mpvdyqAL1pv8pcC9gW8RVMkEgygd9SLrXmqEjI+Me
	 4AdzPlmart+8A==
Message-ID: <abd7a0e3-abe2-4125-8ddd-9dfad24a704b@kernel.org>
Date: Sun, 31 Aug 2025 11:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: v4l2-ctrls: Enable support for u64 value
To: Sunny Patel <nueralspacetech@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250831080606.35545-1-nueralspacetech@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250831080606.35545-1-nueralspacetech@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2025 10:06, Sunny Patel wrote:
> Added Support for unsigned 64 bit value
> 
> Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
> ---
>  include/media/v4l2-ctrls.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index c32c46286441..7b2bc459f378 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -250,6 +250,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
>   * @cur.val:	The control's current value, if the @type is represented via
>   *		a u32 integer (see &enum v4l2_ctrl_type).
>   * @val:	The control's new s32 value.
> + * @val64:	The control's new u64 value.
>   * @p_def:	The control's default value represented via a union which
>   *		provides a standard way of accessing control types
>   *		through a pointer (for compound controls only).
> @@ -313,6 +314,7 @@ struct v4l2_ctrl {
>  	void *p_array;
>  	u32 p_array_alloc_elems;
>  	s32 val;
> +	u64 val64;
>  	struct {
>  		s32 val;
>  	} cur;

????

This patch makes no sense whatsoever. Rejecting.

Regards,

	Hans

