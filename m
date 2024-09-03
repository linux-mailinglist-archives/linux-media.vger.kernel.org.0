Return-Path: <linux-media+bounces-17456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0067969905
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 11:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38DAEB28929
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD2A1CB503;
	Tue,  3 Sep 2024 09:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LisZIULd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBF1C9844
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355646; cv=none; b=UQLMBlKOEItAGLZ5/5y7svzOFKyOPcl0k/lmNmpAKWC99j7rtZLrPLnrp0S7ANLjfQzjm4SX5HtuHNVEh4vj04CPNdnB3r2xrDBXEb3Z5VfbgUsXNKI+A5USPyYrdcdeTtp1U+dr/6ltDzKt74of39t0YRWxXLdkJpb3qnFkRJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355646; c=relaxed/simple;
	bh=u0U9XWuImxldkq5jjPE14Shyrgx3irHd+FfUzCLREBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZAoNdxUkk4UuGK75e9mxFaZS2Mkin0Md/ceFtMsSeJsq+JvDmdw/tgrLyOB5osctgl93IHXtbpfxuKj49aV9DuSpGpydrbSeinjel72UOZCmNOLaygss7CpbBBqF33zUtI7+UH3VW+fBk10utTSt1DNTNVq+h2W0N9wuaAbfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LisZIULd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725355643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YofodTjyQ4m+oep4pei3ai7HYeSGC9DmqIEtUoHVYFc=;
	b=LisZIULdj6hJyGdfUxca7W0NK3QQxMLsWtn6cUAupWApYlmqck2AVAqp2rtfoNJUF+fbLg
	399g4L6QiSzDQXXPmfvjipvDPv+QNTa7b/If0F/kJJKX9je5jS9vne2x1a7zCtmPSIUB3c
	Ofq3I175QCpGb/faC9u/86c8XIO2QS8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-h-I9lflLPsa6LgJkMkGnCg-1; Tue, 03 Sep 2024 05:27:22 -0400
X-MC-Unique: h-I9lflLPsa6LgJkMkGnCg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a86884df270so350668566b.3
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 02:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355641; x=1725960441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YofodTjyQ4m+oep4pei3ai7HYeSGC9DmqIEtUoHVYFc=;
        b=lsqmh0hB8pTi2CdsXkDhTfPHN/kaJRg1zDMZvDQJV5Q4yzICdE22FP14rTvU6c7FWc
         qfDk8YUTeTeVKsiVHvgj8BjAo5uorl5Ruk2Kz3YOSVFQ0vGVIzovz300Ju8bjB9tnqsP
         xozCBpa48TlFVKNv6kGp1ucCwbJXIp3pDZTgW7mckKYSUru665DA/B9LzZyegZjhGoCD
         exZ85aQICBLrLaZN7RTX/MqH+3F43LyjI/djoypSuwIb3xuTc9ULnd5OOI2ZjdJsUciZ
         gKxLRu++XW2HUAuB/zvhmXYgBdhzqi/YVPPCBD/gK0lkMnBYXID+kZn9OhW4M0/APJm9
         WxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiV1fRKY/nfie0keSrUlskZAls0+qTOWPS9mSGvYQmBftgEeqQlXjOGEgmnRRa/OkL84b5s0Pu/h4imw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtOttQcU6A+JB5Y40yVlpMtpYmrU9xBbd1j1XvcEv602lY3oEg
	OD8kFiWpPWqEDJ5YiqrQDcgFl3LB57aTWJ+KWAhRQrq/+C+ZN41wFjuGnRLX5YrCGWauc0OgywP
	IA1ZZsLDpzWjURXS3qjN/wJUBcsrtK+7jUv9qGLFjarePldqXBVn95EScWEMj
X-Received: by 2002:a17:907:a02:b0:a7a:9f0f:ab26 with SMTP id a640c23a62f3a-a89d878234bmr699458566b.23.1725355641302;
        Tue, 03 Sep 2024 02:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEj7UOPRo6Z3q0roG0+pQ/MXcaPi0nFXO7D6Ps/9n9XFjyMzio0Z/YpayBGLFteJuWqur6qQ==
X-Received: by 2002:a17:907:a02:b0:a7a:9f0f:ab26 with SMTP id a640c23a62f3a-a89d878234bmr699456066b.23.1725355640786;
        Tue, 03 Sep 2024 02:27:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891a3e52sm650276966b.116.2024.09.03.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 02:27:20 -0700 (PDT)
Message-ID: <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
Date: Tue, 3 Sep 2024 11:27:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240902095229.59059-1-hdegoede@redhat.com>
 <20240902095229.59059-3-hdegoede@redhat.com>
 <ZtWpi7_S5d7NZx61@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZtWpi7_S5d7NZx61@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for the reviews.

On 9/2/24 2:03 PM, Andy Shevchenko wrote:
> On Mon, Sep 02, 2024 at 11:52:29AM +0200, Hans de Goede wrote:
>> The atomisp firmware contains a number of different pipeline binaries
>> inside its firmware file and the driver selects the right one depending
>> on the selected pipeline configuration.
>>
>> Sometimes (e.g. when the selected output resolution is too big) it fails
>> to find a binary. This happens especially when adding support for new
>> sensors.
>>
>> Improve the logging when this happens to make debugging easier:
>>
>> 1. Replace ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, ...) with standard
>>    dev_dbg() calls so that the logs can be enabled with dyndbg
>>
>> 2. Do not dump_stack() when this fails, doing so adds no useful extra
>>    info
>>
>> 3. With the dump_stack() call gone, remove the wrapper and rename
>>    __ia_css_binary_find() to ia_css_binary_find()
>>
>> 4. On error use dev_err() instead of dev_dbg() so that when things
>>    fail it is clear why they fail without needing to enable dyndbg
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note the log messages could also do with a bit of rewording and
>> reflowing them to put more arguments on a single line to use less
>> lines. I consider that out of scope for this patch which already
>> enough (see the 1-4 enough) something like this should be done
>> in a follow-up patch IMHO.
> 
> Yes, but...
> 
> ...
> 
>> -static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
>> -				struct ia_css_binary *binary) {
>> +int ia_css_binary_find(struct ia_css_binary_descr *descr,
>> +		       struct ia_css_binary *binary)
> 
> ...for example, in this case you touched both lines, so making them a single
> line just reduces the future churn.

Ack, fixed in my media-atomisp branch.

> 
> ...
> 
>> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>> -			    "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
>> -			    descr, descr->mode,
>> -			    binary);
>> +	dev_dbg(atomisp_dev,
>> +		"ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
> 
>> +		descr, descr->mode,
>> +		binary);
> 
> So does this.

Ack, fixed in my media-atomisp branch.

> 
> ...
> 
>>  	/* print a map of the binary file */
>> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"BINARY INFO:\n");
>> +	dev_dbg(atomisp_dev,	"BINARY INFO:\n");
> 
> TAB instead of space.

Ack, fixed in my media-atomisp branch.

> ...
> 
>> -			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>> -					    "ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
>> -					    __LINE__, candidate->enable.continuous,
>> -					    continuous, mode,
>> -					    IA_CSS_BINARY_MODE_COPY);
>> +			dev_dbg(atomisp_dev,
>> +				"ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
>> +				__LINE__, candidate->enable.continuous,
> 
>> +				continuous, mode,
>> +				IA_CSS_BINARY_MODE_COPY);
> 
> Now one line?

Ack, fixed in my media-atomisp branch.

> ...
> 
>> -			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>> -					    "ia_css_binary_find() [%d] continue: binary is not striped\n",
>> -					    __LINE__);
>> +			dev_dbg(atomisp_dev,
>> +				"ia_css_binary_find() [%d] continue: binary is not striped\n",
>> +				__LINE__);
> 
> Now the __LINE__ argument is redundant as one may run-time turn it on and off.
> So, trimming it while converting to dev_dbg() makes sense to me as a one
> logical change. Ditto for other __LINE__ cases.

Dropping __LINE__ is the bit which I want to postpone to a follow-up patch,
the messages rejecting certain binaries as not suitable are not very
unique and the __LINE__ print is necessary (atm) to help find which check
exactly is failing. Not ideal I know, something for the TODO list.

> Otherwise it's a good clean up!

Thanks.

Regards,

Hans


