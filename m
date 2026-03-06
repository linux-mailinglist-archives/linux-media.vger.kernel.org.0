Return-Path: <linux-media+bounces-54828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEvNINwXq2kfaAEAu9opvQ
	(envelope-from <linux-media+bounces-54828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:07:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E026B22690B
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1360303A93D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 18:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7521411615;
	Fri,  6 Mar 2026 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD6zvk2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBF23EA8B
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820436; cv=none; b=MVnQxOpIGDjkeaIA2hUJWdTm8x1nAVwf1zF+CMzGkZe2UC630+879B3SBSJEZJJkGNWZvi3Rh8uHLHj/UEgblHtJujc3ZWXZGXfOwSbKK1lFdMUmGmYMUaAqQrayH0vXfcIWO6rVQey3gFdz+MbFQvAe7eOwOnZgHY+/qUgruJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820436; c=relaxed/simple;
	bh=za/u5OWT6vGjVtXAlbEKi0r0Fy2n+xpZHa4RApaK/60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/kv1WkTVLTXlq4snFevPhiANgFccIfP6SIvRV3rVshvP3hUIrOOvtrF/Ulv/m6t3RRd3uA5sM0I6VEQQtjceEek5mxJ9kDTvWycX4UtxWKqmdyT83ylepWcEh/eR+WThkRIA5Y9F0VpNieetAfMMTdYYfHmhLairpdMpR7kiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD6zvk2Y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso89156865e9.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772820433; x=1773425233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=paY3nSpAVM1sX639S9JaAR1ZcjfM4x2sHww4ugttz7E=;
        b=dD6zvk2Yaf5hcvWcHzJMeC6eZ5uwTtkbN9rB3BxgEHTatsG/39WmC7J6kSHOqzhtXD
         fzdMZeZqnDjZkob28R0uRd0wdtjH28LfxWCGs2CsZBQV3uAAppPwwZnGFEPrnS5ZVPiF
         0vLqwGIdTj+uVrEO4I3IlUiaJzvk+U8Gyr2XlKrqFjVNw74E9arjV4Xm7BKNvWCnq7WA
         o5RzjZIOqnW3xyEOzKq+GhFgnL9fEKdh416YyoxBPOdH6t0lCWQJNZioJx/KpPCd/A9I
         uAYn4WF0e1Zw5LHAJmkZzFR3giQYE75un7IVCDwZIdM5J3JOhNKhAnywjlD9s1hf9M5n
         1AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820433; x=1773425233;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paY3nSpAVM1sX639S9JaAR1ZcjfM4x2sHww4ugttz7E=;
        b=S9GpJ1p5noTGlNoijbS5OmAKz2//qm5ppqMTHFXiRKBP4ze8nNOsKNxpfx2MRK5IFW
         tRRe5DwGzW0CJqP5guwg0oRdpI0Gst16w4IACm9/tgOiAWnjxgCjh/OayzUgZZ59ryDl
         GM4ddLSajiQODkQZuOXllQTwe0SmJ97Az1cjYFWUjZtHu/l7qXqaS3U3HjJp+zlRmzx9
         nHGK6x1mhe4JPpf5HKj4g9+0bUbl4tA5dOt9CIxMo++/GOjLS2XgkNEywX4kri9wwePs
         iCoUReAetRi92gX1HrYNV6NSt93yVfOK3APbfEbOIvd8H6QyTXfXy45I+TSmcKciQpwW
         hWuw==
X-Gm-Message-State: AOJu0Yy7eHn1oHc+29552h2Tj8kTsBM9zuo9Q0liEaEhAFq9oOCbj6xW
	ZD9zMbWA7FgKZVjI8dLPHEXMC85sM87soVxg2TfOH0VNdwzwAqUwqHuT4lcnvpu4FbM=
X-Gm-Gg: ATEYQzzR4jdqSQWMrDU+Jshw+JMdItYYD4olty45yY8QmTM+xRQeuFi3UPcXn55XLkL
	OBrUUcMrnqo9zXI0hgLyTEvluwhIom83mOSrURwFuzupYUwjWvkEJ9RodXgvvEihrOuSGhM7f4p
	EyaMK/BXxxETTar5DMdgRGfWb9q7S9Z9SigO2FbPRlyUs0PP135ABLAg26YbWn26XUbBKT4BCCC
	97LKmcl8pm07EMTiHMoIK30tQc9ELaLaeDN7RZaJuBGDxtuipHlXQ8p65bu4Vll79VUrdBfjJ6B
	lhNCJZH466LVA8HTsZcQvTjj2uR1b2nXm9yhhCieBhYZ0M1xPbzAwzU1vH49KXVOAjWJpIlklbs
	eFR99MDmfPodIMWIh3tapCoMQrAaQY5v7gNN9e+KU6wQjEDzeZu8RyQRL9yefJPUOZM648XXGUq
	E02GzQWeyhaWCReGkJlfO5XO7E9qWSyv5p1pQ=
X-Received: by 2002:a05:600c:5253:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-4852692c99bmr49110955e9.14.1772820433357;
        Fri, 06 Mar 2026 10:07:13 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237dcf87sm23627765e9.1.2026.03.06.10.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:07:12 -0800 (PST)
Message-ID: <6f341604-fc77-4329-ba0a-2d67ef01e60a@linaro.org>
Date: Fri, 6 Mar 2026 18:07:10 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: camss: Use proper BPL alignment helper and
 non-power-of-two rounding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-3-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306160006.1513177-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E026B22690B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54828-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.946];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On 06/03/2026 16:00, Loic Poulain wrote:
> Bytes-per-line (BPL) alignment in CAMSS currently uses ALIGN(), which
> only works correctly for power-of-two values. Some RAW Bayer packing
> formats (e.g. RAW10/12/14) require non-power-of-two alignment such as
> 3, 5, or 7-byte multiples, so ALIGN() produces incorrect results.
> 
> Introduce the use of roundup() with the per-format alignment returned by
> camss_format_get_bpl_alignment() when no hardware alignment is enforced
> (video->bpl_alignment).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index f52d8e84f970..0852eb6f1315 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -47,6 +47,9 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
>   	unsigned int i;
>   	u32 bytesperline;
>   
> +	if (!alignment)
> +		alignment = camss_format_get_bpl_alignment(f);
> +
>   	memset(pix, 0, sizeof(*pix));
>   	v4l2_fill_pix_format_mplane(pix, mbus);
>   	pix->pixelformat = f->pixelformat;
> @@ -54,7 +57,7 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
>   	for (i = 0; i < pix->num_planes; i++) {
>   		bytesperline = pix->width / f->hsub[i].numerator *
>   			f->hsub[i].denominator * f->bpp[i] / 8;
> -		bytesperline = ALIGN(bytesperline, alignment);
> +		bytesperline = roundup(bytesperline, alignment);
>   		pix->plane_fmt[i].bytesperline = bytesperline;
>   		pix->plane_fmt[i].sizeimage = pix->height /
>   				f->vsub[i].numerator * f->vsub[i].denominator *
> @@ -459,6 +462,7 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>   
>   static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   {
> +	unsigned int alignment = video->bpl_alignment;
>   	struct v4l2_pix_format_mplane *pix_mp;
>   	const struct camss_format_info *fi;
>   	struct v4l2_plane_pix_format *p;
> @@ -491,6 +495,9 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   	width = pix_mp->width;
>   	height = pix_mp->height;
>   
> +	if (!alignment)
> +		alignment = camss_format_get_bpl_alignment(fi);
> +
>   	memset(pix_mp, 0, sizeof(*pix_mp));
>   
>   	pix_mp->pixelformat = fi->pixelformat;
> @@ -500,7 +507,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   	for (i = 0; i < pix_mp->num_planes; i++) {
>   		bpl = pix_mp->width / fi->hsub[i].numerator *
>   			fi->hsub[i].denominator * fi->bpp[i] / 8;
> -		bpl = ALIGN(bpl, video->bpl_alignment);
> +		bpl = roundup(bpl, alignment);
>   		pix_mp->plane_fmt[i].bytesperline = bpl;
>   		pix_mp->plane_fmt[i].sizeimage = pix_mp->height /
>   			fi->vsub[i].numerator * fi->vsub[i].denominator * bpl;
> @@ -525,7 +532,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
>   			lines = p->sizeimage / p->bytesperline;
>   
>   			if (p->bytesperline < bytesperline[i])
> -				p->bytesperline = ALIGN(bytesperline[i], 8);
> +				p->bytesperline = roundup(bytesperline[i], alignment);
>   
>   			if (p->sizeimage < p->bytesperline * lines)
>   				p->sizeimage = p->bytesperline * lines;

This seems fine.

I still don't think the error handling in the dependent function is 
right/warranted so I'll hold off on RB until you updated that.

---
bod

