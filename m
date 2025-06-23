Return-Path: <linux-media+bounces-35640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B98AE4164
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41EE63A56F3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E7F24DD1D;
	Mon, 23 Jun 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="opI9f8NG"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B8C24DCFD
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683405; cv=none; b=BevjcN9SQdS7Gzv/Ykr7bUeWF1W7zzab5uUg0FGxTLTqrQEVnfoY43b4Xa+/N0ITtEPTmIIrLMsXiKkx8uozPkB4KwIBnznlg5QCZxtpnOxPQYkq2pEh+lfGZFmEYd6OfzYDvqZoXvRgPH2ReoGjaSHmf/LyxgFVCYoscxktI64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683405; c=relaxed/simple;
	bh=Bq50PI9RWr2nxyL8+VPSJyvxs/HZurbYu4n3w0bfImw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UjB0ZtmbEOyXUhYGBWhPjkvhSa8GMEV2NyUVaaBspLE1ful2bqR8nxSytE3RJCW/lVThkQBekQ6E8yWRdAtCKXdA9s54t3gBX5vr8FGfwNMKoN7SnAcB63NfveL6i1SZ4RBiUMIHUC27akMbvzU5QdtUH3uOeORuLBEHEriNAfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=opI9f8NG; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bQp4F4rglz1PcB;
	Mon, 23 Jun 2025 12:56:29 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bQp4D6w8Wz2xWG;
	Mon, 23 Jun 2025 12:56:28 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=opI9f8NG;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750683389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TE0E+qRPL4CnvBsdGeCVZpZaoICcvmi+5g60Asx41ms=;
	b=opI9f8NGWmuH7v+QXs+E14Hv4L5t+TUXpEsfn0D3LgsoclTmjoEP9PSCg6Vvbe4HOPMSyS
	BebJobOa5+ITalH3dhF940D8rCzQJwqUxSUpsxKv2SxkPezWykuJtatESV/L0VxEiLizH/
	XAmupopKLCYW4zsuO/IGLiKbuV7crNcqjIpZ8QM9rkhcTZ297j6CqVzVvLfAi+sHzjVnY4
	v3jajtmMhA1Ok6k11Nogx6inilAtv4uG7w1ily5XjT07BOCg8D1k1H95cGkHndPbeu2H9Y
	80Qt4fH+PdiL29ocEevyvxj2EKQ1TPe7OjAFVTt7uVAxFDpjMnRxhllyNeB2YA==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=68594efd a=IkcTkHD0fZMA:10 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=xOd6jRPJAAAA:8 a=-fIW-uut3qeXBzhQ7CAA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
Message-ID: <28440727-a466-4358-8f01-32bda1aa0b04@jjverkuil.nl>
Date: Mon, 23 Jun 2025 14:56:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v4 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
 <20250623122314.2346635-3-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250623122314.2346635-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 23/06/2025 14:23, Sakari Ailus wrote:
> v4l2_ctrl_handler_free() used to return void but changing this to int,
> returning the handler's error code, enables the drivers to simply return
> the handler's error in this common error handling pattern:
> 
> 	if (handler->error)
> 		return v4l2_ctrl_handler_free(handler);
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 11 ++++++++---
>  include/media/v4l2-ctrls.h                |  4 +++-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index d28596c720d8..98b960775e87 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1631,14 +1631,17 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>  EXPORT_SYMBOL(v4l2_ctrl_handler_init_class);
>  
>  /* Free all controls and control refs */
> -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
> +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  {
>  	struct v4l2_ctrl_ref *ref, *next_ref;
>  	struct v4l2_ctrl *ctrl, *next_ctrl;
>  	struct v4l2_subscribed_event *sev, *next_sev;
>  
> -	if (hdl == NULL || hdl->buckets == NULL)
> -		return;
> +	if (!hdl)
> +		return 0;
> +
> +	if (!hdl->buckets)
> +		return hdl->error;
>  
>  	v4l2_ctrl_handler_free_request(hdl);
>  
> @@ -1663,6 +1666,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	hdl->cached = NULL;
>  	mutex_unlock(hdl->lock);
>  	mutex_destroy(&hdl->_lock);
> +
> +	return hdl->error;
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_handler_free);
>  
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 3a87096e064f..c32c46286441 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>   * @hdl:	The control handler.
>   *
>   * Does nothing if @hdl == NULL.
> + *
> + * Return: @hdl's error field or 0 if @hdl is NULL.
>   */
> -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
> +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
>  
>  /**
>   * v4l2_ctrl_lock() - Helper function to lock the handler


