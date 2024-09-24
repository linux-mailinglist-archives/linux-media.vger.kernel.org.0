Return-Path: <linux-media+bounces-18512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A619847E5
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC57B286291
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC121AB6C0;
	Tue, 24 Sep 2024 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bZPvUkci"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D21AAE3B
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727188919; cv=none; b=AFpRuZBqxJkJ4oL/dT4a5NZlLErzLJyXv6bxSExNlm1+Iy6lrSzRRJBzyNirmz9RmMPVYadqQWBjHKuNvpiHYjNEeHv1KwKXhf3UjAoKe5ifXjFjVmIyx+Gptmd7HNvOjwReNjvTVDPDF0wy5zDtWUbbGPoqdMrRepmIyy2J2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727188919; c=relaxed/simple;
	bh=775K+b4JojCj/aYOX4tvR3/Nx57JHTr4617eywulfZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIqwYEuesIQ3QfMW1PHH6ulZs1y92gJ7HoBbgwjZezQkN+RvyEAVOiXnS6fgYUUxmNPBcsjonrcGUk467UBSBp6CHG9DWeAe60mgUmd8p09XDhbmGlyZSPa5xjyt7zaiFHwEd2PcYKt7lNvCtAdEpde7Ranqlmn1kWuYl0fiqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bZPvUkci; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso269504366b.1
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727188915; x=1727793715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KplL6YVGYXmQtdrD19h01dJIHQ5EglFyVNmxCWcimXo=;
        b=bZPvUkciaA5RKtn6y1i4Z407UmJm3vzI9+LxJbHy5Z/SM6kVl50LETZMvD5yINPo+T
         9O9q1SclIZ3dt42YeFeVWctmvJ52Wo6nXSk9St6LUCTwf0uKga/GiRLZt+UH8z66VkX9
         3tJT5mwFCHXvMnJfNMWou0r0KTxNGFuKE8MDS/Cs821NXNbs7OTs9eTcdNWK3tCRfv5n
         KBRtZ29OjhxRWKX4+Cn57z1zHeuFQ014CNssSXjy2+D4dTDvxVzavfQVk6E18gQYfny5
         Z0MASe20seIoW6ZlRAbeiosPo0W5gtZKirvdOiamJqNtBrk7OGek6/GXQ0eqxokb390U
         ZL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188915; x=1727793715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KplL6YVGYXmQtdrD19h01dJIHQ5EglFyVNmxCWcimXo=;
        b=N2e+PctTxQ2xxdHKomrTkfDBh7DgcmDvF4bWNFxJZqt63W3i/mXwu1N2yt4yKlmVAh
         p2UIpvE5W4A7pZf0jvWlycLWCB/uAcA0D1LJ6WAxH3Ei7HUlQmMwnYEOiLt1Rf9wnEyU
         NbV3TO2aU+26K9BYT0f5pojpytC5/wqHA4FMQIXdNkaGNhzxZCXJZ20t9tYqk36Zx/IL
         Yy0mW02nEhie/zYNJ3xx6IvnZTl0SDJJLRyKO715u+gooCeXmfRLPd0XDSYzNRH+pJKy
         sDwYxbtukLFL+lZFAsz7p/9nf4nTocWMr/LD5zthF/AD/5co7+DRg7QwLY8lp86piBf6
         IRQQ==
X-Gm-Message-State: AOJu0YwY+mCW6NhzWpbUpvahO3CSnbHR4w4N8kbvtE4iCUwDsvWpLyQ+
	mjiq12VcW+lJ/bYY0Ijkho8s64ZUN/EkWb5rKfwsf7ix15x2f0/MGYUNRMaewIE=
X-Google-Smtp-Source: AGHT+IHVIgjdWmVivneDu/IWQdwJLHd3+dXBGBtzlAEoXQdjjxX+Bmh4LZe7IZ+GpYb6vzMVaaPjmA==
X-Received: by 2002:a17:906:db05:b0:a8d:3ee9:12fd with SMTP id a640c23a62f3a-a92b11fa6e8mr378550366b.0.1727188914825;
        Tue, 24 Sep 2024 07:41:54 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f541b8sm91425966b.84.2024.09.24.07.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 07:41:54 -0700 (PDT)
Message-ID: <78fbe221-57c3-495b-a9d8-2e40a1612e40@linaro.org>
Date: Tue, 24 Sep 2024 15:41:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/29] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-12-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-12-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Implement s_fmt, g_fmt and try_fmt IOCTL ops in
> the driver with necessary hooks.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

> +
> +	src_q = v4l2_m2m_get_src_vq(m2m_ctx);
> +	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
> +			f_inst = inst->fmt_src;
> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> +			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
> +		}
> +	} else if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
> +			f_inst = inst->fmt_dst;
> +			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> +		}
> +		if (vb2_is_streaming(src_q)) {
> +			f_inst = inst->fmt_src;
> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +

<snip>

> +int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
> +{
> +	struct v4l2_format *fmt, *output_fmt;
> +	struct vb2_queue *q;
> +	u32 codec_align;
> +
> +	int ret = 0;
> +
> +	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> +	if (!q)
> +		return -EINVAL;
> +
> +	iris_vdec_try_fmt(inst, f);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {

<snip>

> +		
> +	} else if (V4L2_TYPE_IS_CAPTURE(f->type)) {

<snip>
> +	} else {
> +		return -EINVAL;
> +	}

I'd switch this instead of if/elsing.

A blanket comment for this series.



