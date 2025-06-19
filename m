Return-Path: <linux-media+bounces-35259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE328AE026C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A691BC3B5E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0956221FCE;
	Thu, 19 Jun 2025 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="D21pCKrO"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD568202F8F
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327871; cv=none; b=cNLpzehFzfImMg/nEP2hiuCrZS9UwAUaDM+y2ZSU6kHhRTRRC4fqXGAJHG58yTn0fIS7GZ4Z87p6QkDjVtobQ5dNjaS5FjDbiB9ogIkB1EYbNMOfTnuxr5FLa2DKH5J/LJYjM8TpbKb5vXvJd6PU+P7KmThpzoIA/2BLqiNcc+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327871; c=relaxed/simple;
	bh=/dawppyRjxDw0FRVPwoYS/GEi2JmOW9HtWqOYnNlRiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8Y8FKBeiuPdVDuH7dSac54nPPNpBi/7jwgxsjIdmWq4VCQQlbNNAsjBUsiDUz0/mlhCVLbGvvlghFKNkaYXFK494HGLQDUYv9jARonHqJ/SGwD0MPyS8QyO4hWL9dJ1Tl2SavBxDkPi8W/UdLb2nzPK309FS0qXoQoBeFHeTh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=D21pCKrO; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bNGb94cVGz1Lxl;
	Thu, 19 Jun 2025 10:11:01 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bNGb903vWz2xS1;
	Thu, 19 Jun 2025 10:11:00 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=D21pCKrO;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750327861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=71dcp3tTnTLXjvKbhqIVsghOcjZRCAZBca7B2b8u8NU=;
	b=D21pCKrOa8yZsJxf4H4gnLpD5i6WNi5/Xhw9E3IR7RFQP6kVyandLH2dOYGOUB2/zgL3uL
	aAiu405NHtPLLXjBYw9F1P5mRU6BgO9q5HZBKj+5UjuaSPVK9wuPHLrbEkQy672i7snhoI
	WefhFEmE9UzEC5VgJ29yRZRmGD3V4lDp3uYdpc2YHQpCXuKORtGHe74OzexUg6O3MoHiB0
	TvVWE/bLLMgzW4PH/wwsF3rAkgbslimAuHiVcOLtbImDbaywG+pUVEhd3Rr1/LQldqVaf0
	DCHbGX9F5RUzGSIPlYpZYnIHanzqRn6Z3cBj5GlYpvd9OKKTNwL2pXdPnC+zaQ==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=6853e235 a=0e3EYSnDa2Jsw2qmQjskYA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=QyXUC8HyAAAA:8 a=JkrZEpaFSTxME9IceLMA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfOBNKyRGgoGL6ceXt8kKtOP8MXmEziqgiuoUP0DW3tfWXGDez0xVth8HfjWkfTZPvxEB0MZgOUK84S7q4sMA65IIW1dronk+F3ZhYdy5ZBcYD5g2Mzhk Saoq0N7NCXGdI+/NTU7Ir9APBG/bMX9MNkW870cRuZkPh/YcpBiDaEaWvuT9swRqCHz7CrJFiQ2RXiDHFdGY+0060oLmssuIjIBq7nHjLCeFt98Syhgmt7/G ReE2Ez5mFIF5X+WQXjoTiRJiujRrTLYSrV5FPnOl4CDyP6Suwi2ukWei5butS5ESRGgbNdWUCrs6BW1wdOitYOWdChU2+u9LwwaOMcJJcKO3VgHfui+F7QVa wOvA2I2RinZf7iGBRSV0Y3ryfK3qEw==
Message-ID: <ea26eb21-6d93-4f2d-b860-897d5617431a@jjverkuil.nl>
Date: Thu, 19 Jun 2025 12:10:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] media: Documentation: Document new
 v4l2_ctrl_handler_free() behaviour
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20250619095227.1939114-1-sakari.ailus@linux.intel.com>
 <20250619095227.1939114-4-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250619095227.1939114-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 19/06/2025 11:52, Sakari Ailus wrote:
> v4l2_ctrl_handler_free() no longer resets the handler's error code.
> Document it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/v4l2-controls.rst | 9 +++------
>  include/media/v4l2-ctrls.h                       | 3 ++-
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
> index b2e91804829b..fc04907589ab 100644
> --- a/Documentation/driver-api/media/v4l2-controls.rst
> +++ b/Documentation/driver-api/media/v4l2-controls.rst
> @@ -110,6 +110,7 @@ For sub-device drivers:
>  
>  	v4l2_ctrl_handler_free(&foo->ctrl_handler);
>  
> +:c:func:`v4l2_ctrl_handler_free` does not touch the handler's ``error`` field.
>  
>  2) Add controls:
>  
> @@ -191,12 +192,8 @@ These functions are typically called right after the
>  			V4L2_CID_TEST_PATTERN, ARRAY_SIZE(test_pattern) - 1, 0,
>  			0, test_pattern);
>  	...
> -	if (foo->ctrl_handler.error) {
> -		int err = foo->ctrl_handler.error;
> -
> -		v4l2_ctrl_handler_free(&foo->ctrl_handler);
> -		return err;
> -	}
> +	if (foo->ctrl_handler.error)
> +		return v4l2_ctrl_handler_free(&foo->ctrl_handler);
>  
>  The :c:func:`v4l2_ctrl_new_std` function returns the v4l2_ctrl pointer to
>  the new control, but if you do not need to access the pointer outside the
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 9e1693ecc283..ecd72528a4c5 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -578,7 +578,8 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
>   * the control list.
>   * @hdl:	The control handler.
>   *
> - * Does nothing if @hdl == NULL.
> + * Does nothing if @hdl == NULL. Does not reset the handler's error code in any
> + * case.

So this should change to something like:

 * If @hdl == NULL, then it just returns 0 without doing anything.

>   *
>   * Returns the handler's error field.
>   */

I don't think that there is a reason to state that the error code isn't reset.
Documenting that the error field is returned already indicates that it isn't
reset.

Actually, patch 1/3 should probably document this in v4l2-ctrls.h: that patch
will be backported, and it doesn't return the error code, so there is makes
sense to state that error field isn't reset. In patch 2/3 it can be removed
again and you just say that it returns the handler's error field.

This documentation patch shouldn't touch v4l2-ctrls.h at all.

Regards,

	Hans

Regards,

	Hans

