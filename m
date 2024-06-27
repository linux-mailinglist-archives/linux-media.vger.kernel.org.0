Return-Path: <linux-media+bounces-14234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C769C91A2C3
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 11:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA7128474B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 09:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E00013AD3D;
	Thu, 27 Jun 2024 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="W0FT3aMa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F113A418
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719481190; cv=none; b=SKCSdgDDlCqh6M7guRJkJMwOu/ElZDEZUlqJlpBqoKa/ZHO2e489sBpx/JLVIuwELrhX2dArLFpseujKMS+L1CPMvR4QlxIba8RHrMlS4ZQL2gckCUkYtdfjOu98RkGBXpepQhvM4hAsjDNADY0N+3wLeaYNfT/77hhjSROrDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719481190; c=relaxed/simple;
	bh=lxTZXKZuxfotuscn6ZIT1ZAkADWhWpvVGjic8HteS5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYcRFjT+ylf04WsElSQ2hdKju2MUzuMyWSBzOP9SSBGCKSyb4v02UhrtdQP2W6jelat135PybDwcZwu+bO5DWgISFUoTh4Zf65o5W+cZaeaIGdgXS4443J6w1ffssCzBYMRFaAmE+AVXYbOnrXWNO0ri3+7NAnTZv0vOBSD7vz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=W0FT3aMa; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1719481174;
 bh=t84FHH9Qz2oscsWXd253HB7jbbaRf6bF8zfUqJ67FIU=;
 b=W0FT3aMa2lrw4vE48d5nRgT2oomXuhZveVPMuMb6bPxOLENPJQF1KyFmsMD6tgZD114M1zrg5
 5vs+v76Q8Vjbg1JOz2iFOQCVWjQk9nNR8d7uo/oavDQUTTYrt6VygU4pfAkGLiqgAoY+1Wx14EI
 gpwLaa0IlK/JSdRU7GtHwO96QrRSMmToMP2uPtRBfZJjm29mCK1T++0IWSnHc95Op7zpMpOKcpm
 xy9fn/U45R5QPrR2eaJHPtGEnXzUtaqCXjfA99iqrJR+e/BDWjze1HGJx8TzKMdrDMGk8JlqqLk
 I+oIP2rZv8blW3Z/zlDCEQVApbUqawtBERQ9w4N6UMnA==
Message-ID: <e72fb6fb-4dcd-4fb4-9d44-d8de3c5ffe30@kwiboo.se>
Date: Thu, 27 Jun 2024 11:39:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] media: rkvdec: Add image format concept
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Alex Bee
 <knaerzche@gmail.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Christopher Obbard
 <chris.obbard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240618194647.742037-1-jonas@kwiboo.se>
 <20240618194647.742037-9-jonas@kwiboo.se>
 <f7e4b0be-fe09-4db8-b081-21c46c0d836f@moroto.mountain>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <f7e4b0be-fe09-4db8-b081-21c46c0d836f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 667d33569aa1b906e1d3e383

Hi Dan,

On 2024-06-19 09:21, Dan Carpenter wrote:
> On Tue, Jun 18, 2024 at 07:46:32PM +0000, Jonas Karlman wrote:
>> +static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index,
>> +				   enum rkvdec_image_fmt image_fmt)
>>  {
>>  	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
>> +	unsigned int i, j;
>>  
>>  	if (WARN_ON(!desc))
>>  		return 0;
>>  
>> -	if (index >= desc->num_decoded_fmts)
>> -		return 0;
>> +	for (i = 0, j = 0; i < desc->num_decoded_fmts; i++) {
>> +		if (rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
>> +					   image_fmt) &&
>> +		    index == j++)
> 
> I really don't care for this j++ which is tucked inside a condition.
> 
>> +			return desc->decoded_fmts[i].fourcc;
>> +	}
> 
> 	int fmt_idx = -1;
> 	unsigned int i;
> 
> 	for (i = 0, i < desc->num_decoded_fmts; i++) {
> 		if (!rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
> 					    image_fmt))
> 			continue;
> 		fmt_idx++;
> 		if (index == fmt_idx)
> 			return desc->decoded_fmts[i].fourcc;
> 	}
> 
> 	return 0;
> 
>>  
>> -	return desc->decoded_fmts[index];
>> +	return 0;
>>  }
> 
> Don't resend if this is the only issue, but if you do resend could you
> get rid of the j++?

Thanks, I will send a v6 later today/tomorrow and will include your
proposed change.

Regards,
Jonas

> 
> regards,
> dan carpenter


