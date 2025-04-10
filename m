Return-Path: <linux-media+bounces-29970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698EAA84A5B
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F9964C00D0
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849AB1EB9E1;
	Thu, 10 Apr 2025 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="wh4ReCx3"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE74D1C1F13
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303600; cv=pass; b=F47wkzhYhldW1glEDWGLnDy7/WTbz3Cn7NX+qGQCn85GmQ78wpGRozj+GYZS7Sih//2iwk44nnNVwJpaA8cgCKQiKAL7410Xee8hqkh8Y9sMZw7w/lxLB5Fo2rqzRCFs27oCV1kvkeH6XjyxRQ8GuVZVrj3u3xWlye+9KFtFP1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303600; c=relaxed/simple;
	bh=a5XhI3c9VjZbnZyPwOs9v7p7ztwj/IC+04vRIa+5yMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBA+IQj68J33YYPPDjYIePj3ITbHE4cjwRxvkYm/7WeOGEhew5KyAKKgMd/7OGmPnrOFe2sxCUMuul4TDA8h+xwYqqk+XIUGyS7nNd7hm5lfrLxSFiV1Nq9ANgX0kWNd6sWgN6sGFyWmUevoImSwPZFVVlLGyugywJiWn0pDEYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=wh4ReCx3; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZYQgr0kkTz49Pxf;
	Thu, 10 Apr 2025 19:46:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1744303592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/BULjYU+05EezM//RhKpqcpl86VInwwkgdUf0CmOl8=;
	b=wh4ReCx3OIl7cIBMUnPDPpRblqi6/DMfpLBt3GZ3WtC4fdEQm6eFRTa7t4pCerP9FSWE73
	glXYjLHyrNax4QMfcnLhlIaTai8WVrn+Yzf15OwmZLoD4kOonDlkRV3D23YNz0h7sZ9L44
	Q2YTszjaqZ+3KfVlOxxoU3PftYp1fhOBmh/HVEpHi5+9i8PddfYqNOLOaHBnXJHoYY5a6i
	6W34rJkrpN9+1RGai/BIMBtMcKrt7aEdBYP4WH6AgBTclKtYBro1WTo+JqtJ0Bysia/GHa
	2mF4/Qawr6bEOVZYWS0MqLV6aZmJ+QZuR0dObVtiHcOu44eZjn0O8X9/OkubqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1744303592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/BULjYU+05EezM//RhKpqcpl86VInwwkgdUf0CmOl8=;
	b=htjICqWoA20JnU6KTauRs98eK01Mwwfct4dSkJHhEsXx4w3tbdX3bcgS4Eya9bbfJ6LA0d
	68DSmCTUhgoVaxTRAky3Zh0NM9ggJD3/shr3eEk7W6UefHWONUC9/lUsyQyfNIUd6Q2t5C
	L3CepNNnyu6Jj7UHXLQR6Ck5HfOp2GvXnK1nPa/YA8HJVIHqMpGQIVfhYo+VyS/BinMUvJ
	sMm8f+7tEZYoIL0Y9hRHDQQ268T75lxFLGqMkNEbI1NjSE1EQBobvdcdiN3jFSleKpeJhb
	npDHBQk9peLR7LaGKEOhePIpMYSWlo5r9NQvswIOvQpW1rgdDaa8TF3+SjVHhQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1744303592; a=rsa-sha256;
	cv=none;
	b=ZuQzcW6Pl5TUI0MKQopf1GJmDzN2b3XuGhswLxjMhhrwjsScnoIe6MHf3ADG6S1Vqmq/oB
	X0nZfK+rbkOcoskCcxMgpV4fUPS8NkLktAJ6b261cmydpXKSPiJygbgkCegFzubDlqeV+F
	QTSwFHHf4BldHI7+Ih5/u+tBtGPvX67m0D6c1Hr3cSIQI7HXqEtMc8chhYED4PYvy8LxHG
	TKSCZRUnZZkDtFdeGAefSXuze3IWRFJUccGol/2+sDvqxkUhjwoZaegGldz/ww3WMEH3EG
	JbbMJTnArgyoq4i2IbQPiav9TcRtYfU/HyPayAGnnbQ6c9N10Vf+T2MGLqaHvg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 93B3F634C93;
	Thu, 10 Apr 2025 19:46:31 +0300 (EEST)
Date: Thu, 10 Apr 2025 16:46:31 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] Use key_value to handle V4L2 field names
Message-ID: <Z_f15yFItvQCAld2@valkosipuli.retiisi.eu>
References: <20250410164251.15352-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410164251.15352-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Thu, Apr 10, 2025 at 07:42:51PM +0300, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Extend the key_value helper with a function to retrieve the key
> corresponding to a value, and use it to replace the manual
> implementation of V4L2 field name lookup.
> 
> The name comparison needs to be made case-insensitive to avoid breaking
> users, as yavta handles V4L2 field names in a case-insensitive way.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  yavta.c | 50 +++++++++++++++++++++++---------------------------
>  1 file changed, 23 insertions(+), 27 deletions(-)
> 
> diff --git a/yavta.c b/yavta.c
> index b463f5841100..49f10c371aa6 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -199,7 +199,7 @@ static int __key_value_get(const struct key_value *values,
>  	unsigned int i;
>  
>  	for (i = 0; i < count; ++i) {
> -		if (!strcmp(values[i].name, name))
> +		if (!strcasecmp(values[i].name, name))

Shouldn't this change be ing the previous patch?

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  			return values[i].value;
>  	}
>  
> @@ -235,12 +235,29 @@ static void __key_value_list(const struct key_value *values,
>  	printf("\n");
>  }
>  
> +static const char *__key_value_name(const struct key_value *values,
> +				    unsigned int count, unsigned int value,
> +				    const char *def_value)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < count; ++i) {
> +		if (values[i].value == value)
> +			return values[i].name;
> +	}
> +
> +	return def_value;
> +}
> +
>  #define key_value_get(values, name) \
>  	__key_value_get(values, ARRAY_SIZE(values), name)
>  
>  #define key_value_list(values, type) \
>  	__key_value_list(values, ARRAY_SIZE(values), type)
>  
> +#define key_value_name(values, value, def_value) \
> +	__key_value_name(values, ARRAY_SIZE(values), value, def_value)
> +
>  /* -----------------------------------------------------------------------------
>   * Format handling
>   */
> @@ -466,10 +483,7 @@ static const char *v4l2_format_name(unsigned int fourcc)
>  	return name;
>  }
>  
> -static const struct {
> -	const char *name;
> -	enum v4l2_field field;
> -} fields[] = {
> +static const struct key_value v4l2_fields[] = {
>  	{ "any", V4L2_FIELD_ANY },
>  	{ "none", V4L2_FIELD_NONE },
>  	{ "top", V4L2_FIELD_TOP },
> @@ -482,29 +496,11 @@ static const struct {
>  	{ "interlaced-bt", V4L2_FIELD_INTERLACED_BT },
>  };
>  
> -static enum v4l2_field v4l2_field_from_string(const char *name)
> -{
> -	unsigned int i;
> +#define v4l2_field_from_string(name) \
> +	key_value_get(v4l2_fields, name)
>  
> -	for (i = 0; i < ARRAY_SIZE(fields); ++i) {
> -		if (strcasecmp(fields[i].name, name) == 0)
> -			return fields[i].field;
> -	}
> -
> -	return -1;
> -}
> -
> -static const char *v4l2_field_name(enum v4l2_field field)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(fields); ++i) {
> -		if (fields[i].field == field)
> -			return fields[i].name;
> -	}
> -
> -	return "unknown";
> -}
> +#define v4l2_field_name(field) \
> +	key_value_name(v4l2_fields, field, "unknown")
>  
>  static const struct key_value v4l2_colorspaces[] = {
>  	{ "DEFAULT", V4L2_COLORSPACE_DEFAULT },
> 
> base-commit: 3e445c7855f8240d1f8473d127307dd967be2d25

-- 
Kind regards,

Sakari Ailus

