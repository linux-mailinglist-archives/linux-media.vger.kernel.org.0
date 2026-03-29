Return-Path: <linux-media+bounces-57503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJNcDpsAyWkqtQUAu9opvQ
	(envelope-from <linux-media+bounces-57503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:36:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0040351975
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 12:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF530301C8BD
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 10:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747373126A0;
	Sun, 29 Mar 2026 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UI7QGgJo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A830E827
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774780563; cv=none; b=fkBb9oUf4MhkhDKq5yGDpZ6OWsrDqGYwc0FWso8CfLSUcSiwmcVEg+l4AdFbKJ6bmEyN2HOkKLjq6CBOiJOlmqNe5QSKnZXcyqEKOBZGKasUX1l7cdtTlmNuWlYn/H6fDXAzgsMaZxHzlBT79U5luvrq5JufhSmXWQuFMdkA6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774780563; c=relaxed/simple;
	bh=otXHHIxUcVkOKT4kg/b8IKo9nR1gEbZGzgVmxCC6PSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4xyl42BigfBWrxaZvphRkJGRQCSKP0lnkjUychYPFeDvLOZcFax/EA9qKv4TvEJJL+86eCs0LiRKpSqaYxrOqKqapDjIIo8M+uwFc6YVjbhV87Ywlz7MZaIf8VIalOzNW+tKplkjCbspi1aRoSR3C6lt5IHljlQcJfSmGxOGs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UI7QGgJo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so28095635e9.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 03:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774780561; x=1775385361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bchxObtGWko8YywUX16TMs4qLqqo6ynrliog/EkgTB8=;
        b=UI7QGgJo5UnuQyandvC9eBzLPlsuP3etqWz1h+8+YIzX3wPQTWLUzHg4jR8t4NOTdW
         6hI9Das94pWZv3GBC8Skkz8oJafsmTsPV0fg0szrs0YeT7j34/TDPqXHBApyLf5T+p51
         ycn7MJm9OFZCSJTwB2uPyDGj1j4JpLlBcCn4cuOVcAe/Dz10R0wHp2rCHfoOGm2ZFQn0
         Ls7TG/7KHHYjRsLP7YtTyjWVdlskeeMPNsPCHOJyc4sjRM0NWr712btGNSsJE087Y6E5
         L7hDJpyglmZj6rmFYPkZqGLtoXCM49y82cE4bN5R5s8zjOCo1D2LtCS32feQ7xd3HO7I
         RRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774780561; x=1775385361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bchxObtGWko8YywUX16TMs4qLqqo6ynrliog/EkgTB8=;
        b=nAde4zBr86EUG6Ajv8wrQ8Ng2cZEUFMheV3OOirVFs+UsKMZHV11t8ZlwqqqWi0oNt
         8la2IcXWstb+zMG+DB5ZA9Eek2DHrVeT4Q3YVuu37E7SW1casu/Wo8BkPRvT2FaHOWJ/
         nGf8zjE2Bz4Ayhee1i5ICBC3reP3BBPs96sTNfKUJKQ0SDP9qr0YvqWDzTY58RHd6+mB
         PbHISGt99Vg3VOrh/RvuJqYiRbdWPmUwSzqKgtFsIT3BlV2REQD1DYvk5O506ifIK6F8
         k7PjYXpCydvdQSTpGQcbshy5r3kNBf6dUO95acKkHiOQ55aI7J4p/xrDKfOjM2i7WR5R
         nUcQ==
X-Gm-Message-State: AOJu0Yzb2FMg9abAXZgKX0AXdJvBPKiK3nSYommminnMvK1WMy1vTRHj
	W/hrq59d/psqBC202acb733jb7LNXCv6H3mSr/q5pSizBBFcqJ4sWZCeKaWk5yvbols=
X-Gm-Gg: ATEYQzy5H+nOZ3a/UZ0iBAqtp4NOeaWpvV4cbzbj/8ViOCpMdDjAqOAl8LbUNeNkWp4
	O3Abx6TrBpNnvb9q33btpB5S3e1QxZ7qs4+Y87rLQuZw8m2ckqWS0gQh2sPiMGvnnaCpz8oAB5s
	bAep7QOsGzUcOpXRyAZbrhA890E6I3olQE0k4peEihHSNW2y0rS31LR8N/ZPQlorSaK7kpSsjdE
	Q0zGh68EbX3g2aGpfF+fO2asMOaGXy37Ko68pmD8UWBZYcu9eBG5D70Xlk+G8pFePzGJqlvryCh
	JcucGm+FtlooVU2IdunBlb2tOhzIWceM9rYth/r3SvWUikG1PooAUCyVYlu74E0H7OPQT5iDJRO
	5rqzWO+wnoIe5mG5DD/M2JV09xZ7sYRpjSFL8EjwWSvYEDBtCXsHW5V2uhgg94ctV4IRn1PXdI7
	UkIM3pkj+jNXlP/++4YwNU3vnV/67+kCI=
X-Received: by 2002:a05:600c:8b6d:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48727eb7fb7mr148621085e9.21.1774780560818;
        Sun, 29 Mar 2026 03:36:00 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245f8a3sm11835742f8f.24.2026.03.29.03.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 03:36:00 -0700 (PDT)
Message-ID: <1dd66c87-1b4d-4f86-a00f-229552ed3e74@linaro.org>
Date: Sun, 29 Mar 2026 11:36:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Use proper BPL alignment
 helper and non-power-of-two rounding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
 <20260313195152.275196-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313195152.275196-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-57503-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0040351975
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 19:51, Loic Poulain wrote:
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

