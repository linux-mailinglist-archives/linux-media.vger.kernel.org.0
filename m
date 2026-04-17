Return-Path: <linux-media+bounces-58968-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLgALarp4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58968-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:04:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50C4185DD
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9102F303EFC8
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339E7397685;
	Fri, 17 Apr 2026 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQ0VmohW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11A396B8B
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412999; cv=none; b=BHbzkyDyYLaZei3uHMKKOQT0GniJ3Riki4ayaOPYa93g2m7iuyAanOZM/cJ4DdfB3nJ91ZFzu22rLa+3hpkyGBjBhCPUo9F5oNj6an3Y70QESpDHhjuU8WZdva84s6UZo1VMMNqlH90xfqPAuQiKf+RDA1RAUGfbzV7YigUqKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412999; c=relaxed/simple;
	bh=BTJjLjWfUvgTCIjBLnvcZjPN/3AECIIcbi7bQaSLpt4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kvgCW07nY+Efu4yP8b1GdNlJe8bFrUQCAnnaTWHsZcH7SsGyjKzMBnqoKOWzRh0iOCHWmskVy14zdRqaZRoeu+EbLik+MoZNEwKajfaIt/xA4oRUlhZvoKNe00PUvmdnmqWkqNB6nHdPZXC3alAicyPNTCNi+UqJhhfngDLFgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQ0VmohW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d73422431so250554f8f.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776412994; x=1777017794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8pmYuJdAVErRS/Y++PivAAgpE/JcE8cwNEE0jwueEE=;
        b=bQ0VmohWs+y7qHBluHVntOVBHOszxuHl18DlkItVfAcNOGnMuS1eBojDPbOot8I0LD
         /5t+RzQ+I0sFcdqQ2FShBQ1phziyrg/QakaUAF/l25qDjdv6OBbPzIQdGjTjblM1mtfn
         tgeCZERlJ6piTgI+CSR5jtX2DZyjDnB7TOUtnbNsC0BcxJdKAakqXE5SuSiSo1AnWofO
         I/Hd/XnarsDGhRy+GSXZ8+/QeeX1Hf/mpenLen53Q0fCYPzCx9xoh6qjK78JTATMxrYI
         7W7zVi3A2SaGJZdi8hdwyuktVECPmEFwwnb1Q7iQkRc4x+obNNID0ZC2REHwFIRMlL82
         IGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412994; x=1777017794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8pmYuJdAVErRS/Y++PivAAgpE/JcE8cwNEE0jwueEE=;
        b=oQYFc+p+oWLgKsRKk5PrJ+j5zm4AOXan+z6zvv87Jn85X7QEqqw5gyy3Nqm4v/6qFT
         8Zx4ogPNG8C9MI5qh8aEK5UQMcYLcyZb6SEZL2zNlBYL0w0aG52bksuvDS7Rnfl8ppuW
         nsjwRK4OnKagJNCJKtxgDRYZWzF37HPrSg/KvwaflN+vPFpPhyL4U+btG2uULvqDRT0p
         +HTU3vDoSIGOK0lAbPFoLU9eBs4McCv58DqexD6rc47+c4IDiwpxXbN3k3KXV197QSxf
         +tiYGWvq+SIHss53QiIdY61j+0RECxh0IB7i0KYOu4nADH7HtLkQqCMbncpNKNfgYz0+
         Rkfw==
X-Gm-Message-State: AOJu0YwgYHQnF61f2GZyZMT5w7KdWuzL3lKO1ODOvdiqDc2mWYXfWWJq
	zacFe4G3oe68l7ztNUXRksSy9fJCYRx0zp1HPh/ymIVmUZm/mfgjv3er3J5gHHLHwoI=
X-Gm-Gg: AeBDieuAqjka3HfUq/W1cljAnkufh7xxTno3rbHI6zD7oJVBw2xDMT2TlAHYVhW08Mb
	m0bt0L2ekawk+UlgzQ4cz7n0TIFl+tYLvCt9mRjQqq+8EUNu3ZBP/Y6aZ//OOIwFlMAujtIexUc
	qsvp1on/xJRq5yagdIv378ZdOpw8sBee92MZyqnKVLqwf64vhyW8WfsOsLDanl8U5X2m1l9wA4L
	4fsRTa+XOs11hB32YuRAG0Z4yPTIrzhzFPP6qxckO1w5mMsy2Oz5mnkIP+8jx/AwcUklHdee1yo
	Foip5xPBwsS/FOHw4Mg9KN3sEaP7JQnus3/TZjvnYJrtimWQ8st6x2IFqsQVL2ZzuGz0rE/zERh
	IqkymX4Bxx6Qouny26phgDWlivPyoaUdYLhcrm4IXhSjq810a6bD+aXdM9PIX0+mjdNEiEz/bgb
	8wOzHfRjzXyJOUtC1mVAc+WCCDpzOluuMq0PI3IWKHPnjvYmeqPnm06JSJPHCyI/iV6iLPAQTYU
	B1boFxoVxlfLJk=
X-Received: by 2002:a5d:5f43:0:b0:43d:73d4:b27 with SMTP id ffacd0b85a97d-43fe3e1575dmr2527363f8f.32.1776412993845;
        Fri, 17 Apr 2026 01:03:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b416:50ee:20e:8775? ([2a01:e0a:106d:1080:b416:50ee:20e:8775])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d112sm2568221f8f.29.2026.04.17.01.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:03:13 -0700 (PDT)
Message-ID: <dbc98f63-b851-4470-be38-aeb83c719759@linaro.org>
Date: Fri, 17 Apr 2026 10:03:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 2/7] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-2-428c1ec2e3f3@linaro.org>
 <d27e1500-ac4a-01ac-084e-bb53aa1f63b0@oss.qualcomm.com>
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
In-Reply-To: <d27e1500-ac4a-01ac-084e-bb53aa1f63b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58968-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 4B50C4185DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 09:22, Dikshita Agarwal wrote:
> 
> 
> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>> the right 10bit pixel format and stride when in compressed mode.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 +++++++++++++++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>   3 files changed, 72 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 30bfd90d423b..8e547e390fa3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>   
>>   	if (inst->domain == DECODER) {
>>   		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> -			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>> +		switch (pixelformat) {
>> +		case V4L2_PIX_FMT_NV12:
>> +			hfi_colorformat = HFI_COLOR_FMT_NV12;
>> +			break;
>> +		case V4L2_PIX_FMT_QC08C:
>> +			hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>> +			break;
>> +		case V4L2_PIX_FMT_P010:
>> +			hfi_colorformat = HFI_COLOR_FMT_P010;
>> +			break;
>> +		case V4L2_PIX_FMT_QC10C:
>> +			hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>> +			break;
>> +		};
>>   	} else {
>>   		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>   		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>   	stride_uv = stride_y;
>>   	scanline_uv = scanline_y / 2;
>>   
>> -	if (pixelformat != V4L2_PIX_FMT_NV12)
>> +	if (pixelformat != V4L2_PIX_FMT_NV12 &&
>> +	    pixelformat != V4L2_PIX_FMT_P010)
>>   		return 0;
>>   
>>   	payload[0] = stride_y << 16 | scanline_y;
>> @@ -532,6 +545,57 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>   						  sizeof(u64));
>>   }
>>   
>> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>> +	u32 stride_y, scanline_y, stride_uv, scanline_uv;
>> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
>> +	u32 pixelformat, width, height;
>> +	u32 payload[4];
>> +
>> +	pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> +	width = inst->fmt_dst->fmt.pix_mp.width;
>> +	height = inst->fmt_dst->fmt.pix_mp.height;
> 
> This HFI is only applicable to AV1, you might see some corruption due to
> this. Please check.

This is what I saw looking at donwstream, but I had not implemented this initially
but I got some corruption with some different width/height, which was solved adding
this command.
I guess this in-firmware calculations are not exactly the same the DRM driver expects.

Honestly I think it's preferable to sync the stride/scanlines calculations between the
driver and the firmware.
For example I used the same "ALIGN(width, 192)" for the v2 iris patchset which was wrong
because ALIGN only works on Power Of Two number but it still worked because this HFI
HFI_PROP_UBWC_STRIDE_SCANLINE command was called with the wrong aligned width.

Neil

> 
> Thanks,
> Dikshita


