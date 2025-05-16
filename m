Return-Path: <linux-media+bounces-32634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCFFAB99D7
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 12:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BDC6A0150E
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 10:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E121233D91;
	Fri, 16 May 2025 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvH+DbcZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135B233715
	for <linux-media@vger.kernel.org>; Fri, 16 May 2025 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390301; cv=none; b=kdtuWnMTjnrWMnKQd4sY50WRlfcC03SmeUUnIdv49ygpcdGpYmfdinhN5vmG/qkNNaqtvzAv/mHKg1mezxO4VN4ri2jBwuYRRU0dTYflVc93igG+pJm51hyMW46640qck6wUUh0rNVw2oJQdvQyCO/IFdBFu8YsI4XPhxxvueGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390301; c=relaxed/simple;
	bh=PHD79eIwWCw9V5lNQ7QYdkVLrAR+HF/Hje38keTFPFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FoE2gNaXFLfSw6AB8xVl+dyqepvx02UuJdkNERYLEh+MSUQqMMoIVQAOiXQgsQKi8nR2XFe3p5eMZQeVVqu8rJrn8Ix1gg7ITYvg+BTu9rTjz8UZ77k68rgBqkYZDL/bE9UHgN3EjFiFPlCoDMBFPdn3Qy59+/DEOpV1PscNYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvH+DbcZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso13880085e9.2
        for <linux-media@vger.kernel.org>; Fri, 16 May 2025 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747390298; x=1747995098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FK5emDR4y7307fTZlqtGJXVVpQCgklOy57Bb5kZPQdc=;
        b=SvH+DbcZuDdpa8iXC1jr2c3Ywxtm6z2bWqo3ZhCsITj2rL4pkwvBvrsXK+FpSckHSq
         Sq89UwmY6BihghzgV6Il7Ks+rSQBKruOHIjRefNhNLl8KKIrhUERQME62NWoa27KoWpf
         jWoUFJfiYRwNP/eBDjl2JtviHPapZB2jQqbHBW3i74/QEqovQgf50WD3y3OlukGLmLkH
         +LTsYyQBQPeOuOroa8sBS/Jdj6VDIatNioNIeG38322dsqD2R9mjvETyupOM+aOzK6W0
         8ioGQiMgAbEHgCr8gGSslMTisds8iUk279eu/amA3NXsN2hxXq8PXy6/uuI61bYVGzcz
         ig7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747390298; x=1747995098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FK5emDR4y7307fTZlqtGJXVVpQCgklOy57Bb5kZPQdc=;
        b=HpZyjEx53gU/oa/4z1CKEwLrqIMmZG/NOwbsEdXroeC65KsSzychE5yo3Ntxmr00Lh
         M8WoojivbgrprBAcFYZTliWMBVBby29MMcKLQdRGUGqLTbE6WHbSjxMULqZg6Dj8IRfI
         dCmxINi1kMD+a50uZyb105aIvYtEaeTGD5wlC49wyZTC/w0kebb42mxJzMicm+Fes7z2
         jk7YKMtlw/rd3ZPBkCokKr48QHpvThhOKYnBR1fH9prI1TJEGagOtcpWTHfHBFj5PSy2
         mCVJzXdsE0VmftqBunF5eHmfUb1ZIj0/zLL8Jyev6BPVi7v2z7XaaEfUMMSOblfE830b
         tEpQ==
X-Gm-Message-State: AOJu0YwCg03lfnOiveBqCfvYbmPCz0IUfxPdSiukxzfaP05HiJoeYV5w
	Z96MujWnSmc+FWEMFK4ipwMQPYKeehbMRA5QHGLem554xl6PzPXStTEwpQN+tSWZ613c7knl8P6
	fJOcsFQ7pxw==
X-Gm-Gg: ASbGncuiim0Kw0wk6FmjU5sb8iV4b7IqASVGKHY82sDlHsiVP3pMAMcUWDg9nRQUwsk
	CPnuVhE4LUQWEbvKgYKxWaNOfr3Naly23EaySddpyH7smlEQVv9YpyhG5Dfb79f76FSnrye0npp
	5XBiJ0C7JyR/YwF9OzddKKou1jXhbu6Hm1YpEUcT5uXSPeYqRvd/S2l7db1tsNc0r75EWIdxgPS
	NhjQ7qxcGvzQvcJZB/03H42PBhlBkkCgNR1uYp1apXayrZAmlPVBg5Aq/NYF2DAFp9CxZoZ8L9t
	CJKB4Zso6wNOg2jlShTXU/VXXJ6tDNwrcJmw9icwqP3SRMey+cArKIIKpUDD8bzsRI0UXqhiNwF
	LkAiGmeNTWf7y
X-Google-Smtp-Source: AGHT+IENqe0ySJELs1LHO+iGEWDGqtm1yvWiW49LkEbYEHxbTK/1es1hMOvGyGFEKYjY38sVDEx5OA==
X-Received: by 2002:a05:6000:3110:b0:3a0:b550:ded4 with SMTP id ffacd0b85a97d-3a35c821bbcmr2765151f8f.13.1747390297854;
        Fri, 16 May 2025 03:11:37 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3620dbc6asm1284004f8f.88.2025.05.16.03.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 03:11:37 -0700 (PDT)
Message-ID: <c394186d-83ce-41f4-b564-e074e0dabb90@linaro.org>
Date: Fri, 16 May 2025 11:11:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
 <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
 <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
 <b0c48989-4ce7-4338-b4bb-565ea8b6cd82@linaro.org>
 <b663539d-5ad6-399b-1e7b-0b8b9daca10d@quicinc.com>
 <bd704149-694f-4d89-90d9-a22307488743@linaro.org>
 <f7df808c-0724-3f4d-b910-6e44637c7aaf@quicinc.com>
 <767909a0-70ea-47d3-b6bf-b57e5d7e7c5c@linaro.org>
 <13887de6-4f84-9d0c-bd48-de6f0472d9ef@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <13887de6-4f84-9d0c-bd48-de6f0472d9ef@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2025 19:25, Vikash Garodia wrote:
> Check the pseudo code which i proposed earlier in this conversation [1]. It does
> not rely on ptr_val at all to check the sanity after memcpy.
> 
> [1]https://lore.kernel.org/all/0c50c24a-35fa-acfb-a807- 
> b4ed5394506b@quicinc.com/

Understood.

Another version of this patch to check after the memcpy() for 
verification purposes might be correct but, IMO there's no scope for a 
TOCTOU based modification here.

---
bod

