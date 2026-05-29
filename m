Return-Path: <linux-media+bounces-63008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH4PKAxBGWpVtAgAu9opvQ
	(envelope-from <linux-media+bounces-63008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:32:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2859C5FE8E4
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 897D2303AF21
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7336D3A7F40;
	Fri, 29 May 2026 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9ssjUro"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4D3368A5
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039894; cv=none; b=UcoX/XmwuGPmzwyluqj7mqnclNOwIgJ2W2Mv1Ut+zeyk2XFo3UurLaFhySF0t6PWn5VsOj/UVlaxCN6ubMAHnCt6zhFXqDc6rdmqGbH/BkhTakESD/uNdO9O0HB99Zc9PmDnyq7wPd6rlFTBW+lbMmfLApDRfF8C4wODLN17tSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039894; c=relaxed/simple;
	bh=kiKQdNo0DDcBdFP9nkKVecmzFIK7XiBxcfgs65fn7G4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qqfANq7Ywemjq0RSv1jIA1uH6Viumjth+DP73R0t9Zg2FJu94jWpNUj+O6xxDC+c6pEac9/sv6kFPN2zKbfIJur9wzoASnQIVIq57vO3ia8So9GI802UUMKG/XPeRczJjdCS92Q6bN7PFMnb8H78RTRDjyZfV1FTnO89CjW619c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9ssjUro; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ee1a56328so1687144f8f.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 00:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780039890; x=1780644690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbf61mTeeb5+bPzWqAJNBcq8SFoXoM6zULZJ7jvwjCw=;
        b=a9ssjUroTOgUJ3Dll1LNsnkexTdmTVwSGInpSeLKyEcJHYaSwalRRa6KoX8377RMIc
         Lv/tsdo6rmF2SZXa/SoxxNZ9GbwdtiNgCItBGfY4clnrpLfyTkWD05BkdNixqKFvYBKE
         cxXZ/3zobPXtnAHO5pfZRM3g/EugdocicEHQBq/KZ/XkYD0drz4E/vefVcsnV6elL8Pr
         YpoXdN+EGzR8okik5K5NKZwJZI+zsLF7Zinb1CCnWntrC7GsInLp2n9hpZDGwLx8DI34
         4+2835R/J41yeS53kVbyRLrRNcIXmudtDQ90dn/7jJz6zZ8d3Ki9yvgGx5WmP8nS3X9H
         DWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780039890; x=1780644690;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbf61mTeeb5+bPzWqAJNBcq8SFoXoM6zULZJ7jvwjCw=;
        b=RMWwnzSS8EPQyj5orSsHT7hWuSJHmZHjHL+KXNAIi8vrEMLALQH0kVOox5Ax8xD2kb
         US95Z2M7jKSo2cgpFkJ8WrbWm9AjQItHiKGD19bX6jwKY229HkjApuC4XZsf4iuxAvWC
         Bi4LRhcGTE87NJ2vL+KZ/oOjpDBlh7/Et6iXa6byqL9jvvS0wFFAHeHnWHdCTHeOxUri
         SXnkI0swQHJHPrUYHEtUhR8MLKj+8xl7QIhNeylRV0lz3sBUgoNLPLSc6E5GJFz16mAX
         YTWa1OBHXwe8dULLtf8bVDLy6tE0HdTUngu4vn97D8YSFV4rINuncvSo2Yr8jfTZ+X+s
         oLUg==
X-Forwarded-Encrypted: i=1; AFNElJ/01UFhCgGGZN2QE26Ulr/acOaq1QGAmEaqdzJG9tRTNIPuGswEKyvuDQ7ANKcd7HrkHY6M1sM9LSzvEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEMUIXok+5IzcH9WOU/vDESGF+mmiPyyPnDgYPGe+SBCxtFlG
	SmRxJbyKBLZXn9Zh4B27Dxi7cElPvMUeqiRM72Vdd/JVJNXKIkHX6+QypqV36J1b6b4=
X-Gm-Gg: Acq92OFbvxdFnrV8IEs1x55CeHIaVMQcb0488eueEsIbiTaDt8jhToR7O+W4xWE9G3x
	voZKrJDO7L2C6RKcMcErUOimVTGwgjQg+jttWAOu3WqbIw2HraMj945cqVHdMGd1ZnRQofPUsWK
	sNBBaG+5EONJGtRLsSKNdn6marFTxia41FC+FHudY9pGq6/CzCKMS/Qwa/vXOm0y1yLGjKGwykM
	izjgdrWd4Y1AJcVl56NT8Tu6NvkUeP7QhNzwzWzxFlSUAi5OIQQTCRkHOL6orAwh82p1/hTBnEG
	tOeKjkfxv1dQF0NZugUvadXFbm370FTjfBcC6mCSO5LRUXFMmpw9cpB59M8mud8tIE3RNJULgsK
	lMBTaPAAUQEVKECQexlBSSDUj5Q4W4PAy2PTEKPZLLghOWJuW1p3T7nUMiYDvL9ck1Iw3W+XlbV
	TJbpnHiOKbsSQ+PKpw6jaSKMIqbY4EfBuVzHlaiuHhaA==
X-Received: by 2002:a05:6000:4b07:b0:45e:ec27:b4b1 with SMTP id ffacd0b85a97d-45ef140cc1bmr2805286f8f.12.1780039890330;
        Fri, 29 May 2026 00:31:30 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.96.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm1495768f8f.3.2026.05.29.00.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:31:29 -0700 (PDT)
Message-ID: <8ef7a26d-8e32-4684-b0ff-dc0c3ff4af73@linaro.org>
Date: Fri, 29 May 2026 09:31:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] media: cec: meson: ao-cec-g12a: name the CEC core regmap
 to avoid debugfs clash
To: Yi Ding <yi.s.ding@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529060005.94700-1-yi.s.ding@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260529060005.94700-1-yi.s.ding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-63008-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 2859C5FE8E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 08:00, Yi Ding wrote:
> The driver registers two regmaps on the same platform device: an MMIO
> regmap for the AO CEC registers, and an indirect regmap (using
> reg_read()/reg_write() callbacks) for the CEC controller core registers.
> Neither regmap_config sets a .name, so both default their debugfs
> directory to the device name and collide:
> 
>    debugfs: 'ff800280.cec' already exists in 'regmap'
> 
> Because of the clash the second regmap's debugfs directory fails to
> register, so its registers can no longer be inspected via debugfs.
> 
> Give the indirect CEC core regmap a distinct name. The two debugfs
> directories then become "<dev>.cec" and "<dev>.cec-core". This only
> affects debugfs naming; register access is unchanged.
> 
> Tested on an ODROID-N2 (Amlogic S922X): the warning is gone and both
> /sys/kernel/debug/regmap/ff800280.cec and ff800280.cec-core are present.
> 
> Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Yi Ding <yi.s.ding@gmail.com>
> ---
>   drivers/media/cec/platform/meson/ao-cec-g12a.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> index 41f5b8669..2c914f000 100644
> --- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
> +++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> @@ -405,6 +405,7 @@ static int meson_ao_cec_g12a_write(void *context, unsigned int addr,
>   }
>   
>   static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
> +	.name = "core",
>   	.reg_bits = 8,
>   	.val_bits = 8,
>   	.reg_read = meson_ao_cec_g12a_read,

Good catch


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

