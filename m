Return-Path: <linux-media+bounces-33402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B57BAC4122
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18CAA1897182
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DD8202C31;
	Mon, 26 May 2025 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZE0Dl0Ar"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791C19BBA;
	Mon, 26 May 2025 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268968; cv=none; b=tXVC8cd6X0OlOO0qk0iWiTu1R/qL+8G1+ZkdVxHQz9g99TKRxO0ij7rhRZrllyqlsGYZO7tY6F/C+J020Q8qAEqFLdqpjm8ip+sycqXYfYAb0UXmga1g1JfdKkd3u/aIV2dej08q11I9qj6RCtEJuCIZvuHuCfCl+z2W1JSl+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268968; c=relaxed/simple;
	bh=yS4lvg5BCVIIEJbHc6Mprc6sI5O+lunrZT59p/2eUL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5hvU+ZC/MZtbzgBm7hjzhWnBbmIdRB723zoEHrde2W0VAfSoTE6F2QAoT1yb8EC7EVr/tAbcFw09jfKEdrehrzWzyxu0pkPCiRepOBn85aw+CqV1Nq7Qnwt9oqmiok7ZBrVHb6TsmBa4FC4D6lYb5KSukPBkZJYCPJ7/M3TyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZE0Dl0Ar; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60462000956so2112198a12.0;
        Mon, 26 May 2025 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748268965; x=1748873765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/crlRBagCnIOIZRNJ+r+raWiHrCUa2+Lr7j4P1GLWY=;
        b=ZE0Dl0Arw6UBPxSKo/fwyOqHK3PhX7AqW66TWDIm8Z3AkkiTzjjd/3PO9KZhC3tt6k
         rc8TRGg2S1qAFMwsEpQAGKTxnCp5q5AgP6081mTLmdk6+yrVB7UzB+roCnb6AQ+MJ+9y
         /Jtlz9PbZy7VyKOZYgO6NTURDWwV3ikb45nCwoPrlrWPIIfqVETOFx9nNxFGvEVo0Zka
         gZa/+qX3feqm9j5VNjxi+q4JH4asgrUYCADDLKVgn3/7btYGbZ98hI70gT7UT5VOEg52
         1DbXfQZGoBKRLz8pJtmjG1OLt3Lv26smYQh7q7xlJnHrTQDi/cfa5Jt2j4Dbgh4tNvsy
         bRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268965; x=1748873765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/crlRBagCnIOIZRNJ+r+raWiHrCUa2+Lr7j4P1GLWY=;
        b=AdrEdqRMsH/hNlovAI24JYV+yNhrX6NsMV3CrMZq5myj1r8GTpMG+cXr7F2/Ep2AHj
         +4zIACj0+oyvh+WcaD2sXEPFck9+asUEjDdCkTNo9+9pjgefO3i0n3DFFrs5oB+NKbb7
         RPsw0g/KN7aLuaOPrKT3E0b9t1OWP0nw8OuPPDrmazR/x4FQjXm1+gyQTcmF6TMCu0ZR
         iwdlqYNKVx37Kxsd+WSRUVU+EqcT7el74Asi/T6/OA4BWxkU75SBPrjkAg8rNz7rpkhD
         9lE4HCUoNGFeD7jdopBrZGIL3mYEI97H5JwSRWJ+XzRY6U4/4xpqNT6P9tRUP9qf2GWy
         PYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXW7Uu/bqAoLqcdkUkrtfToeswMyezVZG8j5I4LbzIAq1Vxus2Yum4lPD9hfRsUAcX9kSWLqHMUwbA3s9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH8o6RrD0fsLrG3H2dfJ61DSUvUjAVhnYek1lhsllF0v7+77x6
	kkuSdSSvPnpgVlyRLWV9blvsk9ZkiwUzGsz0NqNg1UfYnjAy9aM2rRe/+WuwCNMR9RE=
X-Gm-Gg: ASbGncsEp6/70Cjt9aXxcYwm6XQXfbFBihsk5Rl0vjbMoTHkjJhKHEoktbzPwpcBk1l
	B/g1pZ6nsZx5PJwAYNaeTqH3zj53jBRlvymVzNWy5QSw6V/o4I1qoQMSYmpB+3jCL9ZmNw3C+z5
	SBXEdK3WVj+l+pJeKvjaxAugoikaWahFrx/+m1+XzHav3M4t/puWvSjQfqesXmLk3q+ipr4mhSb
	MrqkzWQkKdvuZeSX/K4iM0yoa9MWepIl4pyxal+BlXwdPAoL29mUE6bY6cT25LimZzdDAIzosJV
	fCEZ7np243bHlAXa9DYU/efxqVuo9+km3x1dD8Fo6NCMXt4FOoRhwtF6mtaERj15BYvm1TNOQfw
	RRViib3oqyh7oVhq36Xb7sM8ZUgz7tLKmPmo=
X-Google-Smtp-Source: AGHT+IF0pFk+od97RSJU8Mzlpr1c0Tay/B2Ch7lBQWROD9O/7pqRN+VP9iEbsYTEaCtevx0JLeAh/Q==
X-Received: by 2002:a17:907:8e87:b0:ad5:3504:a6d with SMTP id a640c23a62f3a-ad85b2d6e72mr665567566b.47.1748268964486;
        Mon, 26 May 2025 07:16:04 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:125e:f885:2a24:cf3d? ([2a02:8109:8617:d700:125e:f885:2a24:cf3d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06b105sm1671885866b.41.2025.05.26.07.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:16:04 -0700 (PDT)
Message-ID: <4e97af0e-0cc1-4b92-9876-927624a981f7@gmail.com>
Date: Mon, 26 May 2025 16:16:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] MAINTAINERS: Update my email address to gmail.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
 tomm.merciai@gmail.com, martin.hecht@avnet.eu, michael.roeder@avnet.eu
References: <20250515145150.1419247-2-mhecht73@gmail.com>
 <aDQfcnIzJDLcK-U-@kekkonen.localdomain>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <aDQfcnIzJDLcK-U-@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 5/26/25 09:59, Sakari Ailus wrote:
> Hi Martin,
> 
> On Thu, May 15, 2025 at 04:51:50PM +0200, Martin Hecht wrote:
>> Replace my corporate email address by @gmail.com.
>>
>> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> 
> I've picked this patch but do the other instances also need updating?
> 

Thank you. If it is okay I will update this later. Both email addresses 
are valid.



