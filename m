Return-Path: <linux-media+bounces-35641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94C4AE417D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2024A3AE67E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23B62512EE;
	Mon, 23 Jun 2025 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="p5Y+BXY/"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC14246BCA
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683540; cv=none; b=B2qxHHxpVkBtnboz1wpFG6Ads1A5ZWX6Qks1aBlnaQzFzdgEg2npi9Mi74hOP88ycgCT5CGHNo6DdUL/skS0FDecqEP7mPPKcqDxk6f1l/SSXuTSDzSSK8oZiysHkTp0Okox3NytJ1/4g2DUK4wtIWoe8dQDH8kwVTlazaCptGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683540; c=relaxed/simple;
	bh=ueJErSbvPr8Hj4rMNXTw5nM77QlieNbf7rb93V+D15I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kN/iMA871GD7mFSShfremiA+lm61H31IfUKwDGW79b3iH+UB4pyS+FDa2Cd+1RXliXThQnZoIq++RW0B7niuZ59Ps5ByIg0CbSYrPmF2YdNAfNfTi833AMHr5Ob7vKPubyL8aD8v/VZkx48E+DRSupZGBYas93WEurJp29ET6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=p5Y+BXY/; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bQp721tT7z1PhK;
	Mon, 23 Jun 2025 12:58:54 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bQp716csDz5F;
	Mon, 23 Jun 2025 12:58:53 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=p5Y+BXY/;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750683534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vt6z4AFgYKtmXW8WYDviRto/F4SMYfX0KQuo6i2T0jY=;
	b=p5Y+BXY/zgp6M/AIb7vDloQKiyEnqRhdHaPDN9t5zS8a539lt2PG0nWjZkavAAn81/WLja
	zDfMw+UdvqUg5lZdQ0fv4D3GzfOKq1gfZUnQHKhOm1jYzE6NWLcq6/S9PiAOWCbAtv90aZ
	aUHSymP3BSHVAd20h2Y8GEzv+A7l+Xmv57zNAJX+8YeB2E+Uld+sbDLYvTNS+ke/Cd009O
	EIiLL0sb5R5pyJF8I6snno8MK8duFgyZz51K/nwKBH4Md57q0kXk/qSgqmyaau5+F5uPv+
	K8b+iCbADBnYxcK92BTlUmQ7x6U9E368NjX1EFV4xqc7CYYTneIoRAk8Rwnl3Q==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=68594f8e a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=UzY_-ZiojEFP8pc-x00A:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
X-CM-Envelope: MS4xfPvSQrEIq2dsD4/SrepsHsW/YyF7UkEvSqQoatT/MBAdS1zoOZcRIw2BnDI1Y18g/4u25Cv84r/gXeUgLyOSFBr3n8oQDImZ7fv1hQNxB52jNz3ce4KX 81fCRw3hwAO9g31UdG82mde7q9V4VPzNugW7JE78G+NmtCYsYKJ+71lrT7lAGGFDF0mMCLkZJOka6RGW1hh/546Fizf0XEyMIKhyqbZbeOxEqiMcMMrph8b7 0/0jtWQfb078slNTsGJ5xqlE6+AMHtQuZDbjRWnoeemwklaKcKrR05FQDVfGROGP
Message-ID: <c948f60f-8a73-4a64-9ea9-5a23a24ba8e4@jjverkuil.nl>
Date: Mon, 23 Jun 2025 14:58:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v4 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
 <20250623122314.2346635-3-sakari.ailus@linux.intel.com>
 <20250623122717.GG826@pendragon.ideasonboard.com>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250623122717.GG826@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 23/06/2025 14:27, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Jun 23, 2025 at 03:23:13PM +0300, Sakari Ailus wrote:
>> v4l2_ctrl_handler_free() used to return void but changing this to int,
>> returning the handler's error code, enables the drivers to simply return
>> the handler's error in this common error handling pattern:
>>
>> 	if (handler->error)
>> 		return v4l2_ctrl_handler_free(handler);
>>
>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 11 ++++++++---
>>  include/media/v4l2-ctrls.h                |  4 +++-
>>  2 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index d28596c720d8..98b960775e87 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -1631,14 +1631,17 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>>  EXPORT_SYMBOL(v4l2_ctrl_handler_init_class);
>>  
>>  /* Free all controls and control refs */
>> -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>> +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>>  {
>>  	struct v4l2_ctrl_ref *ref, *next_ref;
>>  	struct v4l2_ctrl *ctrl, *next_ctrl;
>>  	struct v4l2_subscribed_event *sev, *next_sev;
>>  
>> -	if (hdl == NULL || hdl->buckets == NULL)
>> -		return;
>> +	if (!hdl)
>> +		return 0;
>> +
>> +	if (!hdl->buckets)
>> +		return hdl->error;
> 
> !hdl->buckets means the handler has been freed, or is not initialized.
> I'd return 0 in that case.

Ah, no. If v4l2_ctrl_handler_init is called, and allocating hdl->buckets fails,
then hdl->error is set to -ENOMEM. You can just continue adding controls etc. and
do this at the end:

	if (foo->ctrl_handler.error)
		return v4l2_ctrl_handler_free(&foo->ctrl_handler);

You want to return -ENOMEM in that case, not 0.

Regards,

	Hans

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>  
>>  	v4l2_ctrl_handler_free_request(hdl);
>>  
>> @@ -1663,6 +1666,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>>  	hdl->cached = NULL;
>>  	mutex_unlock(hdl->lock);
>>  	mutex_destroy(&hdl->_lock);
>> +
>> +	return hdl->error;
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_handler_free);
>>  
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 3a87096e064f..c32c46286441 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -579,8 +579,10 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>>   * @hdl:	The control handler.
>>   *
>>   * Does nothing if @hdl == NULL.
>> + *
>> + * Return: @hdl's error field or 0 if @hdl is NULL.
>>   */
>> -void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
>> +int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl);
>>  
>>  /**
>>   * v4l2_ctrl_lock() - Helper function to lock the handler
> 


