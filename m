Return-Path: <linux-media+bounces-54827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKaXMFQXq2nMZwEAu9opvQ
	(envelope-from <linux-media+bounces-54827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:05:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F22268B2
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 19:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37AFE3078389
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 18:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057333ACF0C;
	Fri,  6 Mar 2026 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="arX55jjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C325A642
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820298; cv=none; b=hQuHjkBRHzMfIKfQYBLazvGcThSH/QG5z9z8IguhTaSUZlnNiDxiYBko5Cc1EhxK2317aL5bAdSFNOjafR7jyJPw1y87kDNTo33sMHc/emar52VxmJmSnOvlZBVNk5WNEGYhok56raO4cNtekQByE64VA9yf8ft6j7o9odzqVIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820298; c=relaxed/simple;
	bh=YQOYef0T+IsmCM4l7gYcrDURSeU39E5b+TcSOrDCCuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rv065FVnh0SCYetagqCCnH6BWPKdAWv3d4J1AV/71QQkz75OmWmIs0WkntiKyXiVIp9VDNk55lG/2aAZWoFXJrXf9cna6Sgfk3HA2rrXVhn2BsVQaJp/hj21RdBPPMy7JY3FMgZo6P7g1yDqTQxiDVCUENKOjEOReEBitnNJsDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=arX55jjU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso89138465e9.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 10:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772820295; x=1773425095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/P8qpjTb/KNUh2ciZfsM7Ct12r9nUTtdTAu/7RgIPI=;
        b=arX55jjUC0hwVrWSWJfYF457ibz6DZGhUcvycCqVkna1SkDHqmFLVpejaXtr3tVIEN
         AzixtOpxP+5UDW0kKJNSKzA2uUCXgOyNllDvgPqoBaeC8Ni/m/YBpxQ5HmPKDspv3djm
         waOfUDl0cI2YTWhb/c+xSsllDXUje83e4ssHEVILUSyymMok58E0RI4iNw/eqY8gBN8X
         0tU0PSYPAdpTiZ1PiRg6zWW6M0dY1PsJv9X1waxP4fFhAjyb1zn2WuUkG9bRoS9IaQJE
         +uRaGLqfL3HVPMFwexAhdqDDCE8tl76NwBtUAk/51LuCcyaR+qsAEtDWemtN9j6ySeHM
         PYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820295; x=1773425095;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/P8qpjTb/KNUh2ciZfsM7Ct12r9nUTtdTAu/7RgIPI=;
        b=Gq0H4KAeF9WUJTJ3Z/SreZ5a8Nns0LoWMfsJdQgpOrgK+LgZIZKWGVB6tg5sfLzS3K
         GN0nzun8h1vj5e1S0ZoLjGB5YjSdeTYSg6fyK9XnFtfblBAs5kRJaidmpJIpAluDoJPz
         0Pb813tsLBn1XmmksgryHOwRV99goUvJJ/FU6dOuHGbgYbz+A2979vdlVvLuQetysmZh
         /No9P/uFU4jgEMoup5UHjHA2darAT+V2CXlNqQm22Ibdalt81WIQnRFe4AsqceWXZJ48
         79TCnKLwp6Hsf7CClIcBmXdOOTO0SrHNsdS5vH1uBTgFwcEElRlkkKsvVW81ljuavDYs
         awAg==
X-Gm-Message-State: AOJu0Yx3rW/lpa9s0DqrLdik72E46oX+G2FHFrBkRERPDrpeaDp4DePa
	7/xHQ2FNm4DQ1L5t//JDxf0bonTAZVMecv/LrCpSPgFlI2qhyh+O5T/z+GXukEJRxJ0=
X-Gm-Gg: ATEYQzwee0O5FXRp1G8WuLygsylfozfDFh3CEbsw+v9RRT4YPAWgj5eHXfnUcYstGa7
	26fY3gCb4A9rcVF7Y++nuMmUXaucT7zE6duvNBce+z8HT4+JuwvmR93DgrBkxFXHDDXCOEsz0Yq
	d73L3pLQ9S5TtRdsHG3m8+NN7EG6YJgsFU9Ps0XloBdfk8Fnt3E2k3nvYYtWxSTAym0OzZACO10
	sOuvrBoNiW4x18mHzxLrn83CigJS39eM3ivd4VnHSI13TB5OrdFWUNPMFH62iLQVRmdWBDSQzH4
	yOYd3iWWneR4JEqo9g7st6N2w8vM5P3apUWJGyyGbhU9SpP5qh88P13Wln5KeLQqB3w/ar3v92a
	9CU6KeT94/j6twCSdEyaqfssKCxB9dx0N7zqcEOsJIqOjgmY+SiMmJy6dRK30jpzYmsXAiofNI/
	5RiKlzhiQzYVkbeA/VgJQYWCoxCHBoYzm6VPA=
X-Received: by 2002:a05:600c:4f0b:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-4852697a114mr48328475e9.35.1772820295386;
        Fri, 06 Mar 2026 10:04:55 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237dd04bsm45125125e9.1.2026.03.06.10.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:04:54 -0800 (PST)
Message-ID: <3e3ce8a3-e8fe-4d6b-978a-8bb8a9d996f4@linaro.org>
Date: Fri, 6 Mar 2026 18:04:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: camss: vfe: Make PIX BPL alignment
 format-based on CAMSS_2290
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2B1F22268B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54827-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.948];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On 06/03/2026 16:00, Loic Poulain wrote:
> Split the VFE bytes-per-line (BPL) alignment logic into separate
> helpers for RDI and PIX paths. RDI is usually aligned on RDI write
> engine bus constraint such as 64-bit or 128-bit. But PIX engine
> is usually (at least on platform I looked at) based on pixel format.
> 
> On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
> alignment must be derived from the pixel format. This allows the
> pipeline to use camss_format_get_bpl_alignment().
> 
> For other platforms, retain the legacy PIX default (16 bytes), until
> PIX is properly tested/enabled.
> 
> A future improvement would be to remove platform-specific conditionals
> from the VFE code and move the alignment requirements into the
> per-platform VFE resource data.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
>   1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 9c7ad8aa4058..c174c7d706e2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_media_ops = {
>   	.link_validate = v4l2_subdev_link_validate,
>   };
>   
> -static int vfe_bpl_align(struct vfe_device *vfe)
> +static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>   {
>   	int ret = 8;
>   
> @@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	return ret;
>   }
>   
> +static int vfe_bpl_align_pix(struct vfe_device *vfe)
> +{
> +	int ret = 16;
> +
> +	switch (vfe->camss->res->version) {
> +	case CAMSS_2290:
> +		/* The alignment/bpl depends solely on the pixel format and is
> +		 * computed dynamically in camss_format_get_bpl_alignment().
> +		 */
> +		ret = 0;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +
>   /*
>    * msm_vfe_register_entities - Register subdev node for VFE module
>    * @vfe: VFE device
> @@ -2085,11 +2104,12 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>   		}
>   
>   		video_out->ops = &vfe->video_ops;
> -		video_out->bpl_alignment = vfe_bpl_align(vfe);
> -		video_out->line_based = 0;
>   		if (i == VFE_LINE_PIX) {
> -			video_out->bpl_alignment = 16;
> +			video_out->bpl_alignment = vfe_bpl_align_pix(vfe);
>   			video_out->line_based = 1;
> +		} else {
> +			video_out->bpl_alignment = vfe_bpl_align_rdi(vfe);
> +			video_out->line_based = 0;
>   		}
>   
>   		video_out->nformats = vfe->line[i].nformats;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

