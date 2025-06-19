Return-Path: <linux-media+bounces-35258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA60AE024F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 363911BC32E5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CDA221D98;
	Thu, 19 Jun 2025 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Vecx427p"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760CD35963
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327499; cv=none; b=fFAQNKlVwyDkkbmFDycdou9k6c+CqT1l+Z2JoK/JGdBcanZsKV3hMlmCExI+OlnNOG5fafUE6pSCX+y+axMqktelF9N/06ulnk71IEPr/8eVcxbF2WTomG2B2822ZZjQVTYdwJ51+KH3c0oB2EJtNAgMQW2Uqlyew7OTlPtpz74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327499; c=relaxed/simple;
	bh=XVFuh2mN/phDO6ew7I1ulSxbavk3HT6uOYHEEgzctFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DthQP5ptoHVXCecQAQChKxgBpPLnL0nS9TACajjzBhsMzMTc9ZMFdNorQlButWm+AQS2RP8fPxOKzpnc1i3hOURNZFqlwiw6Gz5vmI7tEQj6knyneGHUz8XB6SrDw6aoonmXr3rrhgbeG7dgnkRtAms/AWyZ38q9VrSJa/G+P98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Vecx427p; arc=none smtp.client-ip=195.121.94.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: f4389818-4cf4-11f0-bc2d-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id f4389818-4cf4-11f0-bc2d-005056ab378f;
	Thu, 19 Jun 2025 12:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=5/Ru2zwy+cEg5GeHClKewbmIOOtF/jStYXb+Ok1u+bI=;
	b=Vecx427pUb/oKxH5gp7kusZd3TRWlFGujMaEr9YcnUqSoLIJr2xsww+QcqtIEzpP1fBAUnMhdL06H
	 un4Ayi4zTpwPR0jxdU1wFKwvK12WqIq8jHuT0KcasNBz0sDKgTGOmcHVSd552P6c6jR9N0JXIlHvSp
	 Unn0be+qXB94EUxCwkXrco80/MpO+RT9eQRdQOsKaqrqrd2x4ESAdfe5PbuLcLGkILzSRLByJxfF+L
	 nGYbDgI/oN0bq6b7BC/B8KYQtNYnNI/6uHgDlwuaILRGDIvwpGIFCVOUy6k6NHJhd2AIvD3H6F0QZQ
	 L61xg8YDdO/C9dx6nnhebpECNHtlC/A==
X-KPN-MID: 33|f083Tc2qDbyMEit1UeAJ60+NFkeJxCHWi3QuUyPsJ+VIkJLODaJuLxMYR25xxMh
 fGMJF9qqFdpZpXqbICugZ0f4vmOLsjgFJGFuqXMV06wo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|8V3QAPTxRwvC+536Sv/lc68rmrR3O6VUH1akCYDw5YXXSCCvT/CH1np+tROev45
 IUmieN+eHkz8/MO1yrDfkZA==
Received: from [192.168.1.10] (80-60-128-215.fixed.kpn.net [80.60.128.215])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id d5496848-4cf4-11f0-9c60-005056ab7447;
	Thu, 19 Jun 2025 12:04:48 +0200 (CEST)
Message-ID: <7cee1db5-363f-445d-91fc-f0ff36351cc6@xs4all.nl>
Date: Thu, 19 Jun 2025 12:04:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20250619095227.1939114-1-sakari.ailus@linux.intel.com>
 <20250619095227.1939114-3-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250619095227.1939114-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2025 11:52, Sakari Ailus wrote:
> v4l2_ctrl_handler_free() used to return void but changing this to int,
> returning the handler's error code, enables the drivers to simply return
> the handler's error in this common error handling pattern:
> 
> 	if (handler->error)
> 		return v4l2_ctrl_handler_free(handler);
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 6 ++++--
>  include/media/v4l2-ctrls.h                | 4 +++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 932aedc26049..eb008a2e829c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1631,14 +1631,14 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
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
>  	if (hdl == NULL || hdl->buckets == NULL)
> -		return;
> +		return hdl->error;

Hmm, that will crash if hdl == NULL!

I'm not really sure what this should return if hdl == NULL: 0 or some error code.

I'm inclined to just return 0 in that case. If hdl can be NULL, then presumably
it is intentional and not an error.

>  
>  	v4l2_ctrl_handler_free_request(hdl);
>  
> @@ -1663,6 +1663,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	hdl->cached = NULL;
>  	mutex_unlock(hdl->lock);
>  	mutex_destroy(&hdl->_lock);
> +
> +	return hdl->error;
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_handler_free);
>  
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 3a87096e064f..9e1693ecc283 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>   * @hdl:	The control handler.
>   *
>   * Does nothing if @hdl == NULL.

Also here it states that it does nothing. So returning 0 is probably best.
And document here that it does in fact return 0 if hdl == NULL.

Regards,

	Hans

> + *
> + * Returns the handler's error field.
>   */
> -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
> +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
>  
>  /**
>   * v4l2_ctrl_lock() - Helper function to lock the handler


