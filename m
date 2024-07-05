Return-Path: <linux-media+bounces-14669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C932928168
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 07:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B86285A79
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 05:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D63213A88A;
	Fri,  5 Jul 2024 05:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j36W5uTH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FFA39AE7
	for <linux-media@vger.kernel.org>; Fri,  5 Jul 2024 05:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720157280; cv=none; b=iTpuulEPcOHaKt8258kMCtpYpAbuTeqxGmzGMFOlxjvqd0A9GY1JHOl96MAeMtw9/8g6Qr4RNm8dhCFltDbBCVquq8yPsRNj/yr0IBog9nii8w8pTGRXUujfAmNfPG3JSevAs954QAg55RrgvkOOhYHz9Rrn2PrPphmlc9dQQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720157280; c=relaxed/simple;
	bh=IuWAwgCeUBkfjP6km09ctIwl+81nu6Pfao0/ZhGBw1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhbwWguRwbV444feAKvxyuRjDYsJC6AfTxqOHxNHPgnBxOK0qAnOv/TKO7yYkgFvZ8SrYsltCF6HyTMZqZAwnqjqELR/F3qfX1vTfqkaa2Hci4HMx+YFqcQNp8P02AjeA6wP9OqGk1jjF71g8rl9bpW7ag1jRdJta8JDybXLo1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j36W5uTH; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c1a4192d55so840868a91.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2024 22:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720157277; x=1720762077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE/VrsMliLS4UQF71x1J0DRE8YW0wHhjEBi4FtG/ij4=;
        b=j36W5uTHGd2Nx7AWoLbkmPBFbCbyLWcqCg3JMs/CxsOaAeKgP+WiOmsgEp22kUX30g
         KPEzzpAa1pAvFP2DaOFkIUhAgP3+YWyv3c5SGFgiQXr6sfi8ZDDDFXOtYfQtqTfz43ce
         ujtK3ttUtKh86bZcQaPjc/f/wWJoXUboErngM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720157277; x=1720762077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cE/VrsMliLS4UQF71x1J0DRE8YW0wHhjEBi4FtG/ij4=;
        b=mmj/aJ3s1n60tNXXU3ZCP3B1hXAfugfVdKXduinssdBRcaFdQSvQGYraSJLCkYfB/m
         G1+h2cMKbre/ti5yaWNg/Ga+AyTYt9DhQZrMXGY8TJs0U4JlFcwzXA7bAh9pub5ShaLG
         VGVPSRjBxqJEZc0HMu7Z8oqt05EKhe/57DMaHX1Hu+ZWaeV2oMa3xjpiGDvAv5t07iYm
         Y6Wm4ZZlM+RV60sk60XALi/Kvr8NuIMWj4Uv4dSeTp7FQxM/dtq8IGT+UUFzasPu4eOT
         oh5NK9xBbEWJSDsjdU2W5KraUwdojHnny6OsRIcuYGxR8fhMnbqdZ1ZMumfbUpyjnwDj
         y6/g==
X-Forwarded-Encrypted: i=1; AJvYcCUeqBYD6kAgiec5mEuUjFwNBkFotPYzDdaxC8Us7HEOF7zdwCEqeH1tZCvab+M0FIDCc2lu9+KTeJzhU8KzrZgICSszp21HKsslfLc=
X-Gm-Message-State: AOJu0YzxZeiRmgWGDXVvbcIELtrwirHATRxL6teddzGa8WZVy0B6FaQk
	G0xt/fvfLxQikzyjQfReGNOgdwzMDR0fOzih+e8WM6OdGdIHxtmrklB+RaeSWg==
X-Google-Smtp-Source: AGHT+IGC+qm/pcTF4bcmuL7sgtnOCCmzDDrXkjKPmvUq3AAMMNrl5im0HLdaM4e8ra3lqSDxXXYNnQ==
X-Received: by 2002:a17:90b:81:b0:2c9:371c:ea9 with SMTP id 98e67ed59e1d1-2c99c56abb6mr2645253a91.21.1720157277588;
        Thu, 04 Jul 2024 22:27:57 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:cd34:f8a3:9ee6:ca3? ([2401:fa00:8f:203:cd34:f8a3:9ee6:ca3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a980663sm2469296a91.28.2024.07.04.22.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:27:57 -0700 (PDT)
Message-ID: <f3b86a0f-54ea-4a41-869e-643cbbad8192@chromium.org>
Date: Fri, 5 Jul 2024 14:27:53 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] staging: media: ipu3: Stop streaming in inverse
 order of starting
Content-Language: en-US
To: Bingbu Cao <bingbu.cao@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
 <20240620145820.3910239-4-mstaudt@chromium.org>
 <e6ff8ad5-933d-fbbb-0c4b-ae19c65e8439@linux.intel.com>
 <4e01aa78-497e-477e-a5c1-951cfb1df907@chromium.org>
 <594c28e3-67f6-bb80-4751-ae6dc9f34c7c@linux.intel.com>
From: Max Staudt <mstaudt@chromium.org>
In-Reply-To: <594c28e3-67f6-bb80-4751-ae6dc9f34c7c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/24 1:03 PM, Bingbu Cao wrote:
> I guess the real problem is the subdev s_stream cannot be called multiple
> times, please correct me if I am wrong as I have not touch IPU3 for long
> time. :)
> 
> You can ignore my previous comment - 's_stream' is fine here.

Yes, indeed the multiple calls were what the newer V4L2 versions are 
screaming about, and what made me write this patch...


> Just a nit, stop_stream and s_stream only happen after imgu_s_stream(), so I
> think they can be together and no need 'stop_streaming'. I think the mutex
> is mainly for imgu_s_stream, subdev stream on/off should work without it.
> It depends on you. :)
> 
> It'll be better that others who is still working on IPU3 devices can review.

Okay, let's wait for their feedback then before I send a v2.


> Besides,
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

Appreciated! Let's do a v2, when other Intel folks have had a chance to 
chime in.

Max


