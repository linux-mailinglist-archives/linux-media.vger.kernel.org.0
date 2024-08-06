Return-Path: <linux-media+bounces-15880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B9949C3D
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 01:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 221D6B29EAE
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 23:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DDE175D23;
	Tue,  6 Aug 2024 23:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U3+yQ0sk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC7175D52
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 23:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722986110; cv=none; b=nYWiO+J3U8iYx2kQITXhQgfOnOlrqxDlZKOhEez4k7qmu4zYTHjpJl1alOKG/XVgQCJHnvKTo8cvXkkBRsqBNFFS3PvoQ4ixXmMTKnwOdrYNgWvzXCgZz8drXfKUt8iK1peCpEHJt6FA5VQJiYM+thHr894giOvroPxS5VQcheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722986110; c=relaxed/simple;
	bh=c4ElZR5cSHHVZs5b/QivuGERpZLhZ+fGwrKF1y0Cdh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcLtbgcRUrAp9cnJOfu8IUU6dOGEGf4hnQezs7G/M8P1cDbmW4SXFQ8fO0G033v3e9+4uehOQ6tdeoI+kXNxZojoWfxChnQA1PzVt0q7G5lqdxGHLJHrCimM/dTA26mOGUGxz283nw7AbOirl8JaJIt/tfxb8e7k75Ah5GAEJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U3+yQ0sk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42809d6e719so8746875e9.3
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 16:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722986107; x=1723590907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ptZEeRi9iXLknZOgkEzs0wHNgINZe8m5SEa6Tl0nwe8=;
        b=U3+yQ0skgiF+Ld5fLmwoKzwxv0FS8zRNfNwuvu746uY4XVy44mPsiQYCtHFB0B/tBf
         Md+zljfhI7JnkNZ6mnIWQiCeTObMPr+7Iez7Wc4oBoozmrc38uAzRsNe+2yfyAJ1WfAK
         bttSrXwgKpeF2UUDDZ47b3m3bBApU7ps68NxPzyTgwpZRdx6PZGy43EckyVBCqG8pCjZ
         BaP4qYaF5EQ/gPDkw6ZQOfy5DY0/UA8/xLIqXtkqKowzYq6EiZmcM9DfFY/2U3UJgGe6
         ZwiztvFFzIK2ltfe4utFMCuUhjsWUCFrLKksJftOHTpK0o0Yplcvu1UzAr00CJrj0h96
         ZkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722986107; x=1723590907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptZEeRi9iXLknZOgkEzs0wHNgINZe8m5SEa6Tl0nwe8=;
        b=hnBpKmpy95wohCl0kUwIWRa1LO4DjfN3q2RS9QAg4n1JvU6fymgu6R61LuNnJbAvST
         l60v2zphJTH3Ro1QG9IrxnNsi6epWtIX2NTIctcXtAdk1M9EgNZxHaxhl89RlzyURjpm
         SeacbI84R5TckRlqm4APZ4BuEm1/A6LOHqHgxVZH7YaEGZ1j6Z7I3BfmTqw4Gm7f4Grd
         iF0YbJqTW+0ekSTPMnb2fgNxlWNMvEzY1D8w09VcgkgtkGHGQXUEb9w/TCs+MpefkGZ2
         ugSrX6B9q0/Zyix+LtfFBVp9BN3ouJvDfLN2n4R8Q0JpQlKd0HkR64F2GrDE9UsgUWWB
         irvA==
X-Forwarded-Encrypted: i=1; AJvYcCWPacEno719pc0YJHkIt+PCZY4OWbpvvD1sg9Jn/bxnAWQCkRJssNGG2R0WPItPUl32hy8p1SyOoWSK3Fmf9Zp/GXuVAP9tJRnG35A=
X-Gm-Message-State: AOJu0YyDgxFoGL3KnWIKksGZeOdvN3Ffc5nSKYVNEU/kcJ4iVj4tHdpA
	wY8yk0QBC6vxwxMUnnxmFXZzsa0vMvK7DoV+6SXmZMeN4rdeAAzU1zjoS1b2QB0=
X-Google-Smtp-Source: AGHT+IFpQWyVkqNpbX3oWQ1qVWAoDRpCEHFfRnLPrm7K1OyyrZxbSjbCJFiwT2d3oFuSdNyHV6MyhA==
X-Received: by 2002:a05:600c:3d14:b0:428:6f4:57ff with SMTP id 5b1f17b1804b1-428e6b93fc0mr91125085e9.35.1722986106806;
        Tue, 06 Aug 2024 16:15:06 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429057a4f8dsm2151635e9.20.2024.08.06.16.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:15:06 -0700 (PDT)
Message-ID: <bb8398a7-3661-437e-8173-09117aedab16@linaro.org>
Date: Wed, 7 Aug 2024 00:15:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: fix error path on configuration of
 power domains
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Todor Tomov <todor.too@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240806221204.1560258-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806221204.1560258-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:12, Vladimir Zapolskiy wrote:
> There is a chance to meet runtime issues during configuration of CAMSS
> power domains, because on the error path dev_pm_domain_detach() is
> unexpectedly called with NULL or error pointer.
> 
> Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Have you tested this with and without named power domains in your dts ? 
The logic here is complex to support both the legacy non-named case and 
the updated named required case.

Could you also provide a backtrace of a failing camss_configure_pd() for 
the commit log.

---
bod

