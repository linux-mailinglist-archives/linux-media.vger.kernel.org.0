Return-Path: <linux-media+bounces-53382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALPlAmUcn2kzZAQAu9opvQ
	(envelope-from <linux-media+bounces-53382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:59:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D9819A24B
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1594130DFBE1
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0873EF0A4;
	Wed, 25 Feb 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gehkr11l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC53EF0A5
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034055; cv=none; b=saG61JeutAMelm7jLo1euNsCgjRx16QlAj1wxblfI6TFG1ENAsWwrZ0Q89j8Lk5UuSbHZFQFkhTdKkehUnM2UE6oWNciL+tMB0bXMfjQz2tGfgDlj5Le9X7YlzqWQAzzoaGBkqGCDKR+6xLUa+rP8UOa1tG2haZgFcT4WTuWXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034055; c=relaxed/simple;
	bh=SlTw6Q3mxs5YUyePAVEH/piwUiAAVGXfWxj49nPRSns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jY3XRrE2ArsjRGg3pOkU373cxjeyg+rkM0XTsm5NWWTVCICWAZ4z2XT8DweaeolNhH9BTYQhy8pXdwyePzmtqKczXFBWwqGm9GIlcL98ceE7XLYMxgOFy0alMy7zs6Z9FpGOrNXXFOTzDyMZr9s35ryfth5qE5Q/eKO/+by0WKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gehkr11l; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43991064db8so664051f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772034052; x=1772638852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfisFREuuziHlUQm98siWP5Hc9OmqGPk3nXbgEd4S04=;
        b=Gehkr11lIGrES8oH9bnsQenTu+2rnbtnv4fumYFTWsAl6RV551ZnjRo7fTk+g8kIl5
         ONjOkkkqj0dfgTfWZIsFczxz8tMVIdt4AnuraxAbL9PgHRPI2j/EU8nWI6wOgA+XWnhS
         3fR9dZCWgcGGFWcab+Q4U9T3Q/zTV6gdr5+XjsLcI7gB1sC1kOmiDD+d4erpQtHvrTPy
         WyZ7r3RLbzbHSs3jsFT65QsPKyfmaHs3YGXD5NrK5bbLszojoKkSvMbGfc1BJ8aMS6ME
         /RMOaZ/b0+SPJ2wFyN23vkH8SgtvlOkRMEXYOfuXBsBwYICSJ3UMvT4r9W5NbzhgfG7q
         TGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772034052; x=1772638852;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfisFREuuziHlUQm98siWP5Hc9OmqGPk3nXbgEd4S04=;
        b=gMTqtrp2M32o645jrY1/Vku7gFkxMisDrmfyr7kpGY0z63D8IqxSm/ydC4vreoLER0
         RFG6uuHt7tmJ231/CIJ0DTAV3/GyIvQwjU2NrKUrRVhYtPT1e1lDUQA0cgtrEzLyoDly
         Osg0oRESqYqEYH0/XGly8KdXaGykdlgkD8XwlbcYFv4VxPT6mBaidAg9jI+h3BAuDwdV
         ++6KnpaTY/QETEB/znwTTu5N92OL5p7mi098C+oe2mg/Bn3F7Jb789X2CQhZpXMJ5/IQ
         MOQbwrUoTIuN1j1j5ivguM1y0gYP6fIeZ/ltN6WPG4OqVPRNLxKCNhTbX3DxyP++Vwhy
         N6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeMaGBZTIasVhOYjBJG6zvqEk6MNQJmalaROQp0+nI4cZzjldtf2Lsit/SqutjkAaRyK30sLQemC6oSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUua4EqG5E0ltS25cD+UUjPjP2EN8HH8Z/fz/WqYf9A+MPlhfN
	zI72oeu3d56VkbuunLRDeQmv0Y9Mh8TRYqHG1f1DhVAYpgYWSiVaHHDWIjvMr5+6SSCbuUm0gd/
	jgxbFOns=
X-Gm-Gg: ATEYQzyqSpAtlPOQh9kzJz174RxbtWmFmbdCQNYPNsxo0F60EEjwuAQY2kIb+Tl9fjh
	s9TnTdZkIVAhdXbH8lFBhkEB7bvw1+pasUiwhAQJ+ustA/f3B1GQnmFMk7kZ8A2KUNRrOpDjWjE
	GToTKmUGSMir23DyMJ/7p3/44WzJSL3REdQo4BE4+sUfE75fnvb2eX6093WYsnFrSwvHtRc5VbK
	r/TLHY0rbwRMNyTqkFJd1UCdRuphaN1J/AEIHTkUFbC9bfItFMmmZKnK+7mb7CZjxfJLs/gxRL6
	W/KWEfcWwBG2TSoTNc/2G7JPbWl1AZTPnhwTsvpaJh0Soea1Fm4Mi64V9366rYsBOQPFDS4+r6y
	llWjD1W43pkmNOcQGP5854A59fnciNmToVZleiC4duugXmsobvVcjKvHNadgzFEF52hsByqjtmL
	4ZZVaorXL7qx0QeFCAlhPkwGNKs5DM3QRmbDNJR2cUlekcE+WnRiKjZQyKp8qXHwfM
X-Received: by 2002:a5d:4ecb:0:b0:439:8487:73ae with SMTP id ffacd0b85a97d-43984877507mr8814768f8f.27.1772034052325;
        Wed, 25 Feb 2026 07:40:52 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439899da8dbsm11588457f8f.18.2026.02.25.07.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 07:40:51 -0800 (PST)
Message-ID: <11249664-38c5-4cab-998d-f715a4e0124c@linaro.org>
Date: Wed, 25 Feb 2026 15:40:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, vladimir.zapolskiy@linaro.org
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53382-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: B9D9819A24B
X-Rspamd-Action: no action

On 25/02/2026 15:22, Loic Poulain wrote:
> +static char *print_fourcc(u32 fmt)
> +{
> +	static char code[5];
> +
> +	code[0] = (unsigned char)(fmt & 0xff);
> +	code[1] = (unsigned char)((fmt >> 8) & 0xff);
> +	code[2] = (unsigned char)((fmt >> 16) & 0xff);
> +	code[3] = (unsigned char)((fmt >> 24) & 0xff);
> +	code[4] = '\0';
> +
> +	return code;
> +}
> +
>   /* -----------------------------------------------------------------------------
>    * Video queue operations
>    */
> @@ -218,6 +231,12 @@ static int video_check_format(struct camss_video *video)
>   	if (ret < 0)
>   		return ret;
>   
> +	pr_debug("%s: format is (%ux%u %s/%up field:%u), trying (%ux%u %s/%up field:%u)",
> +		 video->vdev.name, sd_pix->width, sd_pix->height,
> +		 print_fourcc(sd_pix->pixelformat), sd_pix->num_planes, sd_pix->field,
> +		 pix->width, pix->height, print_fourcc(pix->pixelformat),

The return is static, which means there is one of them but, it gets 
returned twice.

The second call will overwrite the first..

Just use %p4cc - also please use dev_dbg(video->camss->dev, ...);

---
bod

