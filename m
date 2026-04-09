Return-Path: <linux-media+bounces-58307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E9iM5hV12kFMggAu9opvQ
	(envelope-from <linux-media+bounces-58307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:30:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648F3C70BA
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94B2030A3A11
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CB437A488;
	Thu,  9 Apr 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxGa1nXt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354837B036
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719509; cv=none; b=cKwN/8MtieeppGu2eXQIQ7ud1vmOc/veL5AraCNXEKNsInHPHWWMFS0qYpsre12/aMnmB21+jc4Q6tX+9Uu1/om+m+YOCECgqvoyn7kVDalA/nUqRNagnddGdYfQJ1pkSLq4DVWKZf4zFeauRkcUTs+VzSlUc4hsGWE9WpTWo+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719509; c=relaxed/simple;
	bh=Mre/gPXienu7b651lOjwL51fnx8ucen0SPyDP2M6ewI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JF6fxUDs/WSvlznsvjtMHLNuRzlL5sUU9L83f45wUG7iQBhvZ3hWj6Tyd/qgZcZNN6ruXg/MTzzbuxi0rMZPpF8YSORyPWe9gsCmHId9nvUIL8/1/91mt++w9feS25qFBhXjTEchiryEwVMRRxewoAm3+1aZg9XwC69/HNDBKMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxGa1nXt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfd96354aso278939f8f.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775719506; x=1776324306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg9WRrstgNbb6NQ4lJbZaY8JxdMrq6CTwj9LX/b3odQ=;
        b=FxGa1nXtEry7Cgly3cXPYhm/xQ0HLO8JO5OyEn/HgngCOkzufDfhcwHKL4BTVlLSxB
         Oadc/tlmGotvOGNCfEEOCAr8PgPsXPsVRCuYjv99ZA+63gnHS1k5qP8cS+7f9DYk7hCQ
         g3WxdV/cpOE34O3sm9h/UvREyguWLp+Rz5gbGrU3af89uAcxF2Opv6+AW+rL3NvBfYje
         YSFxte0J5nRqn2+yKE2RcuF2dosJh/YYrg480UawEBNI5JXBvy6rnPrsfFn2ITrfwJhF
         EPboY8TMQ6CTCY4FCdRHYo/JvL8x61CnH91ABjQjAyCHPtDsOMrGR4zUzMK2wDwKwKE2
         0+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719506; x=1776324306;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg9WRrstgNbb6NQ4lJbZaY8JxdMrq6CTwj9LX/b3odQ=;
        b=c5XqVrCpot3cErmfPSOWdmExt5a1LR/hUhaCtpZ4JSJxt3yF1BKMTw8rJOaCsNz6ER
         ig1nb3soY42GJIYxspYIDZhHzJRIJwoPjKk/IZv/RzcOBQRzHUNDjE9pyFKCnyOpIEsi
         r/+mZ3xANfd/ea29hm9txGgZpS96Ab57/O9TQdylzrRGyK1OiKnPgdcmU2OInhdc8XmI
         MmbCgTdlfvDLZlUbHBAJp9zi3OCQ5rtTu/GccrRQnfMPZyzc56+g+gNAai3SAq46lVZE
         gadtEgLoboTMAULnOWaKnC4RliGURQ+CmhGDVPqOO+5lixdhtZTiniDMr+nY8Y+ZcBhd
         5HZA==
X-Forwarded-Encrypted: i=1; AJvYcCUPD6d55skYV9gIXmrJmvHyqFyv9nNRGrW6v6RrElWeOGlD6sfGGH+loiY5vLgdwYXjwdVDQnRaMZmtiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnir6gxCJQNMvUH16V1PtHopumEOHNnt1WoXR/SdO9vVUXMsD
	U2be1LznOHKVdwu/rM/mhtCNQl9MqxnBP7tMMoNZrnG8SsZDcUU0wjfEp1VXqfqcp60=
X-Gm-Gg: AeBDieu7T2h3jgH3dWtvgNjzjz1SJQdr58dnMWrf32jlInIAwcwnlAGT5v/xrMrhp7F
	CZSaQRrEgJyl0Qbk7PAVSW6+eHVpL+Z/r5A39vonaTtjkS1RiqPX6JstISInyBzqsQQEVKYYOzk
	0zPARy/eNawLYg9Y3CqHWB2SMY/MtLnbkvy1strVh75SXFe71zEEllSohBaREiO4+PW4Sx69v6Q
	1zjd+lZiQgHoCNBQSjIVLD7DRf2eEhMEtcfOnqGaVXQdBpNaVcXJ6kjdf+EPTtb+4+XKT/asVzG
	9VwBxVYB7e658WVjEN3R/fgChsr/3kCxpQJPwkgEV1l93f3hRWIFYekghi12IdW244x8p+Bqm6G
	ynPKkWZV4y6XwnbzSjVHUkG20UNOBxqHfP6xj/ROUXrf19BJtfr4dXU0ZHLfQVO6y1aJExWN4Ex
	Xjo7w+81sYS+jf0jaib76NpgQ8RGM29htGBWg/cVXXo00Rdw0p7ZX7c23ub2vABWXG6+Uw0ZxtN
	S0rOrg=
X-Received: by 2002:adf:f0d1:0:b0:43d:2fc7:4816 with SMTP id ffacd0b85a97d-43d2fc74868mr21807629f8f.0.1775719506011;
        Thu, 09 Apr 2026 00:25:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:70d5:8219:5bd4:e213? ([2a01:e0a:106d:1080:70d5:8219:5bd4:e213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm66705933f8f.0.2026.04.09.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:25:05 -0700 (PDT)
Message-ID: <bb7abc44-ead0-452e-9429-6c6350ce69ec@linaro.org>
Date: Thu, 9 Apr 2026 09:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
 <753kndrdrq6j67c3l7uvwrsj2ino7vb2chmvfwzmppo42kcd4h@x5wcdhdpzje2>
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
In-Reply-To: <753kndrdrq6j67c3l7uvwrsj2ino7vb2chmvfwzmppo42kcd4h@x5wcdhdpzje2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58307-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6648F3C70BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 01:59, Dmitry Baryshkov wrote:
> On Wed, Apr 08, 2026 at 06:43:54PM +0200, Neil Armstrong wrote:
>> The P010 (YUV format with 16-bits per pixel with interleaved UV)
> 
> 10-bit, but with 16-bit alignment

Ack

> 
>> and QC10C (P010 compressed mode similar to QC08C) requires specific
>> buffer calculations to allocate the right buffer size for DPB frames
>> and frames consumed by userspace.
>>
>> Similar to 8bit, the 10bit DPB frames uses QC10C format.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 81 +++++++++++++++++++++++++-
>>   1 file changed, 80 insertions(+), 1 deletion(-)
> 
>> @@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>>   	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>>   }
>>   
>> +/*
>> + * QC10C:
>> + * Compressed Macro-tile format for TP10.
> 
> UBWC-compressed format

I literally took the head comment of the QC08C buffer size function and replaced 8 by 10...

> 
>> + */
> 


